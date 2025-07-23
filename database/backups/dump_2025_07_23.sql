BEGIN TRANSACTION;
CREATE TABLE EvaluationExpression (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,







    expression_id INTEGER NOT NULL,







    evaluation_id INTEGER NOT NULL,







    grade SMALLINT NOT NULL,







    duration INT NOT NULL,







    language_skill TEXT CHECK (language_skill IN ('speak', 'listen', 'write', 'read')) NOT NULL,







    FOREIGN KEY (expression_id) REFERENCES Expressions(id),







    FOREIGN KEY (evaluation_id) REFERENCES Evaluations(id)







);
INSERT INTO "EvaluationExpression" VALUES(1,'2025-07-18 02:22:03',2,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(2,'2025-07-18 02:22:03',3,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(3,'2025-07-18 02:22:03',4,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(4,'2025-07-18 02:22:03',5,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(5,'2025-07-18 02:22:03',6,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(6,'2025-07-18 02:22:03',7,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(7,'2025-07-18 02:22:03',8,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(8,'2025-07-18 02:22:03',9,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(9,'2025-07-18 02:22:03',10,1,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(10,'2025-07-18 02:22:03',11,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(11,'2025-07-18 02:22:03',12,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(12,'2025-07-18 02:22:03',13,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(13,'2025-07-18 02:22:03',14,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(14,'2025-07-18 02:22:03',15,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(15,'2025-07-18 02:22:03',16,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(16,'2025-07-18 02:22:03',17,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(17,'2025-07-18 02:22:03',18,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(18,'2025-07-18 02:22:03',19,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(19,'2025-07-18 02:22:03',20,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(20,'2025-07-22 14:54:49',81,2,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(21,'2025-07-22 14:54:49',85,2,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(22,'2025-07-22 14:54:49',86,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(23,'2025-07-22 14:54:49',87,2,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(24,'2025-07-22 14:54:49',88,2,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(25,'2025-07-22 14:54:49',89,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(26,'2025-07-22 14:54:49',90,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(27,'2025-07-22 14:54:49',91,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(28,'2025-07-22 14:54:49',92,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(29,'2025-07-22 14:54:49',93,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(30,'2025-07-22 14:54:49',94,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(31,'2025-07-22 14:54:49',95,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(32,'2025-07-22 14:54:49',96,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(33,'2025-07-22 14:54:49',99,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(34,'2025-07-22 14:54:49',100,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(35,'2025-07-22 14:54:49',101,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(36,'2025-07-22 14:54:49',102,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(37,'2025-07-22 14:54:49',103,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(38,'2025-07-22 14:54:49',104,2,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(39,'2025-07-22 14:54:49',1,3,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(40,'2025-07-22 14:54:49',2,3,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(41,'2025-07-22 14:54:49',3,3,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(42,'2025-07-22 14:54:49',4,3,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(43,'2025-07-22 14:54:49',5,3,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(44,'2025-07-22 14:54:49',17,3,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(45,'2025-07-22 14:54:49',18,3,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(46,'2025-07-22 14:54:49',1,4,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(47,'2025-07-22 14:54:49',2,4,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(48,'2025-07-22 14:54:49',3,4,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(49,'2025-07-22 14:54:49',4,4,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(50,'2025-07-22 14:54:49',5,4,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(51,'2025-07-22 14:54:49',1,5,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(52,'2025-07-22 14:54:49',2,5,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(53,'2025-07-22 14:54:49',3,5,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(54,'2025-07-22 14:54:49',4,5,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(55,'2025-07-22 14:54:49',5,5,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(56,'2025-07-22 14:54:50',5,6,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(57,'2025-07-22 14:54:50',1,6,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(58,'2025-07-22 14:54:50',4,6,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(59,'2025-07-22 14:54:50',3,6,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(60,'2025-07-22 14:54:50',2,6,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(61,'2025-07-22 14:54:50',6,7,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(62,'2025-07-22 14:54:50',7,7,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(63,'2025-07-22 14:54:50',9,7,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(64,'2025-07-22 14:54:50',8,7,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(65,'2025-07-22 14:54:50',9,8,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(66,'2025-07-22 14:54:50',6,8,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(67,'2025-07-22 14:54:50',8,8,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(68,'2025-07-22 14:54:50',7,8,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(69,'2025-07-22 14:54:50',16,9,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(70,'2025-07-22 14:54:50',15,9,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(71,'2025-07-22 14:54:50',17,9,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(72,'2025-07-22 14:54:50',14,9,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(73,'2025-07-22 14:54:50',12,9,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(74,'2025-07-22 14:54:50',13,9,3,3000,'speak');
CREATE TABLE Evaluations (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    type TEXT CHECK (type IN ('Review', 'Pack', 'Selection', 'Test')) NOT NULL,







    start DATETIME NOT NULL,







    end DATETIME NOT NULL,







    size INTEGER NOT NULL







);
INSERT INTO "Evaluations" VALUES(1,'Test','2025-07-18 04:54:21','2025-07-18 04:55:01',19);
INSERT INTO "Evaluations" VALUES(2,'Test','2025-07-22 01:59:47','2025-07-22 02:02:07',19);
INSERT INTO "Evaluations" VALUES(3,'Test','2025-07-22 03:17:57','2025-07-22 03:18:47',7);
INSERT INTO "Evaluations" VALUES(4,'Test','2025-07-22 03:19:02','2025-07-22 03:19:11',5);
INSERT INTO "Evaluations" VALUES(5,'Test','2025-07-22 03:19:17','2025-07-22 03:19:27',5);
INSERT INTO "Evaluations" VALUES(6,'Test','2025-07-22 03:24:21','2025-07-22 03:24:37',5);
INSERT INTO "Evaluations" VALUES(7,'Test','2025-07-22 04:27:15','2025-07-22 04:27:23',4);
INSERT INTO "Evaluations" VALUES(8,'Test','2025-07-22 04:27:37','2025-07-22 04:27:45',4);
INSERT INTO "Evaluations" VALUES(9,'Test','2025-07-22 04:28:08','2025-07-22 04:28:39',6);
CREATE TABLE Expressions (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    text TEXT NOT NULL,







    sound_filename TEXT NOT NULL,







    language_id INTEGER NOT NULL,







    meaning_id INTEGER NOT NULL,







    FOREIGN KEY (language_id) REFERENCES Languages(id),







    FOREIGN KEY (meaning_id) REFERENCES Meanings(id)







);
INSERT INTO "Expressions" VALUES(1,'мой дом','russian__my_house',2,1);
INSERT INTO "Expressions" VALUES(2,'твоя машина','russian__your_car',2,2);
INSERT INTO "Expressions" VALUES(3,'его телефон','russian__his_phone',2,3);
INSERT INTO "Expressions" VALUES(4,'её книга','russian__her_book',2,4);
INSERT INTO "Expressions" VALUES(5,'его цвет','russian__its_color',2,5);
INSERT INTO "Expressions" VALUES(6,'наша команда','russian__our_team',2,6);
INSERT INTO "Expressions" VALUES(7,'их сад','russian__their_garden',2,7);
INSERT INTO "Expressions" VALUES(8,'мой ноутбук','russian__my_laptop',2,8);
INSERT INTO "Expressions" VALUES(9,'твоя идея','russian__your_idea',2,9);
INSERT INTO "Expressions" VALUES(10,'его стул','russian__his_chair',2,10);
INSERT INTO "Expressions" VALUES(11,'её песня','russian__her_song',2,11);
INSERT INTO "Expressions" VALUES(12,'его функция','russian__its_function',2,12);
INSERT INTO "Expressions" VALUES(13,'наш план','russian__our_plan',2,13);
INSERT INTO "Expressions" VALUES(14,'их проект','russian__their_project',2,14);
INSERT INTO "Expressions" VALUES(15,'моя куртка','russian__my_jacket',2,15);
INSERT INTO "Expressions" VALUES(16,'твоя мечта','russian__your_dream',2,16);
INSERT INTO "Expressions" VALUES(17,'его игра','russian__his_game',2,17);
INSERT INTO "Expressions" VALUES(18,'её фильм','russian__her_movie',2,18);
INSERT INTO "Expressions" VALUES(19,'наш ужин','russian__our_dinner',2,19);
INSERT INTO "Expressions" VALUES(20,'их история','russian__their_story',2,20);
INSERT INTO "Expressions" VALUES(21,'my house','english__my_house',4,1);
INSERT INTO "Expressions" VALUES(22,'your car','english__your_car',4,2);
INSERT INTO "Expressions" VALUES(23,'his phone','english__his_phone',4,3);
INSERT INTO "Expressions" VALUES(24,'her book','english__her_book',4,4);
INSERT INTO "Expressions" VALUES(25,'its color','english__its_color',4,5);
INSERT INTO "Expressions" VALUES(26,'our team','english__our_team',4,6);
INSERT INTO "Expressions" VALUES(27,'their garden','english__their_garden',4,7);
INSERT INTO "Expressions" VALUES(28,'my laptop','english__my_laptop',4,8);
INSERT INTO "Expressions" VALUES(29,'your idea','english__your_idea',4,9);
INSERT INTO "Expressions" VALUES(30,'his chair','english__his_chair',4,10);
INSERT INTO "Expressions" VALUES(31,'her song','english__her_song',4,11);
INSERT INTO "Expressions" VALUES(32,'its function','english__its_function',4,12);
INSERT INTO "Expressions" VALUES(33,'our plan','english__our_plan',4,13);
INSERT INTO "Expressions" VALUES(34,'their project','english__their_project',4,14);
INSERT INTO "Expressions" VALUES(35,'my jacket','english__my_jacket',4,15);
INSERT INTO "Expressions" VALUES(36,'your dream','english__your_dream',4,16);
INSERT INTO "Expressions" VALUES(37,'his game','english__his_game',4,17);
INSERT INTO "Expressions" VALUES(38,'her movie','english__her_movie',4,18);
INSERT INTO "Expressions" VALUES(39,'our dinner','english__our_dinner',4,19);
INSERT INTO "Expressions" VALUES(40,'their story','english__their_story',4,20);
INSERT INTO "Expressions" VALUES(41,'один','russian__one',2,21);
INSERT INTO "Expressions" VALUES(42,'два','russian__two',2,22);
INSERT INTO "Expressions" VALUES(43,'три','russian__three',2,23);
INSERT INTO "Expressions" VALUES(44,'четыре','russian__four',2,24);
INSERT INTO "Expressions" VALUES(45,'пять','russian__five',2,25);
INSERT INTO "Expressions" VALUES(46,'шесть','russian__six',2,26);
INSERT INTO "Expressions" VALUES(47,'семь','russian__seven',2,27);
INSERT INTO "Expressions" VALUES(48,'восемь','russian__eight',2,28);
INSERT INTO "Expressions" VALUES(49,'девять','russian__nine',2,29);
INSERT INTO "Expressions" VALUES(50,'десять','russian__ten',2,30);
INSERT INTO "Expressions" VALUES(51,'одиннадцать','russian__eleven',2,31);
INSERT INTO "Expressions" VALUES(52,'двенадцать','russian__twelve',2,32);
INSERT INTO "Expressions" VALUES(53,'тринадцать','russian__thirteen',2,33);
INSERT INTO "Expressions" VALUES(54,'четырнадцать','russian__fourteen',2,34);
INSERT INTO "Expressions" VALUES(55,'пятнадцать','russian__fifteen',2,35);
INSERT INTO "Expressions" VALUES(56,'шестнадцать','russian__sixteen',2,36);
INSERT INTO "Expressions" VALUES(57,'семнадцать','russian__seventeen',2,37);
INSERT INTO "Expressions" VALUES(58,'восемнадцать','russian__eighteen',2,38);
INSERT INTO "Expressions" VALUES(59,'девятнадцать','russian__nineteen',2,39);
INSERT INTO "Expressions" VALUES(60,'двадцать','russian__twenty',2,40);
INSERT INTO "Expressions" VALUES(61,'one','english__one',4,21);
INSERT INTO "Expressions" VALUES(62,'two','english__two',4,22);
INSERT INTO "Expressions" VALUES(63,'three','english__three',4,23);
INSERT INTO "Expressions" VALUES(64,'four','english__four',4,24);
INSERT INTO "Expressions" VALUES(65,'five','english__five',4,25);
INSERT INTO "Expressions" VALUES(66,'six','english__six',4,26);
INSERT INTO "Expressions" VALUES(67,'seven','english__seven',4,27);
INSERT INTO "Expressions" VALUES(68,'eight','english__eight',4,28);
INSERT INTO "Expressions" VALUES(69,'nine','english__nine',4,29);
INSERT INTO "Expressions" VALUES(70,'ten','english__ten',4,30);
INSERT INTO "Expressions" VALUES(71,'eleven','english__eleven',4,31);
INSERT INTO "Expressions" VALUES(72,'twelve','english__twelve',4,32);
INSERT INTO "Expressions" VALUES(73,'thirteen','english__thirteen',4,33);
INSERT INTO "Expressions" VALUES(74,'fourteen','english__fourteen',4,34);
INSERT INTO "Expressions" VALUES(75,'fifteen','english__fifteen',4,35);
INSERT INTO "Expressions" VALUES(76,'sixteen','english__sixteen',4,36);
INSERT INTO "Expressions" VALUES(77,'seventeen','english__seventeen',4,37);
INSERT INTO "Expressions" VALUES(78,'eighteen','english__eighteen',4,38);
INSERT INTO "Expressions" VALUES(79,'nineteen','english__nineteen',4,39);
INSERT INTO "Expressions" VALUES(80,'twenty','english__twenty',4,40);
INSERT INTO "Expressions" VALUES(81,'идти','russian__go',2,41);
INSERT INTO "Expressions" VALUES(82,'я иду','russian__i_go',2,42);
INSERT INTO "Expressions" VALUES(83,'ты идёшь','russian__you_go',2,43);
INSERT INTO "Expressions" VALUES(84,'возвращаться','russian__return',2,44);
INSERT INTO "Expressions" VALUES(85,'я возвращаюсь','russian__i_return',2,45);
INSERT INTO "Expressions" VALUES(86,'ты возвращаешься','russian__you_return',2,46);
INSERT INTO "Expressions" VALUES(87,'входить','russian__enter',2,47);
INSERT INTO "Expressions" VALUES(88,'я вхожу','russian__i_enter',2,48);
INSERT INTO "Expressions" VALUES(89,'ты входишь','russian__you_enter',2,49);
INSERT INTO "Expressions" VALUES(90,'выходить','russian__exit',2,50);
INSERT INTO "Expressions" VALUES(91,'я выхожу','russian__i_exit',2,51);
INSERT INTO "Expressions" VALUES(92,'ты выходишь','russian__you_exit',2,52);
INSERT INTO "Expressions" VALUES(93,'приходить','russian__arrive',2,53);
INSERT INTO "Expressions" VALUES(94,'я прихожу','russian__i_arrive',2,54);
INSERT INTO "Expressions" VALUES(95,'ты приходишь','russian__you_arrive',2,55);
INSERT INTO "Expressions" VALUES(96,'уходить','russian__leave',2,56);
INSERT INTO "Expressions" VALUES(97,'я ухожу','russian__i_leave',2,57);
INSERT INTO "Expressions" VALUES(98,'ты уходишь','russian__you_leave',2,58);
INSERT INTO "Expressions" VALUES(99,'проходить','russian__pass',2,62);
INSERT INTO "Expressions" VALUES(100,'я прохожу','russian__i_pass',2,63);
INSERT INTO "Expressions" VALUES(101,'ты проходишь','russian__you_pass',2,64);
INSERT INTO "Expressions" VALUES(102,'останавливаться','russian__stop',2,65);
INSERT INTO "Expressions" VALUES(103,'я останавливаюсь','russian__i_stop',2,66);
INSERT INTO "Expressions" VALUES(104,'ты останавливаешься','russian__you_stop',2,67);
INSERT INTO "Expressions" VALUES(105,'go','english__go',4,41);
INSERT INTO "Expressions" VALUES(106,'I go','english__i_go',4,42);
INSERT INTO "Expressions" VALUES(107,'you go','english__you_go',4,43);
INSERT INTO "Expressions" VALUES(108,'return','english__return',4,44);
INSERT INTO "Expressions" VALUES(109,'I return','english__i_return',4,45);
INSERT INTO "Expressions" VALUES(110,'you return','english__you_return',4,46);
INSERT INTO "Expressions" VALUES(111,'enter','english__enter',4,47);
INSERT INTO "Expressions" VALUES(112,'I enter','english__i_enter',4,48);
INSERT INTO "Expressions" VALUES(113,'you enter','english__you_enter',4,49);
INSERT INTO "Expressions" VALUES(114,'exit','english__exit',4,50);
INSERT INTO "Expressions" VALUES(115,'I exit','english__i_exit',4,51);
INSERT INTO "Expressions" VALUES(116,'you exit','english__you_exit',4,52);
INSERT INTO "Expressions" VALUES(117,'arrive','english__arrive',4,53);
INSERT INTO "Expressions" VALUES(118,'I arrive','english__i_arrive',4,54);
INSERT INTO "Expressions" VALUES(119,'you arrive','english__you_arrive',4,55);
INSERT INTO "Expressions" VALUES(120,'leave','english__leave',4,56);
INSERT INTO "Expressions" VALUES(121,'I leave','english__i_leave',4,57);
INSERT INTO "Expressions" VALUES(122,'you leave','english__you_leave',4,58);
INSERT INTO "Expressions" VALUES(123,'come','english__come',4,59);
INSERT INTO "Expressions" VALUES(124,'I come','english__i_come',4,60);
INSERT INTO "Expressions" VALUES(125,'you come','english__you_come',4,61);
INSERT INTO "Expressions" VALUES(126,'pass','english__pass',4,62);
INSERT INTO "Expressions" VALUES(127,'I pass','english__i_pass',4,63);
INSERT INTO "Expressions" VALUES(128,'you pass','english__you_pass',4,64);
INSERT INTO "Expressions" VALUES(129,'stop','english__stop',4,65);
INSERT INTO "Expressions" VALUES(130,'I stop','english__i_stop',4,66);
INSERT INTO "Expressions" VALUES(131,'you stop','english__you_stop',4,67);
INSERT INTO "Expressions" VALUES(132,'ноль','russian__zero',2,68);
INSERT INTO "Expressions" VALUES(133,'zero','english__zero',4,68);
INSERT INTO "Expressions" VALUES(134,'надцать','russian__prefix_11_to_19',2,69);
INSERT INTO "Expressions" VALUES(135,'teen','english__prefix_11_to_19',4,69);
CREATE TABLE LanguagePackWithTitle (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    pack_id INTEGER NOT NULL,







    language_id INTEGER NOT NULL,







    title TEXT NOT NULL,







    FOREIGN KEY (pack_id) REFERENCES Packs(id),







    FOREIGN KEY (language_id) REFERENCES Languages(id)







);
INSERT INTO "LanguagePackWithTitle" VALUES(1,1,4,'possessive pronouns, with noun');
INSERT INTO "LanguagePackWithTitle" VALUES(2,2,4,'numbers: 1 to 19');
INSERT INTO "LanguagePackWithTitle" VALUES(3,3,4,'verbs inf 1st 2nd movement stuff');
INSERT INTO "LanguagePackWithTitle" VALUES(4,4,4,'numbers: 0 to 9');
INSERT INTO "LanguagePackWithTitle" VALUES(5,5,4,'numbers: 10 to 19');
INSERT INTO "LanguagePackWithTitle" VALUES(6,6,4,'numbers: 20 to 90 (x10)');
CREATE TABLE Languages (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    languageEng TEXT NOT NULL,







    languageNative TEXT NOT NULL,







    languageEngTwoLetters TEXT NOT NULL







);
INSERT INTO "Languages" VALUES(1,'portuguese','Português','pt');
INSERT INTO "Languages" VALUES(2,'russian','Русский','ru');
INSERT INTO "Languages" VALUES(3,'polish','Polski','pl');
INSERT INTO "Languages" VALUES(4,'english','English','en');
CREATE TABLE MeaningPack (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    pack_id INTEGER NOT NULL,







    meaning_id INTEGER NOT NULL,







    FOREIGN KEY (pack_id) REFERENCES Packs(id),







    FOREIGN KEY (meaning_id) REFERENCES Meanings(id)







);
INSERT INTO "MeaningPack" VALUES(1,1,1);
INSERT INTO "MeaningPack" VALUES(2,1,2);
INSERT INTO "MeaningPack" VALUES(3,1,3);
INSERT INTO "MeaningPack" VALUES(4,1,4);
INSERT INTO "MeaningPack" VALUES(5,1,5);
INSERT INTO "MeaningPack" VALUES(6,1,6);
INSERT INTO "MeaningPack" VALUES(7,1,7);
INSERT INTO "MeaningPack" VALUES(8,1,8);
INSERT INTO "MeaningPack" VALUES(9,1,9);
INSERT INTO "MeaningPack" VALUES(10,1,10);
INSERT INTO "MeaningPack" VALUES(11,1,11);
INSERT INTO "MeaningPack" VALUES(12,1,12);
INSERT INTO "MeaningPack" VALUES(13,1,13);
INSERT INTO "MeaningPack" VALUES(14,1,14);
INSERT INTO "MeaningPack" VALUES(15,1,15);
INSERT INTO "MeaningPack" VALUES(16,1,16);
INSERT INTO "MeaningPack" VALUES(17,1,17);
INSERT INTO "MeaningPack" VALUES(18,1,18);
INSERT INTO "MeaningPack" VALUES(19,1,19);
INSERT INTO "MeaningPack" VALUES(20,1,20);
INSERT INTO "MeaningPack" VALUES(21,2,21);
INSERT INTO "MeaningPack" VALUES(22,2,22);
INSERT INTO "MeaningPack" VALUES(23,2,23);
INSERT INTO "MeaningPack" VALUES(24,2,24);
INSERT INTO "MeaningPack" VALUES(25,2,25);
INSERT INTO "MeaningPack" VALUES(26,2,26);
INSERT INTO "MeaningPack" VALUES(27,2,27);
INSERT INTO "MeaningPack" VALUES(28,2,28);
INSERT INTO "MeaningPack" VALUES(29,2,29);
INSERT INTO "MeaningPack" VALUES(30,2,30);
INSERT INTO "MeaningPack" VALUES(31,2,31);
INSERT INTO "MeaningPack" VALUES(32,2,32);
INSERT INTO "MeaningPack" VALUES(33,2,33);
INSERT INTO "MeaningPack" VALUES(34,2,34);
INSERT INTO "MeaningPack" VALUES(35,2,35);
INSERT INTO "MeaningPack" VALUES(36,2,36);
INSERT INTO "MeaningPack" VALUES(37,2,37);
INSERT INTO "MeaningPack" VALUES(38,2,38);
INSERT INTO "MeaningPack" VALUES(39,2,39);
INSERT INTO "MeaningPack" VALUES(40,2,40);
INSERT INTO "MeaningPack" VALUES(41,3,41);
INSERT INTO "MeaningPack" VALUES(42,3,42);
INSERT INTO "MeaningPack" VALUES(43,3,43);
INSERT INTO "MeaningPack" VALUES(44,3,44);
INSERT INTO "MeaningPack" VALUES(45,3,45);
INSERT INTO "MeaningPack" VALUES(46,3,46);
INSERT INTO "MeaningPack" VALUES(47,3,47);
INSERT INTO "MeaningPack" VALUES(48,3,48);
INSERT INTO "MeaningPack" VALUES(49,3,49);
INSERT INTO "MeaningPack" VALUES(50,3,50);
INSERT INTO "MeaningPack" VALUES(51,3,51);
INSERT INTO "MeaningPack" VALUES(52,3,52);
INSERT INTO "MeaningPack" VALUES(53,3,53);
INSERT INTO "MeaningPack" VALUES(54,3,54);
INSERT INTO "MeaningPack" VALUES(55,3,55);
INSERT INTO "MeaningPack" VALUES(56,3,56);
INSERT INTO "MeaningPack" VALUES(62,3,62);
INSERT INTO "MeaningPack" VALUES(63,3,63);
INSERT INTO "MeaningPack" VALUES(64,3,64);
INSERT INTO "MeaningPack" VALUES(65,3,65);
INSERT INTO "MeaningPack" VALUES(66,3,66);
INSERT INTO "MeaningPack" VALUES(67,3,67);
INSERT INTO "MeaningPack" VALUES(68,4,68);
INSERT INTO "MeaningPack" VALUES(69,4,21);
INSERT INTO "MeaningPack" VALUES(70,4,22);
INSERT INTO "MeaningPack" VALUES(71,4,23);
INSERT INTO "MeaningPack" VALUES(72,4,24);
INSERT INTO "MeaningPack" VALUES(73,4,25);
INSERT INTO "MeaningPack" VALUES(74,4,26);
INSERT INTO "MeaningPack" VALUES(75,4,27);
INSERT INTO "MeaningPack" VALUES(76,4,28);
INSERT INTO "MeaningPack" VALUES(77,4,29);
INSERT INTO "MeaningPack" VALUES(78,5,69);
INSERT INTO "MeaningPack" VALUES(79,5,30);
INSERT INTO "MeaningPack" VALUES(80,5,31);
INSERT INTO "MeaningPack" VALUES(81,5,32);
INSERT INTO "MeaningPack" VALUES(82,5,33);
INSERT INTO "MeaningPack" VALUES(83,5,34);
INSERT INTO "MeaningPack" VALUES(84,5,35);
INSERT INTO "MeaningPack" VALUES(85,5,36);
INSERT INTO "MeaningPack" VALUES(86,5,37);
INSERT INTO "MeaningPack" VALUES(87,5,38);
INSERT INTO "MeaningPack" VALUES(88,5,39);
INSERT INTO "MeaningPack" VALUES(89,6,70);
INSERT INTO "MeaningPack" VALUES(90,6,40);
INSERT INTO "MeaningPack" VALUES(91,6,71);
INSERT INTO "MeaningPack" VALUES(92,6,72);
INSERT INTO "MeaningPack" VALUES(93,6,73);
INSERT INTO "MeaningPack" VALUES(94,6,74);
INSERT INTO "MeaningPack" VALUES(95,6,75);
INSERT INTO "MeaningPack" VALUES(96,6,76);
INSERT INTO "MeaningPack" VALUES(97,6,77);
CREATE TABLE Meanings (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    meaningEng TEXT NOT NULL







);
INSERT INTO "Meanings" VALUES(1,'my house');
INSERT INTO "Meanings" VALUES(2,'your car');
INSERT INTO "Meanings" VALUES(3,'his phone');
INSERT INTO "Meanings" VALUES(4,'her book');
INSERT INTO "Meanings" VALUES(5,'its color');
INSERT INTO "Meanings" VALUES(6,'our team');
INSERT INTO "Meanings" VALUES(7,'their garden');
INSERT INTO "Meanings" VALUES(8,'my laptop');
INSERT INTO "Meanings" VALUES(9,'your idea');
INSERT INTO "Meanings" VALUES(10,'his chair');
INSERT INTO "Meanings" VALUES(11,'her song');
INSERT INTO "Meanings" VALUES(12,'its function');
INSERT INTO "Meanings" VALUES(13,'our plan');
INSERT INTO "Meanings" VALUES(14,'their project');
INSERT INTO "Meanings" VALUES(15,'my jacket');
INSERT INTO "Meanings" VALUES(16,'your dream');
INSERT INTO "Meanings" VALUES(17,'his game');
INSERT INTO "Meanings" VALUES(18,'her movie');
INSERT INTO "Meanings" VALUES(19,'our dinner');
INSERT INTO "Meanings" VALUES(20,'their story');
INSERT INTO "Meanings" VALUES(21,'one');
INSERT INTO "Meanings" VALUES(22,'two');
INSERT INTO "Meanings" VALUES(23,'three');
INSERT INTO "Meanings" VALUES(24,'four');
INSERT INTO "Meanings" VALUES(25,'five');
INSERT INTO "Meanings" VALUES(26,'six');
INSERT INTO "Meanings" VALUES(27,'seven');
INSERT INTO "Meanings" VALUES(28,'eight');
INSERT INTO "Meanings" VALUES(29,'nine');
INSERT INTO "Meanings" VALUES(30,'ten');
INSERT INTO "Meanings" VALUES(31,'eleven');
INSERT INTO "Meanings" VALUES(32,'twelve');
INSERT INTO "Meanings" VALUES(33,'thirteen');
INSERT INTO "Meanings" VALUES(34,'fourteen');
INSERT INTO "Meanings" VALUES(35,'fifteen');
INSERT INTO "Meanings" VALUES(36,'sixteen');
INSERT INTO "Meanings" VALUES(37,'seventeen');
INSERT INTO "Meanings" VALUES(38,'eighteen');
INSERT INTO "Meanings" VALUES(39,'nineteen');
INSERT INTO "Meanings" VALUES(40,'twenty');
INSERT INTO "Meanings" VALUES(41,'go');
INSERT INTO "Meanings" VALUES(42,'I go');
INSERT INTO "Meanings" VALUES(43,'you go');
INSERT INTO "Meanings" VALUES(44,'return');
INSERT INTO "Meanings" VALUES(45,'I return');
INSERT INTO "Meanings" VALUES(46,'you return');
INSERT INTO "Meanings" VALUES(47,'enter');
INSERT INTO "Meanings" VALUES(48,'I enter');
INSERT INTO "Meanings" VALUES(49,'you enter');
INSERT INTO "Meanings" VALUES(50,'exit');
INSERT INTO "Meanings" VALUES(51,'I exit');
INSERT INTO "Meanings" VALUES(52,'you exit');
INSERT INTO "Meanings" VALUES(53,'arrive');
INSERT INTO "Meanings" VALUES(54,'I arrive');
INSERT INTO "Meanings" VALUES(55,'you arrive');
INSERT INTO "Meanings" VALUES(56,'leave');
INSERT INTO "Meanings" VALUES(57,'I leave');
INSERT INTO "Meanings" VALUES(58,'you leave');
INSERT INTO "Meanings" VALUES(59,'come');
INSERT INTO "Meanings" VALUES(60,'I come');
INSERT INTO "Meanings" VALUES(61,'you come');
INSERT INTO "Meanings" VALUES(62,'pass');
INSERT INTO "Meanings" VALUES(63,'I pass');
INSERT INTO "Meanings" VALUES(64,'you pass');
INSERT INTO "Meanings" VALUES(65,'stop');
INSERT INTO "Meanings" VALUES(66,'I stop');
INSERT INTO "Meanings" VALUES(67,'you stop');
INSERT INTO "Meanings" VALUES(68,'zero');
INSERT INTO "Meanings" VALUES(69,'prefix 11 to 19');
INSERT INTO "Meanings" VALUES(70,'prefix of tenths');
INSERT INTO "Meanings" VALUES(71,'thirty');
INSERT INTO "Meanings" VALUES(72,'forty');
INSERT INTO "Meanings" VALUES(73,'fifty');
INSERT INTO "Meanings" VALUES(74,'sixty');
INSERT INTO "Meanings" VALUES(75,'seventy');
INSERT INTO "Meanings" VALUES(76,'eighty');
INSERT INTO "Meanings" VALUES(77,'ninty');
CREATE TABLE Packs (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    descriptionEng TEXT NOT NULL







);
INSERT INTO "Packs" VALUES(1,'possessive pronouns, with noun');
INSERT INTO "Packs" VALUES(2,'numbers: 1 to 19');
INSERT INTO "Packs" VALUES(3,'verbs (infinitive, present: 1st, 2nd) related to movement.');
INSERT INTO "Packs" VALUES(4,'numbers: 0 to 9');
INSERT INTO "Packs" VALUES(5,'numbers: 10 to 19');
INSERT INTO "Packs" VALUES(6,'numbers: 20 to 90 (x10)');
CREATE TABLE Phonetics (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    text TEXT NOT NULL,







    expression_id INTEGER NOT NULL,







    FOREIGN KEY (expression_id) REFERENCES Expressions(id)







);
INSERT INTO "Phonetics" VALUES(1,'moi dom',1);
INSERT INTO "Phonetics" VALUES(2,'tvaia mach#ina',2);
INSERT INTO "Phonetics" VALUES(3,'iivo tilifon',3);
INSERT INTO "Phonetics" VALUES(4,'iiio kniga',4);
INSERT INTO "Phonetics" VALUES(5,'iivo tsviet',5);
INSERT INTO "Phonetics" VALUES(6,'nacha kamanda',6);
INSERT INTO "Phonetics" VALUES(7,'irr sat',7);
INSERT INTO "Phonetics" VALUES(8,'moi noʊtbuk',8);
INSERT INTO "Phonetics" VALUES(9,'tvaia ideia',9);
INSERT INTO "Phonetics" VALUES(10,'iivo stul',10);
INSERT INTO "Phonetics" VALUES(11,'iiio pesna',11);
INSERT INTO "Phonetics" VALUES(12,'iivo funkts#iia',12);
INSERT INTO "Phonetics" VALUES(13,'nach plan',13);
INSERT INTO "Phonetics" VALUES(14,'irr praiekt',14);
INSERT INTO "Phonetics" VALUES(15,'maia kurtka',15);
INSERT INTO "Phonetics" VALUES(16,'tvaia mit͡shta',16);
INSERT INTO "Phonetics" VALUES(17,'iivo igra',17);
INSERT INTO "Phonetics" VALUES(18,'iiio film',18);
INSERT INTO "Phonetics" VALUES(19,'nach ui#in',19);
INSERT INTO "Phonetics" VALUES(20,'irr istoriia',20);
INSERT INTO "Phonetics" VALUES(21,'adin',41);
INSERT INTO "Phonetics" VALUES(22,'dva',42);
INSERT INTO "Phonetics" VALUES(23,'tri',43);
INSERT INTO "Phonetics" VALUES(24,'t͡shit#iri',44);
INSERT INTO "Phonetics" VALUES(25,'pat',45);
INSERT INTO "Phonetics" VALUES(26,'chest',46);
INSERT INTO "Phonetics" VALUES(27,'sem',47);
INSERT INTO "Phonetics" VALUES(28,'vosim',48);
INSERT INTO "Phonetics" VALUES(29,'devit',49);
INSERT INTO "Phonetics" VALUES(30,'desit',50);
INSERT INTO "Phonetics" VALUES(31,'adinːats#it',51);
INSERT INTO "Phonetics" VALUES(32,'dvinats#it',52);
INSERT INTO "Phonetics" VALUES(33,'trinats#it',53);
INSERT INTO "Phonetics" VALUES(34,'t͡shit#irnats#it',54);
INSERT INTO "Phonetics" VALUES(35,'pitnats#it',55);
INSERT INTO "Phonetics" VALUES(36,'ch#isnats#it',56);
INSERT INTO "Phonetics" VALUES(37,'simnats#it',57);
INSERT INTO "Phonetics" VALUES(38,'vasimnats#it',58);
INSERT INTO "Phonetics" VALUES(39,'divitnats#it',59);
INSERT INTO "Phonetics" VALUES(40,'dvatsat',60);
INSERT INTO "Phonetics" VALUES(41,'itti',81);
INSERT INTO "Phonetics" VALUES(42,'ii idu',82);
INSERT INTO "Phonetics" VALUES(43,'t#i idɵch',83);
INSERT INTO "Phonetics" VALUES(44,'vazrachtchætsa',84);
INSERT INTO "Phonetics" VALUES(45,'ii vazrachtchæiʊs',85);
INSERT INTO "Phonetics" VALUES(46,'t#i vazrachtchæiichsa',86);
INSERT INTO "Phonetics" VALUES(47,'frradit',87);
INSERT INTO "Phonetics" VALUES(48,'ii frraiu',88);
INSERT INTO "Phonetics" VALUES(49,'t#i frrodich',89);
INSERT INTO "Phonetics" VALUES(50,'v#irradit',90);
INSERT INTO "Phonetics" VALUES(51,'ii v#irraiu',91);
INSERT INTO "Phonetics" VALUES(52,'t#i v#irrodich',92);
INSERT INTO "Phonetics" VALUES(53,'prirradit',93);
INSERT INTO "Phonetics" VALUES(54,'ii prirraiu',94);
INSERT INTO "Phonetics" VALUES(55,'t#i prirrodich',95);
INSERT INTO "Phonetics" VALUES(56,'ʊrradit',96);
INSERT INTO "Phonetics" VALUES(57,'ii ʊrraiu',97);
INSERT INTO "Phonetics" VALUES(58,'t#i ʊrrodich',98);
INSERT INTO "Phonetics" VALUES(59,'prarradit',99);
INSERT INTO "Phonetics" VALUES(60,'ii prarraiu',100);
INSERT INTO "Phonetics" VALUES(61,'t#i prarrodich',101);
INSERT INTO "Phonetics" VALUES(62,'astanavlivatsːa',102);
INSERT INTO "Phonetics" VALUES(63,'ii astanavlivaiʊs',103);
INSERT INTO "Phonetics" VALUES(64,'t#i astanavlivaiichsa',104);
INSERT INTO "Phonetics" VALUES(65,'nol',132);
INSERT INTO "Phonetics" VALUES(66,'nats#it',134);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('Languages',4);
INSERT INTO "sqlite_sequence" VALUES('Packs',6);
INSERT INTO "sqlite_sequence" VALUES('Meanings',77);
INSERT INTO "sqlite_sequence" VALUES('MeaningPack',97);
INSERT INTO "sqlite_sequence" VALUES('Expressions',135);
INSERT INTO "sqlite_sequence" VALUES('Phonetics',66);
INSERT INTO "sqlite_sequence" VALUES('LanguagePackWithTitle',6);
INSERT INTO "sqlite_sequence" VALUES('Evaluations',9);
INSERT INTO "sqlite_sequence" VALUES('EvaluationExpression',74);
COMMIT;
