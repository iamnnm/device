import addNotice from '../../../notices/add-notice';
import correctFlushMessage from '../../../comments/correctFlushMessage';

export default function flushForArticleDislikeOnes() {
    const selectors = document.querySelectorAll('.article-vote-down-selector');

    selectors.forEach((selector) => {
        selector.addEventListener('ajax:error', (event) => {
            addNotice('alert-massage-warning', correctFlushMessage(event.detail[0]));
        });
    });
}
