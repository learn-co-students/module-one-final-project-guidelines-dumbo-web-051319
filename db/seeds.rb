user1 = Account.create(name: "Fan", password: "Fan1")
user2 = Account.create(name: "Tan", password: "Tan1")
user3 = Account.create(name: "Rachel", password: "Rachel1")
user4 = Account.create(name: "Otha", password: "Otha1")
user5 = Account.create(name: "Tom", password: "Tom1")
user6 = Account.create(name: "Tim", password: "Tim1")

folder = "/Users/fanqiangmeng/Development/ActiveRecord/module-one-final-project-guidelines-dumbo-web-051319/picture"

post1 = Post.create(account: user1, content: "Hello", picture_path: folder + "/20190501_215801.jpg")
post2 = Post.create(account: user2, content: "Bonjour", picture_path: folder + "/20190501_215801.jpg")
post3 = Post.create(account: user3, content: "Hola", picture_path: folder + "/MonaLisa.jpg")
post4 = Post.create(account: user4, content: "Amazing weather!", picture_path: folder + "/e72.jpg")
post5 = Post.create(account: user5, content: "Have a nice day!", picture_path: folder + "/20190501_215801.jpg")
post6 = Post.create(account: user1, content: "Ruby programmers!", picture_path: folder + "/Programer1.jpg")

Comment.create(post: post1, account: user1, comment: "Hey")
Comment.create(post: post1, account: user2, comment: "good")
Comment.create(post: post1, account: user3, comment: "no")
Comment.create(post: post1, account: user1, comment: "go away")

Like.create(post: post1, account: user1)
Like.create(post: post1, account: user2)
Like.create(post: post1, account: user3)
Like.create(post: post1, account: user4)
