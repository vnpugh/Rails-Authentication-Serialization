require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /sessions" do
    it "works! (now write some real specs)" do
      get sessions_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /login' do
    let!(:user) { create(:user) }

    context 'with valid credentials' do
      it 'authenticates the user and returns a success response' do
        post '/login', params: { username: user.username, password: 'password' }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to include('token')
      end
    end

    context 'with invalid credentials' do
      it 'does not authenticate the user and returns an error response' do
        post '/login', params: { username: user.username, password: 'wrong_password' }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end








