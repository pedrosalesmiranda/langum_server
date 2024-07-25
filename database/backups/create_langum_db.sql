DROP TABLE IF EXISTS EvaluationExpression;
DROP TABLE IF EXISTS PackTitleLanguage;
DROP TABLE IF EXISTS PackMeaning;
DROP TABLE IF EXISTS Evaluations;
DROP TABLE IF EXISTS Packs;
DROP TABLE IF EXISTS Phonetics;
DROP TABLE IF EXISTS Expressions;
DROP TABLE IF EXISTS Languages;
DROP TABLE IF EXISTS Meanings;

CREATE TABLE IF NOT EXISTS Meanings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    meaningEng TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Languages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    languageEng TEXT NOT NULL,
    languageNative TEXT NOT NULL,
    languageEngTwoLetters TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Expressions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    text TEXT NOT NULL,
    sound_filename TEXT NOT NULL,
    language_id INTEGER NOT NULL,
    meaning_id INTEGER NOT NULL,
    FOREIGN KEY (language_id) REFERENCES Languages(id),
    FOREIGN KEY (meaning_id) REFERENCES Meanings(id)
);

CREATE TABLE IF NOT EXISTS Phonetics (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    text TEXT NOT NULL,
    language_id INTEGER NOT NULL,
    expression_id INTEGER NOT NULL,
    FOREIGN KEY (language_id) REFERENCES Languages(id),
    FOREIGN KEY (expression_id) REFERENCES Expressions(id)
);

CREATE TABLE IF NOT EXISTS Packs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descriptionEng TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Evaluations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT NOT NULL,
    goal TEXT NOT NULL,
    start DATETIME NOT NULL,
    end DATETIME NOT NULL,
    size INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS PackMeaning (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pack_id INTEGER NOT NULL,
    meaning_id INTEGER NOT NULL,
    FOREIGN KEY (pack_id) REFERENCES Packs(id),
    FOREIGN KEY (meaning_id) REFERENCES Meanings(id)
);

CREATE TABLE IF NOT EXISTS EvaluationExpression (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    expression_id INTEGER NOT NULL,
    evaluation_id INTEGER NOT NULL,
    grade SMALLINT NOT NULL,
    duration INT NOT NULL,
    FOREIGN KEY (expression_id) REFERENCES Expressions(id),
    FOREIGN KEY (evaluation_id) REFERENCES Evaluations(id)
);

CREATE TABLE IF NOT EXISTS PackTitleLanguage (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pack_id INTEGER NOT NULL,
    language_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    FOREIGN KEY (pack_id) REFERENCES Packs(id),
    FOREIGN KEY (language_id) REFERENCES Languages(id)
);


