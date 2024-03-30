-- Create or Replace View "accommodation_amenities_view"
CREATE OR REPLACE VIEW accommodation_amenities_view AS
SELECT
    a.accommodationID,
    a.accommodation_name,
    a.country,
    a.city_code,
    a.city,
    a.street,
    a.number,
    a.price,
    a.payment,
    a.description,
    a.category,
    a.number_of_rooms,
    a.available_slots,
    string_agg(am.Name, ', ') AS amenities
FROM
    accommodation a
LEFT JOIN
    accommodation_amenities aa ON a.accommodationID = aa.accommodationID
LEFT JOIN
    amenity am ON aa.amenityID = am.amenityID
GROUP BY
    a.accommodationID,
    a.accommodation_name,
    a.country,
    a.city_code,
    a.city,
    a.street,
    a.number,
    a.price,
    a.payment,
    a.description,
    a.category,
    a.number_of_rooms,
    a.available_slots;
