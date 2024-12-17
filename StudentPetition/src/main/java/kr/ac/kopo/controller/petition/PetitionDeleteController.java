package kr.ac.kopo.controller.petition;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionDeleteController implements Controller {

	private PetitionService petitionService;

    public PetitionDeleteController() {
        petitionService = new PetitionServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long petitionId = Long.parseLong(request.getParameter("petitionId"));

        if(petitionService.deletePetitionBy(petitionId));

        return "redirect:/petition/list.do?page=1";
    }

}
