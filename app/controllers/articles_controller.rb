# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  before_action :set_current_user_article, only: %i[edit update destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article, success: 'Post has been created!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, success: 'Post has been updated!'
    else
      render :edit
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def destroy
    if @article.nil?
      redirect_to root_path
    else
      @article.destroy

      redirect_to articles_path, success: 'Post has been deleted!'
    end
  end

  private

  def set_current_user_article
    @article ||= current_user.articles.find_by(id: params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :post)
  end
end
