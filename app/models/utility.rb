# require "FileUtils"
require 'catpix'
class Utility
  #Login
  def self.login
    account_id = $prompt.ask('Account ID:', default: ENV['ACCOUNT_ID'])
    password = $prompt.mask("Password:")
    user = Account.find_by(id: account_id)
    if user == nil || user.password != password
      puts "Wrong Account ID or Password, please try again"
      login
    elsif user.password == password
      puts "Welcome back #{user.name}"
      UserUI.master(user)
    end
  end
  #Sign Up
  def self.sign_up
    name = $prompt.ask('What is your name?', default: ENV['New User'])
    password = $prompt.mask("Create password:")
    Account.create(name: name, password: password)
    new_account = Account.where("name == ?", name)[-1]
    puts "Here is you Account ID #{new_account.id}"
  end
  #Upload Picture
  def self.upload_picture(src_dir, user, content)
    # src_dir = self.pick_picture
    dst_dir = "/Users/fanqiangmeng/Development/ActiveRecord/module-one-final-project-guidelines-dumbo-web-051319/picture"
    if File.exist? (src_dir)
      puts "Uploading: #{File.basename(src_dir)}"
      sleep(rand(5))
      FileUtils.cp(src_dir, dst_dir)
      Post.create(account_id: user.id, content: content, picture_path: dst_dir + "/#{File.basename(src_dir)}")
      UserUI.master(user)
    else
      puts "Sorry, We can't find it."
    end
  end
  #Select a Picture, User can Preview and Upload
  def self.pick_picture(user, content)
    ary =  Dir["/Users/fanqiangmeng/Downloads/Picture_Sample/*.jpg"]
    pictures = ary.map {|ele| File.basename(ele)}
    choice = $prompt.select("Pick one Picture", pictures)
    src_dir = "/Users/fanqiangmeng/Downloads/Picture_Sample/#{choice}"
    choice2 = $prompt.select("Pick one Picture", %w(Upload Preview Back))
    if choice2 == "Upload"
      self.upload_picture(src_dir, user, content)
    elsif choice2 == "Preview"
      self.view_picture(src_dir)
      choice3 = $prompt.select("Pick one Picture", %w(Upload Back))
      if choice3 == "Back"
        self.pick_picture(user, content)
      elsif choice3 == "Upload"
        self.upload_picture(src_dir, user, content)
      end
    else
      self.pick_picture(user, content)
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
    :bg => "white",
    :bg_fill => true,
    :resolution => "high"
  end
  #Show Posts and user can select one to display
  def self.show_posts(post_ary, user)
    puts "Posts"
    post = $prompt.select("", post_ary)
    post_options(post, post_ary, user)
  end
  def self.post_options(post, post_ary, user)
    desplay_post(post)
    choice = $prompt.select("Options:", %w(Comment Back Back_to_top Logout))
    if choice == "Back"
      show_posts(post_ary, user)
    elsif choice == "Back_to_top"
      UserUI.master(user)
    elsif choice == "Comment"
      create_comment(post, user, post_ary)
    else
      Welcome.welcome_to_igl
    end
  end
  #Display the Post with picture
  def self.desplay_post(post)
    post_id = post.split(" ")[1].to_i
    post_info = Post.find_by(id: post_id)
    puts "#{Account.find_by(id: post_info.account_id).name}"
    view_picture(post_info.picture_path)
    puts "#{post_info.content}"
    comments = Comment.where("post_id == ?", post_id)
    if comments.length != 0
      puts "Comments"
      puts " "
      comments.each do |comment|
        puts "#{Account.find_by(id: comment.account_id).name}"
        puts "#{comment.comment}"
        puts ""
      end
    end
  end
  def self.create_comment(post, user, post_ary)
    post_id = post.split(" ")[0].to_i
    comment = $prompt.ask('Comment: ')
    Comment.create(comment: comment, account_id: user.id, post_id: post_id)
    post_options(post, post_ary, user)
  end
end

  #fahdflekajfdlasf
