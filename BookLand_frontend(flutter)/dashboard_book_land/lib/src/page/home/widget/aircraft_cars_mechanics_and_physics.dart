import 'package:dashboard_book_land/src/model/book.dart';
import 'package:dashboard_book_land/src/page/detail/detail.dart';
import 'package:dashboard_book_land/src/page/home/widget/category_title.dart';
import 'package:dashboard_book_land/src/page/home/widget/coming_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AircraftBook extends StatelessWidget {
  final aircraftList = Book.generateAircraftBook();
  AircraftBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryTitle('Aircraft, Cars, Mechanics and Physics'),
        SizedBox(
          height: 250,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(20),
              itemBuilder: (_, index) {
                var book = aircraftList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(book)));
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  book.imgUrl!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                book.name!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              book.author!,
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: _buildIconText(
                              Icons.star, Colors.orange[300]!, '${book.score}'))
                    ],
                  ),
                );
              },
              separatorBuilder: (_, index) => const SizedBox(
                    width: 15,
                  ),
              itemCount: aircraftList.length),
        )
      ],
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 14,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          )
        ],
      ),
    );
  }
}
