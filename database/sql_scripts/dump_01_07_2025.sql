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

INSERT INTO "EvaluationExpression" VALUES(11,'2025-06-23 13:23:07',80,2,3,10,'speak');
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

INSERT INTO "EvaluationExpression" VALUES(28,'2025-06-23 18:32:55',80,4,4,7,'speak');
INSERT INTO "EvaluationExpression" VALUES(29,'2025-06-23 18:32:55',85,4,3,16,'read');

INSERT INTO "EvaluationExpression" VALUES(30,'2025-06-23 18:32:55',80,5,3,8,'speak');
INSERT INTO "EvaluationExpression" VALUES(31,'2025-06-23 18:32:55',85,5,3,14,'read');

INSERT INTO "EvaluationExpression" VALUES(32,'2025-06-23 18:32:55',80,6,4,9,'listen');
INSERT INTO "EvaluationExpression" VALUES(33,'2025-06-23 18:32:55',85,6,3,12,'read');

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
CREATE TABLE Packs (



    id INTEGER PRIMARY KEY AUTOINCREMENT,



    descriptionEng TEXT NOT NULL



);
INSERT INTO "Packs" VALUES(1,'possessive pronouns, with noun');
INSERT INTO "Packs" VALUES(2,'first date common questions');
INSERT INTO "Packs" VALUES(3,'first date common answers');
CREATE TABLE Phonetics (



    id INTEGER PRIMARY KEY AUTOINCREMENT,



    text TEXT NOT NULL,



    expression_id INTEGER NOT NULL,



    FOREIGN KEY (expression_id) REFERENCES Expressions(id)



);
INSERT INTO "Phonetics" VALUES(1,'ru phonetic exp1',1);
INSERT INTO "Phonetics" VALUES(2,'ru phonetic exp2',2);
INSERT INTO "Phonetics" VALUES(3,'ru phonetic exp3',3);

COMMIT;
