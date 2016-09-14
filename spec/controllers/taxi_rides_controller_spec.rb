require 'rails_helper'

RSpec.describe TaxiRidesController do
  describe 'GET #index' do
    render_views

    context 'when authenticated' do
      it 'renders view'
    end

    context 'when unauthenticated' do
      it 'redirects to sign in page'
    end
  end

  describe 'GET #new' do
    render_views

    context 'when authenticated' do
      it 'renders view'
    end

    context 'when unauthenticated' do
      it 'redirects to sign in page'
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
