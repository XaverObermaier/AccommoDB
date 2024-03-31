CREATE OR REPLACE VIEW change_password AS 
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    users.password AS user_password
FROM 
    users;
