-- Active: 1709605227160@@dpg-cmivl7f109ks739oufi0-a.singapore-postgres.render.com@5432@postgres@public
CREATE OR REPLACE FUNCTION public.search_homes(entered_search VARCHAR(255))
RETURNS TABLE (
    home_id INT,
    home_name VARCHAR(255),
    home_description TEXT,
    home_price DECIMAL(10, 2) NOT NULL,
    home_city VARCHAR(100) NOT NULL
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id, name, description, price, city, description
    FROM accomondation 
    WHERE name ILIKE '%' || entered_search || '%' 
    OR description ILIKE '%' || entered_search || '%';
END; 
$functions$ 
