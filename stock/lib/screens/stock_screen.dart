import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock/model/stock_state.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  var seletedStock = "AAPL";
  var seletedPeriod = "day";
  var stockPeriod = [
    "day",
    "area/month3",
    "area/year",
    "area/year3",
    "area/year10"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('Stocks', style: TextStyle(color: Colors.black54)),
        ),
        //body: ListView.builder(itemBuilder: stockListBuilder, itemCount: 3,),
        body: Consumer<StockState>(
          builder: (BuildContext context, StockState stockState, Widget child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(0),
                          child: SizedBox(
                            height: 60,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  seletedStock = stockState.stockTicker[index];
                                });
                              },
                              title: Text(stockState.stockName[index]),
                              subtitle: Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Text(stockState.stockCurrentPrice[
                                        stockState.stockTicker[index]]),
                                  ),
                                  Expanded(
                                    child: Text(
                                        stockState.signProfit[
                                                stockState.stockTicker[index]] +
                                            stockState.profit[
                                                stockState.stockTicker[index]] +
                                            ' (' +
                                            stockState.profitPercent[
                                                stockState.stockTicker[index]] +
                                            '%)',
                                        style: stockState.signProfit[stockState
                                                    .stockTicker[index]] ==
                                                '-'
                                            ? TextStyle(color: Colors.blue)
                                            : TextStyle(color: Colors.red)),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: Text("전일종가 " +
                                        stockState.previousClosingPrice[
                                            stockState.stockTicker[index]]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 0,
                          color: Colors.grey,
                        );
                      },
                      itemCount: stockState.stockName.length),
                ),
                Column(
                  children: [
                    Text(seletedStock),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlatButton(
                            minWidth: 10,
                            onPressed: () {
                              set(0);
                            },
                            child: Text('1일')),
                        FlatButton(
                            minWidth: 10,
                            onPressed: () {
                              set(1);
                            },
                            child: Text('3개월')),
                        FlatButton(
                            minWidth: 10,
                            onPressed: () {
                              set(2);
                            },
                            child: Text('1년')),
                        FlatButton(
                            minWidth: 10,
                            onPressed: () {
                              set(3);
                            },
                            child: Text('3년')),
                        FlatButton(
                            minWidth: 10,
                            onPressed: () {
                              set(4);
                            },
                            child: Text('10년')),
                      ],
                    ),
                    Container(
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://ssl.pstatic.net/imgfinance/chart/mobile/world/item/$seletedPeriod/$seletedStock.O_end.png?1616742000000",
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: FlatButton(onPressed: (){}, child: Text("매수",style: TextStyle(color: Colors.white),),color: Colors.red,)),
                        Expanded(child: FlatButton(onPressed: (){}, child: Text("매도",style: TextStyle(color: Colors.white),),color: Colors.blue,)),
                      ],
                    )
                  ],
                )
              ],
            );
          },
        ));
  }

  void set(index) {
    setState(() {
      seletedPeriod = stockPeriod[index];
    });
  }
}
