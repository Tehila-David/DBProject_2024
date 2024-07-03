CREATE OR REPLACE FUNCTION get_resident_debt_history(p_resident_id resident.resident_id%type)
RETURN SYS_REFCURSOR IS
    v_result SYS_REFCURSOR; -- Declare a cursor variable to store the query result
    Debt_not_found EXCEPTION; -- Custom exception for when no debt is found
    dummy_row Debt%ROWTYPE;
BEGIN
    -- Open the cursor and populate it with the query result
    OPEN v_result FOR
        SELECT debt_id, debt_price, debt_create, asset_address, tax_id
        FROM Debt d
        NATURAL JOIN Tax_Account 
        NATURAL JOIN Asset 
        NATURAL JOIN Ownership 
        WHERE resident_id = p_resident_id
        ORDER BY debt_create DESC;
     
    FETCH v_result INTO dummy_row;   
    -- Check if the cursor is empty (no rows found)
    IF dummy_row.debt_id IS NULL THEN
        CLOSE v_result;
        RAISE Debt_not_found; -- Raise the custom exception
    END IF; 

    
    dbms_output.put_line('there is debt');
    RETURN v_result; -- Return the cursor containing the debt history
    
EXCEPTION
    -- Handle the custom exception
    WHEN Debt_not_found THEN
      dbms_output.put_line('Error: Debt not found');
      
END;
