
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test/model/salon_model.dart';
import 'package:test/model/salons_model.dart';
import 'package:test/model/service_model.dart';
import 'package:test/repo/home_repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeRepo homeRepo = HomeRepo();
  

  List<SalonsModel> salons = [];
  SalonModel? salon;
  List<ServicesModel> services = [];

  int selectedIndex = 0;

  void getServicesData() {
    emit(GetServicesLoading());
    homeRepo.getServicesData().then((value) {
      services = (value.data['data'] as List)
          .map((e) => ServicesModel.fromMap(e))
          .toList();
      emit(GetServicesSuccess());
    }).catchError((error) {
      emit(GetServicesError());
    });
  }

  void getSalonData() {
    emit(GetSalonsLoading());
    homeRepo.getSalonData().then((value) {
      salons = (value.data['data']['data'] as List)
          .map((e) => SalonsModel.fromMap(e))
          .toList();
      getServicesData();
      emit(GetSalonsSuccess());
    }).catchError((error) {
      emit(GetSalonsError());
    });
  }

  void getOneSalonData({int? id}) async {
    EasyLoading.show();
    emit(GetOneSalonsLoading());
    homeRepo.getOneSalonData(id: id).then((value) {
      selectedIndex = 0;
      salon = SalonModel.fromMap(value.data['data']);
      EasyLoading.dismiss();
      emit(GetOneSalonsSuccess(
        salon: salon,
      ));
    }).catchError((error) {
      EasyLoading.dismiss();

      emit(GetOneSalonsError());
    });
  }

  
}
