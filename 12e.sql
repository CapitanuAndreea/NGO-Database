SELECT TITLU_TASK,
CASE 
    WHEN STATUS = 'Neinceput' THEN 'Incepe taskul!'
    WHEN STATUS = 'In curs' THEN TO_CHAR(FLOOR(DEADLINE - SYSDATE))
    ELSE 'Felicitari!'
END AS MESAJ
FROM TASK;
