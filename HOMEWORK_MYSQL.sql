-- CREATE DATABASE homework;
use homework;


-- 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

 drop function dataa;
DELIMITER //

CREATE FUNCTION  dataa(seconds int)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(200) ;
	DECLARE days char(3);
	DECLARE hours, minutes, sec char(2);

	SET days = cast(floor(seconds/60/60/24) as char(3));
	SET hours = cast(floor(mod(seconds/60/60/24,1)*24) as char(2));
	SET minutes = cast(floor(mod(mod(seconds/60/60/24,1)*24,1)*60) as char(2));
	SET sec = cast(round(mod(mod(mod(seconds/60/60/24,1)*24,1)*60,1)*60) as char(2));
	SET result = concat(days, "days ", hours, "hours ", minutes, "minutes ", sec, "seconds ");
	RETURN result;
END //
DELIMITER ;


select dataa(123456);





-- 2.	Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

DELIMITER //
CREATE PROCEDURE chet(`start` INT, `end` INT)
BEGIN
	DECLARE i INT DEFAULT `start`;
    DECLARE res_str TEXT DEFAULT NULL;
    WHILE  i<=`end` DO
        IF i%2 = 0 THEN
			IF res_str IS NULL THEN
				SET res_str = concat(i);
			ELSE
				SET res_str = concat(res_str, ', ', i);
			END IF;
		END IF;
        SET i = i + 1;
    END WHILE;
	SELECT res_str;
END //
DELIMITER ;

CALL chet(1, 10);
  





























































