import '../objects/quote.dart';
import 'dart:convert';

class quotesList {
  int count;
  int totalCount;
  int page;
  int totalPages;
  int lastItemIndex;
  List<Quote> results;
  quotesList({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.lastItemIndex,
    required this.results,
  });
}
