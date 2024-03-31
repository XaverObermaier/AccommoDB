CREATE TRIGGER update_avg_rating
AFTER INSERT ON Reviews
FOR EACH ROW
BEGIN
   UPDATE Accommodations
   SET avg_rating = (SELECT AVG(rating) FROM Reviews WHERE AccommodationID = NEW.AccommodationID)
   WHERE AccommodationID = NEW.AccommodationID;
END;
