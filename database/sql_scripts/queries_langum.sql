WITH filtered_evaluations AS (
    SELECT EE.*,
           ROW_NUMBER() OVER (
               PARTITION BY EE.expression_id, EE.language_skill
               ORDER BY EE.id DESC
           ) AS rn
    FROM main.EvaluationExpression EE
),
ranked_evaluations AS (
    SELECT PM.pack_id        AS pack_id,
           E.text            AS expression_text,
           E.sound_filename  AS expression_sound,
           E.language_id     AS language_id,
           P.text            AS expression_phonetic,
           M.id              AS meaning_id,
           LPWT.title        AS pack_title,
           E.id              AS expression_id,
           P.id              AS phonetic_id,
           FE.grade          AS grade,
           FE.language_skill AS language_skill,
           FE.created_at     AS created_at,
           FE.id             AS expressionEvaluation_id,
           FE.duration       AS duration,
           FE.rn             AS rn
    FROM Meanings M
    JOIN Expressions E ON M.id = E.meaning_id
    JOIN Languages L ON E.language_id = L.id
    JOIN MeaningPack PM ON PM.meaning_id = M.id
    LEFT JOIN Phonetics P ON E.id = P.expression_id
    LEFT JOIN LanguagePackWithTitle LPWT on PM.pack_id = LPWT.pack_id
    LEFT JOIN filtered_evaluations FE on E.id = FE.expression_id AND FE.rn <= 3
    WHERE L.id IN (:target_language_id, :base_language_id)
      AND LPWT.language_id = :base_language_id
)
SELECT *
FROM ranked_evaluations
ORDER BY pack_id, expression_id, language_skill, expressionEvaluation_id ;






SELECT PM.pack_id AS pack_id,
    E.text            AS expression_text,
    E.sound_filename  AS expression_sound,
    E.language_id     AS language_id,
    P.text            AS expression_phonetic,
    M.id              AS meaning_id,
    LPWT.title        AS pack_title,
    E.id              AS expression_id,
    P.id              AS phonetic_id,
    EE.grade          AS grade,
    EE.language_skill AS language_skill,
    EE.created_at     AS created_at

FROM Meanings M
  JOIN Expressions E ON M.id = E.meaning_id
  JOIN Languages L ON E.language_id = L.id
  JOIN MeaningPack PM ON PM.meaning_id = M.id
  LEFT JOIN Phonetics P ON E.id = P.expression_id
  LEFT JOIN LanguagePackWithTitle LPWT on PM.pack_id = LPWT.pack_id
  LEFT JOIN main.EvaluationExpression EE on E.id = EE.expression_id
WHERE L.id IN (:target_language_id, :base_language_id)
    and LPWT.language_id = :base_language_id;

SELECT PM.pack_id       AS pack_id,
       E.text           AS expression_text,
       E.sound_filename AS expression_sound,
       E.language_id    AS language_id,
       P.text           AS expression_phonetic,
       M.id             AS meaning_id,
       LPWT.title        AS pack_title,
       E.id             AS expression_id,
       P.id             AS phonetic_id,
       EE.created_at    AS created_at,
       EE.grade         AS grade,
       EE.language_skill AS language_skill

FROM Meanings M
         JOIN Expressions E ON M.id = E.meaning_id
         JOIN Languages L ON E.language_id = L.id
         JOIN MeaningPack PM ON PM.meaning_id = M.id
         LEFT JOIN LanguagePackWithTitle LPWT on PM.pack_id = LPWT.pack_id
        LEFT JOIN Phonetics P ON E.id = P.expression_id
        LEFT JOIN EvaluationExpression ee ON EE.expression_id = E.id


WHERE L.id IN (:target_language_id, :base_language_id)
  and LPWT.language_id = :base_language_id;


-- :base_language_id and :target_language_id are placeholders for your actual language IDs
SELECT
    p.id AS pack_id,
    lp.title AS pack_title,
    e.id AS expression_id,
    e.text AS expression_text,
    e.language_id AS expression_language_id,
    ee.id AS evaluation_id,
    ee.grade,
    ee.duration,
    ee.language_skill,
    ee.created_at
FROM Packs p
JOIN LanguagePackWithTitle lp ON lp.pack_id = p.id
JOIN MeaningPack mp ON mp.pack_id = p.id
JOIN Expressions e ON e.meaning_id = mp.meaning_id
JOIN Languages l ON e.language_id = l.id
LEFT JOIN EvaluationExpression ee ON ee.expression_id = e.id
WHERE lp.language_id IN (:base_language_id, :target_language_id)
  AND e.language_id IN (:base_language_id, :target_language_id)
ORDER BY
    p.id,
    e.id,
    ee.created_at;


-- SELECT DISTINCT *
-- FROM Meanings M
--          JOIN Expressions E ON M.id = E.meaning_id
--          JOIN Languages L on E.language_id = L.id
--          Join PackMeaning PM on PM.meaning_id == E.id
--          Join EvaluationExpression EE on e.id = EE.expression_id
-- WHERE E.language_id = 1; -- Replace ? with the desired language ID or use a parameterized query
--
--
-- SELECT E.text           as text,
--        E.sound_filename as sound,
--        E.id             as id_expression
-- FROM Meanings M
--          JOIN Expressions E ON M.id = E.meaning_id
--          JOIN Languages L on E.language_id = L.id
--          Join PackMeaning PM on PM.meaning_id == E.id
--          Join EvaluationExpression EE on e.id = EE.expression_id
-- WHERE E.language_id in (?, ?);
--
-- SELECT *
-- FROM Meanings M
--          JOIN Expressions E ON M.id = E.meaning_id
--          JOIN Languages L on E.language_id = L.id
--          LEFT JOIN Phonetics P on E.id = P.expression_id and L.id = P.language_id
--          Join PackMeaning PM on PM.meaning_id == E.id
-- WHERE E.language_id in (1, 2);
--
-- SELECT PM.pack_id       AS pack_id,
--        E.text           AS expression_text,
--        E.sound_filename AS expression_sound,
--        E.language_id    AS language_id,
--        P.text           AS expression_phonetic,
--        M.id             AS meaning_id,
--        PTL.title        AS pack_title,
--        E.id             AS expression_id,
--        P.id             AS phonetic_id
--
--
-- FROM Meanings M
--          JOIN Expressions E ON M.id = E.meaning_id
--          JOIN Languages L ON E.language_id = L.id
--          LEFT JOIN Phonetics P ON E.id = P.expression_id AND 1 = P.language_id
--          JOIN PackMeaning PM ON PM.meaning_id = M.id
--          LEFT JOIN PackTitleLanguage PTL on PM.pack_id = PTL.pack_id
-- WHERE L.id IN (2, 1)
--   and PTL.language_id = 1;
--
-- SELECT PM.pack_id       AS pack_id,
--        E.text           AS expression_text,
--        E.sound_filename AS expression_sound,
--        E.language_id    AS language_id,
--        P.text           AS expression_phonetic,
--        M.id             AS meaning_id,
--        PTL.title        AS pack_title,
--        P.id             AS phonetic_id
--
-- FROM Meanings M
--          JOIN Expressions E ON M.id = E.meaning_id
--          JOIN Languages L ON E.language_id = L.id
--          LEFT JOIN Phonetics P ON E.id = P.expression_id AND 1 = P.language_id
--          JOIN PackMeaning PM ON PM.meaning_id = M.id
--          LEFT JOIN PackTitleLanguage PTL on PM.pack_id = PTL.pack_id
-- WHERE L.id IN (2, 1)
--   and PTL.language_id = 1;
--
--
-- SELECT *
-- FROM PackMeaning PM;
--
-- select *
-- from Phonetics P
--          JOIN Expressions E on E.id = P.expression_id
-- where P.language_id = 1
--   and E.language_id = 1;
--
-- SELECT E.id    AS id,
--        E.start AS eval_start,
--        e.end   AS eval_end,
--        E.goal  AS goal,
--        E.type  AS type
-- FROM Evaluations E;
--
-- SELECT EE.id AS id,
--        EE.expression_id AS expression_id,
--        EE.evaluation_id AS evaluation_id,
--        EE.duration  AS evaluation_duration,
--        EE.grade AS evaluation_grade
-- FROM EvaluationExpression EE WHERE evaluation_id = 1;
--
-- SELECT *
-- FROM Expressions
-- WHERE language_id = 2;

PRAGMA encoding;
