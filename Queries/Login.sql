DO $$
DECLARE
    entered_username VARCHAR(255) := 'User';  -- Test Username here
    entered_password VARCHAR(255) := 'TestPassword';  -- Test Password here 
    login_success BOOLEAN;
BEGIN
    -- Call login check
    login_success := public.check_login(entered_username, entered_password);

    -- Check if Login was successfull
    IF login_success THEN
        RAISE NOTICE 'Login successful for user: %', entered_username;
    ELSE
        RAISE EXCEPTION 'Login failed for user: %', entered_username;
    END IF;
END $$;
