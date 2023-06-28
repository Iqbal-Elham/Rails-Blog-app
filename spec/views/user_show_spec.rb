require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before do
    @user1 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 1, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user2 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 1, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user3 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 1, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')

    @post1 = Post.create(title: 'Post 1', text: 'This is the body of Post 1', comments_counter: 0, likes_counter: 0, author: @user1)
    @post2 = Post.create(title: 'Post 2', text: 'This is the body of Post 2', comments_counter: 0, likes_counter: 0, author: @user2)
    @post3 = Post.create(title: 'Post 2', text: 'This is the body of Post 2', comments_counter: 0, likes_counter: 0, author: @user3)
    @post4 = Post.create(title: 'Post 2', text: 'This is the body of Post 2', comments_counter: 0, likes_counter: 0, author: @user1)
    @post5 = Post.create(title: 'Post 2', text: 'This is the body of Post 2', comments_counter: 0, likes_counter: 0, author: @user1)

  end

  scenario 'show user picture' do
    visit user_path(@user1.id)
    expect(page).to have_selector('img[src="https://unsplash.com/photos/F_-0BxGuVvo"]')
  end

  scenario 'show username' do
    visit user_path(@user1.id)
    expect(page).to have_content('You')
  end

  scenario 'show number of posts' do
    visit user_path(@user1.id)
    expect(page).to have_content('Post #1')
  end

  scenario 'show user bio' do
    visit user_path(@user1.id)
    expect(page).to have_content('John Doe is a bio')
  end

  scenario 'show last 3 user posts' do
    visit user_path(@user1.id)
    expect(page).to have_selector('.post-identifier', count: 3)
  end

  scenario 'show view all posts button' do
    visit user_path(@user1.id)
    expect(page).to have_selector('.btnPosts', text: 'See all posts')
  end

  scenario 'clicks on users post redirect to post show page' do
    visit user_path(@user1.id)
    click_link(href: "/users/#{@user1.id}/posts/#{@post1.id}")
    expect(page).to have_current_path("/users/#{@user1.id}/posts/#{@post1.id}")
  end

  scenario 'clicks on sell all posts redirect to posts index page' do
    visit user_path(@user1.id)
    click_button('See all posts')
    expect(page).to have_current_path("/users/#{@user1.id}/posts")
  end
end