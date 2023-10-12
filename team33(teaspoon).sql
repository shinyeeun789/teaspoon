CREATE DATABASE team33;
USE team33;

SHOW TABLES;

-- 회원 테이블
CREATE TABLE MEMBER(
  id VARCHAR(20) PRIMARY KEY NOT NULL,
  pw VARCHAR(300) NOT NULL,
  NAME VARCHAR(50),
  email VARCHAR(100) NOT NULL,
  tel VARCHAR(20) NOT NULL,
  addr1 VARCHAR(200),
  addr2 VARCHAR(100),
  postcode VARCHAR(10),
  regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  birth DATE,
  pt INT(11) DEFAULT 0,
  visited INT(11) DEFAULT 0);

UPDATE member SET regdate='2022-09-01' WHERE id='admin'
UPDATE member SET regdate='2023-08-01' WHERE id='shin'

-- 회원 테이블 더미데이터
INSERT INTO member 
VALUES('admin','$2a$10$piyWPHz4GuwW0GxHZZfy1ORWtzKu7KPr9M0mFpw90hQJRQditQqJO','관리자','admin@tspoon.com','010-1234-5678',NULL, NULL, NULL,'2023-07-01', '1990-01-01', DEFAULT, DEFAULT);
INSERT INTO MEMBER
VALUES('kimname1', '$2a$10$RZPVsTktT7RmMp7Qoj9pd.xGfZmsvYgsnbalImORzqx5hRNIoqPnm', '김이름', 'kim@tspoon.com', '010-3214-6578', NULL, NULL, NULL, '2023-08-01', '2000-01-01', DEFAULT, DEFAULT);
INSERT INTO MEMBER
VALUES('parkname1', '$2a$10$RZPVsTktT7RmMp7Qoj9pd.xGfZmsvYgsnbalImORzqx5hRNIoqPnm', '박이름', 'kim@tspoon.com', '010-1587-5544', NULL, NULL, NULL, '2023-09-01', '1997-01-01', DEFAULT, DEFAULT);
INSERT INTO MEMBER
VALUES('shinname1', '$2a$10$RZPVsTktT7RmMp7Qoj9pd.xGfZmsvYgsnbalImORzqx5hRNIoqPnm', '신이름', 'shin@tspoon.com', '010-1568-5422', NULL, NULL, NULL, '2023-09-01', '1999-01-01', DEFAULT, DEFAULT);

SELECT * FROM MEMBER;
DELETE FROM attendance WHERE ano=6;


-- 커뮤니티 카테고리 테이블 생성
CREATE TABLE category(
   cate VARCHAR(5) PRIMARY KEY NOT NULL,
   cateName VARCHAR(100) NOT NULL);

-- 카테고리 테이블 데이터
INSERT INTO category VALUES('A', '자유게시판');
INSERT INTO category VALUES('B', '교육정보');
INSERT INTO category VALUES('C', '교재/학원 추천');
INSERT INTO category VALUES('D', '진로상담');


-- 커뮤니티 게시판 테이블 생성
CREATE TABLE community(
  cno INT PRIMARY KEY AUTO_INCREMENT,
  cate VARCHAR(5) NOT NULL,
  title VARCHAR(200) NOT NULL,
  content VARCHAR(1000),
  author VARCHAR(20),
  resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  cnt INT DEFAULT 0,
  FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
  FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE);

/* 자유게시판 더미데이터 */
INSERT INTO community(cate, title, content, author)
VALUES ('A', '요즘 나만 느끼는 일상 이야기 🌼', '안녕하세요! 요즘 일상에서 느끼는 이런 저런 생각들을 나눌 수 있는 자리가 필요해서 이렇게 글을 써봅니다. 평범한 일상에서 느껴지는 작은 기쁨부터 고민, 궁금증까지 다양한 이야기들을 나눠봐요. 함께 이야기 나누면서 조금 더 나를 알아가고 싶어요. 여러분의 이야기도 기대해요! 🌸', 'shinname1');
INSERT INTO community(cate, title, content, author)
VALUES ('A', '먹는 즐거움, 나만의 맛 여행 🍜', '안녕하세요, 맛집 탐험가로 떠나는 나만의 맛 여행 이야기를 공유하려고 합니다! 맛있는 음식을 찾아 나날이 다양한 식도락을 즐기며, 그 맛에 빠져보는 나만의 여정을 담아봅니다. 맛있는 음식과 함께 나누는 추억, 그 무엇도 대신할 수 없는 행복이에요. 같이 맛있는 이야기 나누어봐요!', 'parkname1');
INSERT INTO community(cate, title, content, author)
VALUES ('A', '취미를 통한 나만의 작은 행복 💫', ' 안녕하세요! 취미 생활을 통해 나만의 작은 행복을 찾아가는 여정을 나누고 싶어요. 그림 그리기, 음악 연주, 독서, 등산, 무엇이든지 제게 특별한 순간을 선사하는 취미들을 통해 일상의 소소한 기쁨을 느끼고 있어요. 여러분의 취미와 나누고 싶은 경험이 있다면 언제든지 말씀해주세요!', 'shinname1');
INSERT INTO community(cate, title, content, author)
VALUES ('A', '감성을 담아 풀어내는 나만의 시간 🌌', '안녕하세요, 여기는 감성의 풍부한 이야기들을 나눌 수 있는 공간입니다. 나만의 감정을 시를 통해 표현하고, 일상의 감동을 나누며 마음을 편하게 풀어보려고 합니다. 시를 통해 나만의 감성을 표현하는 순간들을 함께해요. 여러분의 감성적인 이야기도 함께 들려주세요.', 'parkname1');
INSERT INTO community(cate, title, content, author)
VALUES ('A', '여행이야기, 세상을 누비다 🌏', '안녕하세요! 여행을 통해 세계 각지에서 느낀 감동과 경험을 공유하고 싶어서 글을 씁니다. 다양한 나라와 문화를 경험하며 얻은 인상적인 이야기들을 담아봐요. 여행이 주는 새로운 시야와 경험을 통해 나만의 세계를 만들어나가는 여정을 함께 나누어봐요! 🌍', 'kimname1');

/* 교육정보 게시판 더미데이터 */
INSERT INTO community(cate, title, content, author)
VALUES ('B', '똑똑해지자! 유용한 학습 정보 공유 📚', '안녕하세요! 이 공간은 학습과 교육에 관한 다양한 정보를 공유하고 함께 성장하는 공간입니다. 학교 공부에서 시작해서 취미로 꾸준히 배우는 것, 또는 현실에서 유용한 기술까지 학습과 관련된 모든 주제를 다룰 예정이에요. 함께 배워가며 더 똑똑해지는 여정에 동참해보세요!', 'shinname1');
INSERT INTO community(cate, title, content, author)
VALUES ('B', '직업을 위한 교육과 전문 지식 공유 🌟', '안녕하세요! 여기는 다양한 직업을 위한 교육 정보와 전문 지식을 공유하는 공간입니다. 각 분야의 전문가들이 직업과 관련된 유용한 정보, 교육 경로, 취업 준비 팁 등을 나누어드리며, 여러분의 꿈을 향한 첫 걸음을 함께 응원하고 지원해드릴게요. 함께 멋진 직업을 향해 나아가요!', 'kimname1');
INSERT INTO community(cate, title, content, author)
VALUES ('B', '부모님을 위한 교육 안내 및 조언 🏫', '안녕하세요, 부모님을 위한 교육 관련 정보를 나누는 공간입니다. 자녀의 교육과 관련된 궁금증, 교육 방법, 학교 선택, 학습 도구 소개부터 아이들의 성장과 관련된 다양한 이야기들을 함께 공유하고 상담할 수 있는 공간이에요. 부모님들의 이야기를 기다리고 있어요!', 'parkname1');
INSERT INTO community(cate, title, content, author)
VALUES ('B', '효과적인 학습 방법과 꿀팁 공유 🎓', '안녕하세요, 학습을 더욱 효과적으로 하는 방법과 유용한 꿀팁들을 나누고자 하는 공간입니다. 학교에서 공부하는 것부터 개인적으로 공부하는 방법, 집중력 향상을 위한 습관 등 학습과 관련된 다양한 정보들을 함께 공유하고 배워가는 시간을 가지고자 합니다. 함께 공부해요!', 'kimname1');
INSERT INTO community(cate, title, content, author)
VALUES ('B', '학교 생활, 스트레스 극복 팁 공유 🌈', '안녕하세요! 학교 생활에서 느끼는 스트레스를 극복하고 즐겁게 보내기 위한 꿀팁을 공유하는 공간입니다. 공부와 여가를 잘 조절하며, 친구 관계에서의 고민, 시험 스트레스 해소법 등 학교 생활에서 도움이 될만한 다양한 정보를 나누어보려고 해요!', 'kimname1');

/* 교재/학원 추천 게시판 더미데이터 */
INSERT INTO community(cate, title, content, author)
VALUES ('C', '최고의 교재와 학원 찾아봐요! 📚', '안녕하세요! 이곳은 다양한 학습 교재와 학원을 추천해주고 정보를 공유하는 공간입니다. 어떤 분야든 궁금하신 거라면 언제든 물어보세요. 현직 전문가들이 검증한 교재나 효과적인 학원을 함께 찾아보며, 학습에 필요한 최고의 도구를 찾아보아요. 함께 공부의 즐거움을 느껴봐요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('C', '꿀팁으로 찾는 당신에게 딱 맞는 학원! 🌟', '안녕하세요! 이곳은 학원 선택에 도움을 주는 꿀팁과 추천 정보를 공유하는 공간입니다. 당신의 목표와 맞는 학원을 찾기 위한 실용적인 조언들을 나누며, 다양한 분야의 교육 기관을 추천해드립니다. 함께 성장하는 학습의 즐거움을 찾아봐요!', 'kimname1');
INSERT INTO community(cate, title, content, author)
VALUES ('C', '전문가가 추천하는 교재와 학원 모음 📖', '안녕하세요! 이곳에서는 각 분야 전문가들이 추천하는 교재와 학원을 소개해드리고, 그에 대한 리뷰와 효과적인 학습 방법을 공유하고자 합니다. 당신의 학습 목표를 향한 첫걸음을 떼기 위한 좋은 정보들이 기다리고 있어요. 함께 더 나은 미래를 위한 교육을 찾아봐요!', 'parkname1');
INSERT INTO community(cate, title, content, author)
VALUES ('C', '학습의 길목, 교재와 학원 추천 모음 🌼', '안녕하세요! 학습의 길목에서 가장 중요한 것은 바로 교재와 학원의 선택입니다. 여기에서는 각 분야의 교재와 학원을 공부하는 전문가들의 추천과 의견을 모아봤어요. 당신의 학습에 도움이 될 최고의 도구들을 찾아보며, 함께 좋은 선택을 해나가요!', 'shinname1');
INSERT INTO community(cate, title, content, author)
VALUES ('C', '나만의 학습 방식에 맞는 교재와 학원 찾기 🚀', '안녕하세요! 각자의 학습 방식과 목표에 따라 적합한 교재와 학원을 찾는 것은 매우 중요합니다. 이곳에서는 당신의 학습 스타일에 맞는 교재와 학원을 추천하고, 다양한 이야기와 경험을 나누며 최적의 선택을 찾아나가는 공간이에요. 함께 나만의 학습 길을 찾아보아요!', 'kimname1');

/* 진로상담 커뮤니티 더미데이터 */
INSERT INTO community(cate, title, content, author)
VALUES ('D', '미래를 그리는 진로상담 친구들 🚀', '안녕하세요! 이 곳은 당신의 미래를 함께 그리고 상담해주는 공간입니다. 진로에 관한 고민, 궁금증, 희망 등 모든 것을 자유롭게 나누고 고민을 함께 나눌 수 있는 친구들이 여기에 있어요. 함께 당신만의 꿈과 목표를 향해 나아가봐요. 당신의 미래를 응원합니다!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('D', '꿈을 향한 진로탐색 여행 🌠', '안녕하세요! 여기는 당신의 꿈을 찾아가기 위한 진로탐색 여행지입니다. 어떤 진로를 선택해야 할지 망설이고 있다면 함께 여행하며 당신의 강점, 흥미, 가치관을 찾아보아요. 꿈을 향한 여정에서 당신에게 맞는 길을 찾을 수 있도록 도와드릴게요!', 'shinname1');
INSERT INTO community(cate, title, content, author)
VALUES ('D', '나만의 길을 찾는 진로상담 모임 🌱', '안녕하세요! 이곳은 나만의 길을 찾고자 하는 당신을 위한 진로상담 모임입니다. 다양한 진로에 대한 이야기, 성장하는 과정에서의 고민, 앞으로의 목표를 나누며 함께 더 나은 미래를 향해 나아갈 수 있도록 도움을 드릴게요. 나만의 진로를 찾는 여정, 함께해요!', 'shinname1');
INSERT INTO community(cate, title, content, author)
VALUES ('D', '청춘의 선택, 진로에 대한 이야기 🌈', '안녕하세요! 청춘의 선택인 진로에 대해 이야기 나누는 공간입니다. 다양한 진로 선택, 진로에 대한 고민, 준비 과정에서의 이슈들을 나누며 함께 당신에게 맞는 길을 찾아가봐요. 우리 모두 함께 꿈을 향해 달려봅시다!', 'kimname1');
INSERT INTO community(cate, title, content, author)
VALUES ('D', '진로 여행을 떠나는 항해 모임 ⛵', '안녕하세요! 우리는 당신의 진로 여행을 함께 항해할 동료입니다. 함께 세계 여행처럼 다양한 진로를 탐험하며, 당신의 역량과 흥미를 발견해보아요. 진로에 대한 이야기, 정보, 충고 등을 나누며 당신의 항해를 응원하고 지원할 준비가 되어있어요! 함께 떠나볼까요? ⚓', 'admin');

SELECT * FROM community;


-- 커뮤니티 댓글 테이블 생성
CREATE TABLE COMMENT(
   comNo INT PRIMARY KEY AUTO_INCREMENT,
   cno INT NOT NULL,
   author VARCHAR(20) NOT NULL,
   resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   content VARCHAR(1000) NOT NULL,
   FOREIGN KEY(cno) REFERENCES community(cno) ON DELETE CASCADE,
   FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

SELECT * FROM COMMENT;

-- 필터링 단어 테이블 생성
CREATE TABLE filterWord(
   fno INT PRIMARY KEY AUTO_INCREMENT,
   word VARCHAR(100) NOT NULL
);

select * from filterword;

/* 공지사항 테이블 생성 */
CREATE TABLE notice (
   seq INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   nickname VARCHAR(20),
   regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   visited INT DEFAULT 0
);

/* 공지사항 더미데이터 */
INSERT INTO notice VALUES (DEFAULT,'신규 회원 가입 안내','저희 학부모 커뮤니티에 가입하신 것을 진심으로 환영합니다. 회원 가입을 통해 여러분의 소중한 의견과 경험을 공유해주세요. 커뮤니티가 더욱 풍요롭고 활기찬 공간이 되도록 함께 노력하겠습니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티 이용 규칙 안내','티스푼은 아름다운 소통과 공유의 장을 만들기 위해 규칙을 마련하였습니다. 모든 회원들이 존중받고 행복한 커뮤니티를 유지할 수 있도록 함께 노력해주실 것을 부탁드립니다','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티 업데이트 안내','티스푼은 항상 더 나은 서비스를 제공하기 위해 노력하고 있습니다. 최근에 이루어진 업데이트 내용에 대해 안내드립니다. 회원 여러분의 소중한 의견을 항상 환영하며, 더 나은 커뮤니티를 만들기 위해 노력하겠습니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'자주 묻는 질문 (FAQ) 업데이트 안내','티스푼에서 자주 묻는 질문들에 대한 업데이트가 이루어졌습니다. 더 나은 서비스를 위한 자주 묻는 질문을 확인하시어 필요한 정보를 얻어가시길 바랍니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'안전한 커뮤니티 이용을 위한 안내','안전하게 커뮤니티를 이용하기 위해 몇 가지 유용한 안내를 드립니다. 어떻게 커뮤니티 내에서 안전하게 활동할 수 있는지에 대한 방법을 참고하여, 즐거운 커뮤니티 활동을 즐겨보시길 바랍니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'사용자 경험 개선을 위한 소중한 의견 수렴 안내','티스푼은 회원 여러분들의 소중한 의견을 항상 기다리고 있습니다. 사용자들의 의견을 토대로 커뮤니티를 보다 나은 곳으로 만들기 위해 최선을 다하겠습니다. 의견이나 제안 사항은 언제든지 환영합니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티 참여와 활동 방법 안내','티스푼에서 어떻게 참여하고 활동할 수 있는지에 대한 자세한 방법을 안내해 드립니다. 다양한 기능을 활용하여 보다 활발한 커뮤니티 활동에 참여해주시길 바랍니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티에서의 예의와 배려 안내','티스푼은 모두가 존중받고 행복한 환경을 만들기 위해 예의와 배려가 중요합니다. 다른 회원들을 존중하고 따뜻한 마음으로 소통하실 것을 부탁드립니다. 함께하는 커뮤니티를 만들어 나가는 데 도움을 주신다면 감사하겠습니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티에서의 긍정적인 기여에 대한 감사','티스푼은 모든 회원 여러분의 긍정적인 기여에 큰 감사를 드립니다. 각자의 의견과 경험이 모여 더 풍성한 커뮤니티를 만들 수 있습니다. 앞으로도 함께 나눔과 협력을 통해 더욱 발전된 커뮤니티를 만들어 나가시길 바랍니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티에서의 소중한 순간들을 기록하는 방법 안내','티스푼에서의 소중한 순간들을 기록하고 나누는 방법에 대한 안내입니다. 회원들 각자의 소중한 순간들을 공유하여 함께 기뻐하고 나누어주세요.','admin',DEFAULT, DEFAULT);

INSERT INTO notice VALUES (DEFAULT,'커뮤니티 내에서의 정보 무단 유출에 대한 주의 안내','티스푼에서의 정보 무단 유출에 대한 주의사항을 안내해 드립니다. 모두가 안전하게 정보를 공유하고 사용할 수 있도록 주의해주시길 부탁드립니다.','admin',DEFAULT, DEFAULT);

-- faq 테이블 생성
CREATE TABLE faq (
   fno INT  PRIMARY KEY AUTO_INCREMENT ,
   question VARCHAR(1000) NOT NULL,
   answer VARCHAR(1000) NOT NULL,
   cnt INT DEFAULT 0 NOT NULL
);

-- faq 더미 데이터 추가
INSERT INTO faq(question, answer) VALUES('웹사이트에 어떻게 가입하나요?', '회원 가입 페이지에서 필요한 정보를 입력하여 가입할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('게시물을 어떻게 작성하나요?', '커뮤니티 페이지의 "글 작성" 버튼을 클릭하여 게시물을 작성할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('다른 회원들의 게시물에 댓글을 달고 싶어요. 어떻게 해야 하나요?','게시물의 하단에 있는 "댓글 작성" 영역에 댓글을 입력하여 등록할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('제가 작성한 글이 갑자기 사라졌어요', '부적절한 내용은 관리자가 예고 없이 삭제할 수 있습니다. 커뮤니티 규칙을 지켜주세요:)');
INSERT INTO faq(question, answer) VALUES('개인 정보 보호 정책은 무엇인가요?', '웹사이트의 개인 정보 보호 정책은 "회원가입의 회원약관동의" 페이지에서 확인할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('문의사항이 있을 때 어떻게 연락할 수 있나요?', '고객지원의 "QnA" 페이지에서 문의글을 작성하여 문의할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('어떤 유형의 교육자료를 제공하나요?', '초등학교, 중학교 및 고등학교 학생들을 위한 교과서, 참고서 및 워크북을 포함한 다양한 교육자료를 제공합니다.');
INSERT INTO faq(question, answer) VALUES('책은 실물 및 디지털 형식으로 모두 제공되나요?', '네, 대부분의 책은 실물 및 디지털 형식으로 제공되며 다양한 학습 선호도를 고려합니다.');
INSERT INTO faq(question, answer) VALUES('책이나 주제에 대한 제안을 할 수 있나요?', '물론입니다! 저희는 모든 제안을 소중히 생각합니다. 고객 지원팀에 의견을 보내주시면 됩니다.');
INSERT INTO faq(question, answer) VALUES('책은 정기적으로 업데이트되나요?', '네, 정확성과 관련성을 보장하기 위해 최신 교과서 및 참고 자료의 최신 판을 제공하기 위해 노력하고 있습니다.');


-- 자료실 자료 데이터 테이블 생성
CREATE TABLE fileInfo(
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	articleno INT,
	saveFolder VARCHAR(300) NOT NULL,
	originFile VARCHAR(300) NOT NULL,
	saveFile VARCHAR(300) NOT NULL);
                         
-- 자료실 테이블 생성
CREATE TABLE fileboard (
   articleno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   id varchar(16) NOT NULL,
   title varchar(100) NOT NULL,
   content varchar(2000) NOT NULL,
   regdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);


-- 출석체크 테이블 생성
CREATE TABLE attendance (
   ano INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   id VARCHAR(20),
   attend DATE DEFAULT current_date);


-- QNA
CREATE TABLE qna(
  qno int PRIMARY KEY AUTO_INCREMENT,   			-- 번호
  title VARCHAR(100) NOT NULL,   					-- 제목
  content VARCHAR(1000) NOT NULL,   				-- 내용`
  author VARCHAR(16),   								-- 작성자
  resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 등록일
  lev INT DEFAULT 0, 									-- 질문(0), 답변(1)
  par INT DEFAULT 0,													-- 질문(자신 레코드의 qno), 답변(질문의 글번호)
  FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE);

-- QNA 테이블 더미데이터 생성
INSERT INTO	qna VALUES(DEFAULT, '가입하고 싶어요','웹사이트에 어떻게 가입하나요?','kimname1',DEFAULT, DEFAULT, 1);
INSERT INTO	qna VALUES(DEFAULT, '[답변] 가입하고 싶어요',' 회원 가입 페이지에서 필요한 정보를 입력하여 가입할 수 있습니다.','admin',DEFAULT, 1, 1);
INSERT INTO	qna VALUES(DEFAULT, '개인 정보 업데이트하고 싶어요','회원 정보를 어떻게 수정하거나 업데이트하나요?','shinname1',DEFAULT, DEFAULT, 3);
INSERT INTO	qna VALUES(DEFAULT, '[답변] 개인 정보 업데이트하고 싶어요',' 로그인 후, 마이페이지에서 회원 정보를 수정하고 업데이트할 수 있습니다.','admin',DEFAULT, 1, 3);
INSERT INTO	qna VALUES(DEFAULT, '커뮤니티 어떻게 사용해요?','게시물을 작성하는 방법을 알려주세요.','shinname1',DEFAULT, DEFAULT, 5);
INSERT INTO	qna VALUES(DEFAULT, '[답변] 커뮤니티 어떻게 사용해요?',' 커뮤니티 페이지에서 카테고리를 설정한 후 글을 작성해주세요. 글의 하단에는 댓글을 추가할 수 있는 공간도 있습니다. 글과 댓글을 작성하면서 정보를 공유하세요','admin',DEFAULT, 1, 5);

SELECT * FROM qna;


/* 이벤트 글 테이블 */
CREATE TABLE event (
	eno int  PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   STATUS VARCHAR(5) CHECK(status IN(0, 1)),
   sdate DATE,
   edate DATE,
   author VARCHAR(16),
   regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   cnt INT DEFAULT 0 NOT NULL
);

SELECT * FROM event;

-- 이벤트 더미데이터 생성
INSERT INTO event 
VALUES(DEFAULT, '육아에 지친 당신에게 치맥을 드립니다','<p><img alt="" src="/team33_war/event/ckImgSubmit.do?uid=5bf93a98-739e-48a1-88e3-734558e69c37&amp;fileName=제목을-입력해주세요_-001.png" style="height:800px; width:800px" /></p>', 1, 20230920,20230930,'admin', '2023-09-20', DEFAULT);
INSERT INTO event 
VALUES(DEFAULT, '풍성한 가을 이벤트','<p><img alt="" src="/team33_war/event/ckImgSubmit.do?uid=3b137af7-771f-4674-8c0e-d194bff4bae7&amp;fileName=제목을 입력해주세요_-001.png" style="height:1587px; width:1123px" /></p>" /></p>', 1, 20230921,20231021,'admin', '2023-09-20', DEFAULT);


-- 회원의 이벤트 접수
create table apply(
   appno int AUTO_INCREMENT PRIMARY KEY,		/* 접수 번호 */
   eno int not NULL,									/* 이벤트글 번호 */
   id varchar(100) not NULL,						/* 당첨자 아이디 */
   name varchar(100) not NULL,					/* 당첨자 이름 */
   tel varchar(13),									/* 전화번호 */
   foreign key(eno) references event(eno) on delete cascade,
   FOREIGN KEY(id) references member(id) on delete cascade);


-- 당첨자 리스트
create table winnerList(
   appno int auto_increment primary key not null,			
   eno int not NULL,										
   id varchar(100) not NULL,										
   name varchar(100) not NULL,						
   tel varchar(13),													
   foreign key(eno) references event(eno) on delete cascade,
   FOREIGN key(id) references member(id) on delete cascade);

SELECT * FROM winnerList;


--당첨자 발표 글
create table winner(
	wno int primary key AUTO_INCREMENT,			/* 당첨글 번호 */
   eno int not NULL,									/* 이벤트 글 번호 */
   title varchar(100),								/* 글 제목 */
   content varchar(1000),							/* 글 내용 */
   author varchar(100),								/* 작성자 */
   resdate datetime default CURRENT_TIMESTAMP,	/* 작성일 */
   FOREIGN key(eno) references event(eno));

-- 관리자 페이지 출석 및 회원 수 뷰 생성
CREATE VIEW memberMonth AS SELECT concat(year(regdate),' ', month(regdate)) AS regMonth, COUNT(*) AS memberCnt FROM member GROUP BY year(regdate), month(regdate) ORDER BY YEAR(regdate), MONTH(regdate) LIMIT 6;
CREATE VIEW attendanceMonth AS SELECT CONCAT(YEAR(attend), ' ', MONTH(attend)) AS attendMonth,  COUNT(*) AS attendCnt FROM attendance GROUP BY YEAR(attend), MONTH(attend) ORDER BY YEAR(attend), MONTH(attend) LIMIT 6;
