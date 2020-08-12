import addNotice from "../../../notices/add-notice";
import correctFlushMessage from "../../../comments/correctFlushMessage";
import insertNewArticleSelectors from "../insertNewArticleSelectors";
import createDislikeForArticleAJAX from "./createDislikeForArticleAJAX";
import createLikeForArticleAJAX from "../likes/createLikeForArticleAJAX";

export default function deleteDislikeForArticleAJAX() {
    const selectors = document.querySelectorAll('.article-vote-up-selector');

    selectors.forEach((selector) => {
        selector.addEventListener('ajax:success', (e) => {
            insertNewArticleSelectors(e);
            createLikeForArticleAJAX();
            createDislikeForArticleAJAX();
        });

        selector.addEventListener('ajax:error', (e) => {
            addNotice('alert-massage-warning', correctFlushMessage(e.detail[0]));
        });
    });
}
