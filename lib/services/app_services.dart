import 'package:dio/dio.dart';
import 'package:money_to_bitcoin_converter/model/conversion_data.dart';

class AppServices {
  final endPoint = "https://api.coindesk.com/v1/bpi/currentprice.json";
  var dio = Dio();

  Future<ConversionData> getPrices() async {
    try {
      Response response = await dio.get(endPoint);

      if (response.statusCode == 200) {
        dynamic jsonObject = response.data;

        if (jsonObject != null) {
          return ConversionData.fromJson(jsonObject);
        } else {
          throw Exception("Failed to parse response");
        }
      } else {
        throw Exception(
            "Failed to fetch data - Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching prices: $error");
      throw error; // Rethrow the error to handle it at a higher level if needed
    }
  }
}
