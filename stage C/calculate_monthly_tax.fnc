CREATE OR REPLACE FUNCTION calculate_monthly_tax(p_asset_id IN asset.asset_id%TYPE)
RETURN NUMBER IS
    v_annual_tax NUMBER := 0;
    v_asset_area asset.asset_area%TYPE;
    v_asset_type asset.asset_type%TYPE;
    v_tax_rate NUMBER;
    v_discount_percent discount.discount_percent%TYPE := 0;
    Asset_not_found EXCEPTION;
    
    -- Cursor to fetch asset details
    CURSOR c_asset IS
        SELECT asset_area, asset_type
        FROM Asset
        WHERE asset_id = p_asset_id;
        
    -- Cursor to fetch discount information for the asset
    CURSOR c_discount IS
        SELECT discount_percent
        FROM Discount 
        NATURAL JOIN Resident 
        NATURAL JOIN Ownership 
        WHERE asset_id = p_asset_id;
       
BEGIN
    -- Fetch asset details
    OPEN c_asset;
    FETCH c_asset INTO v_asset_area, v_asset_type;
  
    -- Check if asset exists
    IF c_asset%NOTFOUND THEN
        CLOSE c_asset;
        RAISE Asset_not_found;
    END IF;
    CLOSE c_asset;
    
    -- Determine tax rate based on asset type
    CASE v_asset_type
        WHEN 'Hotel' THEN v_tax_rate := 0.50;
        WHEN 'office' THEN v_tax_rate := 0.40;
        WHEN 'land' THEN v_tax_rate := 0.30;
        WHEN 'Apartment' THEN v_tax_rate := 2;
        ELSE v_tax_rate := 0.20;
    END CASE;
    
    -- Calculate base tax
    v_annual_tax := v_asset_area * v_tax_rate;
    
    -- Apply discount if any
    OPEN c_discount;
    FETCH c_discount INTO v_discount_percent;
    CLOSE c_discount;
    
    -- Apply discount to the tax amount
    IF v_discount_percent > 0 THEN
        v_annual_tax := v_annual_tax * (1 - v_discount_percent / 100);
    END IF;
  
    -- Output the final tax amount
    DBMS_OUTPUT.PUT_LINE('The final tax amount is ' || v_annual_tax);
    RETURN v_annual_tax;
   
EXCEPTION
    -- Handle case when asset is not found
    WHEN Asset_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: Asset not found');
END;
/
