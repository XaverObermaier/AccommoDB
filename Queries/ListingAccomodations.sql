DO $$ 
DECLARE 
    entered_user VARCHAR(255) := 'User';  -- Test User here 
    accommodation_list RECORD; 
BEGIN 
    -- Call accommodation listing function 
    FOR accommodation_list IN public.list_accommodations(entered_user) LOOP
        RAISE NOTICE 'Accommodation ID: %, Name: %, Description: %, Price: %, City: %', accommodation_list.accommodation_id, accommodation_list.accommodation_name, accommodation_list.accommodation_description, accommodation_list.accommodation_price, accommodation_list.accommodation_city;
    END LOOP;
END $$; 
