package BookLandComm.example.BookLand.service;
import BookLandComm.example.BookLand.exception.BookLandUserNotFoundException;
import BookLandComm.example.BookLand.model.BookLandBook;
import BookLandComm.example.BookLand.repo.BookLandBookRepo;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class BookLandBookService {

    private static BookLandBookRepo bookLandBookRepo = null;

    @Autowired
    public BookLandBookService(BookLandBookRepo bookLandBookRepo) {
        this.bookLandBookRepo = bookLandBookRepo;
    }

    public static BookLandBook addBookLandBook(BookLandBook bookLandBook) {
        //bookLandBook.setPassword(UUID.randomUUID().toString());
        return bookLandBookRepo.save(bookLandBook);
    }

    public static List<BookLandBook> findAllBookLandBooks() {
        return bookLandBookRepo.findAll();
    }

    public static BookLandBook updateBookLandBook(BookLandBook bookLandBook) {
        return bookLandBookRepo.save(bookLandBook);
    }

    public static BookLandBook findBookLandBookByisbn10(Long isbn10) {
        return bookLandBookRepo.findBookLandBookByIsbn10(isbn10)
                .orElseThrow(() -> new BookLandUserNotFoundException("Book by isbn10 " + isbn10 + " was not found"));
    }

    public static BookLandBook findBookLandBookByTitle(String title) {
        return bookLandBookRepo.findBookLandBookByTitle(title)
                .orElseThrow(() -> new BookLandUserNotFoundException("Book by isbn10 " + title + " was not found"));
    }
}
