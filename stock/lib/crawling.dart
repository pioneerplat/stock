import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

void min() async {
  //String url = 'https://m.stock.naver.com/index.html#/worldstock/stock/AAPL.O/price/';
  //String url = 'https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=aapl';
  String url = 'https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=googl';
  //String url = 'https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=tsla';
  var response = await http.get(url);
  var responseBody = response.body;
  Document document = parser.parse(responseBody);

  //var keywordElements = document.querySelectorAll('.GraphMain_mainGraph__3npcJ GraphMain_FALLING__3SBgl');
  var apple = document.querySelector('.spt_tlt strong');


  //print("statusCode: ${statusCode}");
  //print("responseHeaders: ${responseHeaders}");
  //print("responseBody: ${responseBody}");
  //print(responseBody);
  print(apple.text);
}