require 'rails_helper'

RSpec.describe '/reservations', type: :request do
  before(:each) do
    user = User.create(name: 'user name', address: 'user address', email: 'user_email@mail.com',
                       password: 'user_password')
    videogame = Videogame.create(name: 'videogame name', photo: 'videogame photo', description: 'videogame description',
                                 price_per_day: 1.0)
    @valid_attributes = { user:, videogame_id: videogame.id, days: 1, total_price: 1.0 }
    @invalid_attributes = { user: nil, videogame_id: nil, days: nil, total_price: nil }
    sign_in(user)
    @valid_headers = Devise::JWT::TestHelpers.auth_headers({}, user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Reservation.create! @valid_attributes
      get reservations_url, headers: @valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      reservation = Reservation.create! @valid_attributes
      get reservation_url(reservation), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Reservation' do
        expect do
          post reservations_url, params: { reservation: @valid_attributes }, headers: @valid_headers, as: :json
        end.to change(Reservation, :count).by(1)
      end

      it 'renders a JSON response with the new reservation' do
        post reservations_url, params: { reservation: @valid_attributes }, headers: @valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Reservation' do
        expect do
          post reservations_url, params: { reservation: @invalid_attributes }, as: :json
        end.to change(Reservation, :count).by(0)
      end

      it 'renders a JSON response with errors for the new reservation' do
        post reservations_url, params: { reservation: @invalid_attributes }, headers: @valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { days: 2, total_price: 2.0 } }

      it 'updates the requested reservation' do
        reservation = Reservation.create! @valid_attributes
        expect do
          patch reservation_url(reservation),
                params: { reservation: new_attributes }, headers: @valid_headers, as: :json
          reservation.reload
        end.to change { reservation.days }.from(@valid_attributes[:days]).to(new_attributes[:days])
          .and change { reservation.total_price }.from(@valid_attributes[:total_price]).to(new_attributes[:total_price])
      end

      it 'renders a JSON response with the reservation' do
        reservation = Reservation.create! @valid_attributes
        patch reservation_url(reservation), params: { reservation: new_attributes }, headers: @valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the reservation' do
        reservation = Reservation.create! @valid_attributes
        patch reservation_url(reservation), params: { reservation: @invalid_attributes }, headers: @valid_headers,
                                            as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested reservation' do
      reservation = Reservation.create! @valid_attributes
      expect do
        delete reservation_url(reservation), headers: @valid_headers, as: :json
      end.to change(Reservation, :count).by(-1)
    end
  end
end
