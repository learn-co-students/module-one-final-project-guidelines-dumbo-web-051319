folder = "/Users/fanqiangmeng/Development/ActiveRecord/module-one-final-project-guidelines-dumbo-web-051319/picture"

user1 = Account.create(name: "Rachel", password: "Rachel1", address: "123 Black RD, Brooklyn, NY 11726", bio: "You will face many defeats in life, but never let yourself be defeated.", profile_picture_path: folder +"/Profile_Picture4.jpg")

user2 = Account.create(name: "Fan", password: "Fan1", address: "708 Ashmore Dr Greenwood, Indiana(IN), 46143", bio: "The way to get started is to quit talking and begin doing.", profile_picture_path: folder +"/Profile_Picture1.jpg")

user3 = Account.create(name: "Tan", password: "Tan1", address: "890 Ashmore Dr Green, Georgia(GA), 46143", bio: "If life were predictable it would cease to be life, and be without flavor.", profile_picture_path: folder +"/Profile_Picture2.jpg")

user4 = Account.create(name: "Otha", password: "Otha1", address: "2277 Mariposa Via W #A Laguna Hills, California(CA), 92637", bio: "When you reach the end of your rope, tie a knot in it and hang on.", profile_picture_path: folder +"/Profile_Picture3.jpg")

user5 = Account.create(name: "Tom", password: "Tom1", address: "135 Fairview Rd Searcy, Arkansas(AR), 72143", bio: "The future belongs to those who believe in the beauty of their dreams.", profile_picture_path: folder +"/Profile_Picture1.jpg")

user6 = Account.create(name: "Tim", password: "Tim1", address: "504 Progress St Edna, Texas(TX), 77957", bio:"It is during our darkest moments that we must focus to see the light.", profile_picture_path: folder +"/Profile_Picture4.jpg")

post1 = Post.create(account: user1, create_at: Time.now, content: "Hello", picture_path: folder + "/20190501_215801.jpg")
post2 = Post.create(account: user2, create_at: Time.now, content: "Bonjour", picture_path: folder + "/20190501_215801.jpg")
post3 = Post.create(account: user3, create_at: Time.now, content: "Hola", picture_path: folder + "/MonaLisa.jpg")
post4 = Post.create(account: user4, create_at: Time.now, content: "Amazing weather!", picture_path: folder + "/e72.jpg")
post5 = Post.create(account: user5, create_at: Time.now, content: "Have a nice day!", picture_path: folder + "/20190501_215801.jpg")
post6 = Post.create(account: user1, create_at: Time.now, content: "Ruby programmers!", picture_path: folder + "/Programer1.jpg")

Comment.create(post: post1, account: user1, comment: "Hey")
Comment.create(post: post1, account: user2, comment: "good")
Comment.create(post: post1, account: user3, comment: "no")
Comment.create(post: post1, account: user1, comment: "go away")

Like.create(post: post1, account: user1)
Like.create(post: post1, account: user2)
Like.create(post: post1, account: user3)
Like.create(post: post1, account: user4)
#seeeds
