# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe '#create' do
    context 'as an authenticated user' do
      let(:user) { create(:user) }
      let(:article) { create(:article) }

      before { sign_in user }

      context 'with valid attributes' do
        it 'adds a comment' do
          comment_params = attributes_for(:comment, user: user, article: article)
          expect {
            post :create, xhr: true, params: { article_id: article.id,
                                               comment: comment_params }
          }.to change(user.comments, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not add a comment' do
          comment_params = attributes_for(:comment,
                                          user: user,
                                          article: article,
                                          body: '')
          expect {
            post :create, xhr: true, params: { article_id: article.id,
                                               comment: comment_params }
          }.to change(user.comments, :count).by(0)
        end
      end
    end

    context 'as an unauthenticated user' do
      let(:user) { create(:user) }
      let(:article) { create(:article) }

      it 'does not add a comment' do
        comment_params = attributes_for(:comment, user: user, article: article)
        expect {
          post :create, xhr: true, params: { article_id: article.id,
                                             comment: comment_params }
        }.to change(user.comments, :count).by(0)
      end
    end
  end

  # describe '#update' do
  #   context 'as an authenticated user' do
  #     context 'with valid attributes' do
  #       let(:user) { create(:user) }
  #
  #       before { sign_in user }
  #
  #       it '' do
  #
  #       end
  #     end
  #
  #     context 'with invalid attributes' do
  #       it '' do
  #
  #       end
  #     end
  #   end
  #
  #   context 'as an unauthenticated user' do
  #     context 'with valid attributes' do
  #       it '' do
  #
  #       end
  #     end
  #
  #     context 'with invalid attributes' do
  #       it '' do
  #
  #       end
  #     end
  #   end
  # end

  describe '#destroy' do
    context 'as an authenticated user' do
      let(:user) { create(:user) }
      let(:article) { create(:article) }
      let!(:comment) { create(:comment, user: user, article: article) }

      before { sign_in user }

      it 'deletes a comment' do
        expect {
          delete :destroy, params: { article_id: article.id, id: comment.id }
        }.to change(user.comments, :count).by(-1)
      end
    end

    context 'as an unauthenticated user' do
      let(:user) { create(:user) }
      let(:article) { create(:article) }
      let!(:comment) { create(:comment, user: user, article: article) }

      it 'does not delete a comment' do
        expect {
          delete :destroy, params: { article_id: article.id, id: comment.id }
        }.to change(user.comments, :count).by(0)
      end
    end
  end
end
