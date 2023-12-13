-- BEFORE INSERT Trigger
CREATE OR REPLACE TRIGGER before_insert_trigger
BEFORE INSERT ON YourTableName
FOR EACH ROW
BEGIN
    -- Trigger logic before insert
    -- You can use :NEW.column_name to reference values in the new row being inserted
    -- Your custom logic goes here
END;
/

-- AFTER INSERT Trigger
CREATE OR REPLACE TRIGGER after_insert_trigger
AFTER INSERT ON YourTableName
FOR EACH ROW
BEGIN
    -- Trigger logic after insert
    -- You can use :NEW.column_name to reference values in the new row that has been inserted
    -- Your custom logic goes here
END;
/

