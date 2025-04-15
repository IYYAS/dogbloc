import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/dogpage_cubit.dart';

class Dubittestpage extends StatelessWidget {
  const Dubittestpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DogpageCubit(),
        child: BlocBuilder<DogpageCubit, DogpageState>(
          builder: (context, state) {
            final unit = context.read<DogpageCubit>();
            return Column(
              children: [
                state is Dogpageloading
                ? const Center(child: CircularProgressIndicator(),)
                :  state is Dogpageloaded ?

                Container(
                  height: 250,
                  width: 250,
                  child: Image.network(
                    state.data.message,
                    fit: BoxFit.cover,
                  ),
                ):
                    state is DogpageError ? Center(child: Text("errrrrrr"),):SizedBox(),
                ElevatedButton(onPressed: () {
                  unit.getdog();

                }, child: Text("click me")),
              ],
            );
          },
        ),
      ),
    );
  }
}
