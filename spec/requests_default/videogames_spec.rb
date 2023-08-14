require 'rails_helper'

RSpec.describe '/videogames', type: :request do
  before(:each) do
    user = User.create(name: 'user name', address: 'user address', email: 'user_email@mail.com',
                       password: 'user_password', admin: true)
    @valid_attributes = { name: 'videogame name', photo: 'videogame photo', description: 'videogame description',
                          price_per_day: 1.0 }
    @invalid_attributes = { name: nil, photo: nil, description: nil, price_per_day: nil }
    sign_in(user)
    @valid_headers = Devise::JWT::TestHelpers.auth_headers({}, user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Videogame.create! @valid_attributes
      get videogames_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      videogame = Videogame.create! @valid_attributes
      get videogame_url(videogame), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Videogame' do
        expect do
          post videogames_url, params: { videogame: @valid_attributes }, headers: @valid_headers, as: :json
        end.to change(Videogame, :count).by(1)
      end

      it 'renders a JSON response with the new videogame' do
        post videogames_url, params: { videogame: @valid_attributes }, headers: @valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Videogame' do
        expect do
          post videogames_url, params: { videogame: @invalid_attributes }, as: :json
        end.to change(Videogame, :count).by(0)
      end

      it 'renders a JSON response with errors for the new videogame' do
        post videogames_url, params: { videogame: @invalid_attributes }, headers: @valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'videogame2 name', photo: 'videogame2 photo', description: 'videogame2 description',
          price_per_day: 2.0 }
      end

      it 'updates the requested videogame' do
        videogame = Videogame.create! @valid_attributes
        expect do
          patch videogame_url(videogame), params: { videogame: new_attributes }, headers: @valid_headers, as: :json
          videogame.reload
        end.to change { videogame.name }.from(@valid_attributes[:name]).to(new_attributes[:name])
          .and change { videogame.photo }.from(@valid_attributes[:photo]).to(new_attributes[:photo])
          .and change { videogame.description }.from(@valid_attributes[:description]).to(new_attributes[:description])
          .and change {
                 videogame.price_per_day
               }.from(@valid_attributes[:price_per_day]).to(new_attributes[:price_per_day])
      end

      it 'renders a JSON response with the videogame' do
        videogame = Videogame.create! @valid_attributes
        patch videogame_url(videogame), params: { videogame: new_attributes }, headers: @valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the videogame' do
        videogame = Videogame.create! @valid_attributes
        patch videogame_url(videogame), params: { videogame: @invalid_attributes }, headers: @valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested videogame' do
      videogame = Videogame.create! @valid_attributes
      expect do
        delete videogame_url(videogame), headers: @valid_headers, as: :json
      end.to change(Videogame, :count).by(-1)
    end
  end
end
