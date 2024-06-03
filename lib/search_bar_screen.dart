
import 'package:flutter/material.dart';
import 'package:it_book_app/search_book_model.dart';
import 'api_book_services.dart';
import 'book_details_screen.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Book>? getBookData = List<Book>.empty();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ' Search Book ',
            style: TextStyle(color: Colors.white),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search for books...',
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async{
                      getBookData =   await ApiBookServicse().searchAnyBook(searchController.text.toString());
                     setState(() {

                     });
                      //(searchController.text);
                    },
                  ),
                ),
                // onSubmitted: _searchBooks,
              ),
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body:
         ListView.builder(
                itemCount: getBookData?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("${getBookData?[index].title}"),
                      // subtitle: Text("${data[index].subtitle}"),
                      leading: CircleAvatar(backgroundImage: NetworkImage("${getBookData?[index].image}"),),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SearchScreen(title: getBookData![index].title!,subtitle: getBookData![index].subtitle!),
                          ),
                        );
                      },
                    ),
                  );
                },
    )


        );
    }
}