UPDATE SPONSORI
SET ID_PACHET = 3
WHERE ID_PROIECT IN (SELECT ID_PROIECT
                    FROM PROIECT
                    WHERE SCOP = 'Caritabil');
