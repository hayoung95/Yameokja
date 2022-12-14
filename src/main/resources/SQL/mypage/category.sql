
## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- category_no, category_name, category_order
DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category(
  category_no INTEGER PRIMARY KEY,
  category_name VARCHAR(20) NOT NULL,
  category_order INTEGER(10) NULL  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- # community
-- 101 : 수다글
-- 102 : 모집글
-- 0 : 댓글
-- -1 : 삭제된 댓글

-- # report
-- 300 : 신고 분류 기본값
-- 300 ~ 304 : 신고 분류

INSERT INTO category (category_no, category_name, category_order) VALUES (1, '한식', 1);
INSERT INTO category (category_no, category_name, category_order) VALUES (2, '양식', 2);
INSERT INTO category (category_no, category_name, category_order) VALUES (3, '중식', 3);
INSERT INTO category (category_no, category_name, category_order) VALUES (4, '일식', 4);
INSERT INTO category (category_no, category_name, category_order) VALUES (5, '아시안', 5);
INSERT INTO category (category_no, category_name, category_order) VALUES (6, '술집', 6);
INSERT INTO category (category_no, category_name, category_order) VALUES (7, '카페·디저트', 7);
INSERT INTO category (category_no, category_name, category_order) VALUES (8, '분식', 8);
INSERT INTO category (category_no, category_name, category_order) VALUES (9, '고기', 9);
INSERT INTO category (category_no, category_name, category_order) VALUES (10, '채식', 10);
INSERT INTO category (category_no, category_name, category_order) VALUES (11, '패스트푸드', 11);
INSERT INTO category (category_no, category_name, category_order) VALUES (101, '수다글', 101);
INSERT INTO category (category_no, category_name, category_order) VALUES (102, '모집글', 102);
INSERT INTO category (category_no, category_name, category_order) VALUES (0, '댓글', 0);
INSERT INTO category (category_no, category_name, category_order) VALUES (-1, '삭제된 댓글', 9998);
INSERT INTO category (category_no, category_name, category_order) VALUES (-7, 'null값', -7);
INSERT INTO category (category_no, category_name, category_order) VALUES (300, '신고 분류 기본값', 300);
INSERT INTO category (category_no, category_name, category_order) VALUES (301, 'report_store', 301);
INSERT INTO category (category_no, category_name, category_order) VALUES (302, 'report_post', 302);
INSERT INTO category (category_no, category_name, category_order) VALUES (303, 'report_community', 303);
INSERT INTO category (category_no, category_name, category_order) VALUES (304, 'report_user', 304);

## 0(처리 대기) 1(처리중) 2(처리 보류) 3(처리완료)

COMMIT;

SELECT * FROM category;
