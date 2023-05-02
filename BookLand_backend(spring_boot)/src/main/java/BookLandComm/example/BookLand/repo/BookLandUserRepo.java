package BookLandComm.example.BookLand.repo;

import BookLandComm.example.BookLand.model.BookLandUser;
import BookLandComm.example.BookLand.model.BookLandBook;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BookLandUserRepo extends JpaRepository<BookLandUser, Long> {

    public void deleteBookLandUserById(Long id);

    Optional<BookLandUser> findBookLandUserById(Long id);

    Optional<BookLandUser> findBookLandUserByEmail(String email);


    /*
    public void deleteBookLandBookByIsbn10(Long id);

    Optional<BookLandBook> findBookLandBookByIsbn10(Long id);

    Optional<BookLandBook> findBookLandBookById(Long id);


    Optional<BookLandBook> findBookLandBookByTitle(String title);

*/

}
