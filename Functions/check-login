CREATE OR REPLACE FUNCTION public.check_login(username_input VARCHAR(255), password_input VARCHAR(255))
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $function$
DECLARE
    stored_password_hash VARCHAR(255);
BEGIN
    -- Get Password from right User
    SELECT password_hash INTO stored_password_hash
    FROM "public"."user"
    WHERE username = username_input;

    -- Check if passwords are the same 
    IF stored_password_hash IS NOT NULL AND stored_password_hash = crypt(password_input, stored_password_hash) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$function$;
