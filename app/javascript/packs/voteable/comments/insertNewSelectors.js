export default function insertNewSelectors(event) {
    const [data] = event.detail;
    const newSelectors = data.querySelector('.rating-selectors');
    const insert_point = event.target.parentElement.parentElement;

    event.target.parentElement.remove();

    insert_point.insertAdjacentElement('afterbegin', newSelectors);
}
