DROP DATABASE SpotifyMusic;
CREATE DATABASE SpotifyMusic;
USE SpotifyMusic;
-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` INT(11)  NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL UNIQUE,
  `email` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `uimage` varchar(200) null,
  PRIMARY KEY (`uid`));

-- ----------------------------
-- Records of `user`
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Antonio Rod', 'ab0001@nyu.edu','New York','12345678','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (2, 'Jerry Huang', 'cd0002@nyu.edu','New York','34567812','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (3, 'Brown Snow', 'ef0003@nyu.edu','New York','45678123','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (4, 'Guru Singh', 'gh0004@neu.edu','Boston','56781234','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (5, 'Ivy Yu', 'ij0005@nu.edu','Chicago','67812345','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (6, 'Jack Smith', 'kl0006@cmu.edu','Pittsburgh','78123456','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (7, 'Jane Jing', 'mn0007@usc.edu','California','56781234','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (8, 'Tom White', 'op0008@ucsd.edu','California','12348567','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (9, 'NancyInQueens', 'nancyinqueens@gmail.com','Singapore','14523678','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (10, 'Stuart', 'shuai@gmail.com','Beijing','12345678','http://allesinalab.uchicago.edu/wp-content/uploads/2014/05/Unknown-person.gif');
INSERT INTO `user` VALUES (11, 'ShuaiShuai', 'shuai@gmail.com','Beijing','12345678','http://media-exp2.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAtOAAAAJDZmMDUxMjJmLTY0MjItNDAyMC1iZGNhLTIzZmU1NGUwZDMyYg.jpg');


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'ROLE_USER');
UNLOCK TABLES;

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role_roleid_idx` (`role_id`),
  CONSTRAINT `fk_user_role_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





-- ----------------------------
-- Table structure for `playlist`
-- ----------------------------
DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist` (
  `pid`  INT(11) NOT NULL AUTO_INCREMENT,
  `pname` VARCHAR(45) NOT NULL,
  `pdate` DATE NOT NULL,
  `uid` INT(11) NOT NULL,
  `public` BOOLEAN,
  PRIMARY KEY (`pid`),
  CONSTRAINT `playlist_fk1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`));

-- ----------------------------
-- Records of playlist
-- ----------------------------
INSERT INTO `playlist` VALUES (1, 'adventures','2017-11-05', 1, TRUE);
INSERT INTO `playlist` VALUES (2, 'adventures','2017-11-06', 2, TRUE);
INSERT INTO `playlist` VALUES (3, 'music','2017-11-07', 3, TRUE);
INSERT INTO `playlist` VALUES (4, 'tracks','2017-11-08', 4, TRUE);
INSERT INTO `playlist` VALUES (5, 'blue','2017-11-09', 5, TRUE);
INSERT INTO `playlist` VALUES (6, 'colorful','2017-11-09', 6, TRUE);
INSERT INTO `playlist` VALUES (7, '1','2017-11-10', 7, FALSE);
INSERT INTO `playlist` VALUES (8, 'yellow','2017-11-11', 8, FALSE);
INSERT INTO `playlist` VALUES (9, 'red','2017-11-11', 9, TRUE);
INSERT INTO `playlist` VALUES (10,'apple', '2017-11-12', 2, FALSE);
INSERT INTO `playlist` VALUES (11, 'banana','2017-11-13', 9, TRUE);
INSERT INTO `playlist` VALUES (12, 'contract','2017-11-14', 3, TRUE);
INSERT INTO `playlist` VALUES (13, 'softmusic','2017-11-14', 9, FALSE);
INSERT INTO `playlist` VALUES (14, 'jazzmusic','2017-11-17', 4, TRUE);
INSERT INTO `playlist` VALUES (15, 'dohomework','2017-11-11', 2, TRUE);
INSERT INTO `playlist` VALUES (16, 'lalala','2017-11-11', 4, TRUE);
INSERT INTO `playlist` VALUES (17, 'happy','2017-11-11', 5, TRUE);




-- ----------------------------
-- Table structure for `artist`
-- ----------------------------
DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `aid`  INT(11) NOT NULL AUTO_INCREMENT,
  `aname` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `aimage` varchar(100) null,
  PRIMARY KEY (`aid`)
  );
-- ----------------------------
-- Records of artist
-- ----------------------------
LOAD DATA LOCAL INFILE '/Users/stuartliu/Documents/doc/cs504/dbProject-2017_12_17/data/artists.csv'
INTO TABLE SpotifyMusic.artist FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n';
-- ----------------------------
-- Table structure for `track`
-- ----------------------------
DROP TABLE IF EXISTS `track`;
CREATE TABLE `track` (
  `tid`  INT(11) NOT NULL,
  `ttitle` VARCHAR(45) NOT NULL,
  `tduration` INT NOT NULL,
  `tgenre` VARCHAR(45) NOT NULL,
  `aid`  INT(11) NOT NULL,
  `timage` varchar(100) null,
  `trackurl` varchar(100) null,
  PRIMARY KEY (`tid`),
  CONSTRAINT `track_fk1` FOREIGN KEY (`aid`) REFERENCES `artist` (`aid`)
  );
  
-- ----------------------------
-- Records of track
-- ----------------------------
LOAD DATA LOCAL INFILE '/Users/stuartliu/Documents/doc/cs504/dbProject-2017_12_17/data/tracksuse.csv'
INTO TABLE SpotifyMusic.track FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n';


-- ----------------------------
-- Table structure for `listen`
-- ----------------------------
DROP TABLE IF EXISTS `listen`;
CREATE TABLE `listen` (
  `uid` INT(11) NOT NULL,
  `tid`  INT(11) NOT NULL,
  `ltimestamp` DATETIME NOT NULL,
  PRIMARY KEY (`uid`,`tid`,`ltimestamp`),
  CONSTRAINT `listen_fk1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `listen_fk2` FOREIGN KEY (`tid`) REFERENCES `track` (`tid`));

-- ----------------------------
-- Records of listen
-- ----------------------------
INSERT INTO `listen` VALUES (1, 1, '2017-11-05 12:01:00');
INSERT INTO `listen` VALUES (2, 2, '2017-11-05 12:20:00');
INSERT INTO `listen` VALUES (3, 4, '2017-11-15 12:30:00');
INSERT INTO `listen` VALUES (4, 5, '2017-10-20 12:50:00');
INSERT INTO `listen` VALUES (5, 6, '2017-11-07 12:40:00');
INSERT INTO `listen` VALUES (2, 11, '2017-11-05 12:20:00');
INSERT INTO `listen` VALUES (8, 7, '2017-11-03 11:21:00');
INSERT INTO `listen` VALUES (3, 7, '2017-11-13 10:30:30');
INSERT INTO `listen` VALUES (2, 14, '2013-11-23 13:42:00');
INSERT INTO `listen` VALUES (5, 15, '2010-11-13 15:24:00');
INSERT INTO `listen` VALUES (3, 13, '2007-01-28 16:30:00');
INSERT INTO `listen` VALUES (4, 13, '2017-11-23 02:32:00');
INSERT INTO `listen` VALUES (7, 4, '2014-11-24 02:19:30');
INSERT INTO `listen` VALUES (5, 13, '2017-10-23 12:25:00');
INSERT INTO `listen` VALUES (4, 11, '2015-11-23 12:30:00');
INSERT INTO `listen` VALUES (5, 4, '2014-11-23 12:30:00');
INSERT INTO `listen` VALUES (6, 13, '2017-08-13 12:40:00');
INSERT INTO `listen` VALUES (4, 6, '2014-06-23 12:36:00');
INSERT INTO `listen` VALUES (6, 3, '2013-11-23 12:30:00');
INSERT INTO `listen` VALUES (6, 14, '2017-11-23 12:30:00');
INSERT INTO `listen` VALUES (1, 14, '2017-11-23 12:30:00');
INSERT INTO `listen` VALUES (4, 7, '2017-11-23 12:30:00');
INSERT INTO `listen` VALUES (5, 7, '2017-11-23 12:30:00');

-- ----------------------------
-- Table structure for `follow`
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `fid` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL,
  `ftimestamp` DATETIME NOT NULL,
  PRIMARY KEY (`fid`,`uid`),
  CONSTRAINT `follow_fk1` FOREIGN KEY (`fid`) REFERENCES `user` (`uid`),
  CONSTRAINT `follow_fk2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`));


-- ----------------------------
-- Table structure for `follow`
-- ----------------------------
INSERT INTO `follow` VALUES (1, 2, '2017-11-05 12:00:00');
INSERT INTO `follow` VALUES (2, 3, '2017-11-06 11:00:00');
INSERT INTO `follow` VALUES (3, 2, '2017-11-04 18:04:00');
INSERT INTO `follow` VALUES (4, 1, '2017-11-05 12:00:00');
INSERT INTO `follow` VALUES (5, 9, '2017-11-05 12:00:00');
INSERT INTO `follow` VALUES (3, 4, '2017-11-08 19:00:00');
INSERT INTO `follow` VALUES (9, 5, '2017-11-07 20:30:00');
INSERT INTO `follow` VALUES (3, 8, '2017-11-09 21:00:00');
INSERT INTO `follow` VALUES (8, 2, '2017-11-10 22:00:00');
INSERT INTO `follow` VALUES (9, 7, '2017-11-11 22:00:00');
INSERT INTO `follow` VALUES (1, 9, '2017-11-12 22:00:00');
INSERT INTO `follow` VALUES (9, 4, '2017-11-13 22:00:00');




-- ----------------------------
-- Table structure for `rate`
-- ----------------------------
DROP TABLE IF EXISTS `rate`;
CREATE TABLE `rate` (
  `uid` INT(11) NOT NULL,
  `tid`  INT(11) NOT NULL,
  `score` INT NOT NULL,
  PRIMARY KEY (`uid`,`tid`),
  CONSTRAINT `rate_fk1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `rate_fk2` FOREIGN KEY (`tid`) REFERENCES `track` (`tid`));

-- ----------------------------
-- Records of rate
-- ----------------------------
INSERT INTO `rate` VALUES (8, 7, 2);
INSERT INTO `rate` VALUES (3, 7, 4);
INSERT INTO `rate` VALUES (2, 14, 1);
INSERT INTO `rate` VALUES (5, 15,2 );
INSERT INTO `rate` VALUES (3, 13, 5);
INSERT INTO `rate` VALUES (4, 13, 4);
INSERT INTO `rate` VALUES (7, 4,3 );
INSERT INTO `rate` VALUES (5, 13, 3);
INSERT INTO `rate` VALUES (4, 11,2);
INSERT INTO `rate` VALUES (5, 4, 5);
INSERT INTO `rate` VALUES (6, 13, 4);
INSERT INTO `rate` VALUES (4, 6, 3);
INSERT INTO `rate` VALUES (6, 3, 2);

INSERT INTO `rate` VALUES (8, 1, 2);
INSERT INTO `rate` VALUES (3, 4, 4);
INSERT INTO `rate` VALUES (2, 12, 1);
INSERT INTO `rate` VALUES (5, 2,2 );
INSERT INTO `rate` VALUES (3, 2, 5);
INSERT INTO `rate` VALUES (4, 5, 4);
INSERT INTO `rate` VALUES (7, 5,3 );
INSERT INTO `rate` VALUES (5, 11, 3);
INSERT INTO `rate` VALUES (4, 12,2);
INSERT INTO `rate` VALUES (5, 10, 5);
INSERT INTO `rate` VALUES (6, 4, 4);
INSERT INTO `rate` VALUES (4, 2, 3);
INSERT INTO `rate` VALUES (6, 1, 2);
INSERT INTO `rate` VALUES (6, 5, 2);
INSERT INTO `rate` VALUES (4, 1, 2);
INSERT INTO `rate` VALUES (6, 9, 2);
INSERT INTO `rate` VALUES (1, 10, 2);
INSERT INTO `rate` VALUES (3, 10, 2);



-- ----------------------------
-- Table structure for `like`
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `uid` INT(11) NOT NULL,
  `aid`  INT(11) NOT NULL,
  `lTimestamp` DATETIME NOT NULL,
  PRIMARY KEY (`uid`, `aid`, `lTimestamp`),
  FOREIGN KEY (`uid`)
        REFERENCES `user` (`uid`),
  FOREIGN KEY (`aid`)
        REFERENCES `artist` (`aid`));

-- ----------------------------
-- Records of like
-- ----------------------------  
INSERT INTO `likes` VALUES (2, 9, '2013-11-23 13:42:00');
INSERT INTO `likes` VALUES (5, 9, '2010-11-13 15:24:00');
INSERT INTO `likes` VALUES (3, 8, '2007-01-28 16:30:00');
INSERT INTO `likes` VALUES (4, 8, '2017-11-23 02:32:00');
INSERT INTO `likes` VALUES (7, 2, '2014-11-24 02:19:30');
INSERT INTO `likes` VALUES (5, 8, '2017-10-23 12:25:00');
INSERT INTO `likes` VALUES (4, 7, '2015-11-23 12:30:00');
INSERT INTO `likes` VALUES (5, 2, '2014-11-23 12:30:00');
INSERT INTO `likes` VALUES (6, 8, '2017-08-13 12:40:00');
INSERT INTO `likes` VALUES (4, 3, '2014-06-23 12:36:00');
INSERT INTO `likes` VALUES (6, 1, '2013-11-23 12:30:00');
INSERT INTO `likes` VALUES (6, 9, '2017-11-23 12:30:00');

-- ----------------------------
-- Table structure for `album`
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `alid`  INT(11) NOT NULL,
  `atitle` VARCHAR(45) NOT NULL,
  `adate` DATETIME NOT NULL,
  `alimage` varchar(100) null,
  PRIMARY KEY (`alid`)
  );
LOAD DATA LOCAL INFILE '/Users/stuartliu/Documents/doc/cs504/dbProject-2017_12_17/data/album.csv'
INTO TABLE SpotifyMusic.album FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- ----------------------------
-- Table structure for `orderinalbum`
-- ----------------------------
DROP TABLE IF EXISTS `trackinalbum`;
CREATE TABLE `trackinalbum` (
  `tid`  INT(11) NOT NULL,
  `alid` INT(11) NOT NULL,
  `numberinalbum`INT(8) NOT NULL,
  PRIMARY KEY (`tid`,`alid`),
  CONSTRAINT `trackinalbum_fk1` FOREIGN KEY (`tid`) REFERENCES `track` (`tid`),
  CONSTRAINT `trackinalbum_fk2` FOREIGN KEY (`alid`) REFERENCES `album` (`alid`));

LOAD DATA LOCAL INFILE '/Users/stuartliu/Documents/doc/cs504/dbProject-2017_12_17/data/trackinalbum1.csv'
INTO TABLE SpotifyMusic.trackinalbum FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- ----------------------------
-- Table structure for `trackinplaylist`
-- ----------------------------
DROP TABLE IF EXISTS `trackinplaylist`;
CREATE TABLE `trackinplaylist` (
  `pid`  INT(11) NOT NULL,
  `tid`  INT(11) NOT NULL,
  PRIMARY KEY (`pid`,`tid`),
  CONSTRAINT `trackinplaylist_fk1` FOREIGN KEY (`tid`) REFERENCES `track` (`tid`),
  CONSTRAINT `trackinplaylist_fk2` FOREIGN KEY (`pid`) REFERENCES `playlist` (`pid`));
 -- ----------------------------
-- Records of trackinplaylist
-- ----------------------------
INSERT INTO `trackinplaylist` VALUES (9, 5);
INSERT INTO `trackinplaylist` VALUES (13, 1);
INSERT INTO `trackinplaylist` VALUES (12, 1);
INSERT INTO `trackinplaylist` VALUES (12, 2);
INSERT INTO `trackinplaylist` VALUES (12, 3);
INSERT INTO `trackinplaylist` VALUES (15, 8);
INSERT INTO `trackinplaylist` VALUES (15, 7);
INSERT INTO `trackinplaylist` VALUES (11, 2);
INSERT INTO `trackinplaylist` VALUES (11, 3);
INSERT INTO `trackinplaylist` VALUES (11, 4);
INSERT INTO `trackinplaylist` VALUES (11, 5);
INSERT INTO `trackinplaylist` VALUES (1, 1);
INSERT INTO `trackinplaylist` VALUES (2, 2);
INSERT INTO `trackinplaylist` VALUES (2, 3);
INSERT INTO `trackinplaylist` VALUES (5, 8);
INSERT INTO `trackinplaylist` VALUES (5, 7);
INSERT INTO `trackinplaylist` VALUES (6, 6);
INSERT INTO `trackinplaylist` VALUES (6, 7);
INSERT INTO `trackinplaylist` VALUES (7, 7);
INSERT INTO `trackinplaylist` VALUES (8, 7);
INSERT INTO `trackinplaylist` VALUES (8, 6);
INSERT INTO `trackinplaylist` VALUES (8, 8);
INSERT INTO `trackinplaylist` VALUES (8, 9);
