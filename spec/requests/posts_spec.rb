require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    get users_path
  end

  describe 'GET /users' do
    it 'should return a users' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    it 'should return one user' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /index' do
    it 'renders a successful template' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct content' do
      expect(response.body).to include('users')
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Iqbal', photo: 'https://images.com', bio: 'Hello Iqbal Elham')
      get users_path(@user)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end