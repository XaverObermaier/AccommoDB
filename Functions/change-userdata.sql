UPDATE users 
SET 
    first_name = 'new_first_name',
    last_name = 'new_last_name',
    gender = 'new_gender',
    birthday = 'new_birthday',
    description = 'new_description',
    email = 'new_email',
    telephone = 'new_telephone'
WHERE username = 'username';

