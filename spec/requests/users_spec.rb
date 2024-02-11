require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users' do
    context 'with valid attributes' do
      it 'creates a new user and returns a success response' do
        post '/users', params:  attributes_for(:user) 
        expect(response).to have_http_status(:created)
        expect(User.count).to eq(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new user and returns an error response' do
        post '/users', params: attributes_for(:user, username: nil) 
        expect(response).to have_http_status(:unprocessable_entity)
        expect(User.count).to eq(0)
      end
    end
  end
end






