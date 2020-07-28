export default function ajaxCreateComment () {
    const form = document.querySelector('#submit-comment-form');

    form.addEventListener('ajax:success', (e) => {
        const [data, status] = e.detail;
        const comment = data.querySelector('.comment');
        const insert_point = document.querySelector('.insert-comment');

        // console.log(data);
        // console.log(status);
        // console.log('Hello!');
        // alert("The article was deleted.");

        insert_point.insertAdjacentElement('beforebegin', comment);
    });

    form.addEventListener('ajax:error', (e) => {
        console.log('Hello!!!');
    });
}
