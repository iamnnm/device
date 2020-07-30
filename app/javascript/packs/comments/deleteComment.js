import addNotice from "../notices/add-notice";
import correctFlushMessage from "./correctFlushMessage";

export default function ajaxDeleteComment () {
    const comments = document.querySelectorAll('.delete_comment');

    comments.forEach((comment) => {
        comment.addEventListener('ajax:success', (e) => {
            const [data, status] = e.detail;

            e.target.parentElement.parentElement.remove();

            addNotice('alert-massage-success', 'Comment has been deleted!');
        });

        comment.addEventListener('ajax:error', (e) => {
            const [data, status] = e.detail;

            addNotice('alert-massage-warning', correctFlushMessage(data));
        });
    })
}
