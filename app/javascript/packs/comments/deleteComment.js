export default function ajaxDeleteComment () {
    const comments = document.querySelectorAll('.delete_comment');

    comments.forEach((comment) => {
        comment.addEventListener('ajax:success', (e) => {
            e.target.parentElement.parentElement.remove();
        })
    })
}
