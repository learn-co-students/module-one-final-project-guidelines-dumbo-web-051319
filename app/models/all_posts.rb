class AllPosts
 # return all the post of a user in text
  def self.get_account_name(id)
    Account.find_by(id: id).name
  end
  def self.get_post_id(id, i)
    Account.find_by(id: id).posts[i].id
  end
  def self.get_post_content(id, i)
    Account.find_by(id: id).posts[i].content
  end
  def self.get_post_together(id, i)
    content = get_post_content(id, i)
    post_id = get_post_id(id, i)
    "#{content} #{post_id}"
  end
  def self.get_together(id, i)
    name = get_account_name(id)
    "#{name} #{get_post_together(id, i)}"
  end
  def self.arry_of_posts(user)
    id = user.id
    ary = user.posts
    posts = []
    for i in 0...ary.length
      posts << get_together(id, i)
    end
    posts
  end
end
