import addNotice from "../notices/add-notice";

export default function ajaxDeleteComment () {
    const comments = document.querySelectorAll('.delete_comment');

    comments.forEach((comment) => {
        comment.addEventListener('ajax:success', (e) => {
            e.target.parentElement.parentElement.remove();
            addNotice('alert-massage-success', 'Comment has been deleted!');
        })
    })
}
