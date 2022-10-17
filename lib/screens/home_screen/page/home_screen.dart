import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:mediabooster/screens/playPage/playScreen.dart';
import 'package:mediabooster/utils/string.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Controllers {
  late VideoPlayerController videoPlayerController;

  Controllers({required this.videoPlayerController});
}

class _HomePageState extends State<HomePage> {
  List<Controllers> controllerList = [];

  void myVideos() async {
    controllerList = [
      Controllers(
        videoPlayerController:
            VideoPlayerController.asset("${videoList[0]["source"]}")
              ..initialize().then((value) => setState(() {})),
      ),
      Controllers(
        videoPlayerController:
            VideoPlayerController.asset("${videoList[1]["source"]}")
              ..initialize().then((value) => setState(() {})),
      ),
      Controllers(
        videoPlayerController:
            VideoPlayerController.asset("${videoList[2]["source"]}")
              ..initialize().then((value) => setState(() {})),
      ),
      Controllers(
        videoPlayerController:
            VideoPlayerController.asset("${videoList[3]["source"]}")
              ..initialize().then((value) => setState(() {})),
      ),
      // Controllers(
      //   videoPlayerController:
      //       VideoPlayerController.asset("${videoList[4]["source"]}")
      //         ..initialize().then((value) => setState(() {})),
      // ),
      // Controllers(
      //   videoPlayerController:
      //       VideoPlayerController.asset("${videoList[5]["source"]}")
      //         ..initialize().then((value) => setState(() {})),
      // ),
      // Controllers(
      //   videoPlayerController:
      //       VideoPlayerController.asset("${videoList[6]["source"]}")
      //         ..initialize().then((value) => setState(() {})),
      // ),
      // Controllers(
      //   videoPlayerController:
      //       VideoPlayerController.asset("${videoList[7]["source"]}")
      //         ..initialize().then((value) => setState(() {})),
      // ),
      // Controllers(
      //   videoPlayerController:
      //       VideoPlayerController.asset("${videoList[8]["source"]}")
      //         ..initialize().then((value) => setState(() {})),
      // ),
      // Controllers(
      //   videoPlayerController:
      //       VideoPlayerController.asset("${videoList[9]["source"]}")
      //         ..initialize().then((value) => setState(() {})),
      // ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myVideos();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setState(() {
      mounted == false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Video Player",
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade200,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 8,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 740,
                width: double.infinity,
                child: ListView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: controllerList
                            .map(
                              (controller) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VideoPlayScreen(
                                            controllerList.indexOf(controller)),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Chewie(
                                          controller: ChewieController(
                                            aspectRatio: 16 / 9,
                                            videoPlayerController: controller
                                                .videoPlayerController,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${videoList[controllerList.indexOf(controller)]["title"]}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${videoList[controllerList.indexOf(controller)]["subtitle"]}",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
