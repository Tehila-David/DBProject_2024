--Program#1
DECLARE
    p_asset_id asset.asset_id%TYPE;
    p_tax_id tax_account.tax_id%TYPE; 
    v_monthly_tax NUMBER;
    v_amount NUMBER;
    
BEGIN
    -- Query to randomly select an asset_id
    SELECT asset_id
    INTO p_asset_id
    FROM ( SELECT asset_id
           FROM Asset
           ORDER BY DBMS_RANDOM.VALUE )
    WHERE ROWNUM = 1;

    -- Call the calculate_monthly_tax function to get the monthly tax
    v_monthly_tax := calculate_monthly_tax(p_asset_id);
    
    DBMS_OUTPUT.PUT_LINE('The monthly tax for asset_id ' || p_asset_id || ' is: ' || v_monthly_tax);

    -- Find the tax account id associated with this asset and store it in a variable
    SELECT tax_id
    INTO p_tax_id
    FROM Tax_account
    NATURAL JOIN ASSET
    WHERE asset_id = p_asset_id;

    -- Set the amount to update in the tax
    v_amount := v_monthly_tax;  -- In this case, we assume the amount is the calculated monthly tax

    -- Call the update_tax_price procedure to update the price
    update_tax_price(p_tax_id, v_amount);
    
    DBMS_OUTPUT.PUT_LINE('Tax price update completed successfully');
    
EXCEPTION
    -- Handle any unexpected errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        ROLLBACK;  -- Rollback transaction for any errors
END;
/
