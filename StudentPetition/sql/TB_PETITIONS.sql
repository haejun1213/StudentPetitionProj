-- ������ ���� DNABLS
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
    CREATED_DATE AS createdDate,  -- �� �ٲ� ����
    USER_ID
FROM 
    TB_PETITIONS
ORDER BY 
    CREATED_DATE DESC
OFFSET 5 ROWS FETCH NEXT  ROWS ONLY;

-- TB_PETITIONS ���̺� ����
CREATE TABLE TB_PETITIONS (
    PETITION_ID NUMBER(18) DEFAULT SEQ_PETITION_ID.NEXTVAL NOT NULL, -- û�� ID
    TITLE VARCHAR2(255) NOT NULL,                               -- ����
    CONTENT CLOB NOT NULL,                                      -- ����
    CATEGORY VARCHAR2(100) NOT NULL,                             -- ī�װ�
    CLOSE_DATE DATE NOT NULL,                                     -- ������
    PETITION_STATUS VARCHAR2(20) DEFAULT 'ACTIVE' NOT NULL,     -- ���� (ACTIVE, CLOSURE, END
    CREATED_DATE DATE DEFAULT SYSDATE NOT NULL,                   -- ������
    USER_ID VARCHAR2(50) NOT NULL,                              -- ����� ID
    CONSTRAINT PK_TB_PETITIONS_PETITION_ID PRIMARY KEY (PETITION_ID),  -- û�� ID�� �⺻Ű�� ����
    CONSTRAINT FK_TB_PETITIONS_USER_ID FOREIGN KEY (USER_ID)   -- ����� ID �ܷ�Ű ����
        REFERENCES TB_USERS (USER_ID)                           -- TB_USER ���̺��� USER_ID�� ����
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
        PETITION_status = '����'
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
        start_date      => TRUNC(SYSDATE) + 1, -- ������ �������� ����
        repeat_interval => 'FREQ=DAILY; BYHOUR=0; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE
    );
END;
*/

-- 1
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('�г� ���� ���� �ý��� ����', 
     '�л����� ���ϰ� å�� ������ �� �ֵ��� ���� ���� �ý����� �������ֽñ� ��û�帳�ϴ�.', 
     '����', SYSDATE + 12, 'ACTIVE', 'user11');

-- 2
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('����� �Ĵ� �޴� �پ�ȭ ��û', 
     '����� �Ĵ��� �޴��� �������̴� �� �پ��� ������ �������ֽñ� ��û�帳�ϴ�.', 
     '��Ȱ', SYSDATE + 25, 'ACTIVE', 'user10');

-- 3
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('�г� ���� ���� Ȯ�� ��û', 
     '�л���� ���������� ���� ������ ���� �ʵ��� ���� ������ Ȯ�����ֽñ� ��û�մϴ�.', 
     '�ü�', SYSDATE + 18, 'ACTIVE', 'user05');

-- 4
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('�б� ���Ƹ� Ȱ�� ������ Ȯ��', 
     '���Ƹ� Ȱ���� ���� Ȱ��ȭ�ϱ� ���� �������� Ȯ�����ֽñ� ��û�帳�ϴ�.', 
     '��Ÿ', SYSDATE + 20, 'ACTIVE', 'user24');

-- 5
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('��� �����ܵ� ��ü ��û', 
     '��� �����ܵ� ���°� ���� �ʾ� ��ü�� ��û�帳�ϴ�.', 
     '�ü�', SYSDATE + 15, 'CLOSURE', 'user14');

-- 6
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('�л� Ŀ�´�Ƽ ���� Ȯ��', 
     '�л����� ���ϰ� �����ϰ� �޽��� �� �ִ� Ŀ�´�Ƽ ������ �÷��ֽñ� ��û�մϴ�.', 
     '�ü�', SYSDATE + 28, 'ACTIVE', 'user04');

-- 7
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('�б� �� ���� ���� �ý��� ����', 
     '�л����� �г����� ���� ������ ���� �� �ֵ��� ���� ���� �ý����� �������ֽñ� ��û�մϴ�.', 
     '��Ȱ', SYSDATE + 19, 'ACTIVE', 'user03');

-- 8
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('�б� �� ü���� �ü� ���� ��ȭ', 
     'ü���� �ü��� ���� ���¸� �������ֽñ� ��û�帳�ϴ�.', 
     '�ü�', SYSDATE + 17, 'ACTIVE', 'user02');

-- 9
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('����� �� �л��� ��Ź �ü� Ȯ��', 
     '����� �� ��Ź �ü��� �����ϴ� Ȯ���� ��û�帳�ϴ�.', 
     '��Ȱ', SYSDATE + 22, 'ACTIVE', 'user02');

-- 10
INSERT INTO TB_PETITIONS (TITLE, CONTENT, CATEGORY, CLOSE_DATE, PETITION_STATUS, USER_ID) VALUES
    ('���� �Ƿ� ���� Ȯ��', 
     '�л����� �� ���� �Ƿ� ���񽺸� ���� �� �ֵ��� ���� �Ƿ� �ý����� Ȯ�����ֽñ� ��û�帳�ϴ�.', 
     '��Ȱ', SYSDATE + 26, 'ACTIVE', 'user01');

