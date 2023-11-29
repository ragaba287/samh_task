import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/const/const.dart';
import '../../core/utils/funs.dart';
import '../../core/utils/sharedpreference.dart';
import '../../main.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

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
}
