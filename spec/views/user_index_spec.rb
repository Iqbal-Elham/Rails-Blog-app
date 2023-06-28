require 'rails_helper'

RSpec.describe 'User management', type: :feature do
  before do
    @user1 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 1, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user2 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 1, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user3 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 1, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')

    @post1 = Post.create(title: 'Post 1', text: 'This is the body of Post 1', comments_counter: 2, likes_counter: 5, author: @user1)
    @post2 = Post.create(title: 'Post 2', text: 'This is the body of Post 2', comments_counter: 1, likes_counter: 3, author: @user2)
    @post3 = Post.create(title: 'Post 2', text: 'This is the body of Post 2', comments_counter: 1, likes_counter: 3, author: @user3)
  end

  describe 'User index page' do
    it 'displays the username of all users' do
      visit users_path

      expect(page).to have_content('List of All Users')
      expect(page).to have_content('John Doe')
    end

    it 'displays the profile picture for each user' do
      visit users_path

      expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'displays the number of posts for each user' do
      visit users_path

      expect(page).to have_content('Number of posts: 2')
      expect(page).to have_content('Number of posts: 2')
      expect(page).to have_content('Number of posts: 2')
    end

    it 'redirects to user show page when clicking on a user' do
      visit users_path

      click_link(href: "/users/#{@user1.id}")
      expect(page).to have_current_path("/users/#{@user1.id}")

      visit users_path
      click_link(href: "/users/#{@user2.id}")
      expect(page).to have_current_path("/users/#{@user2.id}")

      visit users_path
      click_link(href: "/users/#{@user3.id}")
      expect(page).to have_current_path("/users/#{@user3.id}")
    end
  end
end