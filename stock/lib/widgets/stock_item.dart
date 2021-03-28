// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:stock/model/stock_state.dart';
//
// class StockItem extends StatefulWidget {
//   final int index;
//
//   const StockItem(this.index,{Key key,}) : super(key: key);
//
//   @override
//   _StockItemState createState() => _StockItemState();
// }
//
// class _StockItemState extends State<StockItem> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<StockState>(
//       builder: (BuildContext context, StockState stockState, Widget child) {
//         StockState().stockPrice(widget.index);
//         return Column(
//           children: [
//             Container(
//               child: Column(
//                 children: [
//                   Text(stockState.stockName[widget.index]),
//                   Text(stockState.stockCurrentPrice[stockState.stockTicker[widget.index]]),
//                 ],
//               ),
//
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
