# 15.times do
#   User.create(name: Faker::Name.unique.first_name, password: 'password')
# end
#
# 15.times do
#   Fortune.create(quote: Faker::TvShows::TwinPeaks.unique.quote)
# end
#
# 15.times do
#   Fortune.create(quote: Faker::TvShows::GameOfThrones.unique.quote)
# end
#
# 15.times do
#   Fortune.create(quote: Faker::TvShows::Simpsons.unique.quote)
# end
#
# # 15.times do
# #    Fortune.create(quote: Faker::TvShows::BojackHorseman.unique.quote)
# # end
#
# 15.times do
#   Fortune.create(quote: Faker::TvShows::Buffy.unique.quote)
# end
#
# 15.times do
#   Fortune.create(quote: Faker::GreekPhilosophers.unique.quote)
# end

Diary.create(user_id: 33, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 34, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 35, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 36, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 37, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 38, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 39, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 40, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 41, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 42, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 43, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 44, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 45, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 46, fortune_id: Fortune.all.sample.id)
Diary.create(user_id: 47, fortune_id: Fortune.all.sample.id)
