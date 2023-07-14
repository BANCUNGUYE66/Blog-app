require 'rails_helper'
# require_relative '../app/models/user'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { User.new(name: 'Taflon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

    it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'photo should be present' do
      subject.photo = nil
      expect(subject).to_not be_valid
    end

    it 'bio should be present' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be an interger' do
      subject.posts_counter = ''
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
