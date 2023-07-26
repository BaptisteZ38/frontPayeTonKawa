import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class LayoutAR extends StatefulWidget {
  const LayoutAR({Key? key, required this.nom}) : super(key: key);

  final String nom;
  @override
  State<LayoutAR> createState() => _LayoutAR();
}

class _LayoutAR extends State<LayoutAR> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  ARNode? localObjectNode;
  ARNode? webObjectNode;

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Réalité augmentée"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: ARView(
                  onARViewCreated: onARViewCreated,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    genereCafetiere(widget.nom);
                  },
                  child: const Text("Faire apparaître la cafetière"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          customPlaneTexturePath: "assets/triangle.png",
          showWorldOrigin: true,
          handleTaps: false,
        );
    this.arObjectManager.onInitialize();
  }

  Future<void> genereCafetiere(String nom) async {
    String url = "";
    if (webObjectNode != null) {
      arObjectManager.removeNode(webObjectNode!);
      webObjectNode = null;
    } else {
      if (nom == "Senseo") {
        url =
            "https://raw.githubusercontent.com/BaptisteZ38/frontPayeTonKawa/realiteAugmente/assets/AR/Senseo.glb";
      } else if (nom == "Krups") {
        url =
            "https://raw.githubusercontent.com/BaptisteZ38/frontPayeTonKawa/realiteAugmente/assets/AR/Krups.glb";
      } else if (nom == "Phillips") {
        url =
            "https://raw.githubusercontent.com/BaptisteZ38/frontPayeTonKawa/realiteAugmente/assets/AR/Phillips.glb";
      }
      var newNode = ARNode(
        type: NodeType.webGLB,
        uri: url,
        scale: Vector3(0.2, 0.2, 0.2),
      );
      bool? didAddWebNode = await arObjectManager.addNode(newNode);
      webObjectNode = (didAddWebNode!) ? newNode : null;
    }
  }
}
