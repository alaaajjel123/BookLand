package BookLandComm.example.BookLand.repo;

import BookLandComm.example.BookLand.model.BookLandBook;
import BookLandComm.example.BookLand.model.BookLandUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BookLandBookRepo extends JpaRepository<BookLandBook, Long> {
    /*
    public void deleteBookLandBookByIsbn10(Long id);

    Optional<BookLandBook> findBookLandBookByIsbn10(Long id);

    */


    Optional<BookLandBook> findBookLandBookByTitle(String title);

    Optional<BookLandBook> findBookLandBookByIsbn10(Long id);


/*
    Optional<BookLandBook> findBookLandBookByTitle(String title);

     */
}

