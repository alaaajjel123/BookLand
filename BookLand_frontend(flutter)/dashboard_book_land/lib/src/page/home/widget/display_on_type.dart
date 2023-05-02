import 'package:dashboard_book_land/src/model/book.dart';
import 'package:dashboard_book_land/src/page/detail/detail.dart';
import 'package:dashboard_book_land/src/page/home/widget/category_title.dart';
import 'package:flutter/material.dart';

class DiversBooks extends StatelessWidget {
  final customizedList = Book.generateDiversBook();
  DiversBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryTitle('divers Book'),
        ListView.separated(
            padding: const EdgeInsets.all(20),
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final book = customizedList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(book)));
                },
                child: SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(book.imgUrl!),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  book.name!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.bookmark,
                                color: Colors.orange[300],
                              )
                            ],
                          ),
                          Text(
                            book.author!,
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            book.desc!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              _buildIconText(Icons.star, Colors.orange[300]!,
                                  '${book.score}(${book.review}k)'),
                              const SizedBox(
                                width: 10,
                              ),
                              _buildIconText(
                                Icons.visibility,
                                Colors.white,
                                '${book.view}M Read',
                              ),
                            ],
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: customizedList.length)
      ],
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
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
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
