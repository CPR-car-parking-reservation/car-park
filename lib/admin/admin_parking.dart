import 'package:car_parking_reservation/bloc/admin_bloc/parking/admin_parking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminParkingPage extends StatelessWidget {
  const AdminParkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AdminParkingBloc(), child: _AdminParkingPageUI());
  }
}

class _AdminParkingPageUI extends StatelessWidget {
  const _AdminParkingPageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              context.read<AdminParkingBloc>().add(ShowParkingData());
            },
            child: Text("Show Parking Data")),
        Text("admin parking page"),
        BlocBuilder<AdminParkingBloc, AdminParkingBlocState>(
          builder: (context, state) {
            return Column(
              children: [
                Text("asdasd ${state.data}"),
              ],
            );
          },
        )
      ]),
    );
  }
}
