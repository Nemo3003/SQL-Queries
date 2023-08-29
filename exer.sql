CREATE TABLE ECV_PRICE_INNEW (
    id NUMBER,
    price_47 NUMBER,
    price_56 NUMBER,
    deal_wh_92 NUMBER,
    deal_wh_103 NUMBER
);
CREATE TABLE ECV_STOCK_INNEW (
    id NUMBER,
    Quantity NUMBER,
    unlimitedQuantity NUMBER,
    warehouseId NUMBER,
    dateUtcOnBalanceSystem DATE
);
-- Insert 200 sample records into ECV_PRICE_INNEW
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO ECV_PRICE_INNEW (id, price_47, price_56, deal_wh_92, deal_wh_103)
        VALUES (i, DBMS_RANDOM.VALUE(), DBMS_RANDOM.VALUE(), DBMS_RANDOM.VALUE(), DBMS_RANDOM.VALUE());
    END LOOP;
    COMMIT;
END;
/

-- Insert 200 sample records into ECV_STOCK_INNEW
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO ECV_STOCK_INNEW (id, Quantity, unlimitedQuantity, warehouseId, dateUtcOnBalanceSystem)
        VALUES (i, ROUND(DBMS_RANDOM.VALUE() * 100), ROUND(DBMS_RANDOM.VALUE() * 50), ROUND(DBMS_RANDOM.VALUE() * 10), SYSDATE - ROUND(DBMS_RANDOM.VALUE() * 365));
    END LOOP;
    COMMIT;
END;
/

SELECT * FROM ECV_PRICE_INNEW ;
SELECT * FROM ECV_STOCK_INNEW;
