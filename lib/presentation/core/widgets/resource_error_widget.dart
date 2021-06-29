import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResourceErrorWidget extends StatelessWidget {
  final String image;
  final String resourceName;
  final String resourceType;
  final String message;

  const ResourceErrorWidget({
    required this.image,
    required this.resourceName,
    required this.resourceType,
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints(
            minHeight: 600,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        resourceName,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red.shade900,
                        ),
                      ),
                      Text(
                        ' $resourceType',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red.shade900,
                        ),
                      ),
                      Text(
                        ' $message',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) => Colors.red.shade900),
                    ),
                    onPressed: () => Modular.to.pushReplacementNamed('/'),
                    child: const Text('Go to application main menu'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
