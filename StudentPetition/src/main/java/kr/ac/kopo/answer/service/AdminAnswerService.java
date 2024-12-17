package kr.ac.kopo.answer.service;

import java.util.List;
import kr.ac.kopo.answer.vo.AdminAnswerVO;

public interface AdminAnswerService {
    
    // 답변 추가
    void addAnswer(AdminAnswerVO adminAnswer);
    
    // 답변 수정
    void updateAnswer(AdminAnswerVO adminAnswer);
    
    // 답변 삭제
    void deleteAnswer(Long answerId);
    
    // 특정 청원에 대한 답변 조회
    AdminAnswerVO getAnswerById(Long answerId);
    
    // 모든 답변 조회
    List<AdminAnswerVO> getAllAnswers();
}
