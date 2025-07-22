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
INSERT INTO "EvaluationExpression" VALUES(1,'2025-06-23 13:23:07',80,1,2,12,'speak');
INSERT INTO "EvaluationExpression" VALUES(2,'2025-06-23 13:23:07',81,1,3,12,'speak');
INSERT INTO "EvaluationExpression" VALUES(3,'2025-06-23 13:23:07',82,1,3,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(4,'2025-06-23 13:23:07',83,1,2,9,'speak');
INSERT INTO "EvaluationExpression" VALUES(5,'2025-06-23 13:23:07',84,1,4,8,'speak');
INSERT INTO "EvaluationExpression" VALUES(6,'2025-06-23 13:23:07',85,1,1,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(7,'2025-06-23 13:23:07',86,1,4,6,'speak');
INSERT INTO "EvaluationExpression" VALUES(8,'2025-06-23 13:23:07',87,1,2,8,'speak');
INSERT INTO "EvaluationExpression" VALUES(9,'2025-06-23 13:23:07',88,1,3,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(10,'2025-06-23 13:23:07',89,1,4,7,'speak');
INSERT INTO "EvaluationExpression" VALUES(11,'2025-06-23 14:20:00',80,2,3,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(12,'2025-06-23 13:23:07',81,2,3,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(13,'2025-06-23 13:23:07',82,2,3,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(14,'2025-06-23 13:23:07',83,2,4,15,'speak');
INSERT INTO "EvaluationExpression" VALUES(15,'2025-06-23 13:23:07',84,2,4,7,'speak');
INSERT INTO "EvaluationExpression" VALUES(16,'2025-06-23 13:23:07',85,2,1,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(17,'2025-06-23 13:23:07',86,2,4,9,'speak');
INSERT INTO "EvaluationExpression" VALUES(18,'2025-06-23 13:23:07',87,2,4,12,'speak');
INSERT INTO "EvaluationExpression" VALUES(19,'2025-06-23 13:23:07',88,2,4,5,'speak');
INSERT INTO "EvaluationExpression" VALUES(20,'2025-06-23 13:23:07',89,2,4,8,'speak');
INSERT INTO "EvaluationExpression" VALUES(21,'2025-06-23 13:23:07',1,3,2,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(22,'2025-06-23 13:23:07',2,3,3,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(23,'2025-06-23 13:23:07',3,3,2,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(24,'2025-06-23 13:23:07',4,3,4,15,'speak');
INSERT INTO "EvaluationExpression" VALUES(25,'2025-06-23 13:23:07',5,3,3,7,'speak');
INSERT INTO "EvaluationExpression" VALUES(26,'2025-06-23 13:23:07',6,3,2,10,'speak');
INSERT INTO "EvaluationExpression" VALUES(27,'2025-06-23 13:23:07',7,3,3,9,'speak');
INSERT INTO "EvaluationExpression" VALUES(28,'2025-06-24 18:32:55',80,4,4,7,'speak');
INSERT INTO "EvaluationExpression" VALUES(29,'2025-06-24 18:32:55',85,4,3,16,'read');
INSERT INTO "EvaluationExpression" VALUES(30,'2025-06-25 18:32:55',80,5,3,8,'speak');
INSERT INTO "EvaluationExpression" VALUES(31,'2025-06-25 18:32:55',85,5,3,14,'read');
INSERT INTO "EvaluationExpression" VALUES(32,'2025-06-26 18:32:55',80,6,4,9,'listen');
INSERT INTO "EvaluationExpression" VALUES(33,'2025-06-26 18:32:55',85,6,3,12,'read');
INSERT INTO "EvaluationExpression" VALUES(34,'2025-07-09 01:15:43',1,7,5,30,'listen');
INSERT INTO "EvaluationExpression" VALUES(35,'2025-07-09 01:15:43',1,7,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(36,'2025-07-09 01:15:43',1,7,4,30,'listen');
INSERT INTO "EvaluationExpression" VALUES(37,'2025-07-09 01:28:51',1,8,3,30,'write');
INSERT INTO "EvaluationExpression" VALUES(38,'2025-07-09 01:28:51',1,8,4,30,'write');
INSERT INTO "EvaluationExpression" VALUES(39,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(40,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(41,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(42,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(43,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(44,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(45,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(46,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(47,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(48,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(49,'2025-07-09 02:00:17',8,9,3,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(50,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(51,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(52,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(53,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(54,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(55,'2025-07-09 02:00:17',8,9,4,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(56,'2025-07-09 02:00:17',8,9,5,30,'speak');
INSERT INTO "EvaluationExpression" VALUES(57,'2025-07-09 02:01:48',8,10,1,30,'listen');
INSERT INTO "EvaluationExpression" VALUES(58,'2025-07-09 02:01:48',8,10,2,30,'listen');
INSERT INTO "EvaluationExpression" VALUES(59,'2025-07-09 02:01:48',8,10,3,30,'listen');
INSERT INTO "EvaluationExpression" VALUES(60,'2025-07-09 02:01:48',8,10,4,30,'listen');
INSERT INTO "EvaluationExpression" VALUES(61,'2025-07-09 02:01:48',8,10,5,30,'listen');
INSERT INTO "EvaluationExpression" VALUES(62,'2025-07-15 23:39:33',41,11,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(63,'2025-07-15 23:39:33',42,11,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(64,'2025-07-15 23:39:33',43,11,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(65,'2025-07-15 23:43:24',50,12,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(66,'2025-07-15 23:43:24',52,12,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(67,'2025-07-15 23:43:24',56,12,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(68,'2025-07-15 23:43:24',57,12,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(69,'2025-07-15 23:43:58',41,13,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(70,'2025-07-15 23:43:58',42,13,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(71,'2025-07-15 23:43:58',43,13,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(72,'2025-07-15 23:43:58',44,13,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(73,'2025-07-15 23:43:58',45,13,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(74,'2025-07-15 23:43:58',46,13,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(75,'2025-07-15 23:43:58',47,13,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(76,'2025-07-15 23:43:58',48,13,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(77,'2025-07-15 23:43:58',49,13,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(78,'2025-07-15 23:43:58',50,13,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(79,'2025-07-15 23:43:58',51,13,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(80,'2025-07-15 23:43:58',52,13,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(81,'2025-07-15 23:43:58',53,13,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(82,'2025-07-15 23:43:58',54,13,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(83,'2025-07-15 23:43:58',55,13,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(84,'2025-07-15 23:43:58',56,13,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(85,'2025-07-15 23:43:58',57,13,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(86,'2025-07-15 23:43:58',58,13,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(87,'2025-07-15 23:44:53',1,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(88,'2025-07-15 23:44:53',2,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(89,'2025-07-15 23:44:53',3,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(90,'2025-07-15 23:44:53',4,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(91,'2025-07-15 23:44:53',5,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(92,'2025-07-15 23:44:53',6,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(93,'2025-07-15 23:44:53',7,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(94,'2025-07-15 23:44:53',8,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(95,'2025-07-15 23:44:53',9,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(96,'2025-07-15 23:44:53',10,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(97,'2025-07-15 23:44:53',11,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(98,'2025-07-15 23:44:53',12,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(99,'2025-07-15 23:44:53',13,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(100,'2025-07-15 23:44:53',14,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(101,'2025-07-15 23:44:53',15,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(102,'2025-07-15 23:44:53',16,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(103,'2025-07-15 23:44:53',17,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(104,'2025-07-15 23:44:53',18,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(105,'2025-07-15 23:44:53',19,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(106,'2025-07-15 23:44:53',20,14,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(107,'2025-07-15 23:46:45',1,15,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(108,'2025-07-15 23:48:39',1,16,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(109,'2025-07-15 23:48:39',2,16,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(110,'2025-07-16 00:29:00',1,17,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(111,'2025-07-16 00:29:00',3,17,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(112,'2025-07-17 01:49:17',43,18,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(113,'2025-07-17 01:49:17',44,18,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(114,'2025-07-17 01:49:17',56,18,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(115,'2025-07-17 01:49:17',57,18,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(116,'2025-07-17 01:49:17',1,19,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(117,'2025-07-17 01:49:17',2,19,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(118,'2025-07-17 01:49:17',3,19,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(119,'2025-07-17 01:49:17',5,19,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(120,'2025-07-17 01:49:17',6,19,3,3000,'speak');
CREATE TABLE Evaluations (



    id INTEGER PRIMARY KEY AUTOINCREMENT,



    type TEXT CHECK (type IN ('Review', 'Pack', 'Selection', 'Test')) NOT NULL,



    start DATETIME NOT NULL,



    end DATETIME NOT NULL,



    size INTEGER NOT NULL



);
INSERT INTO "Evaluations" VALUES(1,'Pack','2024-06-27 10:00:00','2024-06-27 12:00:00',10);
INSERT INTO "Evaluations" VALUES(2,'Test','2024-06-28 09:00:00','2024-06-28 11:00:00',10);
INSERT INTO "Evaluations" VALUES(3,'Review','2024-06-29 13:00:00','2024-06-29 15:00:00',7);
INSERT INTO "Evaluations" VALUES(4,'Review','2025-06-23 20:27:00','2024-06-23 20:28:00',2);
INSERT INTO "Evaluations" VALUES(5,'Review','2025-06-23 20:27:00','2024-06-23 20:28:00',2);
INSERT INTO "Evaluations" VALUES(6,'Review','2025-06-23 20:27:00','2024-06-23 20:28:00',2);
INSERT INTO "Evaluations" VALUES(7,'Test','2025-07-09 04:14:43','2025-07-09 04:15:18',3);
INSERT INTO "Evaluations" VALUES(8,'Test','2025-07-09 04:27:44','2025-07-09 04:28:37',2);
INSERT INTO "Evaluations" VALUES(9,'Test','2025-07-09 04:59:07','2025-07-09 05:00:09',18);
INSERT INTO "Evaluations" VALUES(10,'Test','2025-07-09 05:01:20','2025-07-09 05:01:43',5);
INSERT INTO "Evaluations" VALUES(11,'Test','2025-07-16 02:38:19','2025-07-16 02:38:32',3);
INSERT INTO "Evaluations" VALUES(12,'Test','2025-07-16 02:42:09','2025-07-16 02:43:13',4);
INSERT INTO "Evaluations" VALUES(13,'Test','2025-07-16 02:43:39','2025-07-16 02:43:54',18);
INSERT INTO "Evaluations" VALUES(14,'Test','2025-07-16 02:44:42','2025-07-16 02:44:50',20);
INSERT INTO "Evaluations" VALUES(15,'Test','2025-07-16 02:46:33','2025-07-16 02:46:40',1);
INSERT INTO "Evaluations" VALUES(16,'Test','2025-07-16 02:48:25','2025-07-16 02:48:32',2);
INSERT INTO "Evaluations" VALUES(17,'Test','2025-07-16 03:28:46','2025-07-16 03:28:49',2);
INSERT INTO "Evaluations" VALUES(18,'Test','2025-07-17 04:46:41','2025-07-17 04:47:22',4);
INSERT INTO "Evaluations" VALUES(19,'Test','2025-07-17 04:47:37','2025-07-17 04:48:47',5);
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
INSERT INTO "Expressions" VALUES(41,'Чем ты занимаешься по жизни?','russian__what_do_you_do_for_a_living',2,21);
INSERT INTO "Expressions" VALUES(42,'Где ты вырос?','russian__where_did_you_grow_up',2,22);
INSERT INTO "Expressions" VALUES(43,'Тебе нравится твоя работа?','russian__do_you_enjoy_your_job',2,23);
INSERT INTO "Expressions" VALUES(44,'Какую музыку ты любишь?','russian__what_kind_of_music_do_you_like',2,24);
INSERT INTO "Expressions" VALUES(45,'У тебя есть братья или сестры?','russian__do_you_have_any_siblings',2,25);
INSERT INTO "Expressions" VALUES(46,'Тебе нравится путешествовать?','russian__do_you_enjoy_traveling',2,26);
INSERT INTO "Expressions" VALUES(47,'Какие у тебя хобби?','russian__what_are_your_hobbies',2,27);
INSERT INTO "Expressions" VALUES(48,'Ты любишь готовить?','russian__do_you_like_to_cook',2,28);
INSERT INTO "Expressions" VALUES(49,'Ты больше любишь кошек или собак?','russian__are_you_a_cat_or_dog_person',2,29);
INSERT INTO "Expressions" VALUES(50,'Какая твоя любимая еда?','russian__whats_your_favorite_type_of_food',2,30);
INSERT INTO "Expressions" VALUES(51,'Тебе нравится читать книги?','russian__do_you_enjoy_reading_books',2,31);
INSERT INTO "Expressions" VALUES(52,'Какая твоя работа мечты?','russian__whats_your_dream_job',2,32);
INSERT INTO "Expressions" VALUES(53,'Тебе нравится проводить время на улице?','russian__do_you_like_spending_time_outdoors',2,33);
INSERT INTO "Expressions" VALUES(54,'Какой у тебя знак зодиака?','russian__whats_your_zodiac_sign',2,34);
INSERT INTO "Expressions" VALUES(55,'Ты занимаешься каким-нибудь спортом?','russian__do_you_play_any_sports',2,35);
INSERT INTO "Expressions" VALUES(56,'Какой твой любимый фильм?','russian__whats_your_favorite_movie',2,36);
INSERT INTO "Expressions" VALUES(57,'Ты предпочитаешь кофе или чай?','russian__do_you_prefer_coffee_or_tea',2,37);
INSERT INTO "Expressions" VALUES(58,'Ты жаворонок или сова?','russian__are_you_a_morning_or_night_person',2,38);
INSERT INTO "Expressions" VALUES(59,'What do you do for a living?','english__what_do_you_do_for_a_living',4,21);
INSERT INTO "Expressions" VALUES(60,'Where did you grow up?','english__where_did_you_grow_up',4,22);
INSERT INTO "Expressions" VALUES(61,'Do you enjoy your job?','english__do_you_enjoy_your_job',4,23);
INSERT INTO "Expressions" VALUES(62,'What kind of music do you like?','english__what_kind_of_music_do_you_like',4,24);
INSERT INTO "Expressions" VALUES(63,'Do you have any siblings?','english__do_you_have_any_siblings',4,25);
INSERT INTO "Expressions" VALUES(64,'Do you enjoy traveling?','english__do_you_enjoy_traveling',4,26);
INSERT INTO "Expressions" VALUES(65,'What are your hobbies?','english__what_are_your_hobbies',4,27);
INSERT INTO "Expressions" VALUES(66,'Do you like to cook?','english__do_you_like_to_cook',4,28);
INSERT INTO "Expressions" VALUES(67,'Are you a cat or dog person?','english__are_you_a_cat_or_dog_person',4,29);
INSERT INTO "Expressions" VALUES(68,'What’s your favorite type of food?','english__whats_your_favorite_type_of_food',4,30);
INSERT INTO "Expressions" VALUES(69,'Do you enjoy reading books?','english__do_you_enjoy_reading_books',4,31);
INSERT INTO "Expressions" VALUES(70,'What’s your dream job?','english__whats_your_dream_job',4,32);
INSERT INTO "Expressions" VALUES(71,'Do you like spending time outdoors?','english__do_you_like_spending_time_outdoors',4,33);
INSERT INTO "Expressions" VALUES(72,'What’s your zodiac sign?','english__whats_your_zodiac_sign',4,34);
INSERT INTO "Expressions" VALUES(73,'Do you play any sports?','english__do_you_play_any_sports',4,35);
INSERT INTO "Expressions" VALUES(74,'What’s your favorite movie?','english__whats_your_favorite_movie',4,36);
INSERT INTO "Expressions" VALUES(75,'Do you prefer coffee or tea?','english__do_you_prefer_coffee_or_tea',4,37);
INSERT INTO "Expressions" VALUES(76,'Are you a morning or night person?','english__are_you_a_morning_or_night_person',4,38);
INSERT INTO "Expressions" VALUES(77,'Я программист и преподаватель.','russian__i_am_a_programmer_and_a_teacher',2,39);
INSERT INTO "Expressions" VALUES(78,'Я вырос в Лиссабоне.','russian__i_grew_up_in_lisbon',2,40);
INSERT INTO "Expressions" VALUES(79,'Да, я очень люблю свою работу.','russian__yes_i_really_love_my_job',2,41);
INSERT INTO "Expressions" VALUES(80,'Мне нравится хаус музыка.','russian__i_like_house_music',2,42);
INSERT INTO "Expressions" VALUES(81,'Да, у меня есть два брата.','russian__yes_i_have_two_brothers',2,43);
INSERT INTO "Expressions" VALUES(82,'Да, я люблю путешествовать.','russian__yes_i_love_traveling',2,44);
INSERT INTO "Expressions" VALUES(83,'Мне нравится гулять и природа.','russian__i_enjoy_walk_and_nature',2,45);
INSERT INTO "Expressions" VALUES(84,'Да, я люблю готовить.','russian__yes_i_like_to_cook',2,46);
INSERT INTO "Expressions" VALUES(85,'Я больше люблю собак.','russian__im_a_dog_person',2,47);
INSERT INTO "Expressions" VALUES(86,'Португальская еда — моя любимая.','russian__portuguese_food_is_my_favorite',2,48);
INSERT INTO "Expressions" VALUES(87,'Да, мне нравится читать художественную литературу.','russian__yes_i_enjoy_reading_fiction_books',2,49);
INSERT INTO "Expressions" VALUES(88,'Моя работа мечты — быть писателем.','russian__my_dream_job_is_to_be_a_writer',2,50);
INSERT INTO "Expressions" VALUES(89,'Да, я люблю проводить время на улице.','russian__yes_i_love_spending_time_outdoors',2,51);
INSERT INTO "Expressions" VALUES(90,'Я — Близнецы.','russian__im_a_gemini',2,52);
INSERT INTO "Expressions" VALUES(91,'Я регулярно играю в волейбол.','russian__i_play_volleyball_regularly',2,53);
INSERT INTO "Expressions" VALUES(92,'Мой любимый фильм — Джо Блэк.','russian__my_favorite_movie_is_joe_black',2,54);
INSERT INTO "Expressions" VALUES(93,'Я предпочитаю кофе чаю.','russian__i_prefer_coffee_over_tea',2,55);
INSERT INTO "Expressions" VALUES(94,'Я жаворонок.','russian__im_a_morning_person',2,56);
INSERT INTO "Expressions" VALUES(95,'I am a programmer and a teacher.','english__i_am_a_programmer_and_a_teacher',4,39);
INSERT INTO "Expressions" VALUES(96,'I grew up in Lisbon.','english__i_grew_up_in_lisbon',4,40);
INSERT INTO "Expressions" VALUES(97,'Yes, I really love my job.','english__yes_i_really_love_my_job',4,41);
INSERT INTO "Expressions" VALUES(98,'I like house music.','english__i_like_house_music',4,42);
INSERT INTO "Expressions" VALUES(99,'Yes, I have two brothers.','english__yes_i_have_two_brothers',4,43);
INSERT INTO "Expressions" VALUES(100,'Yes, I love traveling.','english__yes_i_love_traveling',4,44);
INSERT INTO "Expressions" VALUES(101,'I enjoy walk and nature.','english__i_enjoy_walk_and_nature',4,45);
INSERT INTO "Expressions" VALUES(102,'Yes, I like to cook.','english__yes_i_like_to_cook',4,46);
INSERT INTO "Expressions" VALUES(103,'I’m a dog person.','english__im_a_dog_person',4,47);
INSERT INTO "Expressions" VALUES(104,'Portuguese food is my favorite.','english__portuguese_food_is_my_favorite',4,48);
INSERT INTO "Expressions" VALUES(105,'Yes, I enjoy reading fiction books.','english__yes_i_enjoy_reading_fiction_books',4,49);
INSERT INTO "Expressions" VALUES(106,'My dream job is to be a writer.','english__my_dream_job_is_to_be_a_writer',4,50);
INSERT INTO "Expressions" VALUES(107,'Yes, I love spending time outdoors.','english__yes_i_love_spending_time_outdoors',4,51);
INSERT INTO "Expressions" VALUES(108,'I’m a Gemini.','english__im_a_gemini',4,52);
INSERT INTO "Expressions" VALUES(109,'I play volleyball regularly.','english__i_play_volleyball_regularly',4,53);
INSERT INTO "Expressions" VALUES(110,'My favorite movie is Joe Black.','english__my_favorite_movie_is_joe_black',4,54);
INSERT INTO "Expressions" VALUES(111,'I prefer coffee over tea.','english__i_prefer_coffee_over_tea',4,55);
INSERT INTO "Expressions" VALUES(112,'I’m a morning person.','english__im_a_morning_person',4,56);
INSERT INTO "Expressions" VALUES(113,'один','russian__one',2,57);
INSERT INTO "Expressions" VALUES(114,'два','russian__two',2,58);
INSERT INTO "Expressions" VALUES(115,'три','russian__three',2,59);
INSERT INTO "Expressions" VALUES(116,'четыре','russian__four',2,60);
INSERT INTO "Expressions" VALUES(117,'пять','russian__five',2,61);
INSERT INTO "Expressions" VALUES(118,'шесть','russian__six',2,62);
INSERT INTO "Expressions" VALUES(119,'семь','russian__seven',2,63);
INSERT INTO "Expressions" VALUES(120,'восемь','russian__eight',2,64);
INSERT INTO "Expressions" VALUES(121,'девять','russian__nine',2,65);
INSERT INTO "Expressions" VALUES(122,'десять','russian__ten',2,66);
INSERT INTO "Expressions" VALUES(123,'одиннадцать','russian__eleven',2,67);
INSERT INTO "Expressions" VALUES(124,'двенадцать','russian__twelve',2,68);
INSERT INTO "Expressions" VALUES(125,'тринадцать','russian__thirteen',2,69);
INSERT INTO "Expressions" VALUES(126,'четырнадцать','russian__fourteen',2,70);
INSERT INTO "Expressions" VALUES(127,'пятнадцать','russian__fifteen',2,71);
INSERT INTO "Expressions" VALUES(128,'шестнадцать','russian__sixteen',2,72);
INSERT INTO "Expressions" VALUES(129,'семнадцать','russian__seventeen',2,73);
INSERT INTO "Expressions" VALUES(130,'восемнадцать','russian__eighteen',2,74);
INSERT INTO "Expressions" VALUES(131,'девятнадцать','russian__nineteen',2,75);
INSERT INTO "Expressions" VALUES(132,'двадцать','russian__twenty',2,76);
INSERT INTO "Expressions" VALUES(133,'um','portuguese__one',1,57);
INSERT INTO "Expressions" VALUES(134,'dois','portuguese__two',1,58);
INSERT INTO "Expressions" VALUES(135,'três','portuguese__three',1,59);
INSERT INTO "Expressions" VALUES(136,'quatro','portuguese__four',1,60);
INSERT INTO "Expressions" VALUES(137,'cinco','portuguese__five',1,61);
INSERT INTO "Expressions" VALUES(138,'seis','portuguese__six',1,62);
INSERT INTO "Expressions" VALUES(139,'sete','portuguese__seven',1,63);
INSERT INTO "Expressions" VALUES(140,'oito','portuguese__eight',1,64);
INSERT INTO "Expressions" VALUES(141,'nove','portuguese__nine',1,65);
INSERT INTO "Expressions" VALUES(142,'dez','portuguese__ten',1,66);
INSERT INTO "Expressions" VALUES(143,'onze','portuguese__eleven',1,67);
INSERT INTO "Expressions" VALUES(144,'doze','portuguese__twelve',1,68);
INSERT INTO "Expressions" VALUES(145,'treze','portuguese__thirteen',1,69);
INSERT INTO "Expressions" VALUES(146,'catorze','portuguese__fourteen',1,70);
INSERT INTO "Expressions" VALUES(147,'quinze','portuguese__fifteen',1,71);
INSERT INTO "Expressions" VALUES(148,'dezesseis','portuguese__sixteen',1,72);
INSERT INTO "Expressions" VALUES(149,'dezessete','portuguese__seventeen',1,73);
INSERT INTO "Expressions" VALUES(150,'dezoito','portuguese__eighteen',1,74);
INSERT INTO "Expressions" VALUES(151,'dezenove','portuguese__nineteen',1,75);
INSERT INTO "Expressions" VALUES(152,'vinte','portuguese__twenty',1,76);
INSERT INTO "Expressions" VALUES(153,'настройки','russian__settings',2,77);
INSERT INTO "Expressions" VALUES(154,'запуск','russian__start',2,78);
INSERT INTO "Expressions" VALUES(155,'предпочтения','russian__preferences',2,79);
INSERT INTO "Expressions" VALUES(156,'домой','russian__home',2,80);
INSERT INTO "Expressions" VALUES(157,'экран блокировки','russian__lock_screen',2,81);
INSERT INTO "Expressions" VALUES(158,'уведомления','russian__notifications',2,82);
INSERT INTO "Expressions" VALUES(159,'конфиденциальность','russian__privacy',2,83);
INSERT INTO "Expressions" VALUES(160,'безопасность','russian__security',2,84);
INSERT INTO "Expressions" VALUES(161,'дисплей','russian__display',2,85);
INSERT INTO "Expressions" VALUES(162,'звук','russian__sound',2,86);
INSERT INTO "Expressions" VALUES(163,'хранилище','russian__storage',2,87);
INSERT INTO "Expressions" VALUES(164,'батарея','russian__battery',2,88);
INSERT INTO "Expressions" VALUES(165,'сеть','russian__network',2,89);
INSERT INTO "Expressions" VALUES(166,'вайфай','russian__wifi',2,90);
INSERT INTO "Expressions" VALUES(167,'блютус','russian__bluetooth',2,91);
INSERT INTO "Expressions" VALUES(168,'режим полёта','russian__airplane_mode',2,92);
INSERT INTO "Expressions" VALUES(169,'язык','russian__language',2,93);
INSERT INTO "Expressions" VALUES(170,'о телефоне','russian__about_phone',2,94);
INSERT INTO "Expressions" VALUES(171,'settings','english__settings',4,77);
INSERT INTO "Expressions" VALUES(172,'start','english__start',4,78);
INSERT INTO "Expressions" VALUES(173,'preferences','english__preferences',4,79);
INSERT INTO "Expressions" VALUES(174,'home','english__home',4,80);
INSERT INTO "Expressions" VALUES(175,'lock screen','english__lock_screen',4,81);
INSERT INTO "Expressions" VALUES(176,'notifications','english__notifications',4,82);
INSERT INTO "Expressions" VALUES(177,'privacy','english__privacy',4,83);
INSERT INTO "Expressions" VALUES(178,'security','english__security',4,84);
INSERT INTO "Expressions" VALUES(179,'display','english__display',4,85);
INSERT INTO "Expressions" VALUES(180,'sound','english__sound',4,86);
INSERT INTO "Expressions" VALUES(181,'storage','english__storage',4,87);
INSERT INTO "Expressions" VALUES(182,'battery','english__battery',4,88);
INSERT INTO "Expressions" VALUES(183,'network','english__network',4,89);
INSERT INTO "Expressions" VALUES(184,'wifi','english__wifi',4,90);
INSERT INTO "Expressions" VALUES(185,'bluetooth','english__bluetooth',4,91);
INSERT INTO "Expressions" VALUES(186,'airplane mode','english__airplane_mode',4,92);
INSERT INTO "Expressions" VALUES(187,'language','english__language',4,93);
INSERT INTO "Expressions" VALUES(188,'about phone','english__about_phone',4,94);
INSERT INTO "Expressions" VALUES(189,'припев','russian__chorus',2,95);
INSERT INTO "Expressions" VALUES(190,'мелодия','russian__melody',2,96);
INSERT INTO "Expressions" VALUES(191,'текст песни','russian__lyrics',2,97);
INSERT INTO "Expressions" VALUES(192,'ритм','russian__beat',2,98);
INSERT INTO "Expressions" VALUES(193,'гармония','russian__harmony',2,99);
INSERT INTO "Expressions" VALUES(194,'куплет','russian__verse',2,100);
INSERT INTO "Expressions" VALUES(195,'бридж','russian__bridge',2,101);
INSERT INTO "Expressions" VALUES(196,'ху́к','russian__hook',2,102);
INSERT INTO "Expressions" VALUES(197,'темп','russian__tempo',2,103);
INSERT INTO "Expressions" VALUES(198,'риф','russian__riff',2,104);
INSERT INTO "Expressions" VALUES(199,'жанр','russian__genre',2,105);
INSERT INTO "Expressions" VALUES(200,'дуэт','russian__duet',2,106);
INSERT INTO "Expressions" VALUES(201,'соло','russian__solo',2,107);
INSERT INTO "Expressions" VALUES(202,'инструментал','russian__instrumental',2,108);
INSERT INTO "Expressions" VALUES(203,'кавер','russian__cover',2,109);
INSERT INTO "Expressions" VALUES(204,'ремикс','russian__remix',2,110);
INSERT INTO "Expressions" VALUES(205,'альбом','russian__album',2,111);
INSERT INTO "Expressions" VALUES(206,'трек','russian__track',2,112);
INSERT INTO "Expressions" VALUES(207,'певец','russian__singer',2,113);
INSERT INTO "Expressions" VALUES(208,'группа','russian__band',2,114);
INSERT INTO "Expressions" VALUES(209,'хит','russian__hit',2,115);
INSERT INTO "Expressions" VALUES(210,'плейлист','russian__playlist',2,116);
INSERT INTO "Expressions" VALUES(211,'микрофон','russian__microphone',2,117);
INSERT INTO "Expressions" VALUES(212,'сцена','russian__stage',2,118);
INSERT INTO "Expressions" VALUES(213,'концерт','russian__concert',2,119);
INSERT INTO "Expressions" VALUES(214,'мотив','russian__tune',2,120);
INSERT INTO "Expressions" VALUES(215,'нота','russian__note',2,122);
INSERT INTO "Expressions" VALUES(216,'джем','russian__jam',2,123);
INSERT INTO "Expressions" VALUES(217,'запись','russian__record',2,124);
INSERT INTO "Expressions" VALUES(218,'chorus','english__chorus',4,95);
INSERT INTO "Expressions" VALUES(219,'melody','english__melody',4,96);
INSERT INTO "Expressions" VALUES(220,'lyrics','english__lyrics',4,97);
INSERT INTO "Expressions" VALUES(221,'beat','english__beat',4,98);
INSERT INTO "Expressions" VALUES(222,'harmony','english__harmony',4,99);
INSERT INTO "Expressions" VALUES(223,'verse','english__verse',4,100);
INSERT INTO "Expressions" VALUES(224,'bridge','english__bridge',4,101);
INSERT INTO "Expressions" VALUES(225,'hook','english__hook',4,102);
INSERT INTO "Expressions" VALUES(226,'tempo','english__tempo',4,103);
INSERT INTO "Expressions" VALUES(227,'riff','english__riff',4,104);
INSERT INTO "Expressions" VALUES(228,'genre','english__genre',4,105);
INSERT INTO "Expressions" VALUES(229,'duet','english__duet',4,106);
INSERT INTO "Expressions" VALUES(230,'solo','english__solo',4,107);
INSERT INTO "Expressions" VALUES(231,'instrumental','english__instrumental',4,108);
INSERT INTO "Expressions" VALUES(232,'cover','english__cover',4,109);
INSERT INTO "Expressions" VALUES(233,'remix','english__remix',4,110);
INSERT INTO "Expressions" VALUES(234,'album','english__album',4,111);
INSERT INTO "Expressions" VALUES(235,'track','english__track',4,112);
INSERT INTO "Expressions" VALUES(236,'singer','english__singer',4,113);
INSERT INTO "Expressions" VALUES(237,'band','english__band',4,114);
INSERT INTO "Expressions" VALUES(238,'hit','english__hit',4,115);
INSERT INTO "Expressions" VALUES(239,'playlist','english__playlist',4,116);
INSERT INTO "Expressions" VALUES(240,'microphone','english__microphone',4,117);
INSERT INTO "Expressions" VALUES(241,'stage','english__stage',4,118);
INSERT INTO "Expressions" VALUES(242,'concert','english__concert',4,119);
INSERT INTO "Expressions" VALUES(243,'tune','english__tune',4,120);
INSERT INTO "Expressions" VALUES(244,'rhythm','english__rhythm',4,121);
INSERT INTO "Expressions" VALUES(245,'note','english__note',4,122);
INSERT INTO "Expressions" VALUES(246,'jam','english__jam',4,123);
INSERT INTO "Expressions" VALUES(247,'record','english__record',4,124);
INSERT INTO "Expressions" VALUES(248,'меню','russian__menu',2,125);
INSERT INTO "Expressions" VALUES(249,'блюдо','russian__dish',2,126);
INSERT INTO "Expressions" VALUES(250,'приём пищи','russian__meal',2,127);
INSERT INTO "Expressions" VALUES(251,'официант','russian__waiter',2,128);
INSERT INTO "Expressions" VALUES(252,'счёт','russian__bill',2,129);
INSERT INTO "Expressions" VALUES(253,'чаевые','russian__tip',2,130);
INSERT INTO "Expressions" VALUES(254,'стол','russian__table',2,131);
INSERT INTO "Expressions" VALUES(255,'бронь','russian__reservation',2,132);
INSERT INTO "Expressions" VALUES(256,'шеф-повар','russian__chef',2,133);
INSERT INTO "Expressions" VALUES(257,'закуска','russian__appetizer',2,134);
INSERT INTO "Expressions" VALUES(258,'основное блюдо','russian__main_course',2,135);
INSERT INTO "Expressions" VALUES(259,'десерт','russian__dessert',2,136);
INSERT INTO "Expressions" VALUES(260,'напиток','russian__drink',2,137);
INSERT INTO "Expressions" VALUES(261,'стакан','russian__glass',2,138);
INSERT INTO "Expressions" VALUES(262,'вилка','russian__fork',2,139);
INSERT INTO "Expressions" VALUES(263,'нож','russian__knife',2,140);
INSERT INTO "Expressions" VALUES(264,'ложка','russian__spoon',2,141);
INSERT INTO "Expressions" VALUES(265,'салфетка','russian__napkin',2,142);
INSERT INTO "Expressions" VALUES(266,'тарелка','russian__plate',2,143);
INSERT INTO "Expressions" VALUES(267,'заказ','russian__order',2,144);
INSERT INTO "Expressions" VALUES(268,'обслуживать','russian__serve',2,145);
INSERT INTO "Expressions" VALUES(269,'готовить','russian__cook',2,146);
INSERT INTO "Expressions" VALUES(270,'голодный','russian__hungry',2,147);
INSERT INTO "Expressions" VALUES(271,'сытый','russian__full',2,148);
INSERT INTO "Expressions" VALUES(272,'вкусный','russian__delicious',2,149);
INSERT INTO "Expressions" VALUES(273,'menu','english__menu',4,125);
INSERT INTO "Expressions" VALUES(274,'dish','english__dish',4,126);
INSERT INTO "Expressions" VALUES(275,'meal','english__meal',4,127);
INSERT INTO "Expressions" VALUES(276,'waiter','english__waiter',4,128);
INSERT INTO "Expressions" VALUES(277,'bill','english__bill',4,129);
INSERT INTO "Expressions" VALUES(278,'tip','english__tip',4,130);
INSERT INTO "Expressions" VALUES(279,'table','english__table',4,131);
INSERT INTO "Expressions" VALUES(280,'reservation','english__reservation',4,132);
INSERT INTO "Expressions" VALUES(281,'chef','english__chef',4,133);
INSERT INTO "Expressions" VALUES(282,'appetizer','english__appetizer',4,134);
INSERT INTO "Expressions" VALUES(283,'main course','english__main_course',4,135);
INSERT INTO "Expressions" VALUES(284,'dessert','english__dessert',4,136);
INSERT INTO "Expressions" VALUES(285,'drink','english__drink',4,137);
INSERT INTO "Expressions" VALUES(286,'glass','english__glass',4,138);
INSERT INTO "Expressions" VALUES(287,'fork','english__fork',4,139);
INSERT INTO "Expressions" VALUES(288,'knife','english__knife',4,140);
INSERT INTO "Expressions" VALUES(289,'spoon','english__spoon',4,141);
INSERT INTO "Expressions" VALUES(290,'napkin','english__napkin',4,142);
INSERT INTO "Expressions" VALUES(291,'plate','english__plate',4,143);
INSERT INTO "Expressions" VALUES(292,'order','english__order',4,144);
INSERT INTO "Expressions" VALUES(293,'serve','english__serve',4,145);
INSERT INTO "Expressions" VALUES(294,'cook','english__cook',4,146);
INSERT INTO "Expressions" VALUES(295,'hungry','english__hungry',4,147);
INSERT INTO "Expressions" VALUES(296,'full','english__full',4,148);
INSERT INTO "Expressions" VALUES(297,'delicious','english__delicious',4,149);
CREATE TABLE LanguagePackWithTitle (



    id INTEGER PRIMARY KEY AUTOINCREMENT,



    pack_id INTEGER NOT NULL,



    language_id INTEGER NOT NULL,



    title TEXT NOT NULL,



    FOREIGN KEY (pack_id) REFERENCES Packs(id),



    FOREIGN KEY (language_id) REFERENCES Languages(id)



);
INSERT INTO "LanguagePackWithTitle" VALUES(1,1,4,'Possessive pronouns (2 words)');
INSERT INTO "LanguagePackWithTitle" VALUES(2,2,4,'First date common questions');
INSERT INTO "LanguagePackWithTitle" VALUES(3,3,4,'First date common answers');
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
INSERT INTO "MeaningPack" VALUES(39,3,39);
INSERT INTO "MeaningPack" VALUES(40,3,40);
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
INSERT INTO "MeaningPack" VALUES(57,4,57);
INSERT INTO "MeaningPack" VALUES(58,4,58);
INSERT INTO "MeaningPack" VALUES(59,4,59);
INSERT INTO "MeaningPack" VALUES(60,4,60);
INSERT INTO "MeaningPack" VALUES(61,4,61);
INSERT INTO "MeaningPack" VALUES(62,4,62);
INSERT INTO "MeaningPack" VALUES(63,4,63);
INSERT INTO "MeaningPack" VALUES(64,4,64);
INSERT INTO "MeaningPack" VALUES(65,4,65);
INSERT INTO "MeaningPack" VALUES(66,4,66);
INSERT INTO "MeaningPack" VALUES(67,4,67);
INSERT INTO "MeaningPack" VALUES(68,4,68);
INSERT INTO "MeaningPack" VALUES(69,4,69);
INSERT INTO "MeaningPack" VALUES(70,4,70);
INSERT INTO "MeaningPack" VALUES(71,4,71);
INSERT INTO "MeaningPack" VALUES(72,4,72);
INSERT INTO "MeaningPack" VALUES(73,4,73);
INSERT INTO "MeaningPack" VALUES(74,4,74);
INSERT INTO "MeaningPack" VALUES(75,4,75);
INSERT INTO "MeaningPack" VALUES(76,4,76);
INSERT INTO "MeaningPack" VALUES(77,5,77);
INSERT INTO "MeaningPack" VALUES(78,5,78);
INSERT INTO "MeaningPack" VALUES(79,5,79);
INSERT INTO "MeaningPack" VALUES(80,5,80);
INSERT INTO "MeaningPack" VALUES(81,5,81);
INSERT INTO "MeaningPack" VALUES(82,5,82);
INSERT INTO "MeaningPack" VALUES(83,5,83);
INSERT INTO "MeaningPack" VALUES(84,5,84);
INSERT INTO "MeaningPack" VALUES(85,5,85);
INSERT INTO "MeaningPack" VALUES(86,5,86);
INSERT INTO "MeaningPack" VALUES(87,5,87);
INSERT INTO "MeaningPack" VALUES(88,5,88);
INSERT INTO "MeaningPack" VALUES(89,5,89);
INSERT INTO "MeaningPack" VALUES(90,5,90);
INSERT INTO "MeaningPack" VALUES(91,5,91);
INSERT INTO "MeaningPack" VALUES(92,5,92);
INSERT INTO "MeaningPack" VALUES(93,5,93);
INSERT INTO "MeaningPack" VALUES(94,5,94);
INSERT INTO "MeaningPack" VALUES(95,6,95);
INSERT INTO "MeaningPack" VALUES(96,6,96);
INSERT INTO "MeaningPack" VALUES(97,6,97);
INSERT INTO "MeaningPack" VALUES(98,6,98);
INSERT INTO "MeaningPack" VALUES(99,6,99);
INSERT INTO "MeaningPack" VALUES(100,6,100);
INSERT INTO "MeaningPack" VALUES(101,6,101);
INSERT INTO "MeaningPack" VALUES(102,6,102);
INSERT INTO "MeaningPack" VALUES(103,6,103);
INSERT INTO "MeaningPack" VALUES(104,6,104);
INSERT INTO "MeaningPack" VALUES(105,6,105);
INSERT INTO "MeaningPack" VALUES(106,6,106);
INSERT INTO "MeaningPack" VALUES(107,6,107);
INSERT INTO "MeaningPack" VALUES(108,6,108);
INSERT INTO "MeaningPack" VALUES(109,6,109);
INSERT INTO "MeaningPack" VALUES(110,6,110);
INSERT INTO "MeaningPack" VALUES(111,6,111);
INSERT INTO "MeaningPack" VALUES(112,6,112);
INSERT INTO "MeaningPack" VALUES(113,6,113);
INSERT INTO "MeaningPack" VALUES(114,6,114);
INSERT INTO "MeaningPack" VALUES(115,6,115);
INSERT INTO "MeaningPack" VALUES(116,6,116);
INSERT INTO "MeaningPack" VALUES(117,6,117);
INSERT INTO "MeaningPack" VALUES(118,6,118);
INSERT INTO "MeaningPack" VALUES(119,6,119);
INSERT INTO "MeaningPack" VALUES(120,6,120);
INSERT INTO "MeaningPack" VALUES(121,6,121);
INSERT INTO "MeaningPack" VALUES(122,6,122);
INSERT INTO "MeaningPack" VALUES(123,6,123);
INSERT INTO "MeaningPack" VALUES(124,6,124);
INSERT INTO "MeaningPack" VALUES(125,7,125);
INSERT INTO "MeaningPack" VALUES(126,7,126);
INSERT INTO "MeaningPack" VALUES(127,7,127);
INSERT INTO "MeaningPack" VALUES(128,7,128);
INSERT INTO "MeaningPack" VALUES(129,7,129);
INSERT INTO "MeaningPack" VALUES(130,7,130);
INSERT INTO "MeaningPack" VALUES(131,7,131);
INSERT INTO "MeaningPack" VALUES(132,7,132);
INSERT INTO "MeaningPack" VALUES(133,7,133);
INSERT INTO "MeaningPack" VALUES(134,7,134);
INSERT INTO "MeaningPack" VALUES(135,7,135);
INSERT INTO "MeaningPack" VALUES(136,7,136);
INSERT INTO "MeaningPack" VALUES(137,7,137);
INSERT INTO "MeaningPack" VALUES(138,7,138);
INSERT INTO "MeaningPack" VALUES(139,7,139);
INSERT INTO "MeaningPack" VALUES(140,7,140);
INSERT INTO "MeaningPack" VALUES(141,7,141);
INSERT INTO "MeaningPack" VALUES(142,7,142);
INSERT INTO "MeaningPack" VALUES(143,7,143);
INSERT INTO "MeaningPack" VALUES(144,7,144);
INSERT INTO "MeaningPack" VALUES(145,7,145);
INSERT INTO "MeaningPack" VALUES(146,7,146);
INSERT INTO "MeaningPack" VALUES(147,7,147);
INSERT INTO "MeaningPack" VALUES(148,7,148);
INSERT INTO "MeaningPack" VALUES(149,7,149);
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
INSERT INTO "Meanings" VALUES(21,'What do you do for a living?');
INSERT INTO "Meanings" VALUES(22,'Where did you grow up?');
INSERT INTO "Meanings" VALUES(23,'Do you enjoy your job?');
INSERT INTO "Meanings" VALUES(24,'What kind of music do you like?');
INSERT INTO "Meanings" VALUES(25,'Do you have any siblings?');
INSERT INTO "Meanings" VALUES(26,'Do you enjoy traveling?');
INSERT INTO "Meanings" VALUES(27,'What are your hobbies?');
INSERT INTO "Meanings" VALUES(28,'Do you like to cook?');
INSERT INTO "Meanings" VALUES(29,'Are you a cat or dog person?');
INSERT INTO "Meanings" VALUES(30,'What’s your favorite type of food?');
INSERT INTO "Meanings" VALUES(31,'Do you enjoy reading books?');
INSERT INTO "Meanings" VALUES(32,'What’s your dream job?');
INSERT INTO "Meanings" VALUES(33,'Do you like spending time outdoors?');
INSERT INTO "Meanings" VALUES(34,'What’s your zodiac sign?');
INSERT INTO "Meanings" VALUES(35,'Do you play any sports?');
INSERT INTO "Meanings" VALUES(36,'What’s your favorite movie?');
INSERT INTO "Meanings" VALUES(37,'Do you prefer coffee or tea?');
INSERT INTO "Meanings" VALUES(38,'Are you a morning or night person?');
INSERT INTO "Meanings" VALUES(39,'I am a programmer and a teacher.');
INSERT INTO "Meanings" VALUES(40,'I grew up in Lisbon.');
INSERT INTO "Meanings" VALUES(41,'Yes, I really love my job.');
INSERT INTO "Meanings" VALUES(42,'I like house music.');
INSERT INTO "Meanings" VALUES(43,'Yes, I have two brothers.');
INSERT INTO "Meanings" VALUES(44,'Yes, I love traveling.');
INSERT INTO "Meanings" VALUES(45,'I enjoy walk and nature.');
INSERT INTO "Meanings" VALUES(46,'Yes, I like to cook.');
INSERT INTO "Meanings" VALUES(47,'I’m a dog person.');
INSERT INTO "Meanings" VALUES(48,'Portuguese food is my favorite.');
INSERT INTO "Meanings" VALUES(49,'Yes, I enjoy reading fiction books.');
INSERT INTO "Meanings" VALUES(50,'My dream job is to be a writer.');
INSERT INTO "Meanings" VALUES(51,'Yes, I love spending time outdoors.');
INSERT INTO "Meanings" VALUES(52,'I’m a Gemini.');
INSERT INTO "Meanings" VALUES(53,'I play volleyball regularly.');
INSERT INTO "Meanings" VALUES(54,'My favorite movie is Joe Black.');
INSERT INTO "Meanings" VALUES(55,'I prefer coffee over tea.');
INSERT INTO "Meanings" VALUES(56,'I’m a morning person.');
INSERT INTO "Meanings" VALUES(57,'one');
INSERT INTO "Meanings" VALUES(58,'two');
INSERT INTO "Meanings" VALUES(59,'three');
INSERT INTO "Meanings" VALUES(60,'four');
INSERT INTO "Meanings" VALUES(61,'five');
INSERT INTO "Meanings" VALUES(62,'six');
INSERT INTO "Meanings" VALUES(63,'seven');
INSERT INTO "Meanings" VALUES(64,'eight');
INSERT INTO "Meanings" VALUES(65,'nine');
INSERT INTO "Meanings" VALUES(66,'ten');
INSERT INTO "Meanings" VALUES(67,'eleven');
INSERT INTO "Meanings" VALUES(68,'twelve');
INSERT INTO "Meanings" VALUES(69,'thirteen');
INSERT INTO "Meanings" VALUES(70,'fourteen');
INSERT INTO "Meanings" VALUES(71,'fifteen');
INSERT INTO "Meanings" VALUES(72,'sixteen');
INSERT INTO "Meanings" VALUES(73,'seventeen');
INSERT INTO "Meanings" VALUES(74,'eighteen');
INSERT INTO "Meanings" VALUES(75,'nineteen');
INSERT INTO "Meanings" VALUES(76,'twenty');
INSERT INTO "Meanings" VALUES(77,'settings');
INSERT INTO "Meanings" VALUES(78,'start');
INSERT INTO "Meanings" VALUES(79,'preferences');
INSERT INTO "Meanings" VALUES(80,'home');
INSERT INTO "Meanings" VALUES(81,'lock screen');
INSERT INTO "Meanings" VALUES(82,'notifications');
INSERT INTO "Meanings" VALUES(83,'privacy');
INSERT INTO "Meanings" VALUES(84,'security');
INSERT INTO "Meanings" VALUES(85,'display');
INSERT INTO "Meanings" VALUES(86,'sound');
INSERT INTO "Meanings" VALUES(87,'storage');
INSERT INTO "Meanings" VALUES(88,'battery');
INSERT INTO "Meanings" VALUES(89,'network');
INSERT INTO "Meanings" VALUES(90,'wifi');
INSERT INTO "Meanings" VALUES(91,'bluetooth');
INSERT INTO "Meanings" VALUES(92,'airplane mode');
INSERT INTO "Meanings" VALUES(93,'language');
INSERT INTO "Meanings" VALUES(94,'about phone');
INSERT INTO "Meanings" VALUES(95,'chorus');
INSERT INTO "Meanings" VALUES(96,'melody');
INSERT INTO "Meanings" VALUES(97,'lyrics');
INSERT INTO "Meanings" VALUES(98,'beat');
INSERT INTO "Meanings" VALUES(99,'harmony');
INSERT INTO "Meanings" VALUES(100,'verse');
INSERT INTO "Meanings" VALUES(101,'bridge');
INSERT INTO "Meanings" VALUES(102,'hook');
INSERT INTO "Meanings" VALUES(103,'tempo');
INSERT INTO "Meanings" VALUES(104,'riff');
INSERT INTO "Meanings" VALUES(105,'genre');
INSERT INTO "Meanings" VALUES(106,'duet');
INSERT INTO "Meanings" VALUES(107,'solo');
INSERT INTO "Meanings" VALUES(108,'instrumental');
INSERT INTO "Meanings" VALUES(109,'cover');
INSERT INTO "Meanings" VALUES(110,'remix');
INSERT INTO "Meanings" VALUES(111,'album');
INSERT INTO "Meanings" VALUES(112,'track');
INSERT INTO "Meanings" VALUES(113,'singer');
INSERT INTO "Meanings" VALUES(114,'band');
INSERT INTO "Meanings" VALUES(115,'hit');
INSERT INTO "Meanings" VALUES(116,'playlist');
INSERT INTO "Meanings" VALUES(117,'microphone');
INSERT INTO "Meanings" VALUES(118,'stage');
INSERT INTO "Meanings" VALUES(119,'concert');
INSERT INTO "Meanings" VALUES(120,'tune');
INSERT INTO "Meanings" VALUES(121,'rhythm');
INSERT INTO "Meanings" VALUES(122,'note');
INSERT INTO "Meanings" VALUES(123,'jam');
INSERT INTO "Meanings" VALUES(124,'record');
INSERT INTO "Meanings" VALUES(125,'menu');
INSERT INTO "Meanings" VALUES(126,'dish');
INSERT INTO "Meanings" VALUES(127,'meal');
INSERT INTO "Meanings" VALUES(128,'waiter');
INSERT INTO "Meanings" VALUES(129,'bill');
INSERT INTO "Meanings" VALUES(130,'tip');
INSERT INTO "Meanings" VALUES(131,'table');
INSERT INTO "Meanings" VALUES(132,'reservation');
INSERT INTO "Meanings" VALUES(133,'chef');
INSERT INTO "Meanings" VALUES(134,'appetizer');
INSERT INTO "Meanings" VALUES(135,'main course');
INSERT INTO "Meanings" VALUES(136,'dessert');
INSERT INTO "Meanings" VALUES(137,'drink');
INSERT INTO "Meanings" VALUES(138,'glass');
INSERT INTO "Meanings" VALUES(139,'fork');
INSERT INTO "Meanings" VALUES(140,'knife');
INSERT INTO "Meanings" VALUES(141,'spoon');
INSERT INTO "Meanings" VALUES(142,'napkin');
INSERT INTO "Meanings" VALUES(143,'plate');
INSERT INTO "Meanings" VALUES(144,'order');
INSERT INTO "Meanings" VALUES(145,'serve');
INSERT INTO "Meanings" VALUES(146,'cook');
INSERT INTO "Meanings" VALUES(147,'hungry');
INSERT INTO "Meanings" VALUES(148,'full');
INSERT INTO "Meanings" VALUES(149,'delicious');
CREATE TABLE Packs (



    id INTEGER PRIMARY KEY AUTOINCREMENT,



    descriptionEng TEXT NOT NULL



);
INSERT INTO "Packs" VALUES(1,'possessive pronouns, with noun');
INSERT INTO "Packs" VALUES(2,'first date common questions');
INSERT INTO "Packs" VALUES(3,'first date common answers');
INSERT INTO "Packs" VALUES(4,'numbers 1 to 20');
INSERT INTO "Packs" VALUES(5,'common phone OS UI like settings, start, preferences...');
INSERT INTO "Packs" VALUES(6,'used usually in a music bingo');
INSERT INTO "Packs" VALUES(7,'used on restaurante');
CREATE TABLE Phonetics (



    id INTEGER PRIMARY KEY AUTOINCREMENT,



    text TEXT NOT NULL,



    expression_id INTEGER NOT NULL,



    FOREIGN KEY (expression_id) REFERENCES Expressions(id)



);
INSERT INTO "Phonetics" VALUES(1,'muii domioi',1);
INSERT INTO "Phonetics" VALUES(2,'tva-ia ma-chi-na',2);
INSERT INTO "Phonetics" VALUES(3,'ru phonetic exp3',3);
INSERT INTO "Phonetics" VALUES(4,'daaa daaaa
',7);
INSERT INTO "Phonetics" VALUES(5,'idea what is the best time to plant grass ',9);
INSERT INTO "Phonetics" VALUES(6,'ievo tsviet',5);
INSERT INTO "Phonetics" VALUES(7,'mui nottttiiii',8);
INSERT INTO "Phonetics" VALUES(8,'high
',41);
INSERT INTO "Phonetics" VALUES(9,'film see',56);
INSERT INTO "Phonetics" VALUES(10,'igraiu',91);
INSERT INTO "Phonetics" VALUES(11,'love to travel ',82);
INSERT INTO "Phonetics" VALUES(12,'kakaia iedaa',50);
INSERT INTO "Phonetics" VALUES(13,'pripef',189);
INSERT INTO "Phonetics" VALUES(14,'miɫodiia',190);
INSERT INTO "Phonetics" VALUES(15,'tekst pesni',191);
INSERT INTO "Phonetics" VALUES(16,'ritm',192);
INSERT INTO "Phonetics" VALUES(17,'garmoniia',193);
INSERT INTO "Phonetics" VALUES(18,'kupliet',194);
INSERT INTO "Phonetics" VALUES(19,'brit͡sh',195);
INSERT INTO "Phonetics" VALUES(20,'rruk',196);
INSERT INTO "Phonetics" VALUES(21,'tɛmp',197);
INSERT INTO "Phonetics" VALUES(22,'rif',198);
INSERT INTO "Phonetics" VALUES(23,'ianr',199);
INSERT INTO "Phonetics" VALUES(24,'duɛt',200);
INSERT INTO "Phonetics" VALUES(25,'sola',201);
INSERT INTO "Phonetics" VALUES(26,'instrʊmintaɫ',202);
INSERT INTO "Phonetics" VALUES(27,'kavir',203);
INSERT INTO "Phonetics" VALUES(28,'rimiks',204);
INSERT INTO "Phonetics" VALUES(29,'albom',205);
INSERT INTO "Phonetics" VALUES(30,'trɛk',206);
INSERT INTO "Phonetics" VALUES(31,'piviets',207);
INSERT INTO "Phonetics" VALUES(32,'grupa',208);
INSERT INTO "Phonetics" VALUES(33,'rrit',209);
INSERT INTO "Phonetics" VALUES(34,'pleilist',210);
INSERT INTO "Phonetics" VALUES(35,'mikrafon',211);
INSERT INTO "Phonetics" VALUES(36,'stsɛna',212);
INSERT INTO "Phonetics" VALUES(37,'kantsɛrt',213);
INSERT INTO "Phonetics" VALUES(38,'matif',214);
INSERT INTO "Phonetics" VALUES(39,'nota',215);
INSERT INTO "Phonetics" VALUES(40,'d͡iɛm',216);
INSERT INTO "Phonetics" VALUES(41,'zapis',217);
INSERT INTO "Phonetics" VALUES(42,'minu',248);
INSERT INTO "Phonetics" VALUES(43,'blʊda',249);
INSERT INTO "Phonetics" VALUES(44,'priiom pichtchi',250);
INSERT INTO "Phonetics" VALUES(45,'afits#iant',251);
INSERT INTO "Phonetics" VALUES(46,'chtchɵt',252);
INSERT INTO "Phonetics" VALUES(47,'t͡shiiv#ii̯',253);
INSERT INTO "Phonetics" VALUES(48,'stol',254);
INSERT INTO "Phonetics" VALUES(49,'bron',255);
INSERT INTO "Phonetics" VALUES(50,'chɛf povar',256);
INSERT INTO "Phonetics" VALUES(51,'zakuska',257);
INSERT INTO "Phonetics" VALUES(52,'asnavnoia blʊda',258);
INSERT INTO "Phonetics" VALUES(53,'disert',259);
INSERT INTO "Phonetics" VALUES(54,'napitak',260);
INSERT INTO "Phonetics" VALUES(55,'stakan',261);
INSERT INTO "Phonetics" VALUES(56,'vilka',262);
INSERT INTO "Phonetics" VALUES(57,'noch',263);
INSERT INTO "Phonetics" VALUES(58,'lochka',264);
INSERT INTO "Phonetics" VALUES(59,'salfietka',265);
INSERT INTO "Phonetics" VALUES(60,'tarelka',266);
INSERT INTO "Phonetics" VALUES(61,'zakas',267);
INSERT INTO "Phonetics" VALUES(62,'apslui#ivat',268);
INSERT INTO "Phonetics" VALUES(63,'gatovit',269);
INSERT INTO "Phonetics" VALUES(64,'galotn#ii',270);
INSERT INTO "Phonetics" VALUES(65,'s#it#ii',271);
INSERT INTO "Phonetics" VALUES(66,'fkusn#ii',272);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('EvaluationExpression',120);
INSERT INTO "sqlite_sequence" VALUES('Evaluations',19);
INSERT INTO "sqlite_sequence" VALUES('Expressions',297);
INSERT INTO "sqlite_sequence" VALUES('LanguagePackWithTitle',3);
INSERT INTO "sqlite_sequence" VALUES('Languages',4);
INSERT INTO "sqlite_sequence" VALUES('MeaningPack',149);
INSERT INTO "sqlite_sequence" VALUES('Meanings',149);
INSERT INTO "sqlite_sequence" VALUES('Packs',7);
INSERT INTO "sqlite_sequence" VALUES('Phonetics',66);
COMMIT;
