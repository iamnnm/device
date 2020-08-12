import addNotice from '../../../notices/add-notice';
import correctFlushMessage from '../../../comments/correctFlushMessage';
import insertNewSelectors from '../insertNewSelectors';
import createLikeAJAX from "./createLikeAJAX";
import createDislikeAJAX from "../dislikes/createDislikeAJAX";

export default function ajaxDeleteLike() {
    const selectors = document.querySelectorAll('.vote-down');

    selectors.forEach((selector) => {
        selector.addEventListener('ajax:success', (e) => {
            insertNewSelectors(e);
            createLikeAJAX();
            createDislikeAJAX();
        });

        selector.addEventListener('ajax:error', (e) => {
            addNotice('alert-massage-warning', correctFlushMessage(e.detail[0]));
        });
    });
}
