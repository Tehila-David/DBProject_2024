CREATE OR REPLACE PROCEDURE update_tax_price (
    p_tax_id IN NUMBER, 
    p_amount IN NUMBER
)
IS
    v_remaining_amount NUMBER := p_amount;  -- Initialize remaining amount to the given amount
    v_debt_to_pay NUMBER;  -- Variable to hold debt amount
    v_debt_id debt.debt_id%TYPE;  -- Variable to hold generated debt ID
    tax_account_not_found EXCEPTION;  -- Exception for tax account not found
    v_exists NUMBER;  -- Flag to check existence of debt ID
    
    -- Cursor to fetch tax price from tax_account
    CURSOR c_tax_account_price IS
        SELECT tax_price
        FROM tax_account
        WHERE tax_id = p_tax_id;
        
BEGIN
    -- Open cursor to fetch tax price
    OPEN c_tax_account_price;
    FETCH c_tax_account_price INTO v_debt_to_pay;
  
    -- Check if tax account exists
    IF c_tax_account_price%NOTFOUND THEN
        CLOSE c_tax_account_price;
        raise tax_account_not_found;  -- Raise exception if tax account not found
    END IF;
    CLOSE c_tax_account_price;
    
    v_debt_id := 1000000000;  -- Start with initial debt ID
    
    -- Loop to find a unique debt ID
    LOOP
        -- Check if debt ID already exists in Debt table
        SELECT COUNT(*)
        INTO v_exists
        FROM Debt
        WHERE debt_id = v_debt_id;
        
        -- Exit loop if debt ID does not exist in Debt table
        IF v_exists = 0 THEN
            EXIT;
        END IF;
        
        v_debt_id := v_debt_id + 1;  -- Increment debt ID for the next check
    END LOOP;
    
    -- Output message for the created unique debt ID
    dbms_output.put_line('Unique Key - debt_id is created: ' || v_debt_id);
    
    -- Insert into Debt table
    INSERT INTO Debt (debt_id, debt_price, debt_create, debt_last_date, tax_id)
    VALUES (v_debt_id, v_debt_to_pay, TRUNC(SYSDATE), ADD_MONTHS(TRUNC(SYSDATE), 12), p_tax_id);
  
    -- Update tax_price in Tax_Account table
    UPDATE Tax_Account
    SET tax_price = v_remaining_amount
    WHERE tax_id = p_tax_id;
    
    COMMIT;  -- Commit transaction
    
    -- Output message for successful tax price update
    DBMS_OUTPUT.PUT_LINE('Tax price updated successfully for tax_id: ' || p_tax_id );
    
EXCEPTION
    WHEN tax_account_not_found THEN
        dbms_output.put_line('Error: Tax Account not found');  -- Handle exception for tax account not found
END update_tax_price;
/
