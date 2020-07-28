import ajaxDeleteComment from './deleteComment';
import ajaxCreateComment from "./createComment";

document.addEventListener('turbolinks:load', () => {
    ajaxCreateComment();
    ajaxDeleteComment();
});
