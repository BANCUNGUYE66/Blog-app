require 'rails_helper'

describe Post, type: :request do
  describe 'routes with post_controller' do
    it 'should render the index action correctly' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('index')
      expect(response.body).to include('List of Posts')
    end

    it 'should render the show action correctly' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('show')
      expect(response.body).to include('Post Details')
    end
  end
end
