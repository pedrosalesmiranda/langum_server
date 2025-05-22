SELECT DISTINCT *
FROM Meanings M
         JOIN Expressions E ON M.id = E.meaning_id
         JOIN Languages L on E.language_id = L.id
         Join PackMeaning PM on PM.meaning_id == E.id
         Join EvaluationExpression EE on e.id = EE.expression_id
WHERE E.language_id = 1; -- Replace ? with the desired language ID or use a parameterized query


SELECT E.text           as text,
       E.sound_filename as sound,
       E.id             as id_expression
FROM Meanings M
         JOIN Expressions E ON M.id = E.meaning_id
         JOIN Languages L on E.language_id = L.id
         Join PackMeaning PM on PM.meaning_id == E.id
         Join EvaluationExpression EE on e.id = EE.expression_id
WHERE E.language_id in (?, ?);

SELECT *
FROM Meanings M
         JOIN Expressions E ON M.id = E.meaning_id
         JOIN Languages L on E.language_id = L.id
         LEFT JOIN Phonetics P on E.id = P.expression_id and L.id = P.language_id
         Join PackMeaning PM on PM.meaning_id == E.id
WHERE E.language_id in (1, 2);

SELECT PM.pack_id       AS pack_id,
       E.text           AS expression_text,
       E.sound_filename AS expression_sound,
       E.language_id    AS language_id,
       P.text           AS expression_phonetic,
       M.id             AS meaning_id,
       PTL.title        AS pack_title,
       E.id             AS expression_id,
       P.id             AS phonetic_id


FROM Meanings M
         JOIN Expressions E ON M.id = E.meaning_id
         JOIN Languages L ON E.language_id = L.id
         LEFT JOIN Phonetics P ON E.id = P.expression_id AND 1 = P.language_id
         JOIN PackMeaning PM ON PM.meaning_id = M.id
         LEFT JOIN PackTitleLanguage PTL on PM.pack_id = PTL.pack_id
WHERE L.id IN (2, 1)
  and PTL.language_id = 1;

SELECT PM.pack_id       AS pack_id,
       E.text           AS expression_text,
       E.sound_filename AS expression_sound,
       E.language_id    AS language_id,
       P.text           AS expression_phonetic,
       M.id             AS meaning_id,
       PTL.title        AS pack_title,
       P.id             AS phonetic_id

FROM Meanings M
         JOIN Expressions E ON M.id = E.meaning_id
         JOIN Languages L ON E.language_id = L.id
         LEFT JOIN Phonetics P ON E.id = P.expression_id AND 1 = P.language_id
         JOIN PackMeaning PM ON PM.meaning_id = M.id
         LEFT JOIN PackTitleLanguage PTL on PM.pack_id = PTL.pack_id
WHERE L.id IN (2, 1)
  and PTL.language_id = 1;


SELECT *
FROM PackMeaning PM;

select *
from Phonetics P
         JOIN Expressions E on E.id = P.expression_id
where P.language_id = 1
  and E.language_id = 1;

SELECT E.id    AS id,
       E.start AS eval_start,
       e.end   AS eval_end,
       E.goal  AS goal,
       E.type  AS type
FROM Evaluations E;

SELECT EE.id AS id,
       EE.expression_id AS expression_id,
       EE.evaluation_id AS evaluation_id,
       EE.duration  AS evaluation_duration,
       EE.grade AS evaluation_grade
FROM EvaluationExpression EE WHERE evaluation_id = 1;

SELECT *
FROM Expressions
WHERE language_id = 2;
