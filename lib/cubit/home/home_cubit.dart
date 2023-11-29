import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/const/const.dart';
import '../../core/utils/dio_helper.dart';
import '../../core/utils/funs.dart';
import '../../core/utils/sharedpreference.dart';
import '../../main.dart';
import '../../models/flight_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  final _api = DioHelper.instance;

  Future<void> changeLang(BuildContext context, String newLang) async {
    Sharedpreference.saveData(key: 'lang', value: newLang).then((value) {
      lang = newLang;
      MainApp.setLocale(context, newLang);
    });
    emit(ChangLangState());
  }

  String adults = '1';
  String children = '0';
  DateTime departure = DateTime.now();
  TextEditingController teFrom = TextEditingController();
  TextEditingController teTo = TextEditingController();
  TextEditingController teTime =
      TextEditingController(text: formatDate(DateTime.now()));

  List<FlightModel> flightList = [];
  Future<void> searchFlights() async {
    emit(FlightSearchLoadingState());
    _api.getData('${teFrom.text}-${teTo.text}', query: {
      "date": DateFormat('dd/MM/yyyy').format(departure),
    }).then((value) {
      final data = value.data;

      if (value.statusCode == 200) {
        flightList.clear();
        if (data.isNotEmpty) {
          for (var n in data) {
            flightList.add(FlightModel.fromJson(n));
          }
          emit(FlightSearchSuccessState());
        } else {
          emit(FlightEmptySuccessState());
        }
      } else if (value.statusCode == 404) {
        emit(FlightSearchErrorState());
      } else if (value.statusCode == 442) {
        emit(FlightSearchErrorState());
      } else {
        emit(FlightSearchErrorState());
      }
    }).catchError((e) {
      emit(FlightSearchErrorState());
    });
  }
}
