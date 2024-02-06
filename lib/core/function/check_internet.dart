import 'dart:io';

checkInternet()async{
  try {
  var result=await InternetAddress.lookup("googole.com");
  if(result.isNotEmpty){
    return true;
  }
} on SocketException catch (_) {
  return false;
}
}