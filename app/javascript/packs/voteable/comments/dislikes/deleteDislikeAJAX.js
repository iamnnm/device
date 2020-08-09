import addNotice from '../../../notices/add-notice';
import correctFlushMessage from '../../../comments/correctFlushMessage';
import insertNewSelectors from '../insertNewSelectors';
import createDislikeAJAX from './createDislikeAJAX';
import createLikeAJAX from '../likes/createLikeAJAX';

export default function ajaxDeleteDislike() {
    const selectors = document.querySelectorAll('.vote-up');

    selectors.forEach((selector) => {
        selector.addEventListener('ajax:success', (e) => {
            insertNewSelectors(e);
            createDislikeAJAX();
            createLikeAJAX();
        });

        selector.addEventListener('ajax:error', (e) => {
            addNotice('alert-massage-warning', correctFlushMessage(e.detail[0]));
        });
    });
}
