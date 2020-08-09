import createLikeAJAX from './comments/likes/createLikeAJAX';
import deleteLikeAJAX from './comments/likes/deleteLikeAJAX';
import createDislikeAJAX from './comments/dislikes/createDislikeAJAX';
import deleteDislikeAJAX from './comments/dislikes/deleteDislikeAJAX';

document.addEventListener('turbolinks:load', () => {
	createLikeAJAX();
	deleteLikeAJAX();
	createDislikeAJAX();
	deleteDislikeAJAX();
});
