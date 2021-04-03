-- 카테고리
ALTER TABLE CATEGORY
	DROP PRIMARY KEY; -- 카테고리 기본키

-- 카테고리
DROP TABLE IF EXISTS CATEGORY RESTRICT;

-- 카테고리
CREATE TABLE CATEGORY (
	CTG_IDX      INT         NOT NULL, -- IDX
	CTG_CATEGORY VARCHAR(20) NOT NULL  -- 카테고리
);

-- 카테고리
ALTER TABLE CATEGORY
	ADD CONSTRAINT PK_CATEGORY -- 카테고리 기본키
		PRIMARY KEY (
			CTG_IDX -- IDX
		);

ALTER TABLE CATEGORY
	MODIFY COLUMN CTG_IDX INT NOT NULL AUTO_INCREMENT;

ALTER TABLE CATEGORY
	AUTO_INCREMENT = 1;

-------------------------------------------------------

-- 키워드
ALTER TABLE KEYWORD
	DROP FOREIGN KEY FK_CATEGORY_TO_KEYWORD; -- 카테고리 -> 키워드

-- 키워드
ALTER TABLE KEYWORD
	DROP PRIMARY KEY; -- 키워드 기본키

-- 키워드
DROP TABLE IF EXISTS KEYWORD RESTRICT;

-- 키워드
CREATE TABLE KEYWORD (
	KEY_IDX     INT          NOT NULL, -- 키워드IDX
	KEY_CTG_IDX INT          NOT NULL, -- 카테고리IDX
	KEY_WORD    VARCHAR2(20) NOT NULL  -- 키워드
);

-- 키워드
ALTER TABLE KEYWORD
	ADD CONSTRAINT PK_KEYWORD -- 키워드 기본키
		PRIMARY KEY (
			KEY_IDX -- 키워드IDX
		);

ALTER TABLE KEYWORD
	MODIFY COLUMN KEY_IDX INT NOT NULL AUTO_INCREMENT;

ALTER TABLE KEYWORD
	AUTO_INCREMENT = 1;

-- 키워드
ALTER TABLE KEYWORD
	ADD CONSTRAINT FK_CATEGORY_TO_KEYWORD -- 카테고리 -> 키워드
		FOREIGN KEY (
			KEY_CTG_IDX -- 카테고리IDX
		)
		REFERENCES CATEGORY ( -- 카테고리
			CTG_IDX -- IDX
		);

-------------------------------------------------------

-- 키워드작성
ALTER TABLE KEYWORD_RECORD
	DROP FOREIGN KEY FK_KEYWORD_TO_KEYWORD_RECORD; -- 키워드 -> 키워드작성

-- 키워드작성
ALTER TABLE KEYWORD_RECORD
	DROP FOREIGN KEY FK_CONTENT_TO_KEYWORD_RECORD; -- 게시물 -> 키워드작성

-- 키워드작성
ALTER TABLE KEYWORD_RECORD
	DROP FOREIGN KEY FK_USER_TO_KEYWORD_RECORD; -- 회원 -> 키워드작성

-- 키워드작성
ALTER TABLE KEYWORD_RECORD
	DROP PRIMARY KEY; -- 키워드작성 기본키

-- 키워드작성
DROP TABLE IF EXISTS KEYWORD_RECORD RESTRICT;

-- 키워드작성
CREATE TABLE KEYWORD_RECORD (
	KR_IDX      BIGINT    NOT NULL, -- KRIDX
	KR_KEY_IDX  INT       NOT NULL, -- KEYIDX
	KR_CON_IDX  INT       NOT NULL, -- CONIDX
	KR_USER_IDX INT       NOT NULL, -- USERIDX
	KR_CREATE   TIMESTAMP NOT NULL  -- 생성날짜
);

-- 키워드작성
ALTER TABLE KEYWORD_RECORD
	ADD CONSTRAINT PK_KEYWORD_RECORD -- 키워드작성 기본키
		PRIMARY KEY (
			KR_IDX -- KRIDX
		);

-- 키워드작성
ALTER TABLE KEYWORD_RECORD
	ADD CONSTRAINT FK_KEYWORD_TO_KEYWORD_RECORD -- 키워드 -> 키워드작성
		FOREIGN KEY (
			KR_KEY_IDX -- KEYIDX
		)
		REFERENCES KEYWORD ( -- 키워드
			KEY_IDX -- 키워드IDX
		);

-- 키워드작성
ALTER TABLE KEYWORD_RECORD
	ADD CONSTRAINT FK_CONTENT_TO_KEYWORD_RECORD -- 게시물 -> 키워드작성
		FOREIGN KEY (
			KR_CON_IDX -- CONIDX
		)
		REFERENCES CONTENT ( -- 게시물
			CON_IDX -- IDX
		);

-- 키워드작성
ALTER TABLE KEYWORD_RECORD
	ADD CONSTRAINT FK_USER_TO_KEYWORD_RECORD -- 회원 -> 키워드작성
		FOREIGN KEY (
			KR_USER_IDX -- USERIDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

---------------------------------------------------------------------
-- 게시물
ALTER TABLE CONTENT
	DROP FOREIGN KEY FK_USER_TO_CONTENT; -- 회원 -> 게시물

-- 게시물
ALTER TABLE CONTENT
	DROP FOREIGN KEY FK_KEYWORD_TO_CONTENT; -- 키워드 -> 게시물

-- 게시물
ALTER TABLE CONTENT
	DROP PRIMARY KEY; -- 게시물

-- 게시물
DROP TABLE IF EXISTS CONTENT RESTRICT;

-- 게시물
CREATE TABLE CONTENT (
	CON_IDX      INT           NOT NULL, -- IDX
	CON_USER_IDX INT           NOT NULL, -- USERIDX
	CON_KEY_IDX  INT           NOT NULL, -- 키워드IDX
	CON_TEXT     TEXT          NOT NULL, -- 내용
	CON_IMG      VARCHAR2(100) NULL,     -- 사진
	CON_VIDEO    VARCHAR2(100) NULL,     -- 동영상
	CON_CREATE   TIMESTAMP     NOT NULL DEFAULT SYSDATE -- 생성날짜
);

-- 게시물
ALTER TABLE CONTENT
	ADD CONSTRAINT PK_CONTENT -- 게시물
		PRIMARY KEY (
			CON_IDX -- IDX
		);

ALTER TABLE CONTENT
	MODIFY COLUMN CON_IDX INT NOT NULL AUTO_INCREMENT;

ALTER TABLE CONTENT
	AUTO_INCREMENT = 1;

-- 게시물
ALTER TABLE CONTENT
	ADD CONSTRAINT FK_USER_TO_CONTENT -- 회원 -> 게시물
		FOREIGN KEY (
			CON_USER_IDX -- USERIDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-- 게시물
ALTER TABLE CONTENT
	ADD CONSTRAINT FK_KEYWORD_TO_CONTENT -- 키워드 -> 게시물
		FOREIGN KEY (
			CON_KEY_IDX -- 키워드IDX
		)
		REFERENCES KEYWORD ( -- 키워드
			KEY_IDX -- 키워드IDX
		);

---------------------------------------------------------------

-- 태그
ALTER TABLE TAG
	DROP FOREIGN KEY FK_CONTENT_TO_TAG; -- 게시물 -> 태그

-- 태그
ALTER TABLE TAG
	DROP FOREIGN KEY FK_USER_TO_TAG; -- 회원 -> 태그

-- 태그
ALTER TABLE TAG
	DROP PRIMARY KEY; -- 태그 기본키

-- 태그
DROP TABLE IF EXISTS TAG RESTRICT;

-- 태그
CREATE TABLE TAG (
	TAG_IDX      INT          NOT NULL, -- TAGIDX
	TAG_CON_IDX  INT          NOT NULL, -- CONIDX
	TAG_USER_IDX INT          NOT NULL, -- USERDX
	TAG_NAME     VARCHAR2(30) NOT NULL, -- 태그명
	TAG_CREATE   TIMESTAMP    NOT NULL  -- 태그등록일
);

-- 태그
ALTER TABLE TAG
	ADD CONSTRAINT PK_TAG -- 태그 기본키
		PRIMARY KEY (
			TAG_IDX -- TAGIDX
		);

-- 태그
ALTER TABLE TAG
	ADD CONSTRAINT FK_CONTENT_TO_TAG -- 게시물 -> 태그
		FOREIGN KEY (
			TAG_CON_IDX -- CONIDX
		)
		REFERENCES CONTENT ( -- 게시물
			CON_IDX -- IDX
		);

-- 태그
ALTER TABLE TAG
	ADD CONSTRAINT FK_USER_TO_TAG -- 회원 -> 태그
		FOREIGN KEY (
			TAG_USER_IDX -- USERDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);
	
-----------------------------------------------------------------
-- 댓글
ALTER TABLE COMMENT
	DROP FOREIGN KEY FK_CONTENT_TO_COMMENT; -- 게시물 -> 댓글

-- 댓글
ALTER TABLE COMMENT
	DROP FOREIGN KEY FK_USER_TO_COMMENT; -- 회원 -> 댓글

-- 댓글
ALTER TABLE COMMENT
	DROP PRIMARY KEY; -- 댓글 기본키

-- 댓글
DROP TABLE IF EXISTS COMMENT RESTRICT;

-- 댓글
CREATE TABLE COMMENT (
	RE_IDX      INT       NOT NULL, -- REIDX
	RE_CON_IDX  INT       NOT NULL, -- CONIDX
	RE_USER_IDX INT       NOT NULL, -- USERIDX
	RE_CREATE   TIMESTAMP NOT NULL, -- 작성일
	RE_TEXT     TEXT      NOT NULL  -- 본문
);

-- 댓글
ALTER TABLE COMMENT
	ADD CONSTRAINT PK_COMMENT -- 댓글 기본키
		PRIMARY KEY (
			RE_IDX -- REIDX
		);

-- 댓글
ALTER TABLE COMMENT
	ADD CONSTRAINT FK_CONTENT_TO_COMMENT -- 게시물 -> 댓글
		FOREIGN KEY (
			RE_CON_IDX -- CONIDX
		)
		REFERENCES CONTENT ( -- 게시물
			CON_IDX -- IDX
		);

-- 댓글
ALTER TABLE COMMENT
	ADD CONSTRAINT FK_USER_TO_COMMENT -- 회원 -> 댓글
		FOREIGN KEY (
			RE_USER_IDX -- USERIDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-------------------------------------------------------------
-- 노크
ALTER TABLE KNOCK
	DROP FOREIGN KEY FK_CONTENT_TO_KNOCK; -- 게시물 -> 노크

-- 노크
ALTER TABLE KNOCK
	DROP FOREIGN KEY FK_USER_TO_KNOCK; -- 회원 -> 노크

-- 노크
ALTER TABLE KNOCK
	DROP FOREIGN KEY FK_COMMENT_TO_KNOCK; -- 댓글 -> 노크

-- 노크
ALTER TABLE KNOCK
	DROP PRIMARY KEY; -- 노크 기본키

-- 노크
DROP TABLE IF EXISTS KNOCK RESTRICT;

-- 노크
CREATE TABLE KNOCK (
	KNOCK_IDX      BIGINT    NOT NULL, -- KNOCKIDX
	KNOCK_USER_IDX INT       NOT NULL, -- USERIDX
	KNOCK_CON_IDX  INT       NOT NULL, -- CONIDX
	KNOCK_RE_IDX   INT       NULL,     -- REIDX
	KNOCK_TYPE     CHAR(1)   NOT NULL, -- 구분
	KNOCK_CREATE   TIMESTAMP NOT NULL  -- 노크일
);

-- 노크
ALTER TABLE KNOCK
	ADD CONSTRAINT PK_KNOCK -- 노크 기본키
		PRIMARY KEY (
			KNOCK_IDX -- KNOCKIDX
		);

-- 노크
ALTER TABLE KNOCK
	ADD CONSTRAINT FK_CONTENT_TO_KNOCK -- 게시물 -> 노크
		FOREIGN KEY (
			KNOCK_CON_IDX -- CONIDX
		)
		REFERENCES CONTENT ( -- 게시물
			CON_IDX -- IDX
		);

-- 노크
ALTER TABLE KNOCK
	ADD CONSTRAINT FK_USER_TO_KNOCK -- 회원 -> 노크
		FOREIGN KEY (
			KNOCK_USER_IDX -- USERIDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-- 노크
ALTER TABLE KNOCK
	ADD CONSTRAINT FK_COMMENT_TO_KNOCK -- 댓글 -> 노크
		FOREIGN KEY (
			KNOCK_RE_IDX -- REIDX
		)
		REFERENCES COMMENT ( -- 댓글
			RE_IDX -- REIDX
		);

-----------------------------------------------------------------

-- 검색기록
ALTER TABLE SEARCH_RECORD
	DROP FOREIGN KEY FK_USER_TO_SEARCH_RECORD; -- 회원 -> 검색기록

-- 검색기록
ALTER TABLE SEARCH_RECORD
	DROP PRIMARY KEY; -- 검색기록 기본키

-- 검색기록
DROP TABLE IF EXISTS SEARCH_RECORD RESTRICT;

-- 검색기록
CREATE TABLE SEARCH_RECORD (
	SR_IDX      BIGINT       NOT NULL, -- SRIDX
	SR_USER_IDX INT          NOT NULL, -- USERIDX
	SR_SEARCH   VARCHAR(200) NOT NULL, -- 검색어
	SR_CREATE   TIMESTAMP    NOT NULL DEFAULT SYSDATE -- 생성날짜
);

-- 검색기록
ALTER TABLE SEARCH_RECORD
	ADD CONSTRAINT PK_SEARCH_RECORD -- 검색기록 기본키
		PRIMARY KEY (
			SR_IDX -- SRIDX
		);

ALTER TABLE SEARCH_RECORD
	MODIFY COLUMN SR_IDX BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE SEARCH_RECORD
	AUTO_INCREMENT = 1;

-- 검색기록
ALTER TABLE SEARCH_RECORD
	ADD CONSTRAINT FK_USER_TO_SEARCH_RECORD -- 회원 -> 검색기록
		FOREIGN KEY (
			SR_USER_IDX -- USERIDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-------------------------------------------------------------------

-- 회원
ALTER TABLE USER
	DROP PRIMARY KEY; -- 유저

-- 회원
DROP TABLE IF EXISTS USER RESTRICT;

-- 회원
CREATE TABLE USER (
	USER_IDX    INT          NOT NULL, -- USERIDX
	USER_ID     VARCHAR(45)  NOT NULL, -- 유저ID
	USER_NAME   VARCHAR(45)  NOT NULL, -- 이름
	USER_PWD    VARCHAR(100) NOT NULL, -- 비밀번호
	USER_BIRTH  DATE         NULL,     -- 생일
	USER_TEL    VARCHAR(13)  NULL,     -- 핸드폰번호
	USER_EMAIL  VARCHAR(100) NULL,     -- 이메일
	USER_PHOTO  VARCHAR(100) NULL,     -- 사진
	USER_CREATE TIMESTAMP    NOT NULL DEFAULT SYSDATE, -- 생성날짜
	USER_MSTATE CHAR(1)      NOT NULL DEFAULT 0 -- 탈퇴여부
);

-- 회원
ALTER TABLE USER
	ADD CONSTRAINT PK_USER -- 유저
		PRIMARY KEY (
			USER_IDX -- USERIDX
		);

ALTER TABLE USER
	MODIFY COLUMN USER_IDX INT NOT NULL AUTO_INCREMENT;

ALTER TABLE USER
	AUTO_INCREMENT = 1;

------------------------------------------------------------------
-- 유저키워드
ALTER TABLE USERKEY
	DROP FOREIGN KEY FK_USER_TO_USERKEY; -- 회원 -> 유저키워드

-- 유저키워드
ALTER TABLE USERKEY
	DROP FOREIGN KEY FK_KEYWORD_TO_USERKEY; -- 키워드 -> 유저키워드

-- 유저키워드
ALTER TABLE USERKEY
	DROP PRIMARY KEY; -- 유저키워드 기본키

-- 유저키워드
DROP TABLE IF EXISTS USERKEY RESTRICT;

-- 유저키워드
CREATE TABLE USERKEY (
	UK_IDX     INT         NOT NULL, -- IDX
	USER_IDX   INT         NOT NULL, -- USERIDX
	UK_KEY_IDX INT         NOT NULL, -- KEYIDX
	UK_ID      TINYINT     NOT NULL, -- ID
	UK_TEXT    TEXT        NULL,     -- 텍스트
	UK_PHOTO   VARCHR(100) NULL      -- 사진
);

-- 유저키워드
ALTER TABLE USERKEY
	ADD CONSTRAINT PK_USERKEY -- 유저키워드 기본키
		PRIMARY KEY (
			UK_IDX -- IDX
		);

ALTER TABLE USERKEY
	MODIFY COLUMN UK_IDX INT NOT NULL AUTO_INCREMENT;

ALTER TABLE USERKEY
	AUTO_INCREMENT = 1;

-- 유저키워드
ALTER TABLE USERKEY
	ADD CONSTRAINT FK_USER_TO_USERKEY -- 회원 -> 유저키워드
		FOREIGN KEY (
			USER_IDX -- USERIDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-- 유저키워드
ALTER TABLE USERKEY
	ADD CONSTRAINT FK_KEYWORD_TO_USERKEY -- 키워드 -> 유저키워드
		FOREIGN KEY (
			UK_KEY_IDX -- KEYIDX
		)
		REFERENCES KEYWORD ( -- 키워드
			KEY_IDX -- 키워드IDX
		);

--------------------------------------------------------------

-- 팔로잉
ALTER TABLE FOLLOWING
	DROP FOREIGN KEY FK_USER_TO_FOLLOWING; -- 회원 -> 팔로잉

-- 팔로잉
ALTER TABLE FOLLOWING
	DROP FOREIGN KEY FK_USER_TO_FOLLOWING2; -- 회원 -> 팔로잉2

-- 팔로잉
ALTER TABLE FOLLOWING
	DROP PRIMARY KEY; -- 팔로잉

-- 팔로잉
DROP TABLE IF EXISTS FOLLOWING RESTRICT;

-- 팔로잉
CREATE TABLE FOLLOWING (
	FI_IDX      VARCHAR(45) NOT NULL, -- IDX
	FI_CREATE   DATE        NOT NULL DEFAULT SYSDATE, -- 생성날짜
	FI_USER_IDX INT         NOT NULL, -- 유저IDX
	FL_OTHERIDX INT         NOT NULL  -- 샹대IDX
);

-- 팔로잉
ALTER TABLE FOLLOWING
	ADD CONSTRAINT PK_FOLLOWING -- 팔로잉
		PRIMARY KEY (
			FI_IDX -- IDX
		);

ALTER TABLE FOLLOWING
	MODIFY COLUMN FI_IDX VARCHAR(45) NOT NULL AUTO_INCREMENT;

-- 팔로잉
ALTER TABLE FOLLOWING
	ADD CONSTRAINT FK_USER_TO_FOLLOWING -- 회원 -> 팔로잉
		FOREIGN KEY (
			FI_USER_IDX -- 유저IDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-- 팔로잉
ALTER TABLE FOLLOWING
	ADD CONSTRAINT FK_USER_TO_FOLLOWING2 -- 회원 -> 팔로잉2
		FOREIGN KEY (
			FL_OTHERIDX -- 샹대IDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-----------------------------------------------------------------

-- 팔로워
ALTER TABLE FOLLOWER
	DROP FOREIGN KEY FK_USER_TO_FOLLOWER; -- 회원 -> 팔로워

-- 팔로워
ALTER TABLE FOLLOWER
	DROP FOREIGN KEY FK_USER_TO_FOLLOWER2; -- 회원 -> 팔로워2

-- 팔로워
ALTER TABLE FOLLOWER
	DROP PRIMARY KEY; -- 팔로워

-- 팔로워
DROP TABLE IF EXISTS FOLLOWER RESTRICT;

-- 팔로워
CREATE TABLE FOLLOWER (
	FE_IDX      INT  NOT NULL, -- IDX
	FE_CREATE   DATE NOT NULL DEFAULT SYSDATE, -- 생성날짜
	FE_USER_IDX INT  NOT NULL, -- 유저IDX
	FE_OTHERIDX INT  NOT NULL  -- 샹대IDX
);

-- 팔로워
ALTER TABLE FOLLOWER
	ADD CONSTRAINT PK_FOLLOWER -- 팔로워
		PRIMARY KEY (
			FE_IDX -- IDX
		);

ALTER TABLE FOLLOWER
	MODIFY COLUMN FE_IDX INT NOT NULL AUTO_INCREMENT;

ALTER TABLE FOLLOWER
	AUTO_INCREMENT = 1;

-- 팔로워
ALTER TABLE FOLLOWER
	ADD CONSTRAINT FK_USER_TO_FOLLOWER -- 회원 -> 팔로워
		FOREIGN KEY (
			FE_USER_IDX -- 유저IDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-- 팔로워
ALTER TABLE FOLLOWER
	ADD CONSTRAINT FK_USER_TO_FOLLOWER2 -- 회원 -> 팔로워2
		FOREIGN KEY (
			FE_OTHERIDX -- 샹대IDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-----------------------------------------------------------
-- 메세지리스트
ALTER TABLE MESSAGELIST
	DROP FOREIGN KEY FK_USER_TO_MESSAGELIST; -- 회원 -> 메세지리스트

-- 메세지리스트
ALTER TABLE MESSAGELIST
	DROP FOREIGN KEY FK_USER_TO_MESSAGELIST2; -- 회원 -> 메세지리스트2

-- 메세지리스트
ALTER TABLE MESSAGELIST
	DROP PRIMARY KEY; -- 메세지리스트

-- 메세지리스트
DROP TABLE IF EXISTS MESSAGELIST RESTRICT;

-- 메세지리스트
CREATE TABLE MESSAGELIST (
	ML_ID       INT       NOT NULL, -- 리스트ID
	ML_USER_ID  INT       NOT NULL, -- 유저IDX
	ML_OTHER_ID INT       NOT NULL, -- 상대IDX
	ML_CREATE   TIMESTAMP NOT NULL DEFAULT SYSDATE, -- 생성날짜
	ML_UPDATE   TIMESTAMP NOT NULL DEFAULT SYSDATE -- 업데이트날짜
);

-- 메세지리스트
ALTER TABLE MESSAGELIST
	ADD CONSTRAINT PK_MESSAGELIST -- 메세지리스트
		PRIMARY KEY (
			ML_ID -- 리스트ID
		);

ALTER TABLE MESSAGELIST
	MODIFY COLUMN ML_ID INT NOT NULL AUTO_INCREMENT;

ALTER TABLE MESSAGELIST
	AUTO_INCREMENT = 1;

-- 메세지리스트
ALTER TABLE MESSAGELIST
	ADD CONSTRAINT FK_USER_TO_MESSAGELIST -- 회원 -> 메세지리스트
		FOREIGN KEY (
			ML_USER_ID -- 유저IDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-- 메세지리스트
ALTER TABLE MESSAGELIST
	ADD CONSTRAINT FK_USER_TO_MESSAGELIST2 -- 회원 -> 메세지리스트2
		FOREIGN KEY (
			ML_OTHER_ID -- 상대IDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

--------------------------------------------------------------------
-- 메세지
ALTER TABLE MESSAGE
	DROP FOREIGN KEY FK_USER_TO_MESSAGE; -- 회원 -> 메세지

-- 메세지
ALTER TABLE MESSAGE
	DROP FOREIGN KEY FK_MESSAGELIST_TO_MESSAGE; -- 메세지리스트 -> 메세지

-- 메세지
ALTER TABLE MESSAGE
	DROP PRIMARY KEY; -- 메세지

-- 메세지
DROP TABLE IF EXISTS MESSAGE RESTRICT;

-- 메세지
CREATE TABLE MESSAGE (
	MSG_IDX        INT          NOT NULL, -- IDX
	MSG_LIST_IDX   INT          NOT NULL, -- 리스트IDX
	MSG_SENDER_IDX INT          NOT NULL, -- 유저IDX
	MSG_TEXT       TEXT         NULL,     -- 내용
	MSG_PHOTO      VARCHR(100)  NULL,     -- 사진
	MSG_VIDEO      VARCHAR(100) NULL,     -- 동영상
	MSG_CREATE     TIMESTAMP    NOT NULL DEFAULT SYSDATE -- 생성날짜
);

-- 메세지
ALTER TABLE MESSAGE
	ADD CONSTRAINT PK_MESSAGE -- 메세지
		PRIMARY KEY (
			MSG_IDX -- IDX
		);

ALTER TABLE MESSAGE
	MODIFY COLUMN MSG_IDX INT NOT NULL AUTO_INCREMENT;

ALTER TABLE MESSAGE
	AUTO_INCREMENT = 1;

-- 메세지
ALTER TABLE MESSAGE
	ADD CONSTRAINT FK_USER_TO_MESSAGE -- 회원 -> 메세지
		FOREIGN KEY (
			MSG_SENDER_IDX -- 유저IDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-- 메세지
ALTER TABLE MESSAGE
	ADD CONSTRAINT FK_MESSAGELIST_TO_MESSAGE -- 메세지리스트 -> 메세지
		FOREIGN KEY (
			MSG_LIST_IDX -- 리스트IDX
		)
		REFERENCES MESSAGELIST ( -- 메세지리스트
			ML_ID -- 리스트ID
		);

--------------------------------------------------------------------
-- 알람
ALTER TABLE ALARM
	DROP FOREIGN KEY FK_USER_TO_ALARM; -- 회원 -> 알람

-- 알람
ALTER TABLE ALARM
	DROP FOREIGN KEY FK_USER_TO_ALARM2; -- 회원 -> 알람2

-- 알람
ALTER TABLE ALARM
	DROP PRIMARY KEY; -- 알람

-- 알람
DROP TABLE IF EXISTS ALARM RESTRICT;

-- 알람
CREATE TABLE ALARM (
	ALARM_IDX       INT         NOT NULL, -- IDX
	ALARM_USER_IDX  INT         NOT NULL, -- 유저IDX
	ALARM_OTHER_IDX INT         NOT NULL, -- 상대IDX
	ALARM_CREATE    TIMESTAMP   NOT NULL DEFAULT SYSDATE, -- 생성날짜
	ALARM_TEXT      VARCHAR(50) NOT NULL  -- 내용
);

-- 알람
ALTER TABLE ALARM
	ADD CONSTRAINT PK_ALARM -- 알람
		PRIMARY KEY (
			ALARM_IDX -- IDX
		);

ALTER TABLE ALARM
	MODIFY COLUMN ALARM_IDX INT NOT NULL AUTO_INCREMENT;

ALTER TABLE ALARM
	AUTO_INCREMENT = 1;

-- 알람
ALTER TABLE ALARM
	ADD CONSTRAINT FK_USER_TO_ALARM -- 회원 -> 알람
		FOREIGN KEY (
			ALARM_USER_IDX -- 유저IDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);

-- 알람
ALTER TABLE ALARM
	ADD CONSTRAINT FK_USER_TO_ALARM2 -- 회원 -> 알람2
		FOREIGN KEY (
			ALARM_OTHER_IDX -- 상대IDX
		)
		REFERENCES USER ( -- 회원
			USER_IDX -- USERIDX
		);