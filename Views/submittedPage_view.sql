DO $$
DECLARE
    user_id VARCHAR(255) := 'User';  -- Test UserID here
BEGIN
    EXECUTE '
        CREATE OR REPLACE VIEW public.DetailedConfirmedBookings AS
        SELECT 
            Users.UserName, 
            Accommodations.AccommodationName, 
            Accommodations.Country,
            Accommodations.CityCode,
            Accommodations.City,
            Accommodations.Street,
            Accommodations.Number,
            Accommodations.Price,
            Accommodations.Payment,
            Accommodations.Description,
            Accommodations.Category,
            Accommodations.NumberOfRooms,
            Accommodations.AvailableSlots,
            Amenities.Wifi,
            Amenities.Parking,
            Amenities.DisabledAccess,
            Bookings.CheckInDate,
            Bookings.CheckOutDate,
            Bookings.PeopleCount,
            Bookings.RoomCount,
            GuestDetails.Name AS GuestName,
            GuestDetails.Email AS GuestEmail,
            HostDetails.Name AS HostName,
            HostDetails.Email AS HostEmail
        FROM 
            Bookings
        JOIN 
            Users ON Bookings.UserID = Users.UserID
        JOIN 
            Accommodations ON Bookings.AccommodationID = Accommodations.AccommodationID
        JOIN 
            Amenities ON Accommodations.AmenityID = Amenities.AmenityID
        JOIN 
            GuestDetails ON Bookings.GuestID = GuestDetails.GuestID
        JOIN 
            HostDetails ON Accommodations.HostID = HostDetails.HostID
        WHERE 
            Users.UserID = ''' || user_id || ''' AND Bookings.Status = ''Confirmed''
    ';
END $$;
