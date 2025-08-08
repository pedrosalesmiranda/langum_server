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
INSERT INTO "EvaluationExpression" VALUES(1,'2025-08-07 03:35:56',15,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(2,'2025-08-07 03:35:56',6,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(3,'2025-08-07 03:35:56',7,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(4,'2025-08-07 03:35:56',28,1,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(5,'2025-08-07 03:35:56',17,1,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(6,'2025-08-07 03:35:56',26,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(7,'2025-08-07 03:35:56',10,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(8,'2025-08-07 03:35:56',5,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(9,'2025-08-07 03:35:56',16,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(10,'2025-08-07 03:35:56',25,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(11,'2025-08-07 03:35:56',30,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(12,'2025-08-07 03:35:56',4,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(13,'2025-08-07 03:35:56',22,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(14,'2025-08-07 03:35:56',23,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(15,'2025-08-07 03:35:56',14,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(16,'2025-08-07 03:35:56',27,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(17,'2025-08-07 03:35:56',1,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(18,'2025-08-07 03:35:56',13,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(19,'2025-08-07 03:35:56',2,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(20,'2025-08-07 03:35:56',8,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(21,'2025-08-07 03:35:56',32,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(22,'2025-08-07 03:35:56',29,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(23,'2025-08-07 03:35:56',20,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(24,'2025-08-07 03:35:56',19,1,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(25,'2025-08-07 03:35:56',31,1,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(26,'2025-08-07 03:35:56',24,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(27,'2025-08-07 03:35:56',3,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(28,'2025-08-07 03:35:56',12,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(29,'2025-08-07 03:35:56',18,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(30,'2025-08-07 03:35:56',11,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(31,'2025-08-07 03:35:56',9,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(32,'2025-08-07 03:35:56',21,1,3,3000,'speak');
CREATE TABLE Evaluations (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    type TEXT CHECK (type IN ('Review', 'Pack', 'Selection', 'Test')) NOT NULL,







    start DATETIME NOT NULL,







    end DATETIME NOT NULL,







    size INTEGER NOT NULL







);
INSERT INTO "Evaluations" VALUES(1,'Test','2025-08-06 19:21:14','2025-08-06 19:22:17',32);
CREATE TABLE Expressions (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    text TEXT NOT NULL,







    sound_filename TEXT NOT NULL,







    language_id INTEGER NOT NULL,







    meaning_id INTEGER NOT NULL,







    FOREIGN KEY (language_id) REFERENCES Languages(id),







    FOREIGN KEY (meaning_id) REFERENCES Meanings(id)







);
INSERT INTO "Expressions" VALUES(1,'мой план','russian__my_plan',2,1);
INSERT INTO "Expressions" VALUES(2,'моя мечта','russian__my_dream',2,2);
INSERT INTO "Expressions" VALUES(3,'моё решение','russian__my_decision',2,3);
INSERT INTO "Expressions" VALUES(4,'мои действия','russian__my_actions',2,4);
INSERT INTO "Expressions" VALUES(5,'твой план','russian__your_plan',2,5);
INSERT INTO "Expressions" VALUES(6,'твоя мечта','russian__your_dream',2,6);
INSERT INTO "Expressions" VALUES(7,'твоё решение','russian__your_decision',2,7);
INSERT INTO "Expressions" VALUES(8,'твои мечты','russian__your_dreams',2,8);
INSERT INTO "Expressions" VALUES(9,'его план','russian__his_plan',2,9);
INSERT INTO "Expressions" VALUES(10,'его мечта','russian__his_dream',2,10);
INSERT INTO "Expressions" VALUES(11,'его решение','russian__his_decision',2,11);
INSERT INTO "Expressions" VALUES(12,'его планы','russian__his_plans',2,12);
INSERT INTO "Expressions" VALUES(13,'её план','russian__her_plan',2,13);
INSERT INTO "Expressions" VALUES(14,'её мечта','russian__her_dream',2,14);
INSERT INTO "Expressions" VALUES(15,'её решение','russian__her_decision',2,15);
INSERT INTO "Expressions" VALUES(16,'её планы','russian__her_plans',2,16);
INSERT INTO "Expressions" VALUES(17,'его цвет','russian__its_color',2,17);
INSERT INTO "Expressions" VALUES(18,'его цена','russian__its_price',2,18);
INSERT INTO "Expressions" VALUES(19,'его окно','russian__its_window',2,19);
INSERT INTO "Expressions" VALUES(20,'его цвета','russian__its_colors',2,20);
INSERT INTO "Expressions" VALUES(21,'наш план','russian__our_plan',2,21);
INSERT INTO "Expressions" VALUES(22,'наша мечта','russian__our_dream',2,22);
INSERT INTO "Expressions" VALUES(23,'наше решение','russian__our_decision',2,23);
INSERT INTO "Expressions" VALUES(24,'наши действия','russian__our_actions',2,24);
INSERT INTO "Expressions" VALUES(25,'ваш план','russian__your_plan_formal',2,25);
INSERT INTO "Expressions" VALUES(26,'ваша мечта','russian__your_dream_formal',2,26);
INSERT INTO "Expressions" VALUES(27,'ваше решение','russian__your_decision_formal',2,27);
INSERT INTO "Expressions" VALUES(28,'ваши решения','russian__your_decisions_formal',2,28);
INSERT INTO "Expressions" VALUES(29,'их план','russian__their_plan',2,29);
INSERT INTO "Expressions" VALUES(30,'их мечта','russian__their_dream',2,30);
INSERT INTO "Expressions" VALUES(31,'их решение','russian__their_decision',2,31);
INSERT INTO "Expressions" VALUES(32,'их мечты','russian__their_dreams',2,32);
INSERT INTO "Expressions" VALUES(33,'my plan','english__my_plan',4,1);
INSERT INTO "Expressions" VALUES(34,'my dream','english__my_dream',4,2);
INSERT INTO "Expressions" VALUES(35,'my decision','english__my_decision',4,3);
INSERT INTO "Expressions" VALUES(36,'my actions','english__my_actions',4,4);
INSERT INTO "Expressions" VALUES(37,'your plan','english__your_plan',4,5);
INSERT INTO "Expressions" VALUES(38,'your dream','english__your_dream',4,6);
INSERT INTO "Expressions" VALUES(39,'your decision','english__your_decision',4,7);
INSERT INTO "Expressions" VALUES(40,'your dreams','english__your_dreams',4,8);
INSERT INTO "Expressions" VALUES(41,'his plan','english__his_plan',4,9);
INSERT INTO "Expressions" VALUES(42,'his dream','english__his_dream',4,10);
INSERT INTO "Expressions" VALUES(43,'his decision','english__his_decision',4,11);
INSERT INTO "Expressions" VALUES(44,'his plans','english__his_plans',4,12);
INSERT INTO "Expressions" VALUES(45,'her plan','english__her_plan',4,13);
INSERT INTO "Expressions" VALUES(46,'her dream','english__her_dream',4,14);
INSERT INTO "Expressions" VALUES(47,'her decision','english__her_decision',4,15);
INSERT INTO "Expressions" VALUES(48,'her plans','english__her_plans',4,16);
INSERT INTO "Expressions" VALUES(49,'its color','english__its_color',4,17);
INSERT INTO "Expressions" VALUES(50,'its price','english__its_price',4,18);
INSERT INTO "Expressions" VALUES(51,'its window','english__its_window',4,19);
INSERT INTO "Expressions" VALUES(52,'its colors','english__its_colors',4,20);
INSERT INTO "Expressions" VALUES(53,'our plan','english__our_plan',4,21);
INSERT INTO "Expressions" VALUES(54,'our dream','english__our_dream',4,22);
INSERT INTO "Expressions" VALUES(55,'our decision','english__our_decision',4,23);
INSERT INTO "Expressions" VALUES(56,'our actions','english__our_actions',4,24);
INSERT INTO "Expressions" VALUES(57,'your plan (formal)','english__your_plan_formal',4,25);
INSERT INTO "Expressions" VALUES(58,'your dream (formal)','english__your_dream_formal',4,26);
INSERT INTO "Expressions" VALUES(59,'your decision (formal)','english__your_decision_formal',4,27);
INSERT INTO "Expressions" VALUES(60,'your decisions (formal)','english__your_decisions_formal',4,28);
INSERT INTO "Expressions" VALUES(61,'their plan','english__their_plan',4,29);
INSERT INTO "Expressions" VALUES(62,'their dream','english__their_dream',4,30);
INSERT INTO "Expressions" VALUES(63,'their decision','english__their_decision',4,31);
INSERT INTO "Expressions" VALUES(64,'their dreams','english__their_dreams',4,32);
INSERT INTO "Expressions" VALUES(65,'ноль','russian__zero',2,33);
INSERT INTO "Expressions" VALUES(66,'один','russian__one',2,34);
INSERT INTO "Expressions" VALUES(67,'два','russian__two',2,35);
INSERT INTO "Expressions" VALUES(68,'три','russian__three',2,36);
INSERT INTO "Expressions" VALUES(69,'четыре','russian__four',2,37);
INSERT INTO "Expressions" VALUES(70,'пять','russian__five',2,38);
INSERT INTO "Expressions" VALUES(71,'шесть','russian__six',2,39);
INSERT INTO "Expressions" VALUES(72,'семь','russian__seven',2,40);
INSERT INTO "Expressions" VALUES(73,'восемь','russian__eight',2,41);
INSERT INTO "Expressions" VALUES(74,'девять','russian__nine',2,42);
INSERT INTO "Expressions" VALUES(75,'десять','russian__ten',2,43);
INSERT INTO "Expressions" VALUES(76,'одиннадцать','russian__eleven',2,44);
INSERT INTO "Expressions" VALUES(77,'двенадцать','russian__twelve',2,45);
INSERT INTO "Expressions" VALUES(78,'тринадцать','russian__thirteen',2,46);
INSERT INTO "Expressions" VALUES(79,'четырнадцать','russian__fourteen',2,47);
INSERT INTO "Expressions" VALUES(80,'пятнадцать','russian__fifteen',2,48);
INSERT INTO "Expressions" VALUES(81,'шестнадцать','russian__sixteen',2,49);
INSERT INTO "Expressions" VALUES(82,'семнадцать','russian__seventeen',2,50);
INSERT INTO "Expressions" VALUES(83,'восемнадцать','russian__eighteen',2,51);
INSERT INTO "Expressions" VALUES(84,'девятнадцать','russian__nineteen',2,52);
INSERT INTO "Expressions" VALUES(85,'двадцать','russian__twenty',2,53);
INSERT INTO "Expressions" VALUES(86,'тридцать','russian__thirty',2,54);
INSERT INTO "Expressions" VALUES(87,'сорок','russian__forty',2,55);
INSERT INTO "Expressions" VALUES(88,'пятьдесят','russian__fifty',2,56);
INSERT INTO "Expressions" VALUES(89,'шестьдесят','russian__sixty',2,57);
INSERT INTO "Expressions" VALUES(90,'семьдесят','russian__seventy',2,58);
INSERT INTO "Expressions" VALUES(91,'восемьдесят','russian__eighty',2,59);
INSERT INTO "Expressions" VALUES(92,'девяносто','russian__ninty',2,60);
INSERT INTO "Expressions" VALUES(93,'сто','russian__hundred',2,61);
INSERT INTO "Expressions" VALUES(94,'двести','russian__two_hundred',2,62);
INSERT INTO "Expressions" VALUES(95,'триста','russian__three_hundred',2,63);
INSERT INTO "Expressions" VALUES(96,'четыреста','russian__four_hundred',2,64);
INSERT INTO "Expressions" VALUES(97,'пятьсот','russian__five_hundred',2,65);
INSERT INTO "Expressions" VALUES(98,'шестьсот','russian__six_hundred',2,66);
INSERT INTO "Expressions" VALUES(99,'семьсот','russian__seven_hundred',2,67);
INSERT INTO "Expressions" VALUES(100,'восемьсот','russian__eight_hundred',2,68);
INSERT INTO "Expressions" VALUES(101,'девятьсот','russian__nine_hundred',2,69);
INSERT INTO "Expressions" VALUES(102,'тысяча','russian__thousand',2,70);
INSERT INTO "Expressions" VALUES(103,'миллион','russian__million',2,71);
INSERT INTO "Expressions" VALUES(104,'миллиард','russian__billion',2,72);
INSERT INTO "Expressions" VALUES(105,'триллион','russian__trillion',2,73);
INSERT INTO "Expressions" VALUES(106,'zero','english__zero',4,33);
INSERT INTO "Expressions" VALUES(107,'one','english__one',4,34);
INSERT INTO "Expressions" VALUES(108,'two','english__two',4,35);
INSERT INTO "Expressions" VALUES(109,'three','english__three',4,36);
INSERT INTO "Expressions" VALUES(110,'four','english__four',4,37);
INSERT INTO "Expressions" VALUES(111,'five','english__five',4,38);
INSERT INTO "Expressions" VALUES(112,'six','english__six',4,39);
INSERT INTO "Expressions" VALUES(113,'seven','english__seven',4,40);
INSERT INTO "Expressions" VALUES(114,'eight','english__eight',4,41);
INSERT INTO "Expressions" VALUES(115,'nine','english__nine',4,42);
INSERT INTO "Expressions" VALUES(116,'ten','english__ten',4,43);
INSERT INTO "Expressions" VALUES(117,'eleven','english__eleven',4,44);
INSERT INTO "Expressions" VALUES(118,'twelve','english__twelve',4,45);
INSERT INTO "Expressions" VALUES(119,'thirteen','english__thirteen',4,46);
INSERT INTO "Expressions" VALUES(120,'fourteen','english__fourteen',4,47);
INSERT INTO "Expressions" VALUES(121,'fifteen','english__fifteen',4,48);
INSERT INTO "Expressions" VALUES(122,'sixteen','english__sixteen',4,49);
INSERT INTO "Expressions" VALUES(123,'seventeen','english__seventeen',4,50);
INSERT INTO "Expressions" VALUES(124,'eighteen','english__eighteen',4,51);
INSERT INTO "Expressions" VALUES(125,'nineteen','english__nineteen',4,52);
INSERT INTO "Expressions" VALUES(126,'twenty','english__twenty',4,53);
INSERT INTO "Expressions" VALUES(127,'thirty','english__thirty',4,54);
INSERT INTO "Expressions" VALUES(128,'forty','english__forty',4,55);
INSERT INTO "Expressions" VALUES(129,'fifty','english__fifty',4,56);
INSERT INTO "Expressions" VALUES(130,'sixty','english__sixty',4,57);
INSERT INTO "Expressions" VALUES(131,'seventy','english__seventy',4,58);
INSERT INTO "Expressions" VALUES(132,'eighty','english__eighty',4,59);
INSERT INTO "Expressions" VALUES(133,'ninety','english__ninty',4,60);
INSERT INTO "Expressions" VALUES(134,'hundred','english__hundred',4,61);
INSERT INTO "Expressions" VALUES(135,'two hundred','english__two_hundred',4,62);
INSERT INTO "Expressions" VALUES(136,'three hundred','english__three_hundred',4,63);
INSERT INTO "Expressions" VALUES(137,'four hundred','english__four_hundred',4,64);
INSERT INTO "Expressions" VALUES(138,'five hundred','english__five_hundred',4,65);
INSERT INTO "Expressions" VALUES(139,'six hundred','english__six_hundred',4,66);
INSERT INTO "Expressions" VALUES(140,'seven hundred','english__seven_hundred',4,67);
INSERT INTO "Expressions" VALUES(141,'eight hundred','english__eight_hundred',4,68);
INSERT INTO "Expressions" VALUES(142,'nine hundred','english__nine_hundred',4,69);
INSERT INTO "Expressions" VALUES(143,'thousand','english__thousand',4,70);
INSERT INTO "Expressions" VALUES(144,'million','english__million',4,71);
INSERT INTO "Expressions" VALUES(145,'billion','english__billion',4,72);
INSERT INTO "Expressions" VALUES(146,'trillion','english__trillion',4,73);
INSERT INTO "Expressions" VALUES(147,'мужчина','russian__man',2,74);
INSERT INTO "Expressions" VALUES(148,'женщина','russian__woman',2,75);
INSERT INTO "Expressions" VALUES(149,'мальчик','russian__boy',2,76);
INSERT INTO "Expressions" VALUES(150,'девочка','russian__girl',2,77);
INSERT INTO "Expressions" VALUES(151,'подросток','russian__teenager',2,78);
INSERT INTO "Expressions" VALUES(152,'ребёнок','russian__child',2,79);
INSERT INTO "Expressions" VALUES(153,'младенец','russian__baby',2,80);
INSERT INTO "Expressions" VALUES(154,'человек','russian__person',2,81);
INSERT INTO "Expressions" VALUES(155,'лица (формально)','russian__persons_formal',2,82);
INSERT INTO "Expressions" VALUES(156,'люди','russian__people',2,83);
INSERT INTO "Expressions" VALUES(157,'муж','russian__husband',2,84);
INSERT INTO "Expressions" VALUES(158,'жена','russian__wife',2,85);
INSERT INTO "Expressions" VALUES(159,'сын','russian__son',2,86);
INSERT INTO "Expressions" VALUES(160,'дочь','russian__daughter',2,87);
INSERT INTO "Expressions" VALUES(161,'брат','russian__brother',2,88);
INSERT INTO "Expressions" VALUES(162,'сестра','russian__sister',2,89);
INSERT INTO "Expressions" VALUES(163,'отец','russian__father',2,90);
INSERT INTO "Expressions" VALUES(164,'мать','russian__mother',2,91);
INSERT INTO "Expressions" VALUES(165,'дедушка','russian__grandfather',2,92);
INSERT INTO "Expressions" VALUES(166,'бабушка','russian__grandmother',2,93);
INSERT INTO "Expressions" VALUES(167,'дядя','russian__uncle',2,94);
INSERT INTO "Expressions" VALUES(168,'тётя','russian__auntie',2,95);
INSERT INTO "Expressions" VALUES(169,'племянник','russian__nephew',2,96);
INSERT INTO "Expressions" VALUES(170,'племянница','russian__niece',2,97);
INSERT INTO "Expressions" VALUES(171,'man','english__man',4,74);
INSERT INTO "Expressions" VALUES(172,'woman','english__woman',4,75);
INSERT INTO "Expressions" VALUES(173,'boy','english__boy',4,76);
INSERT INTO "Expressions" VALUES(174,'girl','english__girl',4,77);
INSERT INTO "Expressions" VALUES(175,'teenager','english__teenager',4,78);
INSERT INTO "Expressions" VALUES(176,'child','english__child',4,79);
INSERT INTO "Expressions" VALUES(177,'baby','english__baby',4,80);
INSERT INTO "Expressions" VALUES(178,'person','english__person',4,81);
INSERT INTO "Expressions" VALUES(179,'persons (formal)','english__persons_formal',4,82);
INSERT INTO "Expressions" VALUES(180,'people','english__people',4,83);
INSERT INTO "Expressions" VALUES(181,'husband','english__husband',4,84);
INSERT INTO "Expressions" VALUES(182,'wife','english__wife',4,85);
INSERT INTO "Expressions" VALUES(183,'son','english__son',4,86);
INSERT INTO "Expressions" VALUES(184,'daughter','english__daughter',4,87);
INSERT INTO "Expressions" VALUES(185,'brother','english__brother',4,88);
INSERT INTO "Expressions" VALUES(186,'sister','english__sister',4,89);
INSERT INTO "Expressions" VALUES(187,'father','english__father',4,90);
INSERT INTO "Expressions" VALUES(188,'mother','english__mother',4,91);
INSERT INTO "Expressions" VALUES(189,'grandfather','english__grandfather',4,92);
INSERT INTO "Expressions" VALUES(190,'grandmother','english__grandmother',4,93);
INSERT INTO "Expressions" VALUES(191,'uncle','english__uncle',4,94);
INSERT INTO "Expressions" VALUES(192,'auntie','english__auntie',4,95);
INSERT INTO "Expressions" VALUES(193,'nephew','english__nephew',4,96);
INSERT INTO "Expressions" VALUES(194,'niece','english__niece',4,97);
CREATE TABLE LanguagePackWithTitle (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    pack_id INTEGER NOT NULL,







    language_id INTEGER NOT NULL,







    title TEXT NOT NULL,







    FOREIGN KEY (pack_id) REFERENCES Packs(id),







    FOREIGN KEY (language_id) REFERENCES Languages(id)







);
INSERT INTO "LanguagePackWithTitle" VALUES(1,1,4,'possessive pronouns');
INSERT INTO "LanguagePackWithTitle" VALUES(2,2,4,'numbers: 0 to trillion');
INSERT INTO "LanguagePackWithTitle" VALUES(3,3,4,'family and people');
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
INSERT INTO "MeaningPack" VALUES(21,1,21);
INSERT INTO "MeaningPack" VALUES(22,1,22);
INSERT INTO "MeaningPack" VALUES(23,1,23);
INSERT INTO "MeaningPack" VALUES(24,1,24);
INSERT INTO "MeaningPack" VALUES(25,1,25);
INSERT INTO "MeaningPack" VALUES(26,1,26);
INSERT INTO "MeaningPack" VALUES(27,1,27);
INSERT INTO "MeaningPack" VALUES(28,1,28);
INSERT INTO "MeaningPack" VALUES(29,1,29);
INSERT INTO "MeaningPack" VALUES(30,1,30);
INSERT INTO "MeaningPack" VALUES(31,1,31);
INSERT INTO "MeaningPack" VALUES(32,1,32);
INSERT INTO "MeaningPack" VALUES(33,2,33);
INSERT INTO "MeaningPack" VALUES(34,2,34);
INSERT INTO "MeaningPack" VALUES(35,2,35);
INSERT INTO "MeaningPack" VALUES(36,2,36);
INSERT INTO "MeaningPack" VALUES(37,2,37);
INSERT INTO "MeaningPack" VALUES(38,2,38);
INSERT INTO "MeaningPack" VALUES(39,2,39);
INSERT INTO "MeaningPack" VALUES(40,2,40);
INSERT INTO "MeaningPack" VALUES(41,2,41);
INSERT INTO "MeaningPack" VALUES(42,2,42);
INSERT INTO "MeaningPack" VALUES(43,2,43);
INSERT INTO "MeaningPack" VALUES(44,2,44);
INSERT INTO "MeaningPack" VALUES(45,2,45);
INSERT INTO "MeaningPack" VALUES(46,2,46);
INSERT INTO "MeaningPack" VALUES(47,2,47);
INSERT INTO "MeaningPack" VALUES(48,2,48);
INSERT INTO "MeaningPack" VALUES(49,2,49);
INSERT INTO "MeaningPack" VALUES(50,2,50);
INSERT INTO "MeaningPack" VALUES(51,2,51);
INSERT INTO "MeaningPack" VALUES(52,2,52);
INSERT INTO "MeaningPack" VALUES(53,2,53);
INSERT INTO "MeaningPack" VALUES(54,2,54);
INSERT INTO "MeaningPack" VALUES(55,2,55);
INSERT INTO "MeaningPack" VALUES(56,2,56);
INSERT INTO "MeaningPack" VALUES(57,2,57);
INSERT INTO "MeaningPack" VALUES(58,2,58);
INSERT INTO "MeaningPack" VALUES(59,2,59);
INSERT INTO "MeaningPack" VALUES(60,2,60);
INSERT INTO "MeaningPack" VALUES(61,2,61);
INSERT INTO "MeaningPack" VALUES(62,2,62);
INSERT INTO "MeaningPack" VALUES(63,2,63);
INSERT INTO "MeaningPack" VALUES(64,2,64);
INSERT INTO "MeaningPack" VALUES(65,2,65);
INSERT INTO "MeaningPack" VALUES(66,2,66);
INSERT INTO "MeaningPack" VALUES(67,2,67);
INSERT INTO "MeaningPack" VALUES(68,2,68);
INSERT INTO "MeaningPack" VALUES(69,2,69);
INSERT INTO "MeaningPack" VALUES(70,2,70);
INSERT INTO "MeaningPack" VALUES(71,2,71);
INSERT INTO "MeaningPack" VALUES(72,2,72);
INSERT INTO "MeaningPack" VALUES(73,2,73);
INSERT INTO "MeaningPack" VALUES(74,3,74);
INSERT INTO "MeaningPack" VALUES(75,3,75);
INSERT INTO "MeaningPack" VALUES(76,3,76);
INSERT INTO "MeaningPack" VALUES(77,3,77);
INSERT INTO "MeaningPack" VALUES(78,3,78);
INSERT INTO "MeaningPack" VALUES(79,3,79);
INSERT INTO "MeaningPack" VALUES(80,3,80);
INSERT INTO "MeaningPack" VALUES(81,3,81);
INSERT INTO "MeaningPack" VALUES(82,3,82);
INSERT INTO "MeaningPack" VALUES(83,3,83);
INSERT INTO "MeaningPack" VALUES(84,3,84);
INSERT INTO "MeaningPack" VALUES(85,3,85);
INSERT INTO "MeaningPack" VALUES(86,3,86);
INSERT INTO "MeaningPack" VALUES(87,3,87);
INSERT INTO "MeaningPack" VALUES(88,3,88);
INSERT INTO "MeaningPack" VALUES(89,3,89);
INSERT INTO "MeaningPack" VALUES(90,3,90);
INSERT INTO "MeaningPack" VALUES(91,3,91);
INSERT INTO "MeaningPack" VALUES(92,3,92);
INSERT INTO "MeaningPack" VALUES(93,3,93);
INSERT INTO "MeaningPack" VALUES(94,3,94);
INSERT INTO "MeaningPack" VALUES(95,3,95);
INSERT INTO "MeaningPack" VALUES(96,3,96);
INSERT INTO "MeaningPack" VALUES(97,3,97);
CREATE TABLE Meanings (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    meaningEng TEXT NOT NULL







);
INSERT INTO "Meanings" VALUES(1,'my plan');
INSERT INTO "Meanings" VALUES(2,'my dream');
INSERT INTO "Meanings" VALUES(3,'my decision');
INSERT INTO "Meanings" VALUES(4,'my actions');
INSERT INTO "Meanings" VALUES(5,'your plan');
INSERT INTO "Meanings" VALUES(6,'your dream');
INSERT INTO "Meanings" VALUES(7,'your decision');
INSERT INTO "Meanings" VALUES(8,'your dreams');
INSERT INTO "Meanings" VALUES(9,'his plan');
INSERT INTO "Meanings" VALUES(10,'his dream');
INSERT INTO "Meanings" VALUES(11,'his decision');
INSERT INTO "Meanings" VALUES(12,'his plans');
INSERT INTO "Meanings" VALUES(13,'her plan');
INSERT INTO "Meanings" VALUES(14,'her dream');
INSERT INTO "Meanings" VALUES(15,'her decision');
INSERT INTO "Meanings" VALUES(16,'her plans');
INSERT INTO "Meanings" VALUES(17,'its color');
INSERT INTO "Meanings" VALUES(18,'its price');
INSERT INTO "Meanings" VALUES(19,'its window');
INSERT INTO "Meanings" VALUES(20,'its colors');
INSERT INTO "Meanings" VALUES(21,'our plan');
INSERT INTO "Meanings" VALUES(22,'our dream');
INSERT INTO "Meanings" VALUES(23,'our decision');
INSERT INTO "Meanings" VALUES(24,'our actions');
INSERT INTO "Meanings" VALUES(25,'your plan (formal)');
INSERT INTO "Meanings" VALUES(26,'your dream (formal)');
INSERT INTO "Meanings" VALUES(27,'your decision (formal)');
INSERT INTO "Meanings" VALUES(28,'your decisions (formal)');
INSERT INTO "Meanings" VALUES(29,'their plan');
INSERT INTO "Meanings" VALUES(30,'their dream');
INSERT INTO "Meanings" VALUES(31,'their decision');
INSERT INTO "Meanings" VALUES(32,'their dreams');
INSERT INTO "Meanings" VALUES(33,'zero');
INSERT INTO "Meanings" VALUES(34,'one');
INSERT INTO "Meanings" VALUES(35,'two');
INSERT INTO "Meanings" VALUES(36,'three');
INSERT INTO "Meanings" VALUES(37,'four');
INSERT INTO "Meanings" VALUES(38,'five');
INSERT INTO "Meanings" VALUES(39,'six');
INSERT INTO "Meanings" VALUES(40,'seven');
INSERT INTO "Meanings" VALUES(41,'eight');
INSERT INTO "Meanings" VALUES(42,'nine');
INSERT INTO "Meanings" VALUES(43,'ten');
INSERT INTO "Meanings" VALUES(44,'eleven');
INSERT INTO "Meanings" VALUES(45,'twelve');
INSERT INTO "Meanings" VALUES(46,'thirteen');
INSERT INTO "Meanings" VALUES(47,'fourteen');
INSERT INTO "Meanings" VALUES(48,'fifteen');
INSERT INTO "Meanings" VALUES(49,'sixteen');
INSERT INTO "Meanings" VALUES(50,'seventeen');
INSERT INTO "Meanings" VALUES(51,'eighteen');
INSERT INTO "Meanings" VALUES(52,'nineteen');
INSERT INTO "Meanings" VALUES(53,'twenty');
INSERT INTO "Meanings" VALUES(54,'thirty');
INSERT INTO "Meanings" VALUES(55,'forty');
INSERT INTO "Meanings" VALUES(56,'fifty');
INSERT INTO "Meanings" VALUES(57,'sixty');
INSERT INTO "Meanings" VALUES(58,'seventy');
INSERT INTO "Meanings" VALUES(59,'eighty');
INSERT INTO "Meanings" VALUES(60,'ninty');
INSERT INTO "Meanings" VALUES(61,'hundred');
INSERT INTO "Meanings" VALUES(62,'two hundred');
INSERT INTO "Meanings" VALUES(63,'three hundred');
INSERT INTO "Meanings" VALUES(64,'four hundred');
INSERT INTO "Meanings" VALUES(65,'five hundred');
INSERT INTO "Meanings" VALUES(66,'six hundred');
INSERT INTO "Meanings" VALUES(67,'seven hundred');
INSERT INTO "Meanings" VALUES(68,'eight hundred');
INSERT INTO "Meanings" VALUES(69,'nine hundred');
INSERT INTO "Meanings" VALUES(70,'thousand');
INSERT INTO "Meanings" VALUES(71,'million');
INSERT INTO "Meanings" VALUES(72,'billion');
INSERT INTO "Meanings" VALUES(73,'trillion');
INSERT INTO "Meanings" VALUES(74,'man');
INSERT INTO "Meanings" VALUES(75,'woman');
INSERT INTO "Meanings" VALUES(76,'boy');
INSERT INTO "Meanings" VALUES(77,'girl');
INSERT INTO "Meanings" VALUES(78,'teenager');
INSERT INTO "Meanings" VALUES(79,'child');
INSERT INTO "Meanings" VALUES(80,'baby');
INSERT INTO "Meanings" VALUES(81,'person');
INSERT INTO "Meanings" VALUES(82,'persons (formal)');
INSERT INTO "Meanings" VALUES(83,'people');
INSERT INTO "Meanings" VALUES(84,'husband');
INSERT INTO "Meanings" VALUES(85,'wife');
INSERT INTO "Meanings" VALUES(86,'son');
INSERT INTO "Meanings" VALUES(87,'daughter');
INSERT INTO "Meanings" VALUES(88,'brother');
INSERT INTO "Meanings" VALUES(89,'sister');
INSERT INTO "Meanings" VALUES(90,'father');
INSERT INTO "Meanings" VALUES(91,'mother');
INSERT INTO "Meanings" VALUES(92,'grandfather');
INSERT INTO "Meanings" VALUES(93,'grandmother');
INSERT INTO "Meanings" VALUES(94,'uncle');
INSERT INTO "Meanings" VALUES(95,'auntie');
INSERT INTO "Meanings" VALUES(96,'nephew');
INSERT INTO "Meanings" VALUES(97,'niece');
CREATE TABLE Packs (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    descriptionEng TEXT NOT NULL







);
INSERT INTO "Packs" VALUES(1,'possessive pronouns, with noun (2 words)');
INSERT INTO "Packs" VALUES(2,'numbers: 0 to trillion');
INSERT INTO "Packs" VALUES(3,'family and people');
CREATE TABLE Phonetics (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    text TEXT NOT NULL,







    expression_id INTEGER NOT NULL,







    FOREIGN KEY (expression_id) REFERENCES Expressions(id)







);
INSERT INTO "Phonetics" VALUES(1,'mo-uj pl-án',1);
INSERT INTO "Phonetics" VALUES(2,'majá mitchtá',2);
INSERT INTO "Phonetics" VALUES(3,'maiou richenьije',3);
INSERT INTO "Phonetics" VALUES(4,'mai diéjctvia',4);
INSERT INTO "Phonetics" VALUES(5,'tv-ój p-l-án',5);
INSERT INTO "Phonetics" VALUES(6,'tvajá mitchtá',6);
INSERT INTO "Phonetics" VALUES(7,'tvaiou richenьije',7);
INSERT INTO "Phonetics" VALUES(8,'tvai mit͡chti',8);
INSERT INTO "Phonetics" VALUES(9,'iévou plán',9);
INSERT INTO "Phonetics" VALUES(10,'iévou mitchtá',10);
INSERT INTO "Phonetics" VALUES(11,'iévou richenьije',11);
INSERT INTO "Phonetics" VALUES(12,'iévou pláni',12);
INSERT INTO "Phonetics" VALUES(13,'iéiou plán',13);
INSERT INTO "Phonetics" VALUES(14,'iéiou mitchtá',14);
INSERT INTO "Phonetics" VALUES(15,'iéiou richenьije',15);
INSERT INTO "Phonetics" VALUES(16,'iéiou pláni',16);
INSERT INTO "Phonetics" VALUES(17,'iévou tcviét',17);
INSERT INTO "Phonetics" VALUES(18,'iévou tsiná',18);
INSERT INTO "Phonetics" VALUES(19,'iévou aknou',19);
INSERT INTO "Phonetics" VALUES(20,'iévou tcvitá',20);
INSERT INTO "Phonetics" VALUES(21,'nách plán',21);
INSERT INTO "Phonetics" VALUES(22,'nácha mitchtá',22);
INSERT INTO "Phonetics" VALUES(23,'náchi richenьije',23);
INSERT INTO "Phonetics" VALUES(24,'náchi diéjctvia',24);
INSERT INTO "Phonetics" VALUES(25,'vách plán',25);
INSERT INTO "Phonetics" VALUES(26,'vácha mitchtá',26);
INSERT INTO "Phonetics" VALUES(27,'váchi richenьije',27);
INSERT INTO "Phonetics" VALUES(28,'váchi richenьija',28);
INSERT INTO "Phonetics" VALUES(29,'ix plán',29);
INSERT INTO "Phonetics" VALUES(30,'ix mi-tchtá',30);
INSERT INTO "Phonetics" VALUES(31,'ix richenьije',31);
INSERT INTO "Phonetics" VALUES(32,'ix mitchti',32);
INSERT INTO "Phonetics" VALUES(33,'noulь',65);
INSERT INTO "Phonetics" VALUES(34,'adin',66);
INSERT INTO "Phonetics" VALUES(35,'dvá',67);
INSERT INTO "Phonetics" VALUES(36,'tri',68);
INSERT INTO "Phonetics" VALUES(37,'tɕitiri',69);
INSERT INTO "Phonetics" VALUES(38,'pʲétь',70);
INSERT INTO "Phonetics" VALUES(39,'checʲtь',71);
INSERT INTO "Phonetics" VALUES(40,'ciémʲ',72);
INSERT INTO "Phonetics" VALUES(41,'voucimʲ',73);
INSERT INTO "Phonetics" VALUES(42,'dié-vitь',74);
INSERT INTO "Phonetics" VALUES(43,'dié-citь',75);
INSERT INTO "Phonetics" VALUES(44,'adi-na-tsatь',76);
INSERT INTO "Phonetics" VALUES(45,'dvinátsatь',77);
INSERT INTO "Phonetics" VALUES(46,'trinátsatь',78);
INSERT INTO "Phonetics" VALUES(47,'tɕitirnatsatь',79);
INSERT INTO "Phonetics" VALUES(48,'pitnátsatь',80);
INSERT INTO "Phonetics" VALUES(49,'chicnátsatь',81);
INSERT INTO "Phonetics" VALUES(50,'cimnátsatь',82);
INSERT INTO "Phonetics" VALUES(51,'vacimnátsatь',83);
INSERT INTO "Phonetics" VALUES(52,'divitnátsatь',84);
INSERT INTO "Phonetics" VALUES(53,'dvátsatь',85);
INSERT INTO "Phonetics" VALUES(54,'tritsatь',86);
INSERT INTO "Phonetics" VALUES(55,'courak',87);
INSERT INTO "Phonetics" VALUES(56,'pidʲcʲét',88);
INSERT INTO "Phonetics" VALUES(57,'chidʲcʲét',89);
INSERT INTO "Phonetics" VALUES(58,'cimʲdicʲét',90);
INSERT INTO "Phonetics" VALUES(59,'voucimʲdicit',91);
INSERT INTO "Phonetics" VALUES(60,'divinoucta',92);
INSERT INTO "Phonetics" VALUES(61,'ctou',93);
INSERT INTO "Phonetics" VALUES(62,'dviécʲtьi',94);
INSERT INTO "Phonetics" VALUES(63,'tricʲta',95);
INSERT INTO "Phonetics" VALUES(64,'tɕitriécʲta',96);
INSERT INTO "Phonetics" VALUES(65,'pitьcout',97);
INSERT INTO "Phonetics" VALUES(66,'chicʲcout',98);
INSERT INTO "Phonetics" VALUES(67,'cimʲcout',99);
INSERT INTO "Phonetics" VALUES(68,'voucimʲcout',100);
INSERT INTO "Phonetics" VALUES(69,'divitьcout',101);
INSERT INTO "Phonetics" VALUES(70,'ticitcha',102);
INSERT INTO "Phonetics" VALUES(71,'milьioun',103);
INSERT INTO "Phonetics" VALUES(72,'milьiárt',104);
INSERT INTO "Phonetics" VALUES(73,'trilьioun',105);
INSERT INTO "Phonetics" VALUES(74,'muchɕina',147);
INSERT INTO "Phonetics" VALUES(75,'jénchina',148);
INSERT INTO "Phonetics" VALUES(76,'málьtchik',149);
INSERT INTO "Phonetics" VALUES(77,'dʲévatchka',150);
INSERT INTO "Phonetics" VALUES(78,'padractouk',151);
INSERT INTO "Phonetics" VALUES(79,'ribʲounak',152);
INSERT INTO "Phonetics" VALUES(80,'mladʲénьits',153);
INSERT INTO "Phonetics" VALUES(81,'tchilaviék',154);
INSERT INTO "Phonetics" VALUES(82,'lьitcá farmálьna',155);
INSERT INTO "Phonetics" VALUES(83,'lьudi',156);
INSERT INTO "Phonetics" VALUES(84,'much',157);
INSERT INTO "Phonetics" VALUES(85,'jiná',158);
INSERT INTO "Phonetics" VALUES(86,'cin',159);
INSERT INTO "Phonetics" VALUES(87,'doutch',160);
INSERT INTO "Phonetics" VALUES(88,'brát',161);
INSERT INTO "Phonetics" VALUES(89,'cictrá',162);
INSERT INTO "Phonetics" VALUES(90,'atьetc',163);
INSERT INTO "Phonetics" VALUES(91,'mátь',164);
INSERT INTO "Phonetics" VALUES(92,'diéduchka',165);
INSERT INTO "Phonetics" VALUES(93,'bábuchka',166);
INSERT INTO "Phonetics" VALUES(94,'diádia',167);
INSERT INTO "Phonetics" VALUES(95,'tьoutьa',168);
INSERT INTO "Phonetics" VALUES(96,'plьimiánnьik',169);
INSERT INTO "Phonetics" VALUES(97,'plьimiánnьitsa',170);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('Languages',4);
INSERT INTO "sqlite_sequence" VALUES('Packs',3);
INSERT INTO "sqlite_sequence" VALUES('Meanings',97);
INSERT INTO "sqlite_sequence" VALUES('MeaningPack',97);
INSERT INTO "sqlite_sequence" VALUES('Expressions',194);
INSERT INTO "sqlite_sequence" VALUES('Phonetics',97);
INSERT INTO "sqlite_sequence" VALUES('LanguagePackWithTitle',3);
INSERT INTO "sqlite_sequence" VALUES('Evaluations',1);
INSERT INTO "sqlite_sequence" VALUES('EvaluationExpression',32);
COMMIT;
