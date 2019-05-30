class AllPosts
 # return all the post of a user in text
  def self.get_account_name(id)
    Account.find_by(id: id).name
  end
  def self.get_post_id(id, i)
    Post.where("account_id == ?", id)[i].id
  end
  def self.get_post_content(id, i)
    Post.where("account_id == ?", id)[i].content
  end
  def self.get_comment_count(id, i)
    Comment.where("post_id == ?", get_post_id(id, i)).count
  end
  def self.get_together(id, i)
    "Post_id: #{get_post_id(id, i)} | Author: #{get_account_name(id)} || #{get_post_content(id, i)} || Comments: #{get_comment_count(id, i)}"
  end
  def self.arry_of_posts(user)
    id = user.id
    ary = Post.where("account_id == ?", id)
    posts = []
    for i in 0...ary.length
      posts << get_together(id, i)
    end
    posts
  end
end
