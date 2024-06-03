import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:it_book_app/search_book_model.dart';

import 'book_detail_model.dart';

class ApiBookServicse {
  var baseUrl = "https://api.itbook.store/1.0/";
  var endPoint = "search/";

  Future<List<Book>?> searchAnyBook(String name) async {


    var response = await http
        .get(Uri.parse("$baseUrl"+ "search/$name"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var getdata = SearchBook.fromJson(data);
      return getdata.books;
    } else {
      return List<Book>.empty();
    }
  }

  // Future<List<BookDetaileModel>> getSingleBookData() async {
  //   var baseUrl = "https://api.itbook.store/1.0/";
  //   var endPoint = "books/9781617294136";
  //   var response = await http
  //       .get(Uri.parse("$baseUrl$endPoint"));
  //   if (response.statusCode == 200) {
  //     List data = jsonDecode(response.body);
  //     var getdata = data.map((json) => BookDetaileModel.fromJson(json)).toList();
  //     return getdata;
  //   } else {
  //     return List<BookDetaileModel>.empty();
  //   }
  // }

  Future<BookDetaileModel>getSingleBookData() async {
      var baseUrl = "https://api.itbook.store/1.0/";
      var endPoint = "books/9781617294136";
      var response = await http
          .get(Uri.parse("$baseUrl$endPoint"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var convert = BookDetaileModel.fromJson(data);
        return convert;
      } else {
        return throw Exception(" Field PDf ");
      }
    }

  // Future<SearchBook> searchBookdetails(String name) async {
  //   var apiUrl = Uri.parse("https://api.itbook.store/1.0/search/$name");
  //   var responce = await http.get(apiUrl);
  //   if (responce.statusCode == 200) {
  //     var bookData = jsonDecode(responce.body) ;
  //     var data = SearchBook.fromJson(bookData);
  //     return data ;
  //   }else{
  //     return SearchBook();
  //   }
  // }

}
