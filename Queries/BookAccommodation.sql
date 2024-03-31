DO $$
DECLARE
    username_input VARCHAR(255) := 'Xaver';  
    accommodation_id_input INT := 1; 
    check_in_date_input DATE := '2024-04-01'; 
    check_out_date_input DATE := '2024-04-08'; 
    people_count_input INT := 2;
    room_count_input INT := 1;  
    booking_result BOOLEAN;
BEGIN
    -- Get book-accommodation Function
    booking_result := book_accommodation(username_input, accommodation_id_input, check_in_date_input, check_out_date_input, people_count_input, room_count_input);
    RAISE NOTICE 'Buchung erfolgreich: %', booking_result;
END $$;
