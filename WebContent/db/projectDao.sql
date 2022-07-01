-- Dao query
----------------------------------------------------------------------
--                          MEMBER                              --
----------------------------------------------------------------------
--(1)로그인
SELECT * FROM MEMBER WHERE MID='ZICO' AND MPW='1';
--(2) mID로  DTO 가져오기
SELECT * FROM MEMBER WHERE MID = 'ZICO';
--(3) ID중복체크
SELECT * FROM MEMBER WHERE MID = 'ZICO';
--(4) 회원가입
INSERT INTO MEMBER (MID,MGRADE,MNAME,MPW,MTEL,MEMAIL,MADDRESS,MGENDER,mbirth)
    VALUES('CUTE','1','윈터','111','010-1234-1234','WINTER@GMAIL.COM','성북구','여','2001-01-01');
--(5) 회원정보 수정 
UPDATE MEMBER SET MPW ='1',
                  MNAME = '김민정',
                  MTEL = '010-7890-0987',
                  MEMAIL='CUTEWINTER@NAVER.COM',
                  MADDRESS = '서울시 강남구 '
                  WHERE MID = 'CUTE';
--(6) 회원수
SELECT COUNT(*) CNT FROM MEMBER;                 
--(7) 회원탈퇴
DELETE FROM MEMBER WHERE MID='ZICO';

COMMIT;
--(8)EMAIL 중복체크
SELECT * FROM MEMBER WHERE MEMAIL = 'CUTEWINTER@NAVER.COM';
SELECT * FROM MEMBER;

----------------------------------------------------------------------
--                           BOARD                              --
----------------------------------------------------------------------
--(1)글목록(startRow~endRow)
SELECT B.*, MNAME FROM BOARD B, MEMBER M WHERE B.MID=M.MID
    ORDER BY BGROUP DESC, STEP; --출력기준
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT B.*, MNAME FROM BOARD B, MEMBER M WHERE B.MID=M.MID
    ORDER BY BGROUP DESC, STEP) A) 
    WHERE RN BETWEEN 2 AND 3; --DAO에 들어갈 쿼리
    
--(2) 글 개수
SELECT COUNT(*) FROM BOARD;
SELECT * FROM BOARD;

--(3)글쓰기(원글) 
INSERT INTO BOARD (BNO,MID,bSUBJECT,BCONTENT,BFILE,bHIT,BGROUP,bSTEP,BINDENT,bIP,bRDATE)
VALUES (BOARD_SEQ.NEXTVAL,'jo','TITLE','CONTENT',NULL,0,BOARD_SEQ.CURRVAL,0,0,'192.168.152',SYSDATE);
--(3-1)글쓰기(원글) SILVER등급 이상
INSERT INTO BOARD (BNO,MID,bSUBJECT,BCONTENT,BFILE,bHIT,BGROUP,bSTEP,BINDENT,bIP,bRDATE,MGRADE)
VALUES (BOARD_SEQ.NEXTVAL,'ZICO','TITLE','CONTENT',NULL,0,BOARD_SEQ.CURRVAL,0,0,'192.168.152',SYSDATE,3);
--(4)HIT 하나 올리기 (1번글 조회수 하나 올리기 )
UPDATE BOARD SET HIT = HIT+1 WHERE BNO = 1;

--(5)BNO로 글 DTO 보기
SELECT B.*, MNAME FROM BOARD B, MEMBER M 
    WHERE M.MID=B.MID AND BNO=1;
    
--(6)글 수정하기 
UPDATE BOARD SET bSUBJECT = '바뀐제목',
                 BCONTENT = '본문1', 
                 BFILE = '사진',  
                 bIP = '192.168.151.10',
                 brdate = sysdate
                 WHERE MID = 'jo';
                 
--(7)글 삭제하기(BNO)로 삭제                 
COMMIT;
DELETE FROM BOARD WHERE BNO=3;
ROLLBACK;

--(8)답변글 추가전 STEP a
SELECT * FROM BOARD;
UPDATE BOARD SET bSTEP = bSTEP+1
    WHERE BGROUP = 1 AND bSTEP >0;
--(9)답변글 쓰기
INSERT INTO BOARD(BNO,MID,bSUBJECT,BCONTENT,BFILE,BGROUP,bSTEP,BINDENT,bIP)
    VALUES(BOARD_SEQ.NEXTVAL,'KANG','강동원-1','인정','KANG.JPG',1,1,1,'192.167.10');
--(10)회원탈퇴 하려는 사람이 쓴 글 모두 삭제 후 탈퇴
DELETE FROM BOARD WHERE MID = 'jo';
ROLLBACK;
COMMIT;

----------------------------------------------------------------------
--                          ADMIN TABLE                             --
----------------------------------------------------------------------
INSERT INTO ADMIN(AID,APW) VALUES ('ADMIN','111');
--ADMIN  MAIN의 CAR LIST  수정, 삭제, 자유게시판 수정, 삭제,
--(1) admin loginCheck
SELECT * FROM ADMIN WHERE AID = 'ADMIN' AND APW='111';
--(2) 로그인 후 세션에 넣을 용도 : admin AID로 DTO 가져오기
SELECT * FROM ADMIN WHERE AID = 'ADMIN';

--관리자 화면 
--회원리스트(등급별 출력 )
SELECT * FROM (SELECT ROWNUM RN,A.* FROM
    (SELECT * FROM MEMBER ORDER BY MGRADE )A)
    WHERE RN BETWEEN 1 AND 2;

----------------------------------------------------------------------
--                           CAR                             --
----------------------------------------------------------------------    
-- BRAND별  LIST 
select * from car where brandid = 'B1';
--DESIGN별 LIST 
select * from car where designID = 10;
--MAIN LIST
SELECT brandNAME,CARNAME, CPHOTO, CPRICE FROM CAR C, CAR_BRAND B 
    WHERE C.brandID = b.brandID ;
    
--BRAND 밑에 DESIGN별 LIST
SELECT brandNAME,CARNAME,d.designname ,CPHOTO, Cprice FROM CAR C, CAR_BRAND B , CAR_DESIGN D
    WHERE C.brandID = b.brandID AND D.DESIGNID=C.DESIGNID AND BRANDNAME='PORSCHE'  AND D.DESIGNID=10;


--차 등록
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES('M-1','B2','A-CLASS',10,'40600000','가솔린','11.9km/L','A-CLASS.PNG');  

--차 삭제
DELETE FROM CAR WHERE CARNAME = 'A-CLASS';
ROLLBACK;
COMMIT;

--HIT수 증가에 따른 MGRADE 수정
insert into BOARD (BNO, bSUBJECT, BCONTENT, BFILE, bHIT, BGROUP, bSTEP, BINDENT, bIP, bRDATE, MID) 
    VALUES (BOARD_SEQ.NEXTVAL, '제목1','본문1', NULL, 10, BOARD_SEQ.CURRVAL, 0, 0, '192.168.0.1',SYSDATE, 'ZICO');
SELECT MID, SUM(bHIT) FROM BOARD GROUP BY MID;
SELECT M.*, NVL((SELECT SUM(bHIT) FROM BOARD WHERE MID=M.MID GROUP BY MID), 0) BHIT FROM MEMBER M;

SELECT M.*, NVL((SELECT SUM(bHIT) FROM BOARD WHERE MID=M.MID GROUP BY MID), 0) BHIT 
    FROM MEMBER M WHERE MID='ZICO';

SELECT MT.MID, MT.MGRADE 현재레벨, G.MGRADE 바꿀레벨
    FROM (SELECT M.*, NVL((SELECT SUM(bHIT) FROM BOARD WHERE MID=M.MID GROUP BY MID), 0) BHIT FROM MEMBER M) MT, MEMBER_GRADE G
    WHERE bHIT BETWEEN LOW AND HIGH;

UPDATE MEMBER SET MGRADE = (SELECT G.MGRADE
    FROM (SELECT M.*, NVL((SELECT SUM(bHIT) FROM BOARD WHERE MID=M.MID GROUP BY MID), 0) BHIT FROM MEMBER M) MT, MEMBER_GRADE G
    WHERE bHIT BETWEEN LOW AND HIGH AND MID='ZICO')
    WHERE MID='ZICO'; -- ★ ★ ★2번