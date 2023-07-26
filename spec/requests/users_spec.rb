require 'rails_helper'

describe User, type: :request do
  describe 'routes with user_controller' do
    it 'should render the index action correctly' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('index')
      expect(response.body).to include('List of Users')
    end

    it 'should render the show action correctly' do
      get '/users/1'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('show')
      expect(response.body).to include('User Details')
    end
  end
end
