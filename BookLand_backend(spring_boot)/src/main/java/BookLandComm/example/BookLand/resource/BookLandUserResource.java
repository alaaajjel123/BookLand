package BookLandComm.example.BookLand.resource;
import BookLandComm.example.BookLand.model.BookLandBook;
import BookLandComm.example.BookLand.model.BookLandUser;
import BookLandComm.example.BookLand.service.BookLandUserService;
import BookLandComm.example.BookLand.service.BookLandBookService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/BookLandUser")
public class BookLandUserResource {

    private final BookLandUserService BookLandUserService;

    public BookLandUserResource(BookLandUserService employeeService) {
        this.BookLandUserService = employeeService;
    }

    @GetMapping("/allusers")
    public ResponseEntity<List<BookLandUser>> getAllBooKLandUsers () {
        List<BookLandUser> bookLandUsers = BookLandUserService.findAllBookLandUsers();
        return new ResponseEntity<>(bookLandUsers, HttpStatus.OK);
    }

    @GetMapping("/allBooks")
    public ResponseEntity<List<BookLandBook>> getAllBooKLandBooks () {
        List<BookLandBook> bookLandBooks = BookLandBookService.findAllBookLandBooks();
        return new ResponseEntity<>(bookLandBooks, HttpStatus.OK);
    }

    @GetMapping("/findUser/{id}")
    public ResponseEntity<BookLandUser> getBookLandUserById (@PathVariable("id") Long id) {
        BookLandUser bookLandUsers = BookLandUserService.findBookLandUserById(id);
        return new ResponseEntity<>(bookLandUsers, HttpStatus.OK);
    }




    @GetMapping("/findUser2/{email}")
    public ResponseEntity<BookLandUser> getBookLandUserByEmail (@PathVariable("email") String email) {
        BookLandUser bookLandUsers = BookLandUserService.findBookLandUserByEmail(email);
        return new ResponseEntity<>(bookLandUsers, HttpStatus.OK);
    }


    @GetMapping("/findBook/{id}")
    public ResponseEntity<BookLandBook> getBookLandBookById (@PathVariable("id") Long id) {
        BookLandBook bookLandBooks = BookLandBookService.findBookLandBookByisbn10(id);
        return new ResponseEntity<>(bookLandBooks, HttpStatus.OK);
    }

    @GetMapping("/findBook2/{title}")
    public ResponseEntity<BookLandBook> getBookLandBookByTitle (@PathVariable("title") String title) {
        BookLandBook bookLandBooks = BookLandBookService.findBookLandBookByTitle(title);
        return new ResponseEntity<>(bookLandBooks, HttpStatus.OK);
    }


    /*
    @GetMapping("/authentication/{email}/{password}")
    public ResponseEntity<BookLandUser> authentifiedUser (@PathVariable("email") String email,@PathVariable("password") String password) {
        BookLandUser bookLandUser = BookLandUserService.authentifiedUser(email,password);
        return new ResponseEntity<>(bookLandUser, HttpStatus.OK);
    }
     */


    @PostMapping("/authentication")
    public ResponseEntity<BookLandUser> authentifiedBookLandUser(@RequestBody BookLandUser bookLandUser) {
        BookLandUser newBookLandUser = BookLandUserService.authentifiedBookLandUser(bookLandUser);
        return new ResponseEntity<>(newBookLandUser, HttpStatus.CREATED);
    }


    @PostMapping("/add")
    public ResponseEntity<BookLandUser> addBookLandUser(@RequestBody BookLandUser bookLandUser) {
        BookLandUser newBookLandUser = BookLandUserService.addBookLandUser(bookLandUser);
        return new ResponseEntity<>(newBookLandUser, HttpStatus.CREATED);
    }


    @PutMapping("/update")
    public ResponseEntity<BookLandUser> updateBookLandUser(@RequestBody BookLandUser bookLandUser) {
        BookLandUser updateBookLandUser = BookLandUserService.updateBookLandUser(bookLandUser);
        return new ResponseEntity<>(updateBookLandUser, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteBookLandUser(@PathVariable("id") Long id) {
        BookLandUserService.deleteBookLandUser(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }


}
