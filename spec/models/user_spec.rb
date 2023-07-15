require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should have correct associations' do
      expect(User.reflect_on_association(:comments).macro).to eq(:has_many)
      expect(User.reflect_on_association(:posts).macro).to eq(:has_many)
      expect(User.reflect_on_association(:likes).macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    subject { User.new(name: 'Aimable', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'posts_counter should be greater than or equal to zero' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
      expect(subject.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end
  end

  describe '#recent_three_posts method' do
    let(:user) { create(:user) }
    it 'it returns the last 3 posts of a user' do
      user = User.create(name: 'Harriet', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

      first_post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')
      Post.create(author_id: user.id, title: 'nervous', text: 'This is my second post')
      Post.create(author_id: user.id, title: 'sick', text: 'This is my third post')
      Post.create(author_id: user.id, title: 'cool', text: 'I am cool')

      recent_posts = user.recent_three_posts

      expect(recent_posts).to_not include(first_post)
    end
  end
end
