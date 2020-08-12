import addNotice from '../../../notices/add-notice';
import correctFlushMessage from '../../../comments/correctFlushMessage';

export default function flushForLikeOnes() {
    const selectors = document.querySelectorAll('.vote-up');

    selectors.forEach((selector) => {
        selector.addEventListener('ajax:error', (event) => {
            addNotice('alert-massage-warning', correctFlushMessage(event.detail[0]));
        });
    });
}
