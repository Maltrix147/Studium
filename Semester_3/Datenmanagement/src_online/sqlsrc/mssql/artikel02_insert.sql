USE oshop;
GO

SET IDENTITY_INSERT artikel ON ;
INSERT INTO artikel (artikel_id, bezeichnung, einzelpreis, waehrung, deleted) 
 VALUES 
   (7856, N'Silberzwiebel', CAST(0.510000 AS Decimal(14, 6)), N'EUR', 0)
  ,(7863, N'Tulpenzwiebel', CAST(3.390000 AS Decimal(14, 6)), N'EUR', 0)
  ,(9010, N'Schaufel', CAST(14.950000 AS Decimal(14, 6)), N'USD', 0)
  ,(9015, N'Spaten', CAST(19.900000 AS Decimal(14, 6)), N'EUR', 0)
  ,(3001, N'Papier (100)', CAST(2.300000 AS Decimal(14, 6)), N'EUR', 0)
  ,(3005, N'Tinte (gold)', CAST(55.700000 AS Decimal(14, 6)), N'EUR', 0)
  ,(3006, N'Tinte (rot)', CAST(6.200000 AS Decimal(14, 6)), N'EUR', 0)
  ,(3007, N'Tinte (blau)', CAST(4.130000 AS Decimal(14, 6)), N'EUR', 0)
  ,(3010, N'Feder', CAST(5.000000 AS Decimal(14, 6)), N'EUR', 0);
GO
SET IDENTITY_INSERT artikel OFF ;
GO