--Program#2
DECLARE
    p_resident_id Resident.Resident_Id%TYPE;
    v_cursor SYS_REFCURSOR;
    v_debt_id debt.debt_id%TYPE;
    v_debt_price debt.debt_price%TYPE;
    v_debt_create debt.debt_create%TYPE;
    v_asset_address asset.asset_address%TYPE;
    v_tax_id tax_account.tax_id%TYPE;
    
    debt_id_deleted debt.debt_id%TYPE;
BEGIN
    -- Query to randomly select a resident ID who has debts
    SELECT resident_id
    INTO p_resident_id
    FROM ( SELECT resident_id
           FROM Resident
           WHERE resident_id IN (SELECT resident_id 
                                 FROM debt
                                 NATURAL JOIN tax_account
                                 NATURAL JOIN asset
                                 NATURAL JOIN ownership
                                 NATURAL JOIN resident)
    ORDER BY DBMS_RANDOM.VALUE)
    WHERE ROWNUM = 1;
    
    -- Call the function to get the debt history of the resident
    v_cursor := get_resident_debt_history(p_resident_id);
    
    DBMS_OUTPUT.PUT_LINE('List of debts for Resident ID: ' || p_resident_id);
    
    -- Loop through the cursor to display debt information
    LOOP
        FETCH v_cursor INTO v_debt_id, v_debt_price, v_debt_create, v_asset_address, v_tax_id;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Debt ID: ' || v_debt_id || ', Debt Price: ' || v_debt_price ||
                             ', Debt Create Date: ' || v_debt_create || ', Asset Address: ' ||
                             v_asset_address || ', Tax ID: ' || v_tax_id);
    END LOOP;
    CLOSE v_cursor;
    
    -- Store the last fetched debt_id to be deleted
    debt_id_deleted := v_debt_id;
    DBMS_OUTPUT.PUT_LINE('Debt ID to be deleted from the Debt table: ' || debt_id_deleted);
    
    -- Call the procedure to pay the debt
    pay_debt(debt_id_deleted);
    
    DBMS_OUTPUT.PUT_LINE('Debt with ID ' || debt_id_deleted || ' has been paid.');
    
EXCEPTION
    -- Handle any unexpected errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
