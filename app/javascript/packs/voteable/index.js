import createLikeAJAX from './comments/likes/createLikeAJAX';
import deleteLikeAJAX from './comments/likes/deleteLikeAJAX';
import createDislikeAJAX from './comments/dislikes/createDislikeAJAX';
import deleteDislikeAJAX from './comments/dislikes/deleteDislikeAJAX';

import createLikeForArticle from './articles/likes/createLikeForArticleAJAX';
import deleteLikeForArticle from './articles/likes/deleteLikeForArticleAJAX';
import createDislikeForArticle from "./articles/dislikes/createDislikeForArticleAJAX";
import deleteDislikeForArticle from "./articles/dislikes/deleteDislikeForArticleAJAX";

document.addEventListener('turbolinks:load', () => {
	createLikeAJAX();
	deleteLikeAJAX();
	createDislikeAJAX();
	deleteDislikeAJAX();

	createLikeForArticle();
	deleteLikeForArticle();
	createDislikeForArticle();
	deleteDislikeForArticle();
});
