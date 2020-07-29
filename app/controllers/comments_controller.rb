# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  before_action :set_article
  before_action :set_current_user_article, only: %i[edit update destroy]

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      render partial: 'comments/comment',
             locals: { comment: @comment }
    else
      render 'articles/show'
    end
  end

  def update; end

  def destroy
    @comment.destroy
  end

  private

  def set_article
    @article = Article.find_by(id: params[:article_id])
  end

  def set_current_user_article
    @comment ||= current_user.comments.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
