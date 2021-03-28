import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

class StockState extends ChangeNotifier {
  List<String> stockName = ['애플', '알파벳A', '테슬라'];
  List<String> stockTicker = ['AAPL', 'GOOGL', 'TSLA'];
  var stockCurrentPrice = {'AAPL': '0', 'GOOGL': '0', 'TSLA': '0'};
  var previousClosingPrice = {'AAPL': '0', 'GOOGL': '0', 'TSLA': '0'};
  var profit = {'AAPL': '0', 'GOOGL': '0', 'TSLA': '0'};
  var profitPercent = {'AAPL': '0', 'GOOGL': '0', 'TSLA': '0'};
  var signProfit = {'AAPL': "", 'GOOGL': "", 'TSLA': ""};
  var currentGraphName = '애플';
  var graphUrl = "https://ssl.pstatic.net/imgfinance/chart/mobile/world/item/area/month3/AAPL.O_end.png?1616742000000";
  var selectedStock = "AAPL";
  //var selectedPeriod = ['day','month3','year','year3', 'year10'];
  var selectedPeriod = 'day';
  var sss = 1;

  //전일 종가 가져오기
  void previousClosingPriceDate() async {
    for(int i=0; i<stockName.length; i++){
      String ticker = stockTicker[i];
      String url =
          'https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=$ticker';
      var response = await http.get(url);
      var responseBody = response.body;
      Document document = parser.parse(responseBody);

      previousClosingPrice[stockTicker[i]] =
          document.querySelector('.dtcon_lst dd').text.replaceAll(",","");
      notifyListeners();
    }
  }

  //현재 주가 가져오기
  void stockPrice() async {
    for(int i=0; i<stockName.length; i++){
      String ticker = stockTicker[i];
      String url =
          'https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=$ticker';
      var response = await http.get(url);
      var responseBody = response.body;
      Document document = parser.parse(responseBody);

      stockCurrentPrice[stockTicker[i]] =
          document.querySelector('.spt_tlt strong').text.replaceAll(",","");
      var previous = double.parse(previousClosingPrice[stockTicker[i]]);
      var current = double.parse(stockCurrentPrice[stockTicker[i]]);
      //print(previous);
      if( previous > current ){
        signProfit[stockTicker[i]] = "-";
        profit[stockTicker[i]] = (previous - current).toStringAsFixed(2);
        profitPercent[stockTicker[i]] = (((previous - current) / previous)*100).toStringAsFixed(2);
      }else if(previous < current) {
        signProfit[stockTicker[i]] = "+";
        profit[stockTicker[i]] = (current - previous).toStringAsFixed(2);
        profitPercent[stockTicker[i]] = (((current-previous) /  previous)*100).toStringAsFixed(2);
      } else {
        signProfit[stockTicker[i]] = "";
        profit[stockTicker[i]] = '0';
        profitPercent[stockTicker[i]] = '0';
      }
    }
    notifyListeners();
  }






}
