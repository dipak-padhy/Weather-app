import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/home/bloc/home_bloc.dart';

import 'home_screen_widgets/backdrop_widget.dart';
import 'home_screen_widgets/bottom_widget.dart';
import 'home_screen_widgets/middle_widget.dart';
import 'home_screen_widgets/top_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(children: [
                const BackdropWidget(),
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state is HomeLoadingSuccessState) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(children: [
                              TopWidget(state: state),
                              MiddleWidget(state: state),
                              const SizedBox(height: 28),
                              BottomWidget(state: state),
                            ])));
                  } else if (state is HomeLoadingErrorState) {
                    return SizedBox(
                      child: Center(
                        child: Image.asset(
                          "assets/images/internet_not_found.png",
                          scale: 1,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox(
                      child: Center(
                          child: SpinKitSpinningLines(
                        color: Colors.grey,
                      )),
                    );
                  }
                }),
              ]))),
    );
  }
}
