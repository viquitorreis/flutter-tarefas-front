import 'package:front/services/service.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DataController extends GetxController {
  DataService service = DataService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();

    if (response.statusCode == 200) {
      _myData = response.body;
      print("Dados da lista recebidos");
      update();
    } else {
      print("Nenhum dado recebido");
    }
  }

  Future<void> postData(String taskName, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData({
      "taskName": taskName,
      "taskDetail": taskDetail,
    });

    if (response.statusCode == 200) {
      update(); // atualizar o UI
      print("Dados postados com sucesso");
    } else {
      print("Nenhum dado recebido");
    }
  }
}
