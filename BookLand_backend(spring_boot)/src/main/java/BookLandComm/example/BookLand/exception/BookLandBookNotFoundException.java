package BookLandComm.example.BookLand.exception;

public class BookLandBookNotFoundException extends RuntimeException{
    public BookLandBookNotFoundException(String message) {
        super(message);
    }
}
