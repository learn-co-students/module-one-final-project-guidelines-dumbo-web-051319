class Authentication
  def self.check_account(user, post)
    bol = false
    post_id = post.split(" ")[1].to_i
    post_author_id = Post.find_by(id: post_id).account_id
    if user.id == post_author_id
      bol = true
    end
    bol
  end
  def self.give_options(user, post)
    option_arry = ["Like", "Comment", "Back", "Back_to_Main_Menu", "Logout"]
    if check_account(user, post) == true
      option_arry = ["Like", "Comment", "Edit", "Delete", "Back", "Back_to_Main_Menu", "Logout"]
    end
    option_arry
  end
end
