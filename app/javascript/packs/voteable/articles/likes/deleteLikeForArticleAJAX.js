import insertNewArticleSelectors from "../insertNewArticleSelectors";
import addNotice from "../../../notices/add-notice";
import correctFlushMessage from "../../../comments/correctFlushMessage";
import createLikeForArticleAJAX from "./createLikeForArticleAJAX";
import createDislikeForArticleAJAX from "../dislikes/createDislikeForArticleAJAX";

export default function deleteLikeForArticleAJAX() {
    const selectors = document.querySelectorAll('.article-vote-down-selector');

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
