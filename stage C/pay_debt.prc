CREATE OR REPLACE PROCEDURE pay_debt(p_debt_id IN debt.debt_id%TYPE)
IS  
    v_tax_id tax_account.tax_id%TYPE;
    v_payment_amount NUMBER;
    v_payment_id Payment.Payment_Id%TYPE;
    v_exists NUMBER; -- Flag for finding payment_id
    debt_not_found EXCEPTION;
    
    -- Cursor to get debt details (debt amount and account id)
    CURSOR c_debt_pay IS
    SELECT tax_id, debt_price
    FROM debt
    WHERE debt_id = p_debt_id;
    
BEGIN
    v_payment_id := 1000000000;
    
    -- Open cursor to fetch debt
    OPEN c_debt_pay;
    FETCH c_debt_pay INTO v_tax_id, v_payment_amount;
    
    -- If debt doesn't exist
    IF c_debt_pay%NOTFOUND THEN
        CLOSE c_debt_pay;
        RAISE debt_not_found;  -- Raise exception if debt not found
    END IF;
    CLOSE c_debt_pay;

    -- Loop to find a unique payment ID
    LOOP
        -- Check if payment ID already exists in payment table
        SELECT COUNT(*)
        INTO v_exists
        FROM Payment
        WHERE payment_id = v_payment_id;
        
        -- Exit loop if payment ID does not exist in Payment table
        IF v_exists = 0 THEN
            EXIT;
        END IF;
        
        v_payment_id := v_payment_id + 1;  -- Increment payment ID for the next check
    END LOOP;
    
    -- Output message for the created unique payment ID
    DBMS_OUTPUT.PUT_LINE('Unique Key - payment_id is created: ' || v_payment_id);

    -- Add a new record to the payment table with the debt amount
    INSERT INTO payment (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
    VALUES (v_payment_id, v_payment_amount, 'Credit', TRUNC(SYSDATE), ADD_MONTHS(TRUNC(SYSDATE), 1), v_tax_id);
    
    -- Delete the record from the debt table
    DELETE FROM debt
    WHERE debt_id = p_debt_id;

    DBMS_OUTPUT.PUT_LINE('Debt and Payment updated successfully for tax_id: ' || v_tax_id 
    || ' Debt_id ' || p_debt_id ||' payment_id ' || v_payment_id);
    
    -- Commit the changes
    COMMIT;

EXCEPTION
   WHEN debt_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: Debt not found');  
END;

