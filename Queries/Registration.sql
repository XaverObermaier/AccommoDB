
-- Registrate User to the Database 
DO $$
DECLARE
    username_valid BOOLEAN;
    password_valid BOOLEAN;
    new_username VARCHAR(255) := 'Friedrich';  -- Change Username here
    new_password VARCHAR(255) := 'Friedemann';  -- Change Password here 
BEGIN
    -- Check if the username is unique
    username_valid := public.check_unique_username(new_username);

    -- Check if the password is at least 8 characters long
    IF length(new_password) >= 8 THEN
        password_valid := TRUE;
    ELSE
        password_valid := FALSE;
    END IF;

    -- Check if the username is unique and the password is valid
    IF username_valid AND password_valid THEN
        -- Insert your SQL code to insert the user into the database here
        INSERT INTO "public"."user" (username, password_hash, firstname, lastname, gender, birthday, description, email, telephone, role)
        VALUES (new_username, hash_password(new_password), 'DB', 'User', 'OTHER', '2003-03-31', 'Hello there - I am testing this amazing application!', 'db.user@gmail.com', '0123456789', 'USER');
        
        -- Perform additional actions here, such as success messages or redirects
        RAISE NOTICE 'User successfully registered!';
    ELSE
        -- Handle error cases where the username already exists or the password is invalid
        IF NOT username_valid THEN
            RAISE EXCEPTION 'Username already exists';
        ELSE
            RAISE EXCEPTION 'Password must be at least 8 characters long';
        END IF;
    END IF;
END $$;

--
