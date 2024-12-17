-- 시퀀스 생성 DNABLS
CREATE SEQUENCE SEQ_PETITION_ID 
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 9999999999
    NOCACHE
    NOCYCLE;
    
SELECT 
    PETITION_ID AS petitionId,
    TITLE,
    CONTENT,
    CATEGORY,
    CLOSE_DATE AS closeDate,
    PETITION_STATUS AS status,
    CREATED_DATE AS createdDate,  -- 줄 바꿈 제거
    USER_ID
FROM 
    TB_PETITIONS
ORDER BY 
    CREATED_DATE DESC
OFFSET 5 ROWS FETCH NEXT  ROWS ONLY;

-- TB_PETITIONS 테이블 생성
CREATE TABLE TB_PETITIONS (
    PETITION_ID NUMBER(18) DEFAULT SEQ_PETITION_ID.NEXTVAL NOT NULL, -- 청원 ID
    TITLE VARCHAR2(255) NOT NULL,                               -- 제목
    CONTENT CLOB NOT NULL,                                      -- 내용
    CATEGORY VARCHAR2(100) NOT NULL,                             -- 카테고리
    CLOSE_DATE DATE NOT NULL,                                     -- 마감일
    PETITION_STATUS VARCHAR2(20) DEFAULT 'ACTIVE' NOT NULL,     -- 상태 (ACTIVE, CLOSURE, END
    CREATED_DATE DATE DEFAULT SYSDATE NOT NULL,                   -- 생성일
    USER_ID VARCHAR2(50) NOT NULL,                              -- 사용자 ID
    CONSTRAINT PK_TB_PETITIONS_PETITION_ID PRIMARY KEY (PETITION_ID),  -- 청원 ID를 기본키로 설정
    CONSTRAINT FK_TB_PETITIONS_USER_ID FOREIGN KEY (USER_ID)   -- 사용자 ID 외래키 설정
        REFERENCES TB_USERS (USER_ID)                           -- TB_USER 테이블에서 USER_ID를 참조
);
DROP TABLE TB_PETITIONS;
drop SEQUENCE SEQ_PETITION_ID;
ALTER TABLE TB_PETITIONS
MODIFY PETITION_STATUS VARCHAR2(20) DEFAULT 'ACTIVE';

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TB_PETITIONS';

commit;

SELECT PETITION_ID AS petitionId,
		TITLE,
		CONTENT,
		CATEGORY,
		CLOSE_DATE AS closeDate,
		PETITION_STATUS AS status,
		CREATED_DATE AS
		createdDate,
		USER_ID
		FROM TB_PETITIONS
		ORDER BY
		PETITION_ID DESC
        OFFSET
		10 ROWS FETCH NEXT 5 ROWS
		ONLY;


select *
  from TB_PETITIONS;
  
delete TB_PETITIONS;

UPDATE TB_PETITIONS
    SET 
        close_date = '2025-01-04',
        PETITION_status = '진행'
    WHERE 
        petition_id = 31;  
        
  

SELECT M1.PETITION_ID AS petitionId,
		TITLE,
		CONTENT,
		CATEGORY,
		CLOSE_DATE AS
		closeDate,
		PETITION_STATUS AS status,
		M2.JOINED_DATE AS createdDate,
		M1.USER_ID
		FROM TB_PETITIONS M1
		     JOIN TB_PETITION_PARTICIPANTS M2 ON M2.PETITION_ID = M1.PETITION_ID
		WHERE
		M1.user_id = 'xyz123';
        
CREATE OR REPLACE PROCEDURE UPDATE_PETITION_STATUS IS
BEGIN
    UPDATE TB_PETITIONS
    SET PETITION_STATUS = 'CLOSURE'
    WHERE CLOSE_DATE < TRUNC(SYSDATE)
    AND PETITION_STATUS = 'ACTIVE';
END;

/*BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'UPDATE_PETITION_STATUS_DAILY',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN UPDATE_PETITION_STATUS; END;',
        start_date      => TRUNC(SYSDATE) + 1, -- 다음날 자정부터 시작
        repeat_interval => 'FREQ=DAILY; BYHOUR=0; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE
    );
END;
*/

-- 1
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('학내 도서 대출 시스템 개선', 
     '학생들이 편리하게 책을 대출할 수 있도록 도서 대출 시스템을 개선해주시길 요청드립니다.', 
     '교육', SYSDATE + 12, 'ACTIVE', 'user11');

-- 2
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('기숙사 식당 메뉴 다양화 요청', 
     '기숙사 식당의 메뉴가 제한적이니 더 다양한 음식을 제공해주시길 요청드립니다.', 
     '생활', SYSDATE + 25, 'ACTIVE', 'user10');

-- 3
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('학내 주차 공간 확충 요청', 
     '학생들과 교직원들이 주차 문제를 겪지 않도록 주차 공간을 확충해주시길 요청합니다.', 
     '시설', SYSDATE + 18, 'ACTIVE', 'user05');

-- 4
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('학교 동아리 활동 지원금 확대', 
     '동아리 활동을 더욱 활성화하기 위해 지원금을 확대해주시길 요청드립니다.', 
     '기타', SYSDATE + 20, 'ACTIVE', 'user24');

-- 5
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('운동장 인조잔디 교체 요청', 
     '운동장 인조잔디 상태가 좋지 않아 교체를 요청드립니다.', 
     '시설', SYSDATE + 15, 'CLOSURE', 'user14');

-- 6
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('학생 커뮤니티 공간 확충', 
     '학생들이 편하게 소통하고 휴식할 수 있는 커뮤니티 공간을 늘려주시길 요청합니다.', 
     '시설', SYSDATE + 28, 'ACTIVE', 'user04');

-- 7
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('학교 내 교내 할인 시스템 도입', 
     '학생들이 학내에서 할인 혜택을 받을 수 있도록 교내 할인 시스템을 도입해주시길 요청합니다.', 
     '생활', SYSDATE + 19, 'ACTIVE', 'user03');

-- 8
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('학교 내 체육관 시설 관리 강화', 
     '체육관 시설의 관리 상태를 개선해주시길 요청드립니다.', 
     '시설', SYSDATE + 17, 'ACTIVE', 'user02');

-- 9
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('기숙사 내 학생용 세탁 시설 확충', 
     '기숙사 내 세탁 시설이 부족하니 확충을 요청드립니다.', 
     '생활', SYSDATE + 22, 'ACTIVE', 'user02');

-- 10
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('교내 의료 서비스 확대', 
     '학생들이 더 나은 의료 서비스를 받을 수 있도록 교내 의료 시스템을 확대해주시길 요청드립니다.', 
     '생활', SYSDATE + 26, 'ACTIVE', 'user01');

