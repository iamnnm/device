# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_voteable

  def create
    render status: 403 if @voteable.user == current_user

    if already_voted?
      render json: "You can't #{params[:vote_type]} more than once", status: 403
    else
      @vote = @voteable.votes.build
      @vote.vote_type = params[:vote_type]
      @vote.user = current_user
      @vote.save

      render partial: "votes/#{params[:vote_type]}",
             locals: { comment: @voteable }
    end
  end

  def destroy
    @vote = Vote.where(user_id: current_user.id,
                       voteable_id: params[:comment_id || :article_id],
                       vote_type: params[:vote_type]).take

    if @vote.blank?
      render json: 'Comment is missing', status: 403
    else
      @vote.destroy

      render partial: 'votes/default_rate_selectors',
             locals: { comment: @voteable }
    end
  end

  private

  def already_voted?
    Vote.where(user_id: current_user.id,
               voteable_id: params[:comment_id || :article_id]).exists?
  end

  def set_voteable
    model = [Article, Comment].detect do |item|
      params["#{item.name.downcase}_id"]
    end

    @voteable = model.find_by(id: params["#{model.name.downcase}_id"])
  end

  def vote_params
    params.permit(:comment_id, :article_id, :vote_type)
  end
end
