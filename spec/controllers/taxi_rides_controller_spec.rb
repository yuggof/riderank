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
        expect(response).to redirect_to(new_user_session_path)
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
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when authenticated' do
      context 'when params are valid' do
        it 'redirects to index action'
      end

      context 'when params are invalid' do
        it 'renders view'
      end
    end

    context 'when unauthenticated' do
      it 'redirects to sign in page'
    end
  end
end
