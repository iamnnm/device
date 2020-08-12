import addNotice from "../../../notices/add-notice";
import correctFlushMessage from "../../../comments/correctFlushMessage";
import insertNewArticleSelectors from "../insertNewArticleSelectors";
import deleteDislikeForArticleAJAX from "./deleteDislikeForArticleAJAX";
import flushForArticleDislikesOnes from "./flushForArticleDislikesOnes";

export default function createDislikeForArticleAJAX() {
    const selectors = document.querySelectorAll('.article-vote-down-selector-default');

    selectors.forEach((selector) => {
        selector.addEventListener('ajax:success', (e) => {
            insertNewArticleSelectors(e);
            deleteDislikeForArticleAJAX();
            flushForArticleDislikesOnes();
        });

        selector.addEventListener('ajax:error', (e) => {
            addNotice('alert-massage-warning', correctFlushMessage(e.detail[0]));
        });
    });
}
