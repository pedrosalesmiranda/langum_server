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
INSERT INTO "EvaluationExpression" VALUES(1,'2025-08-12 20:22:18',152,1,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(2,'2025-08-12 20:22:18',148,1,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(3,'2025-08-12 20:22:18',149,1,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(4,'2025-08-12 20:22:18',161,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(5,'2025-08-12 20:22:18',164,1,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(6,'2025-08-12 20:22:18',169,1,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(7,'2025-08-12 20:22:18',162,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(8,'2025-08-12 20:22:18',160,1,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(9,'2025-08-12 20:22:18',170,1,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(10,'2025-08-12 20:22:18',153,1,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(11,'2025-08-12 20:22:18',165,1,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(12,'2025-08-12 20:22:18',147,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(13,'2025-08-12 20:22:18',156,1,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(14,'2025-08-12 20:22:18',159,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(15,'2025-08-12 20:22:18',157,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(16,'2025-08-12 20:22:18',158,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(17,'2025-08-12 20:22:18',151,1,0,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(18,'2025-08-12 20:22:18',168,1,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(19,'2025-08-12 20:22:18',150,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(20,'2025-08-12 20:22:18',154,1,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(21,'2025-08-12 20:22:18',163,1,3,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(22,'2025-08-12 20:22:18',167,1,1,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(23,'2025-08-12 20:22:18',166,1,2,3000,'speak');
INSERT INTO "EvaluationExpression" VALUES(24,'2025-08-12 20:22:18',155,1,0,3000,'speak');
CREATE TABLE Evaluations (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    type TEXT CHECK (type IN ('Review', 'Pack', 'Selection', 'Test')) NOT NULL,







    start DATETIME NOT NULL,







    end DATETIME NOT NULL,







    size INTEGER NOT NULL







);
INSERT INTO "Evaluations" VALUES(1,'Test','2025-08-12 18:17:56','2025-08-12 18:25:37',24);
CREATE TABLE Expressions (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    text TEXT NOT NULL,







    sound_filename TEXT NOT NULL,







    language_id INTEGER NOT NULL,







    meaning_id INTEGER NOT NULL,







    FOREIGN KEY (language_id) REFERENCES Languages(id),







    FOREIGN KEY (meaning_id) REFERENCES Meanings(id)







);
INSERT INTO "Expressions" VALUES(1,'ноль','russian__zero',2,1);
INSERT INTO "Expressions" VALUES(2,'один','russian__one',2,2);
INSERT INTO "Expressions" VALUES(3,'два','russian__two',2,3);
INSERT INTO "Expressions" VALUES(4,'три','russian__three',2,4);
INSERT INTO "Expressions" VALUES(5,'четыре','russian__four',2,5);
INSERT INTO "Expressions" VALUES(6,'пять','russian__five',2,6);
INSERT INTO "Expressions" VALUES(7,'шесть','russian__six',2,7);
INSERT INTO "Expressions" VALUES(8,'семь','russian__seven',2,8);
INSERT INTO "Expressions" VALUES(9,'восемь','russian__eight',2,9);
INSERT INTO "Expressions" VALUES(10,'девять','russian__nine',2,10);
INSERT INTO "Expressions" VALUES(11,'десять','russian__ten',2,11);
INSERT INTO "Expressions" VALUES(12,'одиннадцать','russian__eleven',2,12);
INSERT INTO "Expressions" VALUES(13,'двенадцать','russian__twelve',2,13);
INSERT INTO "Expressions" VALUES(14,'тринадцать','russian__thirteen',2,14);
INSERT INTO "Expressions" VALUES(15,'четырнадцать','russian__fourteen',2,15);
INSERT INTO "Expressions" VALUES(16,'пятнадцать','russian__fifteen',2,16);
INSERT INTO "Expressions" VALUES(17,'шестнадцать','russian__sixteen',2,17);
INSERT INTO "Expressions" VALUES(18,'семнадцать','russian__seventeen',2,18);
INSERT INTO "Expressions" VALUES(19,'восемнадцать','russian__eighteen',2,19);
INSERT INTO "Expressions" VALUES(20,'девятнадцать','russian__nineteen',2,20);
INSERT INTO "Expressions" VALUES(21,'двадцать','russian__twenty',2,21);
INSERT INTO "Expressions" VALUES(22,'тридцать','russian__thirty',2,22);
INSERT INTO "Expressions" VALUES(23,'сорок','russian__forty',2,23);
INSERT INTO "Expressions" VALUES(24,'пятьдесят','russian__fifty',2,24);
INSERT INTO "Expressions" VALUES(25,'шестьдесят','russian__sixty',2,25);
INSERT INTO "Expressions" VALUES(26,'семьдесят','russian__seventy',2,26);
INSERT INTO "Expressions" VALUES(27,'восемьдесят','russian__eighty',2,27);
INSERT INTO "Expressions" VALUES(28,'девяносто','russian__ninty',2,28);
INSERT INTO "Expressions" VALUES(29,'сто','russian__hundred',2,29);
INSERT INTO "Expressions" VALUES(30,'двести','russian__two_hundred',2,30);
INSERT INTO "Expressions" VALUES(31,'триста','russian__three_hundred',2,31);
INSERT INTO "Expressions" VALUES(32,'четыреста','russian__four_hundred',2,32);
INSERT INTO "Expressions" VALUES(33,'пятьсот','russian__five_hundred',2,33);
INSERT INTO "Expressions" VALUES(34,'шестьсот','russian__six_hundred',2,34);
INSERT INTO "Expressions" VALUES(35,'семьсот','russian__seven_hundred',2,35);
INSERT INTO "Expressions" VALUES(36,'восемьсот','russian__eight_hundred',2,36);
INSERT INTO "Expressions" VALUES(37,'девятьсот','russian__nine_hundred',2,37);
INSERT INTO "Expressions" VALUES(38,'тысяча','russian__thousand',2,38);
INSERT INTO "Expressions" VALUES(39,'миллион','russian__million',2,39);
INSERT INTO "Expressions" VALUES(40,'миллиард','russian__billion',2,40);
INSERT INTO "Expressions" VALUES(41,'триллион','russian__trillion',2,41);
INSERT INTO "Expressions" VALUES(42,'zero','english__zero',4,1);
INSERT INTO "Expressions" VALUES(43,'one','english__one',4,2);
INSERT INTO "Expressions" VALUES(44,'two','english__two',4,3);
INSERT INTO "Expressions" VALUES(45,'three','english__three',4,4);
INSERT INTO "Expressions" VALUES(46,'four','english__four',4,5);
INSERT INTO "Expressions" VALUES(47,'five','english__five',4,6);
INSERT INTO "Expressions" VALUES(48,'six','english__six',4,7);
INSERT INTO "Expressions" VALUES(49,'seven','english__seven',4,8);
INSERT INTO "Expressions" VALUES(50,'eight','english__eight',4,9);
INSERT INTO "Expressions" VALUES(51,'nine','english__nine',4,10);
INSERT INTO "Expressions" VALUES(52,'ten','english__ten',4,11);
INSERT INTO "Expressions" VALUES(53,'eleven','english__eleven',4,12);
INSERT INTO "Expressions" VALUES(54,'twelve','english__twelve',4,13);
INSERT INTO "Expressions" VALUES(55,'thirteen','english__thirteen',4,14);
INSERT INTO "Expressions" VALUES(56,'fourteen','english__fourteen',4,15);
INSERT INTO "Expressions" VALUES(57,'fifteen','english__fifteen',4,16);
INSERT INTO "Expressions" VALUES(58,'sixteen','english__sixteen',4,17);
INSERT INTO "Expressions" VALUES(59,'seventeen','english__seventeen',4,18);
INSERT INTO "Expressions" VALUES(60,'eighteen','english__eighteen',4,19);
INSERT INTO "Expressions" VALUES(61,'nineteen','english__nineteen',4,20);
INSERT INTO "Expressions" VALUES(62,'twenty','english__twenty',4,21);
INSERT INTO "Expressions" VALUES(63,'thirty','english__thirty',4,22);
INSERT INTO "Expressions" VALUES(64,'forty','english__forty',4,23);
INSERT INTO "Expressions" VALUES(65,'fifty','english__fifty',4,24);
INSERT INTO "Expressions" VALUES(66,'sixty','english__sixty',4,25);
INSERT INTO "Expressions" VALUES(67,'seventy','english__seventy',4,26);
INSERT INTO "Expressions" VALUES(68,'eighty','english__eighty',4,27);
INSERT INTO "Expressions" VALUES(69,'ninety','english__ninty',4,28);
INSERT INTO "Expressions" VALUES(70,'hundred','english__hundred',4,29);
INSERT INTO "Expressions" VALUES(71,'two hundred','english__two_hundred',4,30);
INSERT INTO "Expressions" VALUES(72,'three hundred','english__three_hundred',4,31);
INSERT INTO "Expressions" VALUES(73,'four hundred','english__four_hundred',4,32);
INSERT INTO "Expressions" VALUES(74,'five hundred','english__five_hundred',4,33);
INSERT INTO "Expressions" VALUES(75,'six hundred','english__six_hundred',4,34);
INSERT INTO "Expressions" VALUES(76,'seven hundred','english__seven_hundred',4,35);
INSERT INTO "Expressions" VALUES(77,'eight hundred','english__eight_hundred',4,36);
INSERT INTO "Expressions" VALUES(78,'nine hundred','english__nine_hundred',4,37);
INSERT INTO "Expressions" VALUES(79,'thousand','english__thousand',4,38);
INSERT INTO "Expressions" VALUES(80,'million','english__million',4,39);
INSERT INTO "Expressions" VALUES(81,'billion','english__billion',4,40);
INSERT INTO "Expressions" VALUES(82,'trillion','english__trillion',4,41);
INSERT INTO "Expressions" VALUES(83,'мой план','russian__my_plan',2,42);
INSERT INTO "Expressions" VALUES(84,'моя мечта','russian__my_dream',2,43);
INSERT INTO "Expressions" VALUES(85,'моё решение','russian__my_decision',2,44);
INSERT INTO "Expressions" VALUES(86,'мои действия','russian__my_actions',2,45);
INSERT INTO "Expressions" VALUES(87,'твой план','russian__your_plan',2,46);
INSERT INTO "Expressions" VALUES(88,'твоя мечта','russian__your_dream',2,47);
INSERT INTO "Expressions" VALUES(89,'твоё решение','russian__your_decision',2,48);
INSERT INTO "Expressions" VALUES(90,'твои мечты','russian__your_dreams',2,49);
INSERT INTO "Expressions" VALUES(91,'его план','russian__his_plan',2,50);
INSERT INTO "Expressions" VALUES(92,'его мечта','russian__his_dream',2,51);
INSERT INTO "Expressions" VALUES(93,'его решение','russian__his_decision',2,52);
INSERT INTO "Expressions" VALUES(94,'его планы','russian__his_plans',2,53);
INSERT INTO "Expressions" VALUES(95,'её план','russian__her_plan',2,54);
INSERT INTO "Expressions" VALUES(96,'её мечта','russian__her_dream',2,55);
INSERT INTO "Expressions" VALUES(97,'её решение','russian__her_decision',2,56);
INSERT INTO "Expressions" VALUES(98,'её планы','russian__her_plans',2,57);
INSERT INTO "Expressions" VALUES(99,'его цвет','russian__its_color',2,58);
INSERT INTO "Expressions" VALUES(100,'его цена','russian__its_price',2,59);
INSERT INTO "Expressions" VALUES(101,'его окно','russian__its_window',2,60);
INSERT INTO "Expressions" VALUES(102,'его цвета','russian__its_colors',2,61);
INSERT INTO "Expressions" VALUES(103,'наш план','russian__our_plan',2,62);
INSERT INTO "Expressions" VALUES(104,'наша мечта','russian__our_dream',2,63);
INSERT INTO "Expressions" VALUES(105,'наше решение','russian__our_decision',2,64);
INSERT INTO "Expressions" VALUES(106,'наши действия','russian__our_actions',2,65);
INSERT INTO "Expressions" VALUES(107,'ваш план','russian__your_plan_formal',2,66);
INSERT INTO "Expressions" VALUES(108,'ваша мечта','russian__your_dream_formal',2,67);
INSERT INTO "Expressions" VALUES(109,'ваше решение','russian__your_decision_formal',2,68);
INSERT INTO "Expressions" VALUES(110,'ваши решения','russian__your_decisions_formal',2,69);
INSERT INTO "Expressions" VALUES(111,'их план','russian__their_plan',2,70);
INSERT INTO "Expressions" VALUES(112,'их мечта','russian__their_dream',2,71);
INSERT INTO "Expressions" VALUES(113,'их решение','russian__their_decision',2,72);
INSERT INTO "Expressions" VALUES(114,'их мечты','russian__their_dreams',2,73);
INSERT INTO "Expressions" VALUES(115,'my plan','english__my_plan',4,42);
INSERT INTO "Expressions" VALUES(116,'my dream','english__my_dream',4,43);
INSERT INTO "Expressions" VALUES(117,'my decision','english__my_decision',4,44);
INSERT INTO "Expressions" VALUES(118,'my actions','english__my_actions',4,45);
INSERT INTO "Expressions" VALUES(119,'your plan','english__your_plan',4,46);
INSERT INTO "Expressions" VALUES(120,'your dream','english__your_dream',4,47);
INSERT INTO "Expressions" VALUES(121,'your decision','english__your_decision',4,48);
INSERT INTO "Expressions" VALUES(122,'your dreams','english__your_dreams',4,49);
INSERT INTO "Expressions" VALUES(123,'his plan','english__his_plan',4,50);
INSERT INTO "Expressions" VALUES(124,'his dream','english__his_dream',4,51);
INSERT INTO "Expressions" VALUES(125,'his decision','english__his_decision',4,52);
INSERT INTO "Expressions" VALUES(126,'his plans','english__his_plans',4,53);
INSERT INTO "Expressions" VALUES(127,'her plan','english__her_plan',4,54);
INSERT INTO "Expressions" VALUES(128,'her dream','english__her_dream',4,55);
INSERT INTO "Expressions" VALUES(129,'her decision','english__her_decision',4,56);
INSERT INTO "Expressions" VALUES(130,'her plans','english__her_plans',4,57);
INSERT INTO "Expressions" VALUES(131,'its color','english__its_color',4,58);
INSERT INTO "Expressions" VALUES(132,'its price','english__its_price',4,59);
INSERT INTO "Expressions" VALUES(133,'its window','english__its_window',4,60);
INSERT INTO "Expressions" VALUES(134,'its colors','english__its_colors',4,61);
INSERT INTO "Expressions" VALUES(135,'our plan','english__our_plan',4,62);
INSERT INTO "Expressions" VALUES(136,'our dream','english__our_dream',4,63);
INSERT INTO "Expressions" VALUES(137,'our decision','english__our_decision',4,64);
INSERT INTO "Expressions" VALUES(138,'our actions','english__our_actions',4,65);
INSERT INTO "Expressions" VALUES(139,'your plan (formal)','english__your_plan_formal',4,66);
INSERT INTO "Expressions" VALUES(140,'your dream (formal)','english__your_dream_formal',4,67);
INSERT INTO "Expressions" VALUES(141,'your decision (formal)','english__your_decision_formal',4,68);
INSERT INTO "Expressions" VALUES(142,'your decisions (formal)','english__your_decisions_formal',4,69);
INSERT INTO "Expressions" VALUES(143,'their plan','english__their_plan',4,70);
INSERT INTO "Expressions" VALUES(144,'their dream','english__their_dream',4,71);
INSERT INTO "Expressions" VALUES(145,'their decision','english__their_decision',4,72);
INSERT INTO "Expressions" VALUES(146,'their dreams','english__their_dreams',4,73);
INSERT INTO "Expressions" VALUES(147,'мужчина','russian__man',2,74);
INSERT INTO "Expressions" VALUES(148,'женщина','russian__woman',2,75);
INSERT INTO "Expressions" VALUES(149,'мальчик','russian__boy',2,76);
INSERT INTO "Expressions" VALUES(150,'девочка','russian__girl',2,77);
INSERT INTO "Expressions" VALUES(151,'подросток','russian__teenager',2,78);
INSERT INTO "Expressions" VALUES(152,'ребёнок','russian__child',2,79);
INSERT INTO "Expressions" VALUES(153,'младенец','russian__baby',2,80);
INSERT INTO "Expressions" VALUES(154,'человек','russian__person',2,81);
INSERT INTO "Expressions" VALUES(155,'лица','russian__persons_formal',2,82);
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
INSERT INTO "Expressions" VALUES(179,'persons','english__persons_formal',4,82);
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
INSERT INTO "Expressions" VALUES(195,'я работаю','russian__i_work',2,98);
INSERT INTO "Expressions" VALUES(196,'ты работаешь','russian__you_work',2,99);
INSERT INTO "Expressions" VALUES(197,'он работает','russian__he_works',2,100);
INSERT INTO "Expressions" VALUES(198,'мы работаем','russian__we_work',2,101);
INSERT INTO "Expressions" VALUES(199,'вы работаете','russian__you_work_plural',2,102);
INSERT INTO "Expressions" VALUES(200,'они работают','russian__they_work',2,103);
INSERT INTO "Expressions" VALUES(201,'он работал','russian__he_worked',2,104);
INSERT INTO "Expressions" VALUES(202,'она работала','russian__she_worked',2,105);
INSERT INTO "Expressions" VALUES(203,'оно работало','russian__it_worked',2,106);
INSERT INTO "Expressions" VALUES(204,'он Поработал','russian__he_was_working',2,107);
INSERT INTO "Expressions" VALUES(205,'она Поработала','russian__she_was_working',2,108);
INSERT INTO "Expressions" VALUES(206,'оно Поработало','russian__it_was_working',2,109);
INSERT INTO "Expressions" VALUES(207,'я поработаю','russian__i_will_work',2,110);
INSERT INTO "Expressions" VALUES(208,'ты поработаешь','russian__you_will_work',2,111);
INSERT INTO "Expressions" VALUES(209,'он поработает','russian__he_will_work',2,112);
INSERT INTO "Expressions" VALUES(210,'мы поработаем','russian__we_will_work',2,113);
INSERT INTO "Expressions" VALUES(211,'вы поработаете','russian__you_will_work_plural',2,114);
INSERT INTO "Expressions" VALUES(212,'они поработают','russian__they_will_work',2,115);
INSERT INTO "Expressions" VALUES(213,'я говорю','russian__i_speak',2,116);
INSERT INTO "Expressions" VALUES(214,'ты говоришь','russian__you_speak',2,117);
INSERT INTO "Expressions" VALUES(215,'он говорит','russian__he_speaks',2,118);
INSERT INTO "Expressions" VALUES(216,'мы говорим','russian__we_speak',2,119);
INSERT INTO "Expressions" VALUES(217,'вы говорите','russian__you_speak_plural',2,120);
INSERT INTO "Expressions" VALUES(218,'они говорят','russian__they_speak',2,121);
INSERT INTO "Expressions" VALUES(219,'он говорил','russian__he_spoke',2,122);
INSERT INTO "Expressions" VALUES(220,'она говорила','russian__she_spoke',2,123);
INSERT INTO "Expressions" VALUES(221,'оно говорило','russian__it_spoke',2,124);
INSERT INTO "Expressions" VALUES(222,'он Сказал','russian__he_was_speaking',2,125);
INSERT INTO "Expressions" VALUES(223,'она Сказала','russian__she_was_speaking',2,126);
INSERT INTO "Expressions" VALUES(224,'оно Сказало','russian__it_was_speaking',2,127);
INSERT INTO "Expressions" VALUES(225,'я поговорю','russian__i_will_speak',2,128);
INSERT INTO "Expressions" VALUES(226,'ты поговоришь','russian__you_will_speak',2,129);
INSERT INTO "Expressions" VALUES(227,'он поговорит','russian__he_will_speak',2,130);
INSERT INTO "Expressions" VALUES(228,'мы поговорим','russian__we_will_speak',2,131);
INSERT INTO "Expressions" VALUES(229,'вы поговорите','russian__you_will_speak_plural',2,132);
INSERT INTO "Expressions" VALUES(230,'они поговорят','russian__they_will_speak',2,133);
INSERT INTO "Expressions" VALUES(231,'i work','english__i_work',4,98);
INSERT INTO "Expressions" VALUES(232,'you work','english__you_work',4,99);
INSERT INTO "Expressions" VALUES(233,'he works','english__he_works',4,100);
INSERT INTO "Expressions" VALUES(234,'we work','english__we_work',4,101);
INSERT INTO "Expressions" VALUES(235,'you work (plural)','english__you_work_plural',4,102);
INSERT INTO "Expressions" VALUES(236,'they work','english__they_work',4,103);
INSERT INTO "Expressions" VALUES(237,'he worked','english__he_worked',4,104);
INSERT INTO "Expressions" VALUES(238,'she worked','english__she_worked',4,105);
INSERT INTO "Expressions" VALUES(239,'it worked','english__it_worked',4,106);
INSERT INTO "Expressions" VALUES(240,'he was working','english__he_was_working',4,107);
INSERT INTO "Expressions" VALUES(241,'she was working','english__she_was_working',4,108);
INSERT INTO "Expressions" VALUES(242,'it was working','english__it_was_working',4,109);
INSERT INTO "Expressions" VALUES(243,'i will work','english__i_will_work',4,110);
INSERT INTO "Expressions" VALUES(244,'you will work','english__you_will_work',4,111);
INSERT INTO "Expressions" VALUES(245,'he will work','english__he_will_work',4,112);
INSERT INTO "Expressions" VALUES(246,'we will work','english__we_will_work',4,113);
INSERT INTO "Expressions" VALUES(247,'you will work (plural)','english__you_will_work_plural',4,114);
INSERT INTO "Expressions" VALUES(248,'they will work','english__they_will_work',4,115);
INSERT INTO "Expressions" VALUES(249,'i speak','english__i_speak',4,116);
INSERT INTO "Expressions" VALUES(250,'you speak','english__you_speak',4,117);
INSERT INTO "Expressions" VALUES(251,'he speaks','english__he_speaks',4,118);
INSERT INTO "Expressions" VALUES(252,'we speak','english__we_speak',4,119);
INSERT INTO "Expressions" VALUES(253,'you speak (plural)','english__you_speak_plural',4,120);
INSERT INTO "Expressions" VALUES(254,'they speak','english__they_speak',4,121);
INSERT INTO "Expressions" VALUES(255,'he spoke','english__he_spoke',4,122);
INSERT INTO "Expressions" VALUES(256,'she spoke','english__she_spoke',4,123);
INSERT INTO "Expressions" VALUES(257,'it spoke','english__it_spoke',4,124);
INSERT INTO "Expressions" VALUES(258,'he was speaking','english__he_was_speaking',4,125);
INSERT INTO "Expressions" VALUES(259,'she was speaking','english__she_was_speaking',4,126);
INSERT INTO "Expressions" VALUES(260,'it was speaking','english__it_was_speaking',4,127);
INSERT INTO "Expressions" VALUES(261,'i will speak','english__i_will_speak',4,128);
INSERT INTO "Expressions" VALUES(262,'you will speak','english__you_will_speak',4,129);
INSERT INTO "Expressions" VALUES(263,'he will speak','english__he_will_speak',4,130);
INSERT INTO "Expressions" VALUES(264,'we will speak','english__we_will_speak',4,131);
INSERT INTO "Expressions" VALUES(265,'you will speak (plural)','english__you_will_speak_plural',4,132);
INSERT INTO "Expressions" VALUES(266,'they will speak','english__they_will_speak',4,133);
INSERT INTO "Expressions" VALUES(267,'Я счастлив.','russian__i_am_happy',2,134);
INSERT INTO "Expressions" VALUES(268,'Мне грустно.','russian__i_am_sad',2,135);
INSERT INTO "Expressions" VALUES(269,'Я занят.','russian__i_am_busy',2,136);
INSERT INTO "Expressions" VALUES(270,'Я устал.','russian__i_am_tired',2,137);
INSERT INTO "Expressions" VALUES(271,'Я напишу тебе.','russian__i_will_write_you',2,138);
INSERT INTO "Expressions" VALUES(272,'Я отправлю тебе сообщение.','russian__i_will_send_you_a_message',2,139);
INSERT INTO "Expressions" VALUES(273,'Я еду на поезде.','russian__i_am_going_by_train',2,140);
INSERT INTO "Expressions" VALUES(274,'Я полечу.','russian__i_will_fly',2,141);
INSERT INTO "Expressions" VALUES(275,'Я поеду на поезде.','russian__i_will_go_by_train',2,142);
INSERT INTO "Expressions" VALUES(276,'Я поеду на автобусе.','russian__i_will_go_by_bus',2,143);
INSERT INTO "Expressions" VALUES(277,'Я приехал на поезде.','russian__i_came_by_train',2,144);
INSERT INTO "Expressions" VALUES(278,'Я приехал на автобусе.','russian__i_came_by_bus',2,145);
INSERT INTO "Expressions" VALUES(279,'Я прилетел на самолёте.','russian__i_came_by_plane',2,146);
INSERT INTO "Expressions" VALUES(280,'Я хочу пиццу.','russian__i_want_a_pizza',2,147);
INSERT INTO "Expressions" VALUES(281,'Я принес тебе подарок.','russian__i_brought_you_a_gift',2,148);
INSERT INTO "Expressions" VALUES(282,'Я принесу тебе подарок.','russian__i_will_bring_you_a_gift',2,149);
INSERT INTO "Expressions" VALUES(283,'Я потерял свои ключи.','russian__i_lost_my_keys',2,150);
INSERT INTO "Expressions" VALUES(284,'Я нашёл свои ключи.','russian__i_found_my_keys',2,151);
INSERT INTO "Expressions" VALUES(285,'Я ищу свой телефон.','russian__i_am_looking_for_my_phone',2,152);
INSERT INTO "Expressions" VALUES(286,'Ты видел мой телефон?','russian__did_you_see_my_phone',2,153);
INSERT INTO "Expressions" VALUES(287,'Я попробую ещё раз.','russian__i_will_try_again',2,154);
INSERT INTO "Expressions" VALUES(288,'Тебе нужна помощь?','russian__do_you_need_help',2,155);
INSERT INTO "Expressions" VALUES(289,'Я повернул налево.','russian__i_turned_left',2,156);
INSERT INTO "Expressions" VALUES(290,'Я пойду за тобой.','russian__i_will_follow_you',2,157);
INSERT INTO "Expressions" VALUES(291,'Принеси мне воды.','russian__bring_me_water',2,158);
INSERT INTO "Expressions" VALUES(292,'Мне нравится эта музыка.','russian__i_like_this_music',2,159);
INSERT INTO "Expressions" VALUES(293,'Я хочу написать книгу.','russian__i_want_to_write_a_book',2,160);
INSERT INTO "Expressions" VALUES(294,'Можно здесь сесть?','russian__can_i_sit_here',2,161);
INSERT INTO "Expressions" VALUES(295,'Я встретил своих друзей.','russian__i_met_my_friends',2,162);
INSERT INTO "Expressions" VALUES(296,'Я говорил с родителями.','russian__i_talked_with_my_parents',2,163);
INSERT INTO "Expressions" VALUES(297,'Я разговаривал с братом.','russian__i_was_talking_with_my_brother',2,164);
INSERT INTO "Expressions" VALUES(298,'Ты быстро учишься.','russian__you_learn_fast',2,165);
INSERT INTO "Expressions" VALUES(299,'Ты умный.','russian__you_are_smart',2,166);
INSERT INTO "Expressions" VALUES(300,'Ты готов?','russian__are_you_ready',2,167);
INSERT INTO "Expressions" VALUES(301,'Я только что принял душ.','russian__i_just_took_a_shower',2,168);
INSERT INTO "Expressions" VALUES(302,'Мне нужно принять душ.','russian__i_need_to_have_a_shower',2,169);
INSERT INTO "Expressions" VALUES(303,'Мне нужно переодеться.','russian__i_need_to_change_my_clothes',2,170);
INSERT INTO "Expressions" VALUES(304,'Хочешь посмотреть фильм?','russian__do_you_want_to_watch_a_movie',2,171);
INSERT INTO "Expressions" VALUES(305,'Во сколько ты заканчиваешь работу?','russian__what_time_you_finish_work',2,172);
INSERT INTO "Expressions" VALUES(306,'Во сколько ты начинаешь работать?','russian__what_time_you_start_to_work',2,173);
INSERT INTO "Expressions" VALUES(307,'Что ты делаешь сегодня?','russian__what_are_you_doing_today',2,174);
INSERT INTO "Expressions" VALUES(308,'Что ты делаешь сегодня вечером?','russian__what_are_you_doing_this_evening',2,175);
INSERT INTO "Expressions" VALUES(309,'Что ты делаешь?','russian__what_are_you_doing',2,176);
INSERT INTO "Expressions" VALUES(310,'Какие у тебя планы на выходные?','russian__what_are_your_plans_for_the_weekend',2,177);
INSERT INTO "Expressions" VALUES(311,'Хочешь потанцевать?','russian__do_you_want_to_dance',2,178);
INSERT INTO "Expressions" VALUES(312,'Пойдём гулять.','russian__lets_go_for_a_walk',2,179);
INSERT INTO "Expressions" VALUES(313,'Я был в супермаркете.','russian__i_was_in_supermarket',2,180);
INSERT INTO "Expressions" VALUES(314,'Я только что пришёл из супермаркета.','russian__i_just_came_from_supermarket',2,181);
INSERT INTO "Expressions" VALUES(315,'Я иду в супермаркет.','russian__i_am_going_to_supermarket',2,182);
INSERT INTO "Expressions" VALUES(316,'Я пойду в супермаркет.','russian__i_will_go_to_supermarket',2,183);
INSERT INTO "Expressions" VALUES(317,'Я немного опаздываю.','russian__i_am_a_bit_late',2,184);
INSERT INTO "Expressions" VALUES(318,'Я опаздываю.','russian__i_am_late',2,185);
INSERT INTO "Expressions" VALUES(319,'Я очень опаздываю.','russian__i_am_very_late',2,186);
INSERT INTO "Expressions" VALUES(320,'Мы можем пойти вместе.','russian__we_can_go_together',2,187);
INSERT INTO "Expressions" VALUES(321,'I am happy.','english__i_am_happy',4,134);
INSERT INTO "Expressions" VALUES(322,'I am sad.','english__i_am_sad',4,135);
INSERT INTO "Expressions" VALUES(323,'I am busy.','english__i_am_busy',4,136);
INSERT INTO "Expressions" VALUES(324,'I am tired.','english__i_am_tired',4,137);
INSERT INTO "Expressions" VALUES(325,'I will write you.','english__i_will_write_you',4,138);
INSERT INTO "Expressions" VALUES(326,'I will send you a message.','english__i_will_send_you_a_message',4,139);
INSERT INTO "Expressions" VALUES(327,'I am going by train.','english__i_am_going_by_train',4,140);
INSERT INTO "Expressions" VALUES(328,'I will fly.','english__i_will_fly',4,141);
INSERT INTO "Expressions" VALUES(329,'I will go by train.','english__i_will_go_by_train',4,142);
INSERT INTO "Expressions" VALUES(330,'I will go by bus.','english__i_will_go_by_bus',4,143);
INSERT INTO "Expressions" VALUES(331,'I came by train.','english__i_came_by_train',4,144);
INSERT INTO "Expressions" VALUES(332,'I came by bus.','english__i_came_by_bus',4,145);
INSERT INTO "Expressions" VALUES(333,'I came by plane.','english__i_came_by_plane',4,146);
INSERT INTO "Expressions" VALUES(334,'I want a pizza.','english__i_want_a_pizza',4,147);
INSERT INTO "Expressions" VALUES(335,'I brought you a gift.','english__i_brought_you_a_gift',4,148);
INSERT INTO "Expressions" VALUES(336,'I will bring you a gift.','english__i_will_bring_you_a_gift',4,149);
INSERT INTO "Expressions" VALUES(337,'I lost my keys.','english__i_lost_my_keys',4,150);
INSERT INTO "Expressions" VALUES(338,'I found my keys.','english__i_found_my_keys',4,151);
INSERT INTO "Expressions" VALUES(339,'I am looking for my phone.','english__i_am_looking_for_my_phone',4,152);
INSERT INTO "Expressions" VALUES(340,'Did you see my phone?','english__did_you_see_my_phone',4,153);
INSERT INTO "Expressions" VALUES(341,'I will try again.','english__i_will_try_again',4,154);
INSERT INTO "Expressions" VALUES(342,'Do you need help?','english__do_you_need_help',4,155);
INSERT INTO "Expressions" VALUES(343,'I turned left.','english__i_turned_left',4,156);
INSERT INTO "Expressions" VALUES(344,'I will follow you.','english__i_will_follow_you',4,157);
INSERT INTO "Expressions" VALUES(345,'Bring me water.','english__bring_me_water',4,158);
INSERT INTO "Expressions" VALUES(346,'I like this music.','english__i_like_this_music',4,159);
INSERT INTO "Expressions" VALUES(347,'I want to write a book.','english__i_want_to_write_a_book',4,160);
INSERT INTO "Expressions" VALUES(348,'Can I sit here?','english__can_i_sit_here',4,161);
INSERT INTO "Expressions" VALUES(349,'I met my friends.','english__i_met_my_friends',4,162);
INSERT INTO "Expressions" VALUES(350,'I talked with my parents.','english__i_talked_with_my_parents',4,163);
INSERT INTO "Expressions" VALUES(351,'I was talking with my brother.','english__i_was_talking_with_my_brother',4,164);
INSERT INTO "Expressions" VALUES(352,'You learn fast.','english__you_learn_fast',4,165);
INSERT INTO "Expressions" VALUES(353,'You are smart.','english__you_are_smart',4,166);
INSERT INTO "Expressions" VALUES(354,'Are you ready?','english__are_you_ready',4,167);
INSERT INTO "Expressions" VALUES(355,'I just took a shower.','english__i_just_took_a_shower',4,168);
INSERT INTO "Expressions" VALUES(356,'I need to have a shower.','english__i_need_to_have_a_shower',4,169);
INSERT INTO "Expressions" VALUES(357,'I need to change my clothes.','english__i_need_to_change_my_clothes',4,170);
INSERT INTO "Expressions" VALUES(358,'Do you want to watch a movie?','english__do_you_want_to_watch_a_movie',4,171);
INSERT INTO "Expressions" VALUES(359,'What time do you finish work?','english__what_time_you_finish_work',4,172);
INSERT INTO "Expressions" VALUES(360,'What time do you start to work?','english__what_time_you_start_to_work',4,173);
INSERT INTO "Expressions" VALUES(361,'What are you doing today?','english__what_are_you_doing_today',4,174);
INSERT INTO "Expressions" VALUES(362,'What are you doing this evening?','english__what_are_you_doing_this_evening',4,175);
INSERT INTO "Expressions" VALUES(363,'What are you doing?','english__what_are_you_doing',4,176);
INSERT INTO "Expressions" VALUES(364,'What are your plans for the weekend?','english__what_are_your_plans_for_the_weekend',4,177);
INSERT INTO "Expressions" VALUES(365,'Do you want to dance?','english__do_you_want_to_dance',4,178);
INSERT INTO "Expressions" VALUES(366,'Let''s go for a walk.','english__lets_go_for_a_walk',4,179);
INSERT INTO "Expressions" VALUES(367,'I was in supermarket.','english__i_was_in_supermarket',4,180);
INSERT INTO "Expressions" VALUES(368,'I just came from supermarket.','english__i_just_came_from_supermarket',4,181);
INSERT INTO "Expressions" VALUES(369,'I am going to supermarket.','english__i_am_going_to_supermarket',4,182);
INSERT INTO "Expressions" VALUES(370,'I will go to supermarket.','english__i_will_go_to_supermarket',4,183);
INSERT INTO "Expressions" VALUES(371,'I am a bit late.','english__i_am_a_bit_late',4,184);
INSERT INTO "Expressions" VALUES(372,'I am late.','english__i_am_late',4,185);
INSERT INTO "Expressions" VALUES(373,'I am very late.','english__i_am_very_late',4,186);
INSERT INTO "Expressions" VALUES(374,'We can go together.','english__we_can_go_together',4,187);
CREATE TABLE LanguagePackWithTitle (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    pack_id INTEGER NOT NULL,







    language_id INTEGER NOT NULL,







    title TEXT NOT NULL,







    FOREIGN KEY (pack_id) REFERENCES Packs(id),







    FOREIGN KEY (language_id) REFERENCES Languages(id)







);
INSERT INTO "LanguagePackWithTitle" VALUES(1,1,4,'numbers: 0 to trillion');
INSERT INTO "LanguagePackWithTitle" VALUES(2,2,4,'possessive pronouns, with noun (2 words)');
INSERT INTO "LanguagePackWithTitle" VALUES(3,3,4,'family and people');
INSERT INTO "LanguagePackWithTitle" VALUES(4,4,4,'regular conjugations: work, speak');
INSERT INTO "LanguagePackWithTitle" VALUES(5,5,4,'usual expressions I');
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
INSERT INTO "Languages" VALUES(5,'mandarin','普通话','zh');
INSERT INTO "Languages" VALUES(6,'romanian','Română','ro');
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
INSERT INTO "MeaningPack" VALUES(33,1,33);
INSERT INTO "MeaningPack" VALUES(34,1,34);
INSERT INTO "MeaningPack" VALUES(35,1,35);
INSERT INTO "MeaningPack" VALUES(36,1,36);
INSERT INTO "MeaningPack" VALUES(37,1,37);
INSERT INTO "MeaningPack" VALUES(38,1,38);
INSERT INTO "MeaningPack" VALUES(39,1,39);
INSERT INTO "MeaningPack" VALUES(40,1,40);
INSERT INTO "MeaningPack" VALUES(41,1,41);
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
INSERT INTO "MeaningPack" VALUES(98,4,98);
INSERT INTO "MeaningPack" VALUES(99,4,99);
INSERT INTO "MeaningPack" VALUES(100,4,100);
INSERT INTO "MeaningPack" VALUES(101,4,101);
INSERT INTO "MeaningPack" VALUES(102,4,102);
INSERT INTO "MeaningPack" VALUES(103,4,103);
INSERT INTO "MeaningPack" VALUES(104,4,104);
INSERT INTO "MeaningPack" VALUES(105,4,105);
INSERT INTO "MeaningPack" VALUES(106,4,106);
INSERT INTO "MeaningPack" VALUES(107,4,107);
INSERT INTO "MeaningPack" VALUES(108,4,108);
INSERT INTO "MeaningPack" VALUES(109,4,109);
INSERT INTO "MeaningPack" VALUES(110,4,110);
INSERT INTO "MeaningPack" VALUES(111,4,111);
INSERT INTO "MeaningPack" VALUES(112,4,112);
INSERT INTO "MeaningPack" VALUES(113,4,113);
INSERT INTO "MeaningPack" VALUES(114,4,114);
INSERT INTO "MeaningPack" VALUES(115,4,115);
INSERT INTO "MeaningPack" VALUES(116,4,116);
INSERT INTO "MeaningPack" VALUES(117,4,117);
INSERT INTO "MeaningPack" VALUES(118,4,118);
INSERT INTO "MeaningPack" VALUES(119,4,119);
INSERT INTO "MeaningPack" VALUES(120,4,120);
INSERT INTO "MeaningPack" VALUES(121,4,121);
INSERT INTO "MeaningPack" VALUES(122,4,122);
INSERT INTO "MeaningPack" VALUES(123,4,123);
INSERT INTO "MeaningPack" VALUES(124,4,124);
INSERT INTO "MeaningPack" VALUES(125,4,125);
INSERT INTO "MeaningPack" VALUES(126,4,126);
INSERT INTO "MeaningPack" VALUES(127,4,127);
INSERT INTO "MeaningPack" VALUES(128,4,128);
INSERT INTO "MeaningPack" VALUES(129,4,129);
INSERT INTO "MeaningPack" VALUES(130,4,130);
INSERT INTO "MeaningPack" VALUES(131,4,131);
INSERT INTO "MeaningPack" VALUES(132,4,132);
INSERT INTO "MeaningPack" VALUES(133,4,133);
INSERT INTO "MeaningPack" VALUES(134,5,134);
INSERT INTO "MeaningPack" VALUES(135,5,135);
INSERT INTO "MeaningPack" VALUES(136,5,136);
INSERT INTO "MeaningPack" VALUES(137,5,137);
INSERT INTO "MeaningPack" VALUES(138,5,138);
INSERT INTO "MeaningPack" VALUES(139,5,139);
INSERT INTO "MeaningPack" VALUES(140,5,140);
INSERT INTO "MeaningPack" VALUES(141,5,141);
INSERT INTO "MeaningPack" VALUES(142,5,142);
INSERT INTO "MeaningPack" VALUES(143,5,143);
INSERT INTO "MeaningPack" VALUES(144,5,144);
INSERT INTO "MeaningPack" VALUES(145,5,145);
INSERT INTO "MeaningPack" VALUES(146,5,146);
INSERT INTO "MeaningPack" VALUES(147,5,147);
INSERT INTO "MeaningPack" VALUES(148,5,148);
INSERT INTO "MeaningPack" VALUES(149,5,149);
INSERT INTO "MeaningPack" VALUES(150,5,150);
INSERT INTO "MeaningPack" VALUES(151,5,151);
INSERT INTO "MeaningPack" VALUES(152,5,152);
INSERT INTO "MeaningPack" VALUES(153,5,153);
INSERT INTO "MeaningPack" VALUES(154,5,154);
INSERT INTO "MeaningPack" VALUES(155,5,155);
INSERT INTO "MeaningPack" VALUES(156,5,156);
INSERT INTO "MeaningPack" VALUES(157,5,157);
INSERT INTO "MeaningPack" VALUES(158,5,158);
INSERT INTO "MeaningPack" VALUES(159,5,159);
INSERT INTO "MeaningPack" VALUES(160,5,160);
INSERT INTO "MeaningPack" VALUES(161,5,161);
INSERT INTO "MeaningPack" VALUES(162,5,162);
INSERT INTO "MeaningPack" VALUES(163,5,163);
INSERT INTO "MeaningPack" VALUES(164,5,164);
INSERT INTO "MeaningPack" VALUES(165,5,165);
INSERT INTO "MeaningPack" VALUES(166,5,166);
INSERT INTO "MeaningPack" VALUES(167,5,167);
INSERT INTO "MeaningPack" VALUES(168,5,168);
INSERT INTO "MeaningPack" VALUES(169,5,169);
INSERT INTO "MeaningPack" VALUES(170,5,170);
INSERT INTO "MeaningPack" VALUES(171,5,171);
INSERT INTO "MeaningPack" VALUES(172,5,172);
INSERT INTO "MeaningPack" VALUES(173,5,173);
INSERT INTO "MeaningPack" VALUES(174,5,174);
INSERT INTO "MeaningPack" VALUES(175,5,175);
INSERT INTO "MeaningPack" VALUES(176,5,176);
INSERT INTO "MeaningPack" VALUES(177,5,177);
INSERT INTO "MeaningPack" VALUES(178,5,178);
INSERT INTO "MeaningPack" VALUES(179,5,179);
INSERT INTO "MeaningPack" VALUES(180,5,180);
INSERT INTO "MeaningPack" VALUES(181,5,181);
INSERT INTO "MeaningPack" VALUES(182,5,182);
INSERT INTO "MeaningPack" VALUES(183,5,183);
INSERT INTO "MeaningPack" VALUES(184,5,184);
INSERT INTO "MeaningPack" VALUES(185,5,185);
INSERT INTO "MeaningPack" VALUES(186,5,186);
INSERT INTO "MeaningPack" VALUES(187,5,187);
CREATE TABLE Meanings (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    meaningEng TEXT NOT NULL







);
INSERT INTO "Meanings" VALUES(1,'zero');
INSERT INTO "Meanings" VALUES(2,'one');
INSERT INTO "Meanings" VALUES(3,'two');
INSERT INTO "Meanings" VALUES(4,'three');
INSERT INTO "Meanings" VALUES(5,'four');
INSERT INTO "Meanings" VALUES(6,'five');
INSERT INTO "Meanings" VALUES(7,'six');
INSERT INTO "Meanings" VALUES(8,'seven');
INSERT INTO "Meanings" VALUES(9,'eight');
INSERT INTO "Meanings" VALUES(10,'nine');
INSERT INTO "Meanings" VALUES(11,'ten');
INSERT INTO "Meanings" VALUES(12,'eleven');
INSERT INTO "Meanings" VALUES(13,'twelve');
INSERT INTO "Meanings" VALUES(14,'thirteen');
INSERT INTO "Meanings" VALUES(15,'fourteen');
INSERT INTO "Meanings" VALUES(16,'fifteen');
INSERT INTO "Meanings" VALUES(17,'sixteen');
INSERT INTO "Meanings" VALUES(18,'seventeen');
INSERT INTO "Meanings" VALUES(19,'eighteen');
INSERT INTO "Meanings" VALUES(20,'nineteen');
INSERT INTO "Meanings" VALUES(21,'twenty');
INSERT INTO "Meanings" VALUES(22,'thirty');
INSERT INTO "Meanings" VALUES(23,'forty');
INSERT INTO "Meanings" VALUES(24,'fifty');
INSERT INTO "Meanings" VALUES(25,'sixty');
INSERT INTO "Meanings" VALUES(26,'seventy');
INSERT INTO "Meanings" VALUES(27,'eighty');
INSERT INTO "Meanings" VALUES(28,'ninty');
INSERT INTO "Meanings" VALUES(29,'hundred');
INSERT INTO "Meanings" VALUES(30,'two hundred');
INSERT INTO "Meanings" VALUES(31,'three hundred');
INSERT INTO "Meanings" VALUES(32,'four hundred');
INSERT INTO "Meanings" VALUES(33,'five hundred');
INSERT INTO "Meanings" VALUES(34,'six hundred');
INSERT INTO "Meanings" VALUES(35,'seven hundred');
INSERT INTO "Meanings" VALUES(36,'eight hundred');
INSERT INTO "Meanings" VALUES(37,'nine hundred');
INSERT INTO "Meanings" VALUES(38,'thousand');
INSERT INTO "Meanings" VALUES(39,'million');
INSERT INTO "Meanings" VALUES(40,'billion');
INSERT INTO "Meanings" VALUES(41,'trillion');
INSERT INTO "Meanings" VALUES(42,'my plan');
INSERT INTO "Meanings" VALUES(43,'my dream');
INSERT INTO "Meanings" VALUES(44,'my decision');
INSERT INTO "Meanings" VALUES(45,'my actions');
INSERT INTO "Meanings" VALUES(46,'your plan');
INSERT INTO "Meanings" VALUES(47,'your dream');
INSERT INTO "Meanings" VALUES(48,'your decision');
INSERT INTO "Meanings" VALUES(49,'your dreams');
INSERT INTO "Meanings" VALUES(50,'his plan');
INSERT INTO "Meanings" VALUES(51,'his dream');
INSERT INTO "Meanings" VALUES(52,'his decision');
INSERT INTO "Meanings" VALUES(53,'his plans');
INSERT INTO "Meanings" VALUES(54,'her plan');
INSERT INTO "Meanings" VALUES(55,'her dream');
INSERT INTO "Meanings" VALUES(56,'her decision');
INSERT INTO "Meanings" VALUES(57,'her plans');
INSERT INTO "Meanings" VALUES(58,'its color');
INSERT INTO "Meanings" VALUES(59,'its price');
INSERT INTO "Meanings" VALUES(60,'its window');
INSERT INTO "Meanings" VALUES(61,'its colors');
INSERT INTO "Meanings" VALUES(62,'our plan');
INSERT INTO "Meanings" VALUES(63,'our dream');
INSERT INTO "Meanings" VALUES(64,'our decision');
INSERT INTO "Meanings" VALUES(65,'our actions');
INSERT INTO "Meanings" VALUES(66,'your plan (formal)');
INSERT INTO "Meanings" VALUES(67,'your dream (formal)');
INSERT INTO "Meanings" VALUES(68,'your decision (formal)');
INSERT INTO "Meanings" VALUES(69,'your decisions (formal)');
INSERT INTO "Meanings" VALUES(70,'their plan');
INSERT INTO "Meanings" VALUES(71,'their dream');
INSERT INTO "Meanings" VALUES(72,'their decision');
INSERT INTO "Meanings" VALUES(73,'their dreams');
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
INSERT INTO "Meanings" VALUES(98,'i work');
INSERT INTO "Meanings" VALUES(99,'you work');
INSERT INTO "Meanings" VALUES(100,'he works');
INSERT INTO "Meanings" VALUES(101,'we work');
INSERT INTO "Meanings" VALUES(102,'you work (plural)');
INSERT INTO "Meanings" VALUES(103,'they work');
INSERT INTO "Meanings" VALUES(104,'he worked');
INSERT INTO "Meanings" VALUES(105,'she worked');
INSERT INTO "Meanings" VALUES(106,'it worked');
INSERT INTO "Meanings" VALUES(107,'he was working');
INSERT INTO "Meanings" VALUES(108,'she was working');
INSERT INTO "Meanings" VALUES(109,'it was working');
INSERT INTO "Meanings" VALUES(110,'i will work');
INSERT INTO "Meanings" VALUES(111,'you will work');
INSERT INTO "Meanings" VALUES(112,'he will work');
INSERT INTO "Meanings" VALUES(113,'we will work');
INSERT INTO "Meanings" VALUES(114,'you will work (plural)');
INSERT INTO "Meanings" VALUES(115,'they will work');
INSERT INTO "Meanings" VALUES(116,'i speak');
INSERT INTO "Meanings" VALUES(117,'you speak');
INSERT INTO "Meanings" VALUES(118,'he speaks');
INSERT INTO "Meanings" VALUES(119,'we speak');
INSERT INTO "Meanings" VALUES(120,'you speak (plural)');
INSERT INTO "Meanings" VALUES(121,'they speak');
INSERT INTO "Meanings" VALUES(122,'he spoke');
INSERT INTO "Meanings" VALUES(123,'she spoke');
INSERT INTO "Meanings" VALUES(124,'it spoke');
INSERT INTO "Meanings" VALUES(125,'he was speaking');
INSERT INTO "Meanings" VALUES(126,'she was speaking');
INSERT INTO "Meanings" VALUES(127,'it was speaking');
INSERT INTO "Meanings" VALUES(128,'i will speak');
INSERT INTO "Meanings" VALUES(129,'you will speak');
INSERT INTO "Meanings" VALUES(130,'he will speak');
INSERT INTO "Meanings" VALUES(131,'we will speak');
INSERT INTO "Meanings" VALUES(132,'you will speak (plural)');
INSERT INTO "Meanings" VALUES(133,'they will speak');
INSERT INTO "Meanings" VALUES(134,'I am happy.');
INSERT INTO "Meanings" VALUES(135,'I am sad');
INSERT INTO "Meanings" VALUES(136,'I am busy');
INSERT INTO "Meanings" VALUES(137,'I am tired');
INSERT INTO "Meanings" VALUES(138,'I will write you');
INSERT INTO "Meanings" VALUES(139,'I will send you a message');
INSERT INTO "Meanings" VALUES(140,'I am going by train');
INSERT INTO "Meanings" VALUES(141,'I will fly');
INSERT INTO "Meanings" VALUES(142,'I will go by train');
INSERT INTO "Meanings" VALUES(143,'I will go by bus');
INSERT INTO "Meanings" VALUES(144,'I came by train');
INSERT INTO "Meanings" VALUES(145,'I came by bus');
INSERT INTO "Meanings" VALUES(146,'I came by plane');
INSERT INTO "Meanings" VALUES(147,'I want a pizza.');
INSERT INTO "Meanings" VALUES(148,'I brought you a gift');
INSERT INTO "Meanings" VALUES(149,'I will bring you a gift');
INSERT INTO "Meanings" VALUES(150,'I lost my keys');
INSERT INTO "Meanings" VALUES(151,'I found my keys');
INSERT INTO "Meanings" VALUES(152,'I am looking for my phone');
INSERT INTO "Meanings" VALUES(153,'Did you see my phone?');
INSERT INTO "Meanings" VALUES(154,'I will try again.');
INSERT INTO "Meanings" VALUES(155,'Do you need help?');
INSERT INTO "Meanings" VALUES(156,'I turned left.');
INSERT INTO "Meanings" VALUES(157,'I will follow you.');
INSERT INTO "Meanings" VALUES(158,'Bring me water.');
INSERT INTO "Meanings" VALUES(159,'I like this music');
INSERT INTO "Meanings" VALUES(160,'I want to write a book');
INSERT INTO "Meanings" VALUES(161,'Can I sit here?');
INSERT INTO "Meanings" VALUES(162,'I met my friends');
INSERT INTO "Meanings" VALUES(163,'I talked with my parents');
INSERT INTO "Meanings" VALUES(164,'I was talking with my brother');
INSERT INTO "Meanings" VALUES(165,'You learn fast.');
INSERT INTO "Meanings" VALUES(166,'You are smart');
INSERT INTO "Meanings" VALUES(167,'Are you ready');
INSERT INTO "Meanings" VALUES(168,'I just took a shower');
INSERT INTO "Meanings" VALUES(169,'I need to have a shower');
INSERT INTO "Meanings" VALUES(170,'I need to change my clothes.');
INSERT INTO "Meanings" VALUES(171,'Do you want to watch a movie');
INSERT INTO "Meanings" VALUES(172,'What time you finish work?');
INSERT INTO "Meanings" VALUES(173,'What time you start to work?');
INSERT INTO "Meanings" VALUES(174,'What are you doing today?');
INSERT INTO "Meanings" VALUES(175,'What are you doing this evening?');
INSERT INTO "Meanings" VALUES(176,'What are you doing?');
INSERT INTO "Meanings" VALUES(177,'What are your plans for the weekend?');
INSERT INTO "Meanings" VALUES(178,'Do you want to dance?');
INSERT INTO "Meanings" VALUES(179,'Let''s go for a walk.');
INSERT INTO "Meanings" VALUES(180,'I was in supermarket');
INSERT INTO "Meanings" VALUES(181,'I just came from supermarket');
INSERT INTO "Meanings" VALUES(182,'I am going to supermarket');
INSERT INTO "Meanings" VALUES(183,'I will go to supermarket');
INSERT INTO "Meanings" VALUES(184,'I am a bit late');
INSERT INTO "Meanings" VALUES(185,'I am late');
INSERT INTO "Meanings" VALUES(186,'I am very late');
INSERT INTO "Meanings" VALUES(187,'We can go together');
CREATE TABLE Packs (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    descriptionEng TEXT NOT NULL







);
INSERT INTO "Packs" VALUES(1,'numbers: 0 to trillion');
INSERT INTO "Packs" VALUES(2,'possessive pronouns, with noun (2 words)');
INSERT INTO "Packs" VALUES(3,'family and people');
INSERT INTO "Packs" VALUES(4,'regular conjugations: work, speak');
INSERT INTO "Packs" VALUES(5,'usual expressions I');
CREATE TABLE Phonetics (







    id INTEGER PRIMARY KEY AUTOINCREMENT,







    text TEXT NOT NULL,







    expression_id INTEGER NOT NULL,







    FOREIGN KEY (expression_id) REFERENCES Expressions(id)







);
INSERT INTO "Phonetics" VALUES(1,'noulь',1);
INSERT INTO "Phonetics" VALUES(2,'а́din',2);
INSERT INTO "Phonetics" VALUES(3,'dvá',3);
INSERT INTO "Phonetics" VALUES(4,'tri',4);
INSERT INTO "Phonetics" VALUES(5,'tchi-ti-rie',5);
INSERT INTO "Phonetics" VALUES(6,'piátь',6);
INSERT INTO "Phonetics" VALUES(7,'chectь',7);
INSERT INTO "Phonetics" VALUES(8,'ciémь',8);
INSERT INTO "Phonetics" VALUES(9,'vou-cieimь',9);
INSERT INTO "Phonetics" VALUES(10,'dié-vitь',10);
INSERT INTO "Phonetics" VALUES(11,'dié-citь',11);
INSERT INTO "Phonetics" VALUES(12,'а́di-nа́-tsatь',12);
INSERT INTO "Phonetics" VALUES(13,'dvié-ná-tsаtь',13);
INSERT INTO "Phonetics" VALUES(14,'tri-ná-tsatь',14);
INSERT INTO "Phonetics" VALUES(15,'tchi-tir-nа́-tsаtь',15);
INSERT INTO "Phonetics" VALUES(16,'piet-ná-tsаtь',16);
INSERT INTO "Phonetics" VALUES(17,'chеc-ná-tsаtь',17);
INSERT INTO "Phonetics" VALUES(18,'ciem-ná-tsatь',18);
INSERT INTO "Phonetics" VALUES(19,'va-ciem-ná-tsаtь',19);
INSERT INTO "Phonetics" VALUES(20,'die-viet-ná-tsаtь',20);
INSERT INTO "Phonetics" VALUES(21,'dvá-tsatь',21);
INSERT INTO "Phonetics" VALUES(22,'tri-tsatь',22);
INSERT INTO "Phonetics" VALUES(23,'cou-rak',23);
INSERT INTO "Phonetics" VALUES(24,'pietь-di-ciát',24);
INSERT INTO "Phonetics" VALUES(25,'chеicь-di-ciát',25);
INSERT INTO "Phonetics" VALUES(26,'ciémь-di-ciát',26);
INSERT INTO "Phonetics" VALUES(27,'voucieimʲdieicieit',27);
INSERT INTO "Phonetics" VALUES(28,'dieivieinoucta',28);
INSERT INTO "Phonetics" VALUES(29,'ctou',29);
INSERT INTO "Phonetics" VALUES(30,'dviéc-ti',30);
INSERT INTO "Phonetics" VALUES(31,'tric-ta',31);
INSERT INTO "Phonetics" VALUES(32,'tchitiы.ri.cta',32);
INSERT INTO "Phonetics" VALUES(33,'piet-cо́t',33);
INSERT INTO "Phonetics" VALUES(34,'chеcь-cо́t',34);
INSERT INTO "Phonetics" VALUES(35,'ciemь-cót',35);
INSERT INTO "Phonetics" VALUES(36,'vou-ciemь-cót',36);
INSERT INTO "Phonetics" VALUES(37,'dié-vitь-cót',37);
INSERT INTO "Phonetics" VALUES(38,'tiы-ci-tchа́',38);
INSERT INTO "Phonetics" VALUES(39,'mi-li-оun',39);
INSERT INTO "Phonetics" VALUES(40,'mi-li-árt',40);
INSERT INTO "Phonetics" VALUES(41,'tri-li-oun',41);
INSERT INTO "Phonetics" VALUES(42,'mouj plán',83);
INSERT INTO "Phonetics" VALUES(43,'májá mi-tchtá',84);
INSERT INTO "Phonetics" VALUES(44,'maiou richenьije',85);
INSERT INTO "Phonetics" VALUES(45,'mai diéjctvia',86);
INSERT INTO "Phonetics" VALUES(46,'tvój plán',87);
INSERT INTO "Phonetics" VALUES(47,'tvajá mitchtá',88);
INSERT INTO "Phonetics" VALUES(48,'tvaiou richenьije',89);
INSERT INTO "Phonetics" VALUES(49,'tvai mit͡chti',90);
INSERT INTO "Phonetics" VALUES(50,'iévou plán',91);
INSERT INTO "Phonetics" VALUES(51,'iévou mitchtá',92);
INSERT INTO "Phonetics" VALUES(52,'iévou richenьije',93);
INSERT INTO "Phonetics" VALUES(53,'iévou pláni',94);
INSERT INTO "Phonetics" VALUES(54,'iéiou plán',95);
INSERT INTO "Phonetics" VALUES(55,'iéiou mitchtá',96);
INSERT INTO "Phonetics" VALUES(56,'iéiou richenьije',97);
INSERT INTO "Phonetics" VALUES(57,'iéiou pláni',98);
INSERT INTO "Phonetics" VALUES(58,'iévou tcviét',99);
INSERT INTO "Phonetics" VALUES(59,'iévou tsiná',100);
INSERT INTO "Phonetics" VALUES(60,'iévou aknou',101);
INSERT INTO "Phonetics" VALUES(61,'iévou tcvitá',102);
INSERT INTO "Phonetics" VALUES(62,'nách plán',103);
INSERT INTO "Phonetics" VALUES(63,'nácha mitchtá',104);
INSERT INTO "Phonetics" VALUES(64,'náchi richenьije',105);
INSERT INTO "Phonetics" VALUES(65,'náchi diéjctvia',106);
INSERT INTO "Phonetics" VALUES(66,'vách plán',107);
INSERT INTO "Phonetics" VALUES(67,'vácha mitchtá',108);
INSERT INTO "Phonetics" VALUES(68,'váchi richenьije',109);
INSERT INTO "Phonetics" VALUES(69,'váchi richenьija',110);
INSERT INTO "Phonetics" VALUES(70,'irr plán',111);
INSERT INTO "Phonetics" VALUES(71,'irr mitchtá',112);
INSERT INTO "Phonetics" VALUES(72,'irr richenьije',113);
INSERT INTO "Phonetics" VALUES(73,'irr mitchti',114);
INSERT INTO "Phonetics" VALUES(74,'mu-chi-na',147);
INSERT INTO "Phonetics" VALUES(75,'jen-chi-na',148);
INSERT INTO "Phonetics" VALUES(76,'málь-tchik',149);
INSERT INTO "Phonetics" VALUES(77,'dié-va-tchka',150);
INSERT INTO "Phonetics" VALUES(78,'padractouk',151);
INSERT INTO "Phonetics" VALUES(79,'ribʲounak',152);
INSERT INTO "Phonetics" VALUES(80,'mladʲénьits',153);
INSERT INTO "Phonetics" VALUES(81,'tchilaviék',154);
INSERT INTO "Phonetics" VALUES(82,'lьitcá farmálьna',155);
INSERT INTO "Phonetics" VALUES(83,'lьudi',156);
INSERT INTO "Phonetics" VALUES(84,'much',157);
INSERT INTO "Phonetics" VALUES(85,'je-ná',158);
INSERT INTO "Phonetics" VALUES(86,'cьin',159);
INSERT INTO "Phonetics" VALUES(87,'dou-tch',160);
INSERT INTO "Phonetics" VALUES(88,'brát',161);
INSERT INTO "Phonetics" VALUES(89,'ci-ctrá',162);
INSERT INTO "Phonetics" VALUES(90,'á-tьié-tc',163);
INSERT INTO "Phonetics" VALUES(91,'mátь',164);
INSERT INTO "Phonetics" VALUES(92,'dié-du-chka',165);
INSERT INTO "Phonetics" VALUES(93,'bá-bu-chka',166);
INSERT INTO "Phonetics" VALUES(94,'diá-dia',167);
INSERT INTO "Phonetics" VALUES(95,'tьiou-tia',168);
INSERT INTO "Phonetics" VALUES(96,'plьi-miá-nьik',169);
INSERT INTO "Phonetics" VALUES(97,'plьi-miá-nьitsa',170);
INSERT INTO "Phonetics" VALUES(98,'iá rá-bou-tá-iu',195);
INSERT INTO "Phonetics" VALUES(99,'teь rá-bou-tái-éch',196);
INSERT INTO "Phonetics" VALUES(100,'oun rа́-bou-tái-ét',197);
INSERT INTO "Phonetics" VALUES(101,'mi raboutáiém',198);
INSERT INTO "Phonetics" VALUES(102,'vi raboutáiétьi',199);
INSERT INTO "Phonetics" VALUES(103,'anьi raboutájut',200);
INSERT INTO "Phonetics" VALUES(104,'oun raboutal',201);
INSERT INTO "Phonetics" VALUES(105,'aná raboutala',202);
INSERT INTO "Phonetics" VALUES(106,'anou raboutala',203);
INSERT INTO "Phonetics" VALUES(107,'iá pa-ra-bou-tá-iu',207);
INSERT INTO "Phonetics" VALUES(108,'ti paraboutáiéch',208);
INSERT INTO "Phonetics" VALUES(109,'oun paraboutáiét',209);
INSERT INTO "Phonetics" VALUES(110,'mi paraboutáiém',210);
INSERT INTO "Phonetics" VALUES(111,'vi paraboutáiétьi',211);
INSERT INTO "Phonetics" VALUES(112,'anьi paraboutájut',212);
INSERT INTO "Phonetics" VALUES(113,'já gavarʲu',213);
INSERT INTO "Phonetics" VALUES(114,'ti gavourich',214);
INSERT INTO "Phonetics" VALUES(115,'oun gavarit',215);
INSERT INTO "Phonetics" VALUES(116,'mi gavarim',216);
INSERT INTO "Phonetics" VALUES(117,'vi gavaritьi',217);
INSERT INTO "Phonetics" VALUES(118,'anьi gavariát',218);
INSERT INTO "Phonetics" VALUES(119,'oun gavaril',219);
INSERT INTO "Phonetics" VALUES(120,'aná gavarila',220);
INSERT INTO "Phonetics" VALUES(121,'anou gavarila',221);
INSERT INTO "Phonetics" VALUES(122,'já pagavourʲu',225);
INSERT INTO "Phonetics" VALUES(123,'ti pagavourich',226);
INSERT INTO "Phonetics" VALUES(124,'oun pagavourit',227);
INSERT INTO "Phonetics" VALUES(125,'mi pagavourim',228);
INSERT INTO "Phonetics" VALUES(126,'vi pagavouritьi',229);
INSERT INTO "Phonetics" VALUES(127,'anьi pagavouriát',230);
INSERT INTO "Phonetics" VALUES(128,'já ɕáclьif',267);
INSERT INTO "Phonetics" VALUES(129,'mnьe gructna',268);
INSERT INTO "Phonetics" VALUES(130,'já zánьit',269);
INSERT INTO "Phonetics" VALUES(131,'já uctál',270);
INSERT INTO "Phonetics" VALUES(132,'já napichu tьibié',271);
INSERT INTO "Phonetics" VALUES(133,'já atprávʲlьu tьibié cabɕenьije',272);
INSERT INTO "Phonetics" VALUES(134,'já iédu na pajézdi',273);
INSERT INTO "Phonetics" VALUES(135,'já palьet͡chu',274);
INSERT INTO "Phonetics" VALUES(136,'já pajédu na pajézdi',275);
INSERT INTO "Phonetics" VALUES(137,'já pajédu na aftoubuci',276);
INSERT INTO "Phonetics" VALUES(138,'já prijexal na pajézdi',277);
INSERT INTO "Phonetics" VALUES(139,'já prijexal na aftoubuci',278);
INSERT INTO "Phonetics" VALUES(140,'já prilьitьel na camalьoutьi',279);
INSERT INTO "Phonetics" VALUES(141,'já xatchu pitsu',280);
INSERT INTO "Phonetics" VALUES(142,'já prinьec tьibié padárak',281);
INSERT INTO "Phonetics" VALUES(143,'já prinьicu tьibié padárak',282);
INSERT INTO "Phonetics" VALUES(144,'já patьiriál cvii klьutchi',283);
INSERT INTO "Phonetics" VALUES(145,'já nachoul cvii klьutchi',284);
INSERT INTO "Phonetics" VALUES(146,'já iɕu cvouj tьilьifoun',285);
INSERT INTO "Phonetics" VALUES(147,'ti vidil mouj tьilьifoun',286);
INSERT INTO "Phonetics" VALUES(148,'já paprabuju iéɕou rác',287);
INSERT INTO "Phonetics" VALUES(149,'tьibié nujná poumɕ',288);
INSERT INTO "Phonetics" VALUES(150,'já pavirnul nalьeva',289);
INSERT INTO "Phonetics" VALUES(151,'já pajdu za tabouj',290);
INSERT INTO "Phonetics" VALUES(152,'prinьeci mnьe vadi',291);
INSERT INTO "Phonetics" VALUES(153,'mnьe nrávitsa eta muzika',292);
INSERT INTO "Phonetics" VALUES(154,'já xatchu napicátь knьigu',293);
INSERT INTO "Phonetics" VALUES(155,'moujna zʲdecʲ céctь',294);
INSERT INTO "Phonetics" VALUES(156,'já fctьriétьil cvaix driziéj',295);
INSERT INTO "Phonetics" VALUES(157,'já gavaril c raditьilьimi',296);
INSERT INTO "Phonetics" VALUES(158,'já razgavarivál c brátoum',297);
INSERT INTO "Phonetics" VALUES(159,'ti bictra utchichcia',298);
INSERT INTO "Phonetics" VALUES(160,'ti umnij',299);
INSERT INTO "Phonetics" VALUES(161,'ti gatouf',300);
INSERT INTO "Phonetics" VALUES(162,'já toulьka chtou prinьál duch',301);
INSERT INTO "Phonetics" VALUES(163,'mnьe nujna prinьátь duch',302);
INSERT INTO "Phonetics" VALUES(164,'mnьe nujna piriadiétsa',303);
INSERT INTO "Phonetics" VALUES(165,'xoutchich pazmritьetь fьilm',304);
INSERT INTO "Phonetics" VALUES(166,'vou ckoulka ti zakantchiváiéch raboutu',305);
INSERT INTO "Phonetics" VALUES(167,'vou ckoulka ti natchinaiéch raboutatь',306);
INSERT INTO "Phonetics" VALUES(168,'chtou ti diláiich civoudnьa',307);
INSERT INTO "Phonetics" VALUES(169,'chtou ti diláiich civoudnьa viétchiram',308);
INSERT INTO "Phonetics" VALUES(170,'chtou ti diláiich',309);
INSERT INTO "Phonetics" VALUES(171,'kakii u tьibiá pláni na vixadnii',310);
INSERT INTO "Phonetics" VALUES(172,'xoutchich patantsivatь',311);
INSERT INTO "Phonetics" VALUES(173,'pajdʲoum gulьátь',312);
INSERT INTO "Phonetics" VALUES(174,'já bil f cupirmárkitьi',313);
INSERT INTO "Phonetics" VALUES(175,'já toulьka chtou prichoul iz cupirmárkita',314);
INSERT INTO "Phonetics" VALUES(176,'já idu f cupirmárkit',315);
INSERT INTO "Phonetics" VALUES(177,'já pajdu f cupirmárkit',316);
INSERT INTO "Phonetics" VALUES(178,'já nьimnouga apazdiváju',317);
INSERT INTO "Phonetics" VALUES(179,'já apazdiváju',318);
INSERT INTO "Phonetics" VALUES(180,'já outchinь apazdiváju',319);
INSERT INTO "Phonetics" VALUES(181,'mi moujim pajtьi vmiéctьi',320);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('Languages',6);
INSERT INTO "sqlite_sequence" VALUES('Packs',5);
INSERT INTO "sqlite_sequence" VALUES('Meanings',187);
INSERT INTO "sqlite_sequence" VALUES('MeaningPack',187);
INSERT INTO "sqlite_sequence" VALUES('Expressions',374);
INSERT INTO "sqlite_sequence" VALUES('Phonetics',181);
INSERT INTO "sqlite_sequence" VALUES('LanguagePackWithTitle',5);
INSERT INTO "sqlite_sequence" VALUES('Evaluations',1);
INSERT INTO "sqlite_sequence" VALUES('EvaluationExpression',24);
COMMIT;
