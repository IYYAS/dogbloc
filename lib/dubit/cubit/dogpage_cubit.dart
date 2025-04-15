import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../model.dart';

part 'dogpage_state.dart';

class DogpageCubit extends Cubit<DogpageState> {
  DogpageCubit() : super(DogpageInitial()){
    getdog();
  }

  getdog()async{
    emit(Dogpageloading());
    print("you function is work");
    final url = "https://dog.ceo/api/breeds/image/random";
    final response = await http.get(Uri.parse(url));
     if (response.statusCode == 200){
       final data = welcomeFromJson (response.body);
       emit(Dogpageloaded(data: data));
     }else{
       emit(DogpageError(error: "somting went wrong"));
     }

  }


}
