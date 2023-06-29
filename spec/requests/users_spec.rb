require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'Iqbal Elham', photo: 'https://www.images.com', bio: 'Hello, Iqbal Elham',
                        post_counter: 0)
    get users_path
  end

  describe 'GET /users' do
    it 'should return users' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    it 'should return one user' do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /index' do
    it 'renders a successful template' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct content' do
      expect(response.body).to include('List of All Users')
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Iqbal Elham', photo: 'https://www.images.com', bio: 'Hello, Iqbal Elham',
                          post_counter: 0)
      get users_path(@user)
      get "/users/#{@user.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct content' do
      expect(response.body).to include("Details of #{@user.name}")
    end
  end
end
