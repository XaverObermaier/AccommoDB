-- Active: 1709605227160@@dpg-cmivl7f109ks739oufi0-a.singapore-postgres.render.com@5432@postgres@public
CREATE OR REPLACE FUNCTION public.list_accommodations(entered_user VARCHAR(255))
RETURNS TABLE (
    accommodation_id INT,
    accommodation_name VARCHAR(255),
    accommodation_description TEXT,
    accommodation_price DECIMAL,
    accommodation_city VARCHAR(255)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id, name, description, price, city 
    FROM accommodations 
    WHERE user_name = entered_user;
END; 
$functions$ 
