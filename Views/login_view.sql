DO $$
DECLARE
    entered_username VARCHAR(255) := 'User';  -- Test Username here
    entered_password VARCHAR(255) := 'TestPassword';  -- Test Password here 
BEGIN
    EXECUTE '
        CREATE OR REPLACE VIEW public.login_view AS
        SELECT 
            username,
            ''' || entered_password || ''' AS entered_password,
            password_hash AS actual_password,
            public.check_login(''' || entered_username || ''', ''' || entered_password || ''') AS login_success
           
        FROM "public"."user"
    ';
END $$;
