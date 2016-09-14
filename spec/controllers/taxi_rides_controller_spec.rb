require 'rails_helper'

RSpec.describe TaxiRidesController do
  describe 'GET #index' do
    render_views

    context 'when authenticated' do
      it 'renders view' do
        u = FactoryGirl.create(:user)

        sign_in u
        get :index

        expect(response).to have_http_status 200
      end
    end

    context 'when unauthenticated' do
      it 'redirects to sign in page' do
        get :index

        expect(response).to have_http_status 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #new' do
    render_views

    context 'when authenticated' do
      it 'renders view' do
        u = FactoryGirl.create(:user)

        sign_in u
        get :new

        expect(response).to have_http_status 200
      end
    end

    context 'when unauthenticated' do
      it 'redirects to sign in page' do
        get :new

        expect(response).to have_http_status 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'when authenticated' do
      context 'when params are valid' do
        it 'creates taxi ride' do
          u = FactoryGirl.create(:user)
          tp = FactoryGirl.create(:taxi_provider)

          sign_in u
          process :create, method: :post, params: {
            taxi_ride: {
              start_address: 'Słomińskiego 1, Warszawa, Polska',
              destination_address: 'Wiatraczna 1, Warszawa, Polska',
              fare: '14.59',
              taxi_provider_id: tp.id
            }
          }

          expect(response).to have_http_status 302
          expect(response).to redirect_to taxi_rides_path
          expect(TaxiRide.count).to eql 1
        end
      end

      context 'when params are invalid' do
        it 'does not create taxi ride' do
          u = FactoryGirl.create(:user)

          sign_in u
          process :create, method: :post

          expect(response).to have_http_status 200
          expect(TaxiRide.count).to eql 0
        end
      end
    end

    context 'when unauthenticated' do
      it 'redirects to sign in page' do
        process :create, method: :post

        expect(response).to have_http_status 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
