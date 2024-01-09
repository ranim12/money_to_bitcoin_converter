import 'package:get/get.dart';
import 'package:money_to_bitcoin_converter/model/conversion_data.dart';
import 'package:money_to_bitcoin_converter/services/app_services.dart';

class ConversionController extends GetxController {
  var isLoading = false.obs;
  var isError = false.obs;

  var usdAmount = 0.0.obs;
  var euroAmount = 0.0.obs;
  var gbpAmount = 0.0.obs;

  var service = AppServices();
  late ConversionData data;

  @override
  void onInit() {
    getPrices();
    // TODO: implement onInit
    super.onInit();
  }

  usdToBitcoin(value) {
    usdAmount((1 / data.bpi.usd.rateFloat) * value);
  }

  euroToBitcoin(value) {
    euroAmount((1 / data.bpi.eur.rateFloat) * value);
  }

  poundToBitcoin(value) {
    gbpAmount((1 / data.bpi.gbp.rateFloat) * value);
  }

  getPrices() async {
    try {
      isLoading(true);
      data = await service.getPrices();
      print('data $data');
      update();
    } catch (e) {
      print(e);
      Get.snackbar("oops!", "we have some problems to fetch data");
    } finally {
      isLoading(false);
    }
  }
}
