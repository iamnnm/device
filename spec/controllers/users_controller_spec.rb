# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#show' do
    context 'as an authenticated user' do
      let(:user) { create(:user) }

      before do
        sign_in user
        get :show, params: { id: user.id }
      end

      it 'returns status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders :show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'as an unauthenticated user' do
      let(:user) { create(:user) }

      before do
        get :show, params: { id: user.id }
      end

      it 'returns status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders :show template' do
        expect(response).to render_template(:show)
      end
    end
  end

  describe '#edit' do
    context 'as an authenticated user' do
      let(:user) { create(:user) }

      before do
        sign_in user
        get :edit, params: { id: user.id }
      end

      it 'returns status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders :edit template' do
        expect(response).to render_template(:edit)
      end
    end

    context 'as an unauthenticated user' do
      let(:user) { create(:user) }

      before do
        get :edit, params: { id: user.id }
      end

      it 'returns status 302' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to root_path
      end

      it 'shows flash message with warning' do
        expect(flash[:error]).to eq('Don\'t fuck with me!')
      end
    end
  end

  describe '#update' do
    context 'as an authenticated user' do
      let(:user) { create(:user, name: 'Old') }
      let(:user_params) { { name: 'New', email: user.email } }

      before do
        sign_in user
        patch :update, params: { id: user.id, user: user_params }
      end

      it 'returns status 302' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to user_path' do
        expect(response).to redirect_to user_path
      end

      it 'updates the user' do
        expect(user.reload.name).to eq('New')
      end
    end

    context 'as an unauthenticated user' do
      let(:user) { create(:user, name: 'Old') }
      let(:user_params) { { name: 'New', email: user.email } }

      before do
        patch :update, params: { id: user.id, user: user_params }
      end

      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end

      it 'renders :edit template' do
        expect(response).to render_template :edit
      end

      it 'doesn\'t update the user' do
        expect(user.reload.name).to eq('Old')
      end
    end
  end
end
