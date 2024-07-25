-- Insert 50 meanings in English
INSERT INTO Meanings (meaningEng) VALUES
('Hello'), ('Goodbye'), ('Please'), ('Thank you'), ('Yes'), ('No'),
('Sorry'), ('Excuse me'), ('Good morning'), ('Good night'),
('How are you?'), ('What is your name?'), ('My name is...'), ('Nice to meet you'),
('I do not understand'), ('Do you speak English?'), ('Help!'), ('Where is the bathroom?'),
('I need a doctor'), ('How much is this?'), ('I am lost'), ('Can you help me?'),
('Call the police'), ('I love you'), ('Good afternoon'), ('See you later'),
('Congratulations'), ('Happy Birthday'), ('Merry Christmas'), ('Happy New Year'),
('Happy Easter'), ('Good luck'), ('Cheers'), ('Bon Appétit'), ('Bless you'),
('What time is it?'), ('Where are you from?'), ('I am from...'), ('What do you do?'),
('I am a student'), ('I am a teacher'), ('I am a doctor'), ('I am an engineer'),
('I am a lawyer'), ('I work in...'), ('I am retired'), ('I am unemployed'),
('Can I have the bill, please?'), ('Where can I buy...?'), ('How do I get to...?');

-- Insert languages
INSERT INTO Languages (languageEng, languageNative, languageEngTwoLetters) VALUES
('portuguese', 'Português', 'pt'),
('russian', 'Русский', 'ru'),
('polish', 'Polski', 'pl');

-- Insert expressions for each meaning in Portuguese, Russian, and Polish
INSERT INTO Expressions (text, sound_filename, language_id, meaning_id) VALUES
('Olá', 'hello_pt.mp3', 1, 1), ('Привет', 'hello_ru.mp3', 2, 1), ('Cześć', 'hello_pl.mp3', 3, 1),
('Adeus', 'goodbye_pt.mp3', 1, 2), ('До свидания', 'goodbye_ru.mp3', 2, 2), ('Do widzenia', 'goodbye_pl.mp3', 3, 2),
('Por favor', 'please_pt.mp3', 1, 3), ('Пожалуйста', 'please_ru.mp3', 2, 3), ('Proszę', 'please_pl.mp3', 3, 3),
('Obrigado', 'thankyou_pt.mp3', 1, 4), ('Спасибо', 'thankyou_ru.mp3', 2, 4), ('Dziękuję', 'thankyou_pl.mp3', 3, 4),
('Sim', 'yes_pt.mp3', 1, 5), ('Да', 'yes_ru.mp3', 2, 5), ('Tak', 'yes_pl.mp3', 3, 5),
('Não', 'no_pt.mp3', 1, 6), ('Нет', 'no_ru.mp3', 2, 6), ('Nie', 'no_pl.mp3', 3, 6),
('Desculpe', 'sorry_pt.mp3', 1, 7), ('Извините', 'sorry_ru.mp3', 2, 7), ('Przepraszam', 'sorry_pl.mp3', 3, 7),
('Com licença', 'excuseme_pt.mp3', 1, 8), ('Извините', 'excuseme_ru.mp3', 2, 8), ('Przepraszam', 'excuseme_pl.mp3', 3, 8),
('Bom dia', 'goodmorning_pt.mp3', 1, 9), ('Доброе утро', 'goodmorning_ru.mp3', 2, 9), ('Dzień dobry', 'goodmorning_pl.mp3', 3, 9),
('Boa noite', 'goodnight_pt.mp3', 1, 10), ('Спокойной ночи', 'goodnight_ru.mp3', 2, 10), ('Dobranoc', 'goodnight_pl.mp3', 3, 10),
('Como vai?', 'howareyou_pt.mp3', 1, 11), ('Как дела?', 'howareyou_ru.mp3', 2, 11), ('Jak się masz?', 'howareyou_pl.mp3', 3, 11),
('Qual é o seu nome?', 'whatisyourname_pt.mp3', 1, 12), ('Как тебя зовут?', 'whatisyourname_ru.mp3', 2, 12), ('Jak masz na imię?', 'whatisyourname_pl.mp3', 3, 12),
('Meu nome é...', 'mynameis_pt.mp3', 1, 13), ('Меня зовут...', 'mynameis_ru.mp3', 2, 13), ('Nazywam się...', 'mynameis_pl.mp3', 3, 13),
('Prazer em conhecê-lo', 'nicetomeetyou_pt.mp3', 1, 14), ('Приятно познакомиться', 'nicetomeetyou_ru.mp3', 2, 14), ('Miło cię poznać', 'nicetomeetyou_pl.mp3', 3, 14),
('Eu não entendo', 'idonotunderstand_pt.mp3', 1, 15), ('Я не понимаю', 'idonotunderstand_ru.mp3', 2, 15), ('Nie rozumiem', 'idonotunderstand_pl.mp3', 3, 15),
('Você fala inglês?', 'doyouspeakenglish_pt.mp3', 1, 16), ('Вы говорите по-английски?', 'doyouspeakenglish_ru.mp3', 2, 16), ('Czy mówisz po angielsku?', 'doyouspeakenglish_pl.mp3', 3, 16),
('Ajuda!', 'help_pt.mp3', 1, 17), ('Помогите!', 'help_ru.mp3', 2, 17), ('Pomoc!', 'help_pl.mp3', 3, 17),
('Onde fica o banheiro?', 'wheresthebathroom_pt.mp3', 1, 18), ('Где находится ванная комната?', 'wheresthebathroom_ru.mp3', 2, 18), ('Gdzie jest łazienka?', 'wheresthebathroom_pl.mp3', 3, 18),
('Eu preciso de um médico', 'ineedadoctor_pt.mp3', 1, 19), ('Мне нужен врач', 'ineedadoctor_ru.mp3', 2, 19), ('Potrzebuję lekarza', 'ineedadoctor_pl.mp3', 3, 19),
('Quanto custa isso?', 'howmuchisthis_pt.mp3', 1, 20), ('Сколько это стоит?', 'howmuchisthis_ru.mp3', 2, 20), ('Ile to kosztuje?', 'howmuchisthis_pl.mp3', 3, 20),
('Estou perdido', 'iamlost_pt.mp3', 1, 21), ('Я потерялся', 'iamlost_ru.mp3', 2, 21), ('Zgubiłem się', 'iamlost_pl.mp3', 3, 21),
('Você pode me ajudar?', 'canyouhelpme_pt.mp3', 1, 22), ('Вы можете мне помочь?', 'canyouhelpme_ru.mp3', 2, 22), ('Czy możesz mi pomóc?', 'canyouhelpme_pl.mp3', 3, 22),
('Chame a polícia', 'callthepolice_pt.mp3', 1, 23), ('Вызовите полицию', 'callthepolice_ru.mp3', 2, 23), ('Zadzwoń na policję', 'callthepolice_pl.mp3', 3, 23),
('Eu te amo', 'iloveyou_pt.mp3', 1, 24), ('Я тебя люблю', 'iloveyou_ru.mp3', 2, 24), ('Kocham cię', 'iloveyou_pl.mp3', 3, 24),
('Boa tarde', 'goodafternoon_pt.mp3', 1, 25), ('Добрый день', 'goodafternoon_ru.mp3', 2, 25), ('Dzień dobry', 'goodafternoon_pl.mp3', 3, 25),
('Até logo', 'seeyoulater_pt.mp3', 1, 26), ('До скорого', 'seeyoulater_ru.mp3', 2, 26), ('Do zobaczenia później', 'seeyoulater_pl.mp3', 3, 26),
('Parabéns', 'congratulations_pt.mp3', 1, 27), ('Поздравляю', 'congratulations_ru.mp3', 2, 27), ('Gratulacje', 'congratulations_pl.mp3', 3, 27),
('Feliz aniversário', 'happybirthday_pt.mp3', 1, 28), ('С днем рождения', 'happybirthday_ru.mp3', 2, 28);


-- Insert Packs
INSERT INTO Packs (descriptionEng) VALUES
('Greetings and Farewells'), ('Polite'), ('Personal Information'), ('Common Questions'), ('Emergency Phrases');


INSERT INTO PackMeaning (pack_id, meaning_id) VALUES
-- Greetings and Farewells
(1, 1), -- Hello
(1, 2), -- Goodbye
(1, 9), -- Good morning
(1, 10), -- Good night
(1, 25), -- Good afternoon
(1, 26), -- See you later

-- Polite Expressions
(2, 3), -- Please
(2, 4), -- Thank you
(2, 7), -- Sorry
(2, 8), -- Excuse me
(2, 27), -- Congratulations
(2, 28), -- Happy Birthday
(2, 29), -- Merry Christmas
(2, 30), -- Happy New Year
(2, 31), -- Happy Easter
(2, 32), -- Good luck
(2, 33), -- Cheers
(2, 34), -- Bon Appétit
(2, 35), -- Bless you
(2, 24), -- I love you

-- Personal Information
(3, 12), -- My name is...
(3, 19), -- I need a doctor
(3, 37), -- I am from...
(3, 39), -- I am a student
(3, 40), -- I am a teacher
(3, 41), -- I am a doctor
(3, 42), -- I am an engineer
(3, 43), -- I am a lawyer
(3, 44), -- I work in...
(3, 45), -- I am retired
(3, 46), -- I am unemployed

-- Common Questions
(4, 11), -- How are you?
(4, 13), -- Nice to meet you
(4, 36), -- What time is it?
(4, 38), -- Where are you from?
(4, 14), -- I do not understand
(4, 15), -- Do you speak English?
(4, 48), -- Where can I buy...?
(4, 49), -- How do I get to...?
(4, 20), -- How much is this?

-- Emergency Phrases
(5, 17), -- Help!
(5, 18), -- Where is the bathroom?
(5, 21), -- I am lost
(5, 22), -- Can you help me?
(5, 23), -- Call the police
(5, 47); -- Can I have the bill, please?

-- Insert Evaluations with type and goal
INSERT INTO Evaluations (type, goal, start, end, size) VALUES
('Pack', 'speak', '2024-06-27 10:00:00', '2024-06-27 12:00:00', 20),
('Test', 'speak', '2024-06-28 09:00:00', '2024-06-28 11:00:00', 55),
('Review', 'listen', '2024-06-29 13:00:00', '2024-06-29 15:00:00', 34);

-- Insert phonetics for expressions in Portuguese
INSERT INTO Phonetics (text, language_id, expression_id) VALUES
('zádz-vun ná pó-li-tcion', 1, 69), ('adeus', 1, 2), ('tshé-shtsh', 1, 3), ('uˈbɾiɡadu', 1, 4), ('sĩ', 1, 5),
('nɐ̃w̃', 1, 6), ('dɛsˈkulpɐ', 1, 7), ('kõ liˈsen.ʧɐ', 1, 16), ('ˈaj.dɐ ˈpoʃu daʁ aˈju.dɐɾ', 1, 22);

-- Insert phonetics for expressions in Russian
INSERT INTO Phonetics (text, language_id, expression_id) VALUES
('pri-viet', 2, 1), ('da svʲɪdʲɪˈanʲɪjə', 2, 2), ('paˈʐalʊjstə', 2, 3), ('spɐˈsʲibə', 2, 4), ('da', 2, 5),
('nʲet', 2, 6), ('izvʲiˈnitʲɪ', 2, 7), ('vʲɪ goˈvʲorʲʉ pɐ ˈanɡʲɪlʲiskʲɪ', 2, 16), ('vɨ mɐˈʂɛtʲe mnʲe pɐˈmɔʨɪtʲ', 2, 22);

-- Insert phonetics for expressions in Polish
INSERT INTO Phonetics (text, language_id, expression_id) VALUES
('ˈʧɛɕt͡ɕ', 3, 1), ('dɔ sviˈdajɛnja', 3, 2), ('ˈprɔʃɛ', 3, 3), ('jɛnki', 3, 4), ('tak', 3, 5),
('ɲɛt', 3, 6), ('pʂɛpɾaˈʂam', 3, 7), ('t͡ʂɨ ˈmɔʐɛɕ po aŋˈɡjɛlsku', 3, 16), ('ˈt͡ʂɨ mɔʃɛɕ mi pɔˈmɔt͡ʂ', 3, 22);


-- Insert Evaluations with type and goal
INSERT INTO Evaluations (type, goal, start, end, size) VALUES
('Pack', 'speak', '2024-06-27 10:00:00', '2024-06-27 12:00:00', 20),
('Test', 'speak', '2024-06-28 09:00:00', '2024-06-28 11:00:00', 12),
('Review', 'listen', '2024-06-29 13:00:00', '2024-06-29 15:00:00', 55);


-- Insert ExpressionEvaluation entries with grades from 0 to 2

-- For expressions related to Pack evaluation (Evaluation ID: 1)
INSERT INTO EvaluationExpression (expression_id, evaluation_id, grade, duration)
VALUES
(1, 1, 1, 120), (2, 1, 1, 120), (3, 1, 2, 120), (4, 1, 1, 120), (5, 1, 2, 120),
(6, 1, 0, 120), (7, 1, 1, 120), (16, 1, 1, 120), (22, 1, 2, 120);

-- For expressions related to Test evaluation (Evaluation ID: 2)
INSERT INTO EvaluationExpression (expression_id, evaluation_id, grade, duration)
VALUES
(1, 2, 2, 180), (2, 2, 1, 180), (3, 2, 2, 180), (4, 2, 1, 180), (5, 2, 2, 180),
(6, 2, 1, 180), (7, 2, 0, 180), (16, 2, 2, 180), (22, 2, 1, 180);

-- For expressions related to Review evaluation (Evaluation ID: 3)
INSERT INTO EvaluationExpression (expression_id, evaluation_id, grade, duration)
VALUES
(1, 3, 1, 90), (2, 3, 0, 90), (3, 3, 2, 90), (4, 3, 1, 90), (5, 3, 2, 90),
(6, 3, 1, 90), (7, 3, 0, 90), (16, 3, 1, 90), (22, 3, 2, 90);

INSERT INTO PackTitleLanguage (pack_id, language_id, title) VALUES
-- Portuguese translations
(1, 1, 'Cumprimentos e Despedidas'),
(2, 1, 'Polidez'),
(3, 1, 'Informações Pessoais'),
(4, 1, 'Perguntas Comuns'),
(5, 1, 'Frases de Emergência'),

-- Russian translations
(1, 2, 'Приветствия и Прощания'),
(2, 2, 'Вежливость'),
(3, 2, 'Личная Информация'),
(4, 2, 'Обычные Вопросы'),
(5, 2, 'Экстренные Фразы'),

-- Polish translations
(1, 3, 'Powitania i Pożegnania'),
(2, 3, 'Grzecznościowe'),
(3, 3, 'Informacje Osobiste'),
(4, 3, 'Powszechne Pytania'),
(5, 3, 'Zwroty Awaryjne');

