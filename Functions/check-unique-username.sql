-- Active: 1711727273971@@dpg-co3e3q821fec73900qf0-a.singapore-postgres.render.com@5432@remote_pg_db_j36o@public
DROP FUNCTION check_unique_username;
CREATE OR REPLACE FUNCTION public.check_unique_username(new_username character varying)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
DECLARE
    existing_count INT;
BEGIN
    SELECT COUNT(*) INTO existing_count
    FROM "public"."user"
    WHERE username = new_username;
    
    IF existing_count > 0 THEN
        RAISE EXCEPTION 'User already exists: %', new_username;
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END;
$function$
