package kr.ac.kopo.controller.petition;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.PetitionCommentService;
import kr.ac.kopo.comment.service.PetitionCommentServiceImpl;
import kr.ac.kopo.controller.Controller;

public class CommentDeleteController implements Controller {

	private PetitionCommentService petitionCommentService;

	public CommentDeleteController() {
		this.petitionCommentService = new PetitionCommentServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String commentIdParam = request.getParameter("commentId");
		String petitionId = request.getParameter("petitionId");

		Long commentId = Long.parseLong(commentIdParam);
		

		petitionCommentService.deleteComment(commentId);
		return "redirect:/petition/detail.do?petitionId=" + petitionId;
	}
}
