CREATE OR REPLACE VIEW user_profile AS 
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email,
    users.phone AS user_phone,
    users.birthday AS user_birthday,
    profiles.description AS user_description
FROM 
    users 
JOIN 
    profiles ON users.id = profiles.user_id;
