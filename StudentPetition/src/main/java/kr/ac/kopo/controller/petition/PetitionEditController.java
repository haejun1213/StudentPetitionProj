package kr.ac.kopo.controller.petition;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionEditController implements Controller {

    private PetitionService petitionService;

    public PetitionEditController() {
        petitionService = new PetitionServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 요청에서 파라미터 값 가져오기
        Long petitionId = Long.parseLong(request.getParameter("petitionId"));
        String closeDate = request.getParameter("closeDate");
        String status = request.getParameter("status");

        // VO 객체 생성 및 값 설정
        PetitionVO petition = new PetitionVO();
        petition.setPetitionId(petitionId);
        petition.setCloseDate(closeDate);
        petition.setStatus(status);

        // 서비스 호출하여 데이터 업데이트
        petitionService.updatePetition(petition);

        // 상세 페이지로 리다이렉트
        return "redirect:/petition/detail.do?petitionId=" + petitionId;
    }
}
