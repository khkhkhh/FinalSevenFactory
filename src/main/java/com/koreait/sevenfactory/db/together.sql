-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- hotelfive 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sevenfatory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `sevenfatory`;

-- 테이블 hotelfive.blacklist 구조 내보내기
CREATE TABLE IF NOT EXISTS `blacklist` (
  `BNO` int(11) DEFAULT NULL,
  `MID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BREASON` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BRIGHT` int(11) DEFAULT NULL,
  KEY `MID` (`MID`),
  CONSTRAINT `FK_blacklist_member` FOREIGN KEY (`MID`) REFERENCES `member` (`MID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 hotelfive.blacklist:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
INSERT INTO `blacklist` (`BNO`, `MID`, `BREASON`, `BRIGHT`) VALUES
	(1, 'songhole', '1234', 1),
	(2, 'bigsong', '나쁘다', 1);
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;

-- 테이블 hotelfive.event 구조 내보내기
CREATE TABLE IF NOT EXISTS `event` (
  `ENO` int(11) NOT NULL AUTO_INCREMENT,
  `GNAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EPRICE` int(11) NOT NULL DEFAULT 0 COMMENT '//글자로 적어주세요',
  `ESTART` date DEFAULT NULL,
  `EEND` date DEFAULT NULL,
  `EADDITION` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ETHUMBNAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTEND` int(11) DEFAULT NULL,
  `SID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EAPPROVAL` int(11) DEFAULT NULL,
  `EDELETE` int(11) DEFAULT NULL,
  `EREASON` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EUPDATE` date DEFAULT NULL,
  PRIMARY KEY (`ENO`),
  KEY `FK_event_seller` (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.event:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`ENO`, `GNAME`, `EPRICE`, `ESTART`, `EEND`, `EADDITION`, `ETHUMBNAIL`, `EXTEND`, `SID`, `EAPPROVAL`, `EDELETE`, `EREASON`, `EUPDATE`) VALUES
	(1, '패밀리룸-바다전망', 10000, '2022-10-28', '2022-10-29', '123123', '', 0, '0', 1, NULL, NULL, '2022-11-06'),
	(2, '패밀리룸-바다전망', 50000, '2022-10-29', '2022-10-30', '123', '', 0, '0', 1, NULL, NULL, '2022-11-06'),
	(3, '패밀리룸-바다전망', 50000, '2022-10-29', '2022-11-23', '123', '', 0, '1111111111', 1, NULL, '123123123123', '2022-11-23'),
	(4, '스탠다드 트윈', 50000, '2022-10-29', '2022-10-31', '아아아아아', '', 1, '1111111111', 1, NULL, NULL, '2022-11-01'),
	(6, '패밀리룸-바다전망', 100000, '2022-10-29', '2022-10-30', '여름 특별 할인', '', 0, '1111111111', 1, NULL, NULL, '2022-11-08'),
	(7, '트윈룸-바다전망', 10000, '2022-10-29', '2022-10-30', '123123123', '', 0, '1111111111', 0, NULL, NULL, '2022-11-08'),
	(8, '패밀리룸-바다전망', 30000, '2022-10-29', '2022-10-30', '너무 사업이 잘 되서', '', 0, '1111111111', 0, NULL, NULL, '2022-11-06'),
	(9, '스탠다드 트윈', 10000, '2022-11-25', '2022-11-26', '123123123', '', 0, '1111111111', 0, 0, '', '2022-01-01'),
	(10, '스탠다드 트윈', 10000, '2022-11-25', '2022-11-26', '123123123', '', 0, '1111111111', 0, 0, '', '2022-01-01');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- 테이블 hotelfive.guestroom 구조 내보내기
CREATE TABLE IF NOT EXISTS `guestroom` (
  `GNO` int(11) NOT NULL,
  `GNAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GPRICE` int(11) DEFAULT NULL,
  `GMINPEOPLE` int(11) DEFAULT NULL,
  `GMAXPEOPLE` int(11) DEFAULT NULL,
  `GROOMSIZE` int(11) DEFAULT NULL,
  `GEXPLAIN` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GTHUMBNAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GIMGCOUNT` int(11) DEFAULT NULL,
  `HNO` int(11) NOT NULL,
  `GTEL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GNO`),
  UNIQUE KEY `GNAME` (`GNAME`),
  KEY `FK_guestroom_hotelfive.hotel` (`HNO`),
  CONSTRAINT `FK_guestroom_hotelfive.hotel` FOREIGN KEY (`HNO`) REFERENCES `hotel` (`HNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.guestroom:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `guestroom` DISABLE KEYS */;
INSERT INTO `guestroom` (`GNO`, `GNAME`, `GPRICE`, `GMINPEOPLE`, `GMAXPEOPLE`, `GROOMSIZE`, `GEXPLAIN`, `GTHUMBNAIL`, `GIMGCOUNT`, `HNO`, `GTEL`) VALUES
	(1, '이코노미더블', 65000, 2, 2, 20, '더블베드 1개를 제공하며 도시전망인 객실입니다.', 'h1_r1', 3, 1, '0507-1402-0033'),
	(2, '디럭스트윈룸', 70000, 2, 3, 24, '싱글베드 1개와 더블베드를 제공하며 3인까지 이용가능한 객실입니다.', 'h1_r2', 5, 1, '0507-1402-0033'),
	(3, '디럭스 트윈룸 - 바다전망', 80000, 2, 3, 24, '싱글베드 1개와 더블베드를 제공하며  3인까지 이용가능한 바다전망인 객실입니다.', 'h1_r3', 1, 1, '0507-1402-0033'),
	(4, '디럭스 더블룸 - 바다전망', 60000, 2, 2, 33, '더블베드를 제공하며 바다전망의 발코니가 있는 객실입니다.', 'h2_r1', 3, 2, '010-4699-5053'),
	(5, '스탠다드 트윈룸-바다전망', 90000, 2, 2, 50, '싱글베드 1개와 더블베드 1개를 제공하며 바다전망의 객실입니다.', 'h2_r2', 3, 2, '010-4699-5053'),
	(6, '트윈룸-바다전망', 90000, 2, 2, 33, '싱글베드 2개 제공하며 바다전망의 객실입니다.', 'h2_r3', 3, 2, '010-4699-5053'),
	(7, '스탠다드 트윈', 85000, 2, 2, 50, '싱글베드 1개와 더블베드 1개를 제공하며 바다전망의 객실입니다.', 'h2_r4', 2, 2, '010-4699-5053'),
	(8, '패밀리룸-바다전망', 160000, 2, 4, 66, '싱글베드 2개와 대형 더블베드 1개를 제공하며 룸2개로 이루어진 바다전망의 객실입니다.', 'h2_r5', 4, 2, '010-4699-5053'),
	(9, '퀸룸-바다전망', 70000, 2, 2, 28, '대형 더블베드 1개를 제공하며 취사가 가능한 바다전망의 객실입니다.', 'h3_r1', 3, 3, '064-722-2788'),
	(10, '트윈-바다전망', 75000, 2, 2, 28, '싱글베드 2개를 제공하며 취사가 가능한 바다전망의 객실입니다.', 'h3_r2', 2, 3, '064-722-2788'),
	(11, '퀸룸', 80000, 2, 2, 28, '대형 더블베드 1개를 제공하며 바다전망의 객실입니다.', 'h3_r3', 3, 3, '064-722-2788'),
	(12, '디럭스 더블/트윈룸 - 바다전망', 80000, 2, 2, 30, '싱글베드 1개와 대형 더블베드 1개를 제공하며 취사가 가능한 바다전망의 객실입니다.', 'h3_r4', 3, 3, '064-722-2788'),
	(13, '더블룸', 65000, 2, 3, 30, '대형 더블베드 1개를 제공하며 취사가 가능한 객실입니다.', 'h4_r1', 4, 4, '050-468-7555'),
	(14, '스탠다드 트윈룸', 70000, 2, 2, 30, '싱글베드 2개를 제공하며 취사가 가능한 객실입니다.', 'h4_r2', 3, 4, '050-468-7555'),
	(15, '킹 스위트룸', 48000, 2, 3, 27, '대형 더블베드 1개를 제공하며 테라스가 있는 객실입니다.', 'h5_r1', 5, 5, '0507-1347-9552');
/*!40000 ALTER TABLE `guestroom` ENABLE KEYS */;

-- 테이블 hotelfive.hotel 구조 내보내기
CREATE TABLE IF NOT EXISTS `hotel` (
  `HNO` int(11) NOT NULL,
  `HNAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HADDRESS` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HTHUMBNAIL` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HAMOUNT` int(11) NOT NULL,
  `HMINPRICE` int(11) NOT NULL,
  `HAPPROVAL` int(11) DEFAULT NULL,
  PRIMARY KEY (`HNO`),
  UNIQUE KEY `HNAME` (`HNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.hotel:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` (`HNO`, `HNAME`, `HADDRESS`, `HTHUMBNAIL`, `HAMOUNT`, `HMINPRICE`, `HAPPROVAL`) VALUES
	(1, '헤이, 서귀포호텔', '제주 서귀포시 태평로 363', 'hotel1', 3, 65000, 1),
	(2, '중문 오션블루호텔', '제주 서귀포시 이어도로 67', 'hotel2', 2, 60000, 1),
	(3, '아라팰리스호텔', '제주 제주시 남성로26길 26', 'hotel3', 4, 70000, 1),
	(4, '케이두빛나래리조트', '제주 서귀포시 안덕면 사계북로 109', 'hotel4', 2, 65000, 1),
	(5, '애월코스트 34', '제주 제주시 애월읍 신엄안2길 34', 'hotel5', 1, 48000, 1),
	(6, '안녕호텔', '남해군창선명', 'hotel6', 30, 200000, 0);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;

-- 테이블 hotelfive.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `MNO` int(11) NOT NULL,
  `MID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MPW` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MNAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MBIRTH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MPHONE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MEMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MADDR1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MADDR2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MZipcode` int(11) DEFAULT NULL,
  `MREGDATE` date DEFAULT NULL,
  `MGRADE` int(11) DEFAULT NULL,
  `MPOINT` int(11) DEFAULT NULL,
  `MISWITHDRAWAL` int(11) DEFAULT NULL,
  `MRIGHT` int(11) DEFAULT NULL,
  PRIMARY KEY (`MNO`),
  UNIQUE KEY `MID` (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.member:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`MNO`, `MID`, `MPW`, `MNAME`, `MBIRTH`, `MPHONE`, `MEMAIL`, `MADDR1`, `MADDR2`, `MZipcode`, `MREGDATE`, `MGRADE`, `MPOINT`, `MISWITHDRAWAL`, `MRIGHT`) VALUES
	(0, 'admin', 'poweradmin1@', '관리자(비회원)', NULL, '01012345678', 'rkdgustjwns@naver.com', '행복빌라', '101동2901호', 35266, '2022-09-29', 0, 0, 0, 2),
	(1, 'rlatmd98', 'kim98!!', '김승현', '1998-04-14', '01091236930', 'ksh_9804@naver.com', '행복빌라', '101동 2901호', 35267, '2022-10-04', 0, 3087, 0, 0),
	(2, 'bigsong', 'song94!!', '대지섭', '1994-01-09', '01094167923', NULL, '행복빌라', '101동 2903호', 35267, '2022-10-06', 0, 0, 0, 1),
	(3, 'songhole', 'song90!!', '송홀', '1990-08-14', '01077454663', 'thddlswo2@naver.com', '행복빌라', '101동 2904호', 35267, '2022-10-06', 0, 0, 1, 0),
	(5, 'zxcs2789', 'admin2!', '강현', NULL, '01012347895', 'rlatmd98@naver.com', '대전 서구 대덕대로 182', '10층', 35234, '2022-10-07', 0, 0, 0, 0),
	(6, '2470566312', '123', '승현', '0414', '01011112222', 'rlatmd98@nate.com', '대전서구', '인스빌리베라', 12345, '2022-10-28', 0, 2000, 0, 0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 hotelfive.nonmember 구조 내보내기
CREATE TABLE IF NOT EXISTS `nonmember` (
  `NMID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NMNAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NMPHONE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`NMID`),
  UNIQUE KEY `NMPHONE` (`NMPHONE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.nonmember:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `nonmember` DISABLE KEYS */;
INSERT INTO `nonmember` (`NMID`, `NMNAME`, `NMPHONE`) VALUES
	('1', '강현', '01023527209'),
	('2', '김승현', '01091236930');
/*!40000 ALTER TABLE `nonmember` ENABLE KEYS */;

-- 테이블 hotelfive.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `NNO` int(11) NOT NULL,
  `MNO` int(11) DEFAULT NULL,
  `NTITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NCONTENT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NFILENAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NIMG` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NHIT` int(11) DEFAULT NULL,
  `NISDELETE` int(11) DEFAULT NULL,
  `NNOTICEDATE` date DEFAULT NULL,
  PRIMARY KEY (`NNO`),
  KEY `MNO` (`MNO`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`MNO`) REFERENCES `member` (`MNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.notice:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`NNO`, `MNO`, `NTITLE`, `NCONTENT`, `NFILENAME`, `NIMG`, `NHIT`, `NISDELETE`, `NNOTICEDATE`) VALUES
	(1, 0, '공지입니다', '공지입니다', '공지_1665118018174.hwp', '', 5, 0, '2022-10-07'),
	(2, 0, 'SDADF', 'SADF', 'h1_r11_1665715699300.png', 'pagelogo_1665715699301.JPG', 2, 0, '2022-10-14');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 hotelfive.qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `qna` (
  `QNO` int(11) NOT NULL,
  `MID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NMNAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `QTITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `QPW` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `QCONTENT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `QISDELETE` int(11) DEFAULT NULL,
  `QNOTICEDATE` date DEFAULT NULL,
  PRIMARY KEY (`QNO`),
  KEY `MID` (`MID`),
  CONSTRAINT `qna_ibfk_1` FOREIGN KEY (`MID`) REFERENCES `member` (`MID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.qna:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` (`QNO`, `MID`, `NMNAME`, `QTITLE`, `QPW`, `QCONTENT`, `QISDELETE`, `QNOTICEDATE`) VALUES
	(1, NULL, 'nonmember', '예약 확정인지 궁금해요 !', '1234', '예약을 했는데 예약내역 확인은 어디서하나요?', 1, '2022-10-06');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;

-- 테이블 hotelfive.reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `reply` (
  `RENO` int(11) NOT NULL,
  `MID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RECONTENT` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `QNO` int(11) DEFAULT NULL,
  `RNO` int(11) DEFAULT NULL,
  `RECATEGORY` int(11) NOT NULL,
  `RENOTICEDATE` date DEFAULT NULL,
  PRIMARY KEY (`RENO`),
  KEY `MID` (`MID`),
  KEY `QNO` (`QNO`),
  KEY `RNO` (`RNO`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`MID`) REFERENCES `member` (`MID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`QNO`) REFERENCES `qna` (`QNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_3` FOREIGN KEY (`RNO`) REFERENCES `review` (`RNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.reply:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` (`RENO`, `MID`, `RECONTENT`, `QNO`, `RNO`, `RECATEGORY`, `RENOTICEDATE`) VALUES
	(2, 'admin', '사실 그 방은 베드가 1개입니다....뭘 베고 주무신건가요?', NULL, 1, 0, '2022-10-06'),
	(4, 'admin', '비회원 예약 내역 확인은 로그인 페이지의 비회원 예약 조회를 통해서 확인해주세요.', 1, NULL, 1, '2022-10-07');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;

-- 테이블 hotelfive.reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `reservation` (
  `RNO` int(11) NOT NULL,
  `GNO` int(11) DEFAULT NULL,
  `MNO` int(11) DEFAULT NULL,
  `NMPHONE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NMID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RAPPROVAL` int(11) DEFAULT NULL,
  `RPEOPLE` int(11) DEFAULT NULL,
  `RPRICE` int(11) DEFAULT NULL,
  `RCHECKIN` date DEFAULT NULL,
  `RCHECKOUT` date DEFAULT NULL,
  `HNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`RNO`),
  KEY `GNO` (`GNO`),
  KEY `MNO` (`MNO`),
  KEY `NMID` (`NMID`),
  KEY `HNO` (`HNO`),
  KEY `FK_reservation_nonmember` (`NMPHONE`),
  CONSTRAINT `FK_reservation_hotel` FOREIGN KEY (`HNO`) REFERENCES `hotel` (`HNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reservation_nonmember` FOREIGN KEY (`NMPHONE`) REFERENCES `nonmember` (`NMPHONE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`GNO`) REFERENCES `guestroom` (`GNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`MNO`) REFERENCES `member` (`MNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.reservation:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- 테이블 hotelfive.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `RNO` int(11) NOT NULL,
  `RTITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RCONTENT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RFILENAME` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RREF` int(11) DEFAULT NULL,
  `RSTEP` int(11) DEFAULT NULL,
  `RDEPTH` int(11) DEFAULT NULL,
  `RISDELETE` int(11) DEFAULT NULL,
  `RRATING` int(11) DEFAULT NULL,
  `GNAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RREGDATE` date DEFAULT NULL,
  PRIMARY KEY (`RNO`),
  KEY `MID` (`MID`),
  KEY `GNAME` (`GNAME`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`MID`) REFERENCES `member` (`MID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`GNAME`) REFERENCES `guestroom` (`GNAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.review:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`RNO`, `RTITLE`, `RCONTENT`, `MID`, `RFILENAME`, `RREF`, `RSTEP`, `RDEPTH`, `RISDELETE`, `RRATING`, `GNAME`, `RREGDATE`) VALUES
	(1, '아이들과 함께 놀러 갔다 왔어요 !', '베드가 3개라 아이들과 여행하기 좋았어요 ! 방도 넓고 바다 전망도 너무 예뻤습니다!♡', 'rlatmd98', 'No File', NULL, NULL, NULL, 0, 4, '이코노미더블', '2022-10-06'),
	(2, '너구리와함께', '우리집 너구리와 함께 놀러갔다왔어요~ 보통은 애견받아주는 호텔이 없어서 여행하기 힘들었는데 이번엔 편하게 여행하고 왔습니다 ~', 'zxcs2789', NULL, NULL, NULL, NULL, 1, 5, '디럭스 더블룸 - 바다전망', '2022-10-24'),
	(3, '예약 취소 불가능 불만족후기', '예약취소는 일주일전까지만 가능하다는데 전 모르고 돈만 날렸네요 ㅡㅡ', 'bigsong', NULL, NULL, NULL, NULL, 1, 0, '디럭스트윈룸', '2022-10-23');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 hotelfive.seller 구조 내보내기
CREATE TABLE IF NOT EXISTS `seller` (
  `SNO` int(11) NOT NULL,
  `SID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SNUMBER` bigint(13) DEFAULT NULL,
  `HNAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SPHONE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SPW` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SEMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SREGDATE` date DEFAULT NULL,
  `SENDDATE` date DEFAULT NULL,
  `EXTEND` int(11) DEFAULT NULL,
  PRIMARY KEY (`SNO`) USING BTREE,
  UNIQUE KEY `HNAME` (`HNAME`),
  CONSTRAINT `FK_seller_hotel` FOREIGN KEY (`HNAME`) REFERENCES `hotel` (`HNAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hotelfive.seller:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` (`SNO`, `SID`, `SNUMBER`, `HNAME`, `SPHONE`, `SPW`, `SEMAIL`, `SREGDATE`, `SENDDATE`, `EXTEND`) VALUES
	(1, '3142833671', NULL, '헤이, 서귀포호텔', '01012341234', '1234', 'rlatmd98@naver.com', '2022-10-24', '2023-04-24', 2),
	(2, '1111111111', NULL, '중문 오션블루호텔', NULL, '1234', '1@naver.com', NULL, NULL, 2),
	(3, '2222222222', NULL, '아라팰리스호텔', NULL, '1111', '2@naver.com', NULL, NULL, 0),
	(4, '33333333333', NULL, '케이두빛나래리조트', NULL, '2222', '3@naver.com', NULL, NULL, NULL),
	(5, '4444444444', NULL, '애월코스트 34', NULL, '3333', '4@naver.com', NULL, NULL, NULL),
	(6, '3142833670', 0, '안녕호텔', '01012341225', 'a1234!', 'ksh_9804@naver.com', '2022-10-26', '2023-04-26', 0);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
