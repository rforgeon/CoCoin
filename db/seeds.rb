# # Create places
# count = 0
# 3.times do
#   Place.create!(
#     name:         "San Francisco #{count}",
#     link:         "https://static.pexels.com/photos/25182/pexels-photo-25182.jpg",
#     description:  "Best City on Earth. Come visit this awesome place."
#   )
#   count += 1
# end
# places = Place.all
#
# # Create Posts
# postCount = 0
# 5.times do
#   Post.create!(
#     place:  places.sample,
#     link:   "https://www.youtube.com/watch?v=8tsW1vtpM9I",
#     title:  "Travel Video #{postCount}",
#     body:   "Good vid that shows off some of the highlights of SF."
#   )
#   postCount += 1
# end
#
# posts = Post.all
#
# # Create Comments
# 10.times do
#   Comment.create!(
#     post: posts.sample,
#     body: "This was a pretty good video. I like the effects and advice. "
#   )
# end
#
# puts "Seed finished"
# puts "#{Place.count} places created"
# puts "#{Post.count} posts created"
# puts "#{Comment.count} comments created"
