
import 'package:flutter/cupertino.dart';

class FilterModel extends StatefulWidget {
  final Widget child;
  static _FilterModelState? of(BuildContext context) =>
      context.findAncestorStateOfType<_FilterModelState>();
  const FilterModel({Key? key, required this.child}) : super(key: key);
  @override
  _FilterModelState createState() => _FilterModelState();
}

class _FilterModelState extends State<FilterModel> {
  String brand = 'ALL';
  String model = 'ALL';
  String year = 'ALL';
  String sortBy = 'by_date_desc';
  List<String> brands=['ALL'];
  List<String> models=['ALL'];
  List<String> years=['ALL'];
  List<String> sortBys=['by_date_desc','by_date','by_price_desc','by_price','by_rating_desc','by_rating'];
  String searchT='';
  @override
  Widget build(BuildContext context) {
    // brands.insert(0, 'ALL');
    // models.insert(0, 'ALL');
    // years.insert(0, 'ALL');
    return FilterModelState(child: widget.child,brand: brand,model: model,year: year,sortBy: sortBy,searchT: searchT, models: [], years: [], brands: [], sortBys: [],);
  }
}

class FilterModelState extends InheritedWidget {
  FilterModelState({
    Key? key,
    required this.brand,
    required this.model,
    required this.year,
    required this.sortBy,
    required this.brands,
    required this.models,
    required this.years,
    required this.sortBys,
    required this.searchT,
    required Widget child,
  }) : super(key: key, child: child);

  String searchT='';
  String brand = 'ALL';
  String model = 'ALL';
  String year = 'ALL';
  String sortBy = 'by_date_desc';
  List<String> brands=['ALL'];
  List<String> models=['ALL'];
  List<String> years=['ALL'];
  List<String> sortBys=['by_date_desc','by_date','by_price_desc','by_price','by_rating_desc','by_rating'];
  static FilterModelState? of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<FilterModelState>();
    assert(result != null, 'No data found in context');
    return result;
  }

  @override
  bool updateShouldNotify(FilterModelState old) {
    return (brand != old.brand||model != old.model||year != old.year||sortBy != old.sortBy||searchT != old.searchT);
  }
}
