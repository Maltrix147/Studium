-- Ausfuehren der vorherigen Befehle
SOURCE listing19.sql

SELECT 'Start listing20.sql //////////////////////////////////////////';
SELECT 'Ggf. Kommentare vor DROP USER wieder löschen';
-- DROP USER
--  'oshop_root'@'%'
-- ,'oshop_root'@'localhost'
-- ,'oshop_user'@'%'
-- ,'oshop_user'@'localhost'
-- ;

CREATE USER
 'oshop_root'@'%'
  IDENTIFIED BY 'root'
 ,'oshop_user'@'%'
  IDENTIFIED BY 'user'
;
CREATE USER
  'oshop_root'@'localhost'
    IDENTIFIED BY 'root'
 ,'oshop_user'@'localhost'
    IDENTIFIED BY 'user'
;

GRANT ALL PRIVILEGES
 ON oshop.*
 TO 'oshop_root'@'%', 'oshop_root'@'localhost'
 WITH GRANT OPTION
;

GRANT INSERT, UPDATE, DELETE, SELECT
 ON TABLE oshop.*
 TO 'oshop_user'@'%', 'oshop_user'@'localhost'
;

REVOKE DELETE
 ON TABLE oshop.* 
 FROM 'oshop_user'@'%', 'oshop_user'@'localhost' 
;
SELECT 'Ende listing20.sql //////////////////////////////////////////';
