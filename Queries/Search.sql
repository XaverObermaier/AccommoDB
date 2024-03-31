DO $$ 
DECLARE 
    entered_search VARCHAR(255) := 'Search for Accomodation';  
    search_results RECORD; 
BEGIN 
    
    FOR search_results IN public.search_homes(entered_search) LOOP
        RAISE NOTICE 'Home ID: %, Name: %, Description: %, Price: %, City: %', search_results.home_id, search_results.home_name, search_results.home_description, search_results.home_price, search_results.home_city;
    END LOOP;
END $$; 
