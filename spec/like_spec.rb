require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'User Test', photo: 'photo.com', bio: 'Test Comment', post_counter: 0) }
  let(:post) do
    Post.create(author_id: user.id, title: 'Test', text: 'Text Test', comments_counter: 0, likes_counter: 0)
  end

  describe 'initialize' do
    before(:each) do
      @like = Like.new(post_id: post.id, author_id: user.id)
    end

    it 'should be valid' do
      expect(@like.valid?).to be(true)
    end

    it 'should be a like' do
      expect(@like).to be_a(Like)
    end

    it 'should have a post id' do
      expect(@like.post_id).to eq(post.id)
    end

    it 'should have an author id' do
      expect(@like.author_id).to eq(user.id)
    end
  end

  it 'should have a method update_like_counter' do
    expect(post.likes_counter).to eq(0)

    @like = Like.create(post_id: post.id, author_id: user.id)
    expect(post.reload.likes_counter).to eq(1)
  end
end
