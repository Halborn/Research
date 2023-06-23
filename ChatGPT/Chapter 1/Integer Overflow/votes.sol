function votes(uint postId, uint upvote, uint downvotes) {
	if (upvote - downvote < 0) {
		deletePost(postId)
	}
}
