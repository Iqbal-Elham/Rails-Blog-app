require 'rails_helper'
RSpec.describe 'Post show page', type: :feature do
  before do
    @user1 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 3, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user2 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 1, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user3 = User.create(name: 'John Doe', bio: 'John Doe is a bio', post_counter: 1, photo: 'https://unsplash.com/photos/F_-0BxGuVvo')

    @post = Post.create(title: 'Post 1', text: 'This is the body of Post 1', comments_counter: 3, likes_counter: 3,
                        author: @user1)
    @comment1 = Comment.create(text: 'This is the body of Comment 1', author: @user1, post: @post)
    @comment2 = Comment.create(text: 'This is the body of Comment 2', author: @user2, post: @post)
    @comment3 = Comment.create(text: 'This is the body of Comment 3', author: @user3, post: @post)
  end
  describe 'Post show page' do
    before { visit user_post_path(@user1.id, @post.id) }
    it 'displays the post\'s title' do
      expect(page).to have_content(@post.title)
    end
    it 'displays the user who wrote the post' do
      expect(page).to have_content(@user1.name)
    end
    it 'displays the number of comments the post has' do
      expect(page).to have_content('Comments: 6')
    end
    it 'displays the number of likes the post has' do
      expect(page).to have_content('Likes: 3')
    end
    it 'displays the post body' do
      expect(page).to have_content(@post.text)
    end
    it 'displays the username of each commentator' do
      expect(page).to have_content(@comment1.author.name)
      expect(page).to have_content(@comment2.author.name)
      expect(page).to have_content(@comment3.author.name)
    end
    it 'displays the body of each comment' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
      expect(page).to have_content(@comment3.text)
    end
  end
end
