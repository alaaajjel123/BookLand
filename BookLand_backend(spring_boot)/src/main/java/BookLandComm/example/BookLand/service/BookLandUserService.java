package BookLandComm.example.BookLand.service;
import BookLandComm.example.BookLand.exception.BookLandUserNotFoundException;
import BookLandComm.example.BookLand.model.BookLandUser;
import BookLandComm.example.BookLand.repo.BookLandUserRepo;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BookLandUserService {


    private static BookLandUserRepo bookLandUserRepo = null;

    @Autowired
    public BookLandUserService(BookLandUserRepo bookLandUserRepo) {
        this.bookLandUserRepo = bookLandUserRepo;
    }

    public static BookLandUser addBookLandUser(BookLandUser bookLandUser) {
        //bookLandUser.setPassword(UUID.randomUUID().toString());
        return bookLandUserRepo.save(bookLandUser);
    }

    public static List<BookLandUser> findAllBookLandUsers() {
        return bookLandUserRepo.findAll();
    }

    public static BookLandUser updateBookLandUser(BookLandUser bookLandUser) {
        return bookLandUserRepo.save(bookLandUser);
    }

    public static BookLandUser findBookLandUserById(Long id) {
        return bookLandUserRepo.findBookLandUserById(id)
                .orElseThrow(() -> new BookLandUserNotFoundException("User by id " + id + " was not found"));
    }

    public static BookLandUser findBookLandUserByEmail(String email) {
        return bookLandUserRepo.findBookLandUserByEmail(email)
                .orElseThrow(() -> new BookLandUserNotFoundException("User by email " + email + " was not found"));
    }

    public static BookLandUser authentifiedBookLandUser(BookLandUser bookLandUser)
    {
        BookLandUser bookLandUser1 = findBookLandUserByEmail(bookLandUser.getEmail());
        if(bookLandUser1!=null && bookLandUser1!=null && bookLandUser1.getPassword().equals(bookLandUser.getPassword()))
        {
            return bookLandUser1;
        }

        else
            throw new BookLandUserNotFoundException("User by email " + bookLandUser.getEmail() + " was not found");
    }

    public void deleteBookLandUser(Long id){
        bookLandUserRepo.deleteBookLandUserById(id);
    }


}
