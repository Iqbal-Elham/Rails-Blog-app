# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Iqbal Elham', photo: 'https://xsgames.co/randomusers/avatar.php?g=male', bio: 'I am a software engineer.')
user2 = User.create(name: 'Farhad', photo: 'https://xsgames.co/randomusers/avatar.php?g=male', bio: 'I am an Professor.')
user3 = User.create(name: 'Ali', photo: 'https://xsgames.co/randomusers/avatar.php?g=male', bio: 'I am a Manager.')
user4 = User.create(name: 'Hamid', photo: 'https://xsgames.co/randomusers/avatar.php?g=male', bio: 'I am a President')
user5 = User.create(name: 'Farid', photo: 'https://xsgames.co/randomusers/avatar.php?g=male', bio: 'I am a Chef')

post1 = Post.create(author_id: user1.id, title: 'Hello world', text: 'This is my first post.')
post2 = Post.create(author_id: user1.id, title: 'Hello world', text: 'This is my second post.')
post3 = Post.create(author_id: user3.id, title: 'Hello world', text: 'This is my first post.')
post4 = Post.create(author_id: user4.id, title: 'Hello world', text: 'This is my first post.')

Comment.create(author_id: user2.id, post_id: post1.id, text: 'This is my first comment.')
Comment.create(author_id: user2.id, post_id: post2.id, text: 'This is my second comment.')
Comment.create(author_id: user4.id, post_id: post1.id, text: 'This is my first comment.')
Comment.create(author_id: user5.id, post_id: post4.id, text: 'This is my first comment.')
Comment.create(author_id: user4.id, post_id: post2.id, text: 'This is my second comment.')
Comment.create(author_id: user5.id, post_id: post3.id, text: 'This is my first comment.')

Like.create(author_id: user1.id, post_id: post1.id)
Like.create(author_id: user2.id, post_id: post1.id)
Like.create(author_id: user3.id, post_id: post3.id)
Like.create(author_id: user4.id, post_id: post4.id)
Like.create(author_id: user2.id, post_id: post1.id)
Like.create(author_id: user3.id, post_id: post3.id)
Like.create(author_id: user4.id, post_id: post2.id)
Like.create(author_id: user1.id, post_id: post3.id)