require 'catpix'
class Utility
  #Create a Post
  def self.create_post(user)
    Utility.artii_meun_title("Create Post")
    dst_dir = "/Users/fanqiangmeng/Development/ActiveRecord/module-one-final-project-guidelines-dumbo-web-051319/picture"
    content = $prompt.ask('What do you want to post?', default: ENV['CONTENT'])
    src_dir = pick_picture
    Post.create(account_id: user.id, content: content, create_at: Time.now, picture_path: dst_dir + "/#{File.basename(src_dir)}")
    puts "Done"
    UserUI.master(user)
  end


  #Upload Picture
  def self.upload_picture(src_dir)
    # src_dir = self.pick_picture
    dst_dir = "/Users/fanqiangmeng/Development/ActiveRecord/module-one-final-project-guidelines-dumbo-web-051319/picture"
    if File.exist? (src_dir)
      puts "Uploading #{File.basename(src_dir)}....."
      sleep(rand(5))
      FileUtils.cp(src_dir, dst_dir)
    else
      puts "Sorry, We can't find it."
    end
  end



  #Select a Picture, User can Preview and Upload
  def self.pick_picture
    ary =  Dir["/Users/fanqiangmeng/Downloads/Picture_Sample/*.jpg"]
    pictures = ary.map {|ele| File.basename(ele)}
    choice = $prompt.select("Pick one Picture (Please use .jpg files)", pictures)
    clear_page
    src_dir = "/Users/fanqiangmeng/Downloads/Picture_Sample/#{choice}"
    choice2 = $prompt.select("", %w(Upload Preview Back))
    if choice2 == "Upload"
      self.upload_picture(src_dir)
    elsif choice2 == "Preview"
      self.view_picture(src_dir)
      choice3 = $prompt.select("Pick one Picture", %w(Upload Back))
      if choice3 == "Back"
        self.pick_picture
      elsif choice3 == "Upload"
        self.upload_picture(src_dir)
      end
    else
      self.pick_picture
    end
    src_dir
  end



  #Display a Picture
  def self.view_picture(src_dir)
    Catpix::print_image src_dir,
    :limit_x => 1.0,
    :limit_y => 0,
    :center_x => true,
    :center_y => true,
    :bg => "black",
    :bg_fill => true,
    :resolution => "high"
  end

  def self.view_profile_picture(src_dir)
    Catpix::print_image src_dir,
    :limit_x => 0.5,
    :limit_y => 0,
    :center_x => false,
    :center_y => false,
    :bg => "black",
    :bg_fill => true,
    :resolution => "high"
  end

  def self.view_profile_picture_in_post(src_dir)
    Catpix::print_image src_dir,
    :limit_x => 0.1,
    :limit_y => 0,
    :center_x => false,
    :center_y => false,
    :bg => "black",
    :bg_fill => true,
    :resolution => "high"
  end



  #Show Posts and user can select one to display
  def self.show_posts(user, users)
    post_menu = Artii::Base.new :font => "slant"
    puts post_menu.asciify("Posts")
    post_ary = users.map {|user| AllPosts.arry_of_posts(user)}
    if post_ary == [[]]
      puts "We can't get any post for you, please create one."
      puts "Returnning to Main Menu"
      sleep(2)
      Utility.clear_page
      UserUI.master(user)
    else
      post = $prompt.select("", post_ary)
      clear_page
      get_post_id(post)
      desplay_post(post)
      post_options(post, post_ary, user, users)
    end
  end



  #follow Show_posts, give options after display_post.
  def self.post_options(post, post_ary, user, users)
    choice = $prompt.select("Options:", Authentication.give_options(user, post))
    if choice == "Back"
      clear_page
      show_posts(user, users)
    elsif choice == "Back to Main Menu"
      clear_page
      UserUI.master(user)
    elsif choice == "Comment"
      create_comment(post, user, post_ary, users)
    elsif choice == "Like"
      clear_page
      create_like(post, user, post_ary, users)
    elsif choice == "Edit"
      edit_post(post, post_ary, user, users)
    elsif choice == "Delete"
      delete_post(user, users, post)
    else
      clear_page
      Welcome.welcome_to_igl
    end
  end



  #Display the Post with picture
  def self.desplay_post(post)
    post_id = get_post_id (post)
    comments_count = Comment.where("post_id == ?", post_id).count
    likes_count = Like.where("post_id == ?", post_id).count
    post_info = Post.find_by(id: post_id)
    puts "----------------------------------------------------------------------"
    src_dir = Account.find_by(id: post_info.account_id).profile_picture_path
    view_profile_picture_in_post(src_dir)
    puts "#{Account.find_by(id: post_info.account_id).name}"
    puts "#{post_info.create_at.localtime.to_s[0..18]}"
    puts "----------------------------------------------------------------------"
    view_picture(post_info.picture_path)
    puts "#{post_info.content}"
    comments = Comment.where("post_id == ?", post_id)
    puts "----------------------------------------------------------------------"
    puts "Comments (#{comments_count}) | Likes (#{likes_count})"
    puts " "
    if comments.length != 0
      comments.each do |comment|
        puts "#{Account.find_by(id: comment.account_id).name}"
        puts "#{comment.comment}"
        puts ""
        sleep(0.5)
      end
    else
      puts "No comments."
      puts ""
    end
  end



  #create comment
  def self.create_comment(post, user, post_ary, users)
    post_id = get_post_id (post)
    comment = $prompt.ask("Comment: ")
    Comment.create(comment: comment, account_id: user.id, post_id: post_id)
    desplay_post(post)
    post_options(post, post_ary, user, users)
  end



  def self.create_like(post, user, post_ary, users)
    post_id = get_post_id (post)
    likes = Like.where("post_id == ?", post_id)
    if likes.empty?
        user.likes.create(post_id: post_id)
        desplay_post(post)
        post_options(post, post_ary, user, users)
    else
      for i in 0...likes.length
        counter = 0
        likes.each do |like|
          if like.account_id == user.id
            counter += 1
          end
        end
        if counter == 0
          user.likes.create(post_id: post_id)
          desplay_post(post)
          post_options(post, post_ary, user, users)
        else
          puts "You already liked the post"
          post_options(post, post_ary, user, users)
        end
      end
    end
  end



  def self.clear_page
    system "clear" or system "cls"
  end



  def self.get_post_id (post)
    post_id = post.split(" ")[1].to_i
  end



  def self.edit_post(post, post_ary, user, users)
    post_id = get_post_id(post)
    current_post = Post.find_by(id: post_id)
    edit = $prompt.ask("Edit Post: ")
    current_post.content = edit
    current_post.save
    desplay_post(post)
    post_options(post, post_ary, user, users)
  end


  def self.delete_post(user, users, post)
    post_id = get_post_id(post)
    Post.destroy(post_id)
    Comment.where("post_id == ?", post_id).destroy_all
    Like.where("post_id == ?", post_id).destroy_all
    show_posts(user, users)
  end

  def self.artii_meun_title(title)
    title_string = Artii::Base.new :font => "slant"
    puts title_string.asciify("#{title}")
  end

end
