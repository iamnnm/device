import ajaxDeleteComment from "./deleteComment";
import addNotice from "../notices/add-notice";
import correctFlushMessage from "./correctFlushMessage";

export default function ajaxCreateComment () {
    const form = document.querySelector('#submit-comment-form');

    form.addEventListener('ajax:success', (e) => {
        const [data, status] = e.detail;
        const comment = data.querySelector('.comment');
        const insert_point = document.querySelector('.insert-comment');

        insert_point.insertAdjacentElement('beforebegin', comment);

        addNotice('alert-massage-success', 'Comment has been created!');

        ajaxDeleteComment();
    });

    form.addEventListener('ajax:error', (e) => {
        const [data, status] = e.detail;

        addNotice('alert-massage-warning', correctFlushMessage(data));
    });
}
