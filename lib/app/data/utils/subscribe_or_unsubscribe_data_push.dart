import 'package:untitled/app/data/shared_pref.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';

Future subscribedPushData()async{
await SharedPref.storeIsSubscribed(true);
        subscribed(true);
}
Future unSubscribedPushData()async{
await SharedPref.storeIsSubscribed(false);
        subscribed(false);
}