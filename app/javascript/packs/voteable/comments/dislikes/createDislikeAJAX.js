import addNotice from '../../../notices/add-notice';
import correctFlushMessage from '../../../comments/correctFlushMessage';
import insertNewSelectors from '../insertNewSelectors';
import deleteDislikeAJAX from './deleteDislikeAJAX';
import flushForDislikeOnes from './flushForDislikeOnes';

export default function CreateDislikeAJAX() {
    const selectors = document.querySelectorAll('.vote-down-default');

    selectors.forEach((selector) => {
        selector.addEventListener('ajax:success', (e) => {
            insertNewSelectors(e);
            deleteDislikeAJAX();
            flushForDislikeOnes();
        });

        selector.addEventListener('ajax:error', (e) => {
            addNotice('alert-massage-warning', correctFlushMessage(e.detail[0]));
        });
    });
}
