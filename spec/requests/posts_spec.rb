require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Iqbal Elham', photo: 'https://www.images.com', bio: 'This is a Iqbal Elham.',
                          post_counter: 0)
      get user_posts_path(@user)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct content' do
      expect(response.body).to include('posts')
    end
  end
  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Iqbal Elham', photo: 'https://images.com', bio: 'Hello Iqbal elham', post_counter: 0)
      @post = Post.create(author_id: @user.id, title: 'Hello iqbal Elham', text: 'very nice blog', comments_counter: 0,
                          likes_counter: 0)
      get user_post_path(@user, @post)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'renders the correct content' do
      expect(response.body).to include('Details of the post')
    end
  end
end
