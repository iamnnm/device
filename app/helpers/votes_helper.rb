module VotesHelper
  def did_user_like?(comment)
    comment.likes.detect { |like| like.user == current_user }
  end

  def did_user_dislike?(comment)
    comment.dislikes.detect { |dislike| dislike.user == current_user }
  end

  def did_user_like_article?(article)
    article.likes.detect { |like| like.user == current_user }
  end

  def did_user_dislike_article?(article)
    article.dislikes.detect { |dislike| dislike.user == current_user }
  end
end
