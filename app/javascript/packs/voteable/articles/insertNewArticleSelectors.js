export default function insertNewArticleSelectors(event) {
    const [data] = event.detail;
    const newSelectors = data.querySelector('.article-rating-wrapper');
    const insert_point = event.target.parentElement.parentElement.parentElement;

    event.target.parentElement.parentElement.remove();

    insert_point.insertAdjacentElement('afterbegin', newSelectors);
}
