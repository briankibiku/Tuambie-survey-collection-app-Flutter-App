import 'package:flutter/material.dart';
import 'package:tuambie/constants/colors.dart';
import 'package:tuambie/constants/sizing.dart';
import 'package:tuambie/constants/strings.dart';
import 'package:tuambie/routes.dart'; 
import 'package:flutter_svg/flutter_svg.dart';

class HomePageActionCard extends StatelessWidget {
  final String routeName;
  final String actionName;
  final String actionIconURL;
  const HomePageActionCard(
      {required this.routeName,
      required this.actionName,
      required this.actionIconURL});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
        // ScaffoldMessenger.of(context)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(SnackBar(content: Text('data'), duration: Duration(seconds: 2),));
      },
      child: Container(
        height: 130,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: fadedPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  actionIconURL,
                  height: 30,
                  width: 30,
                ),
                smallVerticalSizedBox,
                Text(actionName, textAlign: TextAlign.center)
              ]),
        ),
      ),
    );
  }
}

List<HomePageActions> homePageActions = [
  HomePageActions(
      actionName: makeSaleString,
      actionIconURL: makeSaleSVGString,
      actionRoute: Routes.makeSale),
  HomePageActions(
      actionName: viewSaleString,
      actionIconURL: salesSVGString,
      actionRoute: Routes.comingSoonPage),
  HomePageActions(
      actionName: addStockString,
      actionIconURL: addStockSVGString,
      actionRoute: Routes.addStock),
  HomePageActions(
      actionName: viewStockString,
      actionIconURL: addStockSVGString,
      actionRoute: Routes.viewStock),
  HomePageActions(
      actionName: addExpenseString,
      actionIconURL: expenseSVGString,
      actionRoute: Routes.comingSoonPage),
  HomePageActions(
      actionName: viewExpenseString,
      actionIconURL: expenseSVGString,
      actionRoute: Routes.comingSoonPage),
  HomePageActions(
      actionName: suppliersString,
      actionIconURL: manageSuppliersSVGString,
      actionRoute: Routes.manageSuppliersPage),
  HomePageActions(
      actionName: customersString,
      actionIconURL: customerSVGString,
      actionRoute: Routes.manageCustomersPage),
  HomePageActions(
      actionName: saleByProductString,
      actionIconURL: reportSVGString,
      actionRoute: Routes.comingSoonPage),
  HomePageActions(
      actionName: pandLString,
      actionIconURL: reportSVGString,
      actionRoute: Routes.comingSoonPage),
  HomePageActions(
      actionName: productsString,
      actionIconURL: desriptionSVGString,
      actionRoute: Routes.manageProductsPage)
];

class HomePageActions {
  HomePageActions(
      {required this.actionName,
      required this.actionIconURL,
      required this.actionRoute});
  String actionName;
  String actionIconURL;
  String actionRoute;
}
