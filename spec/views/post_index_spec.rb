require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  before do
    @user1 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 3, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')

    @post1 = Post.create(title: 'Post 1', text: 'This is the body of Post 1', comments_counter: 2, likes_counter: 5,
                         author: @user1)
    @post2 = Post.create(title: 'Post 2', text: 'This is the body of Post 2', comments_counter: 1, likes_counter: 3,
                         author: @user1)

    @comment1 = Comment.create(text: 'This is the body of Comment 1', author: @user1, post: @post1)
    @comment2 = Comment.create(text: 'This is the body of Comment 2', author: @user1, post: @post1)
    @comment3 = Comment.create(text: 'This is the body of Comment 3', author: @user1, post: @post2)
  end

  it 'displays the user\'s profile picture' do
    visit user_posts_path(@user1)

    expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'displays the number of posts the user has written' do
    visit user_posts_path(@user1)

    expect(page).to have_content("Number of posts: #{@user1.post_counter}")
  end

  it 'displays a post\'s title and body' do
    visit user_posts_path(@user1)

    expect(page).to have_content('Post 1')
    expect(page).to have_content('This is the body of Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('This is the body of Post 2')
  end

  it 'displays the first comments on a post' do
    visit user_posts_path(@user1)

    expect(page).to have_content('This is the body of Comment 1')
    expect(page).to have_content('This is the body of Comment 2')
    expect(page).to have_content('This is the body of Comment 3')
  end

  it 'displays the number of comments a post has' do
    visit user_posts_path(@user1)

    expect(page).to have_content("Comments: #{@post1.comments_counter}")
  end

  it 'displays the number of likes a post has' do
    visit user_posts_path(@user1)

    expect(page).to have_content("Likes: #{@post1.likes_counter}")
  end
end