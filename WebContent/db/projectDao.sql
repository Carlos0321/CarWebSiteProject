-- Dao query
----------------------------------------------------------------------
--                          MEMBER                              --
----------------------------------------------------------------------
--(1)로그인
SELECT * FROM MEMBER WHERE MID='ZICO' AND MPW='111';
--(2) mID로  DTO 가져오기
SELECT * FROM MEMBER WHERE MID = 'ZICO';
--(3) ID중복체크
SELECT * FROM MEMBER WHERE MID = 'HAN';
--(4) 회원가입
INSERT INTO MEMBER (MID,MGRADE,MNAME,MPW,MTEL,MEMAIL,MADDRESS,MGENDER,mbirth)
    VALUES('CUTE','1','윈터','111','010-1234-1234','WINTER@GMAIL.COM','성북구','여','2001-01-01');
INSERT INTO MEMBER (MID,MGRADE,MNAME,MPW,MTEL,MEMAIL,MADDRESS,MGENDER,mbirth)
    VALUES('HAN','5','한소희','111','010-4321-4321','HAN@GMAIL.COM','서초구','여','2001-01-01');    
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
DELETE FROM MEMBER WHERE MID='HAN';

COMMIT;
--(8)EMAIL 중복체크
SELECT * FROM MEMBER WHERE MEMAIL = 'CUTEWINTER@NAVER.COM';
SELECT * FROM MEMBER;

----------------------------------------------------------------------
--                           BOARD                              --
----------------------------------------------------------------------
--(1)글목록(startRow~endRow)
SELECT B.*, MNAME FROM BOARD B, MEMBER M WHERE B.MID=M.MID
    ORDER BY BGROUP DESC, bSTEP; --출력기준
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT B.*, MNAME FROM BOARD B, MEMBER M WHERE B.MID=M.MID
    ORDER BY BGROUP DESC, bSTEP) A) 
    WHERE RN BETWEEN 1 AND 2; --DAO에 들어갈 쿼리
    
--(2) 글 개수
SELECT COUNT(*) FROM BOARD;
SELECT * FROM BOARD;

--(3)글쓰기(원글) 
INSERT INTO BOARD (BNO,MID,bSUBJECT,BCONTENT,BFILE,bHIT,BGROUP,bSTEP,BINDENT,bIP,bRDATE)
VALUES (BOARD_SEQ.NEXTVAL,'jo','벤츠 시승해봤어요','정말 핸들이 매끄러웠어요 ',0,0,BOARD_SEQ.CURRVAL,0,0,'192.168.152',SYSDATE);
--(3-1)글쓰기(원글) 
INSERT INTO BOARD (BNO,MID,bSUBJECT,BCONTENT,BFILE,bHIT,BGROUP,bSTEP,BINDENT,bIP,bRDATE)
VALUES (BOARD_SEQ.NEXTVAL,'ZICO','포르쉐 시승후기','비싼 값을 하네요',NULL,0,BOARD_SEQ.CURRVAL,0,0,'192.168.152',SYSDATE);
--(4)HIT 하나 올리기 (1번글 조회수 하나 올리기 )
UPDATE BOARD SET BHIT = BHIT+1 WHERE BNO = 1;

--(5)BNO로 글 DTO 보기
SELECT B.*, MNAME FROM BOARD B, MEMBER M 
    WHERE M.MID=B.MID AND BNO=1;
    
--(6)글 수정하기 
UPDATE BOARD SET
                bSUBJECT = '코너링 정말 별로였어요',
                 BCONTENT = '아직 미숙해서 그런지 시승이 힘들었네요 ㅜㅜ', 
                 BFILE = 'BMW1.jpg',            
                 brdate = sysdate
                 WHERE MID = 'jo' and bno = '1';
           commit;      
select * from board where mid = 'jo' ;     

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
    VALUES(BOARD_SEQ.NEXTVAL,'KANG','정말 별로였나여','다음주 시승예약했는데','C.JPG',1,1,1,'192.167.10');
--(10)회원탈퇴 하려는 사람이 쓴 글 모두 삭제 후 탈퇴
DELETE FROM BOARD WHERE MID = 'jo';
ROLLBACK;
COMMIT;

----------------------------------------------------------------------
--                          ADMIN TABLE                             --
----------------------------------------------------------------------
INSERT INTO ADMIN(AID,APW) VALUES ('admin','111');
--ADMIN  MAIN의 CAR LIST  수정, 삭제, 자유게시판 수정, 삭제,
--(1) admin loginCheck
SELECT * FROM ADMIN WHERE AID = 'admin' AND APW='111';
--(2) 로그인 후 세션에 넣을 용도 : admin AID로 DTO 가져오기
SELECT * FROM ADMIN WHERE AID = 'admin';

--관리자 화면 
--회원리스트(등급별 출력 )
SELECT * FROM (SELECT ROWNUM RN,A.* FROM
    (SELECT * FROM MEMBER ORDER BY MGRADE )A)
    WHERE RN BETWEEN 1 AND 2;
----------------------------------------------------------------------
--                           COMMENT                             --
----------------------------------------------------------------------
--1. 댓글쓰기
select * from member;
select * from board;
INSERT INTO BOARD_COMMENT(CNO,MID,CMEMO,BNO)
    VALUES(COMMENT_SEQ.NEXTVAL,'CUTE','차가 너무 이뻐요',1);
    INSERT INTO BOARD_COMMENT(CNO,MID,CMEMO,BNO)
    VALUES(COMMENT_SEQ.NEXTVAL,'CUTE','다음주 시승인데 떨리네요',1);
INSERT INTO BOARD_COMMENT(CNO,MID,CMEMO,BNO)
    VALUES(COMMENT_SEQ.NEXTVAL,'ZICO','차 색이 이뻐요',3);
    INSERT INTO BOARD_COMMENT(CNO,MID,CMEMO,BNO)
    VALUES(COMMENT_SEQ.NEXTVAL,'jo','사진이 안보여요',4);
SELECT * FROM BOARD_COMMENT;

--2. 댓글 목록 출력 --페이징처리(STARTROW, ENDROW) ROWNUM
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOARD_COMMENT WHERE BNO='1' ORDER BY CNO DESC) A) 
    WHERE RN BETWEEN 1 AND 2;
--3. 댓글 갯수 출력 
SELECT COUNT(*) BOARD_COUNT FROM BOARD_COMMENT WHERE BNO=1;
--4. 댓글 삭제
select * from board_comment;
DELETE FROM BOARD_COMMENT WHERE CNO=5;
commit;
rollback;
--5. 댓글 수정
UPDATE BOARD_COMMENT SET cmemo = '비 개싫어' WHERE cno=6;
----------------------------------------------------------------------
--                           msg                            --
----------------------------------------------------------------------  
--메세지 쓰기 
insert into msg (msid, mname,memail,mphone,memo) 
    values(msg_seq.NEXTVAL,'박카스','ENERGY@ASD.COM','01012345678','힘들때 박카스 드세요1');
    insert into msg (msid, mname,memail,mphone,memo) 
    values(msg_seq.NEXTVAL,'박카스1','ENERGY@ASD.COM','01012345678','힘들때 박카스 드세요2');
    insert into msg (msid, mname,memail,mphone,memo) 
    values(msg_seq.NEXTVAL,'박카스2','ENERGY@ASD.COM','01012345678','힘들때 박카스 드세요3');
    insert into msg (msid, mname,memail,mphone,memo) 
    values(msg_seq.NEXTVAL,'박카스3','ENERGY@ASD.COM','01012345678','힘들때 박카스 드세요4');
    insert into msg (msid, mname,memail,mphone,memo) 
    values(msg_seq.NEXTVAL,'박카스4','ENERGY@ASD.COM','01012345678','힘들때 박카스 드세요5');
    commit;
--메세지 출력 
SELECT * FROM MSG;

----------------------------------------------------------------------
--                           CAR                             --
----------------------------------------------------------------------  
-- BRAND별  LIST 
select * from car where brandid = 'B1';
--DESIGN별 LIST 
select * from car where designID = 10;
--전체 출력 (가격순)
SELECT brandNAME,CARNAME, CPHOTO, CPRICE FROM CAR C, CAR_BRAND B 
    WHERE C.brandID = b.brandID ORDER BY CPRICE;
SELECT * FROM (SELECT ROWNUM RN,A.* FROM (SELECT brandNAME,CARNAME, CPHOTO, CPRICE FROM CAR C, CAR_BRAND B 
    WHERE C.brandID = b.brandID ORDER BY CPRICE)A)
    WHERE RN BETWEEN 1 AND 2;
update car set cprice = 111600000 where carname = 'CLS쿠페';
commit;
--MAIN LIST
SELECT cid, brandNAME,CARNAME, CPHOTO, CPRICE FROM CAR C, CAR_BRAND B 
    WHERE C.brandID = b.brandID AND BRANDNAME like '%'||'PORSCHE'||'%';
    
--BRAND 밑에 DESIGN별 LIST
SELECT brandNAME,cid,CARNAME,d.designname ,CPHOTO, Cprice, cfuel FROM CAR C, CAR_BRAND B , CAR_DESIGN D
    WHERE C.brandID = b.brandID AND D.DESIGNID=C.DESIGNID AND BRANDNAME like '%'||''||'%'  AND D.DESIGNname LIKE'%'||''||'%';
--cid로 dto 호출 
SELECT brandNAME,CARNAME,designname,CPRICE,CFUEL,CMILE,CPHOTO,cid FROM CAR C , CAR_BRAND B, car_design D 
    WHERE C.BRANDID = B.BRANDID AND D.DESIGNID=C.DESIGNID AND CID = '1';
SELECT * FROM CAR;
select * from CAR ORDER BY BRANDNAME;
commit;
--차 등록
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES('M-1','B2','A-CLASS',10,'40600000','가솔린','11.9km/L','A-CLASS.PNG');  

--차 삭제
DELETE FROM CAR WHERE CARNAME = 'A-CLASS';
ROLLBACK;
COMMIT;

SELECT * FROM CAR;
----------------------------------------------------------------------
--                           ESTIMATE                             --
----------------------------------------------------------------------    
INSERT INTO ESTIMATE (EID,MID, BRANDNAME,CARNAME, CPLACE, PREPAYMENT, TERM, PAY)
    VALUES(ESTIMATE_SEQ.NEXTVAL,'ZICO','PORSCHE','BOXTER','서울시 강남구 청담동','20','36','2035556');    
    
SELECT * FROM ESTIMATE;

--HIT수 증가에 따른 MGRADE 수정
insert into BOARD (BNO, bSUBJECT, BCONTENT, BFILE, bHIT, BGROUP, bSTEP, BINDENT, bIP, bRDATE, MID) 
    VALUES (BOARD_SEQ.NEXTVAL, '제목1','본문1', NULL, 10, BOARD_SEQ.CURRVAL, 0, 0, '192.168.0.1',SYSDATE, 'ZICO');
insert into BOARD (BNO, bSUBJECT, BCONTENT, BFILE, bHIT, BGROUP, bSTEP, BINDENT, bIP, bRDATE, MID) 
    VALUES (BOARD_SEQ.NEXTVAL, '저도 드디어 포르쉐 샀어요!!','평생 함께하자 ㅜㅜ', '4.jpg', 90, BOARD_SEQ.CURRVAL, 0, 0, '192.168.0.1',SYSDATE, 'HAN');    
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
    commit;
    
 SELECT M.*, NVL((SELECT SUM(bHIT) FROM BOARD WHERE MID=M.MID GROUP BY MID), 0) BHIT FROM MEMBER M;   