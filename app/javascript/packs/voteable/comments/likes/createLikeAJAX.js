import addNotice from '../../../notices/add-notice';
import correctFlushMessage from '../../../comments/correctFlushMessage';
import insertNewSelectors from '../insertNewSelectors';
import deleteLikeAJAX from './deleteLikeAJAX';
import flushForLikeOnes from './flushForLikeOnes';

export default function createLikeAJAX() {
    const selectors = document.querySelectorAll('.vote-up-default');

    selectors.forEach((selector) => {
        selector.addEventListener('ajax:success', (e) => {
            insertNewSelectors(e);
            deleteLikeAJAX();
            flushForLikeOnes();
        });

        selector.addEventListener('ajax:error', (e) => {
            const [data, status] = e.detail;
            addNotice('alert-massage-warning', correctFlushMessage(e.detail[0]));
        });
    });
}
