library app_element;

import 'package:polymer/polymer.dart';

import 'package:bwu_sparklines/bwu_sparkline.dart';

@CustomTag('app-element')
class AppElement extends PolymerElement {
  AppElement.created() : super.created();

  @override
  void attached() {
    super.attached();

    try {
//      /** This code runs when everything has been loaded on the page */
//      /* Inline sparklines take their values from the contents of the tag */
//      $('.inlinesparkline').sparkline();

      /* Sparklines can also take their values from the first argument
      passed to the sparkline() function */
      var myvalues = [10,8,5,7,4,4,1];
      ($['dynamicsparkline'] as BwuSparkline).init(myvalues);

      /* The second argument gives options such as chart type */
      ($['dynamicbar'] as BwuSparkline).init(myvalues, new BarOptions()..barColor = 'green');

      /* Use 'html' instead of an array of values to pass options
      to a sparkline with data in the tag */
      ($['inlinebar'] as BwuSparkline).init(null, new BarOptions()..barColor = 'red');

    } on NoSuchMethodError catch (e) {
      print('simple - app-element - attached: $e\n\n${e.stackTrace}');
    }  on RangeError catch (e) {
      print('simple - app-element - attached: $e\n\n${e.stackTrace}');
    } on TypeError catch(e) {
      print('simple - app-element - attached: $e\n\n${e.stackTrace}');
    } catch(e) {
      print('simple - app-element - attached: $e');
    }
  }
}