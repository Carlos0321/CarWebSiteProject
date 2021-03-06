--MEMBER DUMMY
INSERT INTO MEMBER(MID,MGRADE,MNAME,MPW,MTEL,MEMAIL,MADDRESS,MGENDER,mBIRTH)
    VALUES('ZICO',3,'지코','1','010-1111-1111','ZICO@NAVER.COM','서울시 강남구','남','1990-05-05');
INSERT INTO MEMBER(MID,MGRADE,MNAME,MPW,MTEL,MEMAIL,MADDRESS,MGENDER,mBIRTH)
    VALUES('KANG',3,'강동원','1','010-2222-2222','KANG@NAVER.COM','서울시 용산구','남','1986-12-12');  
INSERT INTO MEMBER(MID,MGRADE,MNAME,MPW,MTEL,MEMAIL,MADDRESS,MGENDER,mBIRTH)
    VALUES('jo',2,'조강옥','1','010-3333-3333','JO@NAVER.COM','서울시 용산구','남','1985-04-01');
select * from member;

--BOARD DUMMY
INSERT INTO BOARD (BNO,MID,bSUBJECT,BCONTENT,BFILE,bHIT,BGROUP,bSTEP,BINDENT,bIP,bRDATE)
VALUES (BOARD_SEQ.NEXTVAL,'jo','TITLE','CONTENT',NULL,0,BOARD_SEQ.CURRVAL,0,0,'192.168.152',SYSDATE);
INSERT INTO BOARD (BNO,MID,bSUBJECT,BCONTENT,BFILE,bHIT,BGROUP,bSTEP,BINDENT,bIP,bRDATE)
VALUES (BOARD_SEQ.NEXTVAL,'CUTE','에스파','졸귀탱','WINTER.JPG',0,BOARD_SEQ.CURRVAL,0,0,'192.168.150',SYSDATE);
SELECT * FROM BOARD;
commit;
select * from member;
insert into BOARD (BNO, bSUBJECT, BCONTENT, BFILE, bHIT, BGROUP, bSTEP, BINDENT, bIP, bRDATE, MID) 
    VALUES (BOARD_SEQ.NEXTVAL, '제목1','본문1', NULL, 10, BOARD_SEQ.CURRVAL, 0, 0, '192.168.0.1',SYSDATE, 'ZICO');-- ★ ★ ★1번
insert into BOARD (BNO, bSUBJECT, BCONTENT, BFILE, bHIT, BGROUP, bSTEP, BINDENT, bIP, bRDATE, MID) 
    VALUES (BOARD_SEQ.NEXTVAL, '제목1','본문1', NULL, 100, BOARD_SEQ.CURRVAL, 0, 0, '192.168.0.1',SYSDATE, 'ZICO');
insert into BOARD (BNO, bSUBJECT, BCONTENT, BFILE, bHIT, BGROUP, bSTEP, BINDENT, bIP, bRDATE, MID) 
    VALUES (BOARD_SEQ.NEXTVAL, '제목1','본문1', NULL, 90, BOARD_SEQ.CURRVAL, 0, 0, '192.168.0.1',SYSDATE, 'KANG');
insert into BOARD (BNO, bSUBJECT, BCONTENT, BFILE, bHIT, BGROUP, bSTEP, BINDENT, bIP, bRDATE, MID) 
    VALUES (BOARD_SEQ.NEXTVAL, '제목1','본문1', NULL, 0, BOARD_SEQ.CURRVAL, 0, 0, '192.168.0.1',SYSDATE, 'KANG'); 
    


--CAR DUMMY
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','CAYENNE',20,'117200000','가솔린','6.6km/L','cayenne_suv.png');    
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','CAYENNECoupe',30,'126200000','가솔린','6.6km/L','cayennCoupe_SUV.png');
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','718cayman',30,'86400000','가솔린','9.2km/L','718cayman.png');
    INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','718cayman',30,'86400000','가솔린','9.2km/L','718caymanGT4.png');   
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','MACAN',20,'103000000','가솔린','7.6km/L','macan.png');  
    INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','MACAN_GTS',20,'114500000','가솔린','7.6km/L','macanGTS_SUV.png'); 
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','BOXTER',40,'91600000','가솔린','9.2km/L','718Boxter_carbirolet.png');    
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','panamera',10,'150300000','가솔린','8.0km/L','panamera4_sedan.png');
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','panameraGTS',10,'221200000','가솔린','7.1km/L','panameraGTS_sedan.png');
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','911Carrera',30,'147900000','가솔린','8.1km/L','911Carrera.png');  
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','911CarreraGTS',30,'204100000','가솔린','8.0km/L','911CarreraGTS.png');  
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B5','TYCAN',10,'145600000','전기','251KM/1회충전','taycan_sedan.png');      

INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B3','A5',10,'67900000','가솔린','10.9KM/L','A5.PNG') ;
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B1','M2',30,'114800000','가솔린','9.4KM/L','M2.PNG');  
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B4','ghiblii',10,'115600000','가솔린','6.5KM/L','ghibli.PNG');  
   
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B1','2시리즈',30,'69200000','가솔린','9.6KM/L','2.PNG');
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B1','3시리즈',10,'51800000','디젤','9.9KM/L','3.PNG');
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B1','4시리즈',30,'81500000','가솔린','10.4KM/L','4.PNG'); 
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B1','5시리즈',10,'63700000','가솔린','7.9KM/L','5.PNG');
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B1','7시리즈',10,'138700000','하이브리드','6.4KM/kWh','7.PNG');   
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
  VALUES(CAR_SEQ.NEXTVAL,'B1','8시리즈',30,'138700000','하이브리드','6.6KM/kWh','8.PNG');
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B1','IX',20,'121900000','하이브리드','3.6KM/kWh','ix.PNG');  
   
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B3','A4',10,'51200000','가솔린','10.5KM/L','A4.PNG');
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B3','A5',30,'67900000','가솔린','10.9KM/L','A5.PNG');  
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B3','A5Carbirolet',40,'75660000','가솔린','10.5KM/L','A5carbirolet.PNG');  
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B3','e-tron',20,'97220000','전기','2.9KM/kWh','e-tron.PNG'); 
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
  VALUES(CAR_SEQ.NEXTVAL,'B3','e-tronGT',30,'145200000','전기','3.7KM/kWh','e-tronGT.PNG');   
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B3','Q3',20,'47050000','디젤','14.2KM/L','Q3.PNG');
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
   VALUES(CAR_SEQ.NEXTVAL,'B3','Q5',20,'63960000','디젤','10.2KM/L','Q5.PNG');     

INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','A-CLASS',10,'40300000','가솔린','11KM/L','A-CLASS.PNG' );  
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','C-CLASS',10,'61500000','가솔린','11.3KM/L','C-CLASS.PNG' );
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','C-CLASS쿠페',30,'63700000','가솔린','11.1KM/L','C-CLASS_coupe.PNG' );    
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','CLA쿠페',30,'55200000','가솔린','11.5KM/L','CLA_COUPE.PNG' );
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','CLS쿠페',30,'11160000','가솔린','9.8KM/L','CLA_COUPE.PNG' );     
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','E-CLASS',10,'67300000','디젤','9.1KM/L','E-CLASS.PNG' );  
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','E-CLASS쿠페',30,'82400000','디젤','9.1KM/L','E-CLASS_coupe.PNG' );   
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','GLA',20,'52600000','가솔린','10.5KM/L','GLA_SUV.PNG' );     
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','GLB',20,'52700000','가솔린','10.5KM/L','GLB_SUV.PNG' );  
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','GLE',20,'9970000','디젤','8.7KM/L','GLE_SUV.PNG' );
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','GLS',20,'140060000','가솔린','9,8KM/L','GLS_SUV.PNG' );
INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)
    VALUES(CAR_SEQ.NEXTVAL,'B2','S-CLASS',10,'140060000','가솔린','12.KM/L','S-CLASS.PNG' );        
SELECT * FROM CAR ;
COMMIT;
--Car update 
UPDATE CAR SET CPHOTO= 'cayenne_suv.png' where carname ='CAYENNE';
UPDATE CAR SET CPHOTO= 'cayenneCoupe_SUV.png', carname='CAYENNE_Coupe' where carname ='CAYENNECoupe';
UPDATE CAR SET CPHOTO= 'macan.png' where carname ='MACAN';
UPDATE CAR SET CPHOTO= '718Boxter_carbirolet.png' where carname ='BOXTER';
UPDATE CAR SET CPHOTO= 'panamera4_sedan.png' where carname ='panamera';
UPDATE CAR SET CPHOTO= 'panameraGTS_sedan.png' where carname ='panameraGTS';
UPDATE CAR SET CPHOTO= 'A5.png' where carname ='A5';
UPDATE CAR SET CPHOTO= 'A5.png' where carname ='A5';
UPDATE CAR SET CPHOTO= 'Q5.PNG' where carname ='Q5';
UPDATE CAR SET CPHOTO= 'CLS_coupe.png' where carname ='CLS쿠페';
UPDATE CAR SET CPRICE = '99700000'  WHERE CARNAME='GLE';
select * from car ORDER BY brandid;
commit;
select * from car_display;
--CAR_DISPLAY
INSERT INTO CAR_DISPLAY (CPLACE) VALUES ('서울시 강남구 청담동');
INSERT INTO CAR_DISPLAY (CPLACE) VALUES ('서울시 강남구 역삼동');
INSERT INTO CAR_DISPLAY (CPLACE) VALUES ('서울시 강남구 삼성동');
INSERT INTO CAR_DISPLAY (CPLACE) VALUES ('서울시 강남구 대치동');
INSERT INTO CAR_DISPLAY (CPLACE) VALUES ('서울시 서초구 서초동');
INSERT INTO CAR_DISPLAY (CPLACE) VALUES ('서울시 송파구 방이동');
commit;
