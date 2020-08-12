import insertNewArticleSelectors from "../insertNewArticleSelectors";
import deleteLikeForArticleAJAX from "./deleteLikeForArticleAJAX";
import flushForArticleLikeOnes from "./flushForArticleLikesOnes";
import addNotice from "../../../notices/add-notice";
import correctFlushMessage from "../../../comments/correctFlushMessage";

export default function createLikeForArticleAJAX() {
    const selectors = document.querySelectorAll('.article-vote-up-selector-default');

    selectors.forEach((selector) => {
        selector.addEventListener('ajax:success', (e) => {
            insertNewArticleSelectors(e);
            deleteLikeForArticleAJAX();
            flushForArticleLikeOnes();
        });

        selector.addEventListener('ajax:error', (e) => {
            addNotice('alert-massage-warning', correctFlushMessage(e.detail[0]));
        });
    });
}
