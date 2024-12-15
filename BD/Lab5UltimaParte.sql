--check existing indexes on table Ta--
SELECT
i.name as IndexName,
i.type_desc as IndexType,
OBJECT_NAME(i.object_id) as TableName,
COL_NAME(ic.object_id,ic.column_id) as ColumnName
from sys.indexes as i
INNER JOIN sys.index_columns as ic on i.object_id = ic.object_id AND i.index_id = ic.index_id
where OBJECT_NAME(i.object_id)  = 'Ta'

--clustered index scan, folosit cand vrem sa citim toate sau o portiune mare a tabelului in ordinea indexilor clustered--
SELECT *
from Ta
ORDER by idA;

--clustered index seek, folosit cand cautam o valoare specifica sau un range de valori in lista indexilor clustered--
select *
from Ta
WHERE idA = 5000;

--nonclustered index scan, folosit cand citim toate valorile din lista de indexi nonclustered--
SELECT a2
from Ta 
ORDER by a2

--nonclustered index seek, folosit cand cautam o valoare specifica idn lista de indexi nonclustered
SELECT a2 
FROM Ta 
WHERE a2 = 15000;


--b.)querry ca sa demonstram key lookup, foloseste un index nonclustered index seek urmate de un key lookup ca sa ia si restu coloanelor 
SELECT * 
FROM Ta 
WHERE a2 = 15000;

--c.) fara crearea unui index: clustered index scan , cu index crear atunci : nonclustered index scan + keylookup
SELECT * 
FROM Tb 
WHERE b2 = 353785;


--cream non clustered index --
CREATE NONCLUSTERED INDEX index_Tb_b2 ON Tb(b2);

DROP INDEX index_Tb_b2 ON Tb

--dupa crearea indexului operatorul se va schimba din table scan in index seek si costul estimat cautari in subtree se va face mai mic

--d.) 
-- Join intre Tc si Ta
SELECT * FROM Tc 
INNER JOIN Ta ON Tc.idA = Ta.idA 
WHERE Tc.idA = 5000;


--fara indexi Ta va folosi clustered index seek si Tc clustered index scan
--cu indexi creati Ta va folosi clustered index seek si Tc Index seek + Key Lookup

-- Join intre Tc si Tb
SELECT * FROM Tc 
INNER JOIN Tb ON Tc.idB = Tb.idB 
WHERE Tc.idB = 1500;

--fara indexi Tb va folosi clustered index seek si Tc clustered Index scan
--cu indexi creati Tb va folosi clustered index seek si Tc index seek + Key Lookup

CREATE INDEX index_Tc_idA
ON Tc (idA)

DROP INDEX index_Tc_idA ON Tc


CREATE INDEX index_Tc_idB
ON Tc (idB)

DROP INDEX index_Tc_idB ON Tc









