CREATE TABLE YourTableName (
    -- Primary Key
    IdColumnName NUMBER(4) PRIMARY KEY,
    
    -- String Data Types
    varcharColumn VARCHAR2(50),
    charColumn CHAR(10),
    
    -- Numeric Data Types
    numericColumn NUMBER(10, 2),
    integerColumn INTEGER,
    
    -- Date/Time Data Type
    dateColumn DATE,
    
    -- Constraints
    notNullColumn VARCHAR2(50) NOT NULL,
    
    -- Default Value
    defaultColumn NUMBER(4) DEFAULT 0,
    
    -- Foreign Key
    foreignKeyId NUMBER(4),
    FOREIGN KEY (foreignKeyId) REFERENCES AnotherTable(anotherTableId),
    
    -- Check Constraint
    CHECK (numericColumn >= 0),
    
    -- Unique Constraint
    UNIQUE (varcharColumn)
);

