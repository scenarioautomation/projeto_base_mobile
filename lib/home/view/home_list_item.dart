import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projeto_base_mobile/general/scenario_colors.dart';
import 'package:projeto_base_mobile/home/model/home_model.dart';

class HomeListItem extends StatefulWidget {
  final HomeModel home;

  const HomeListItem({super.key, required this.home});

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(
                File(widget.home.imagePath),
              ),
              fit: BoxFit.cover
            ),
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: ScenarioColors.dark.withOpacity(0.5),
                child: Center(
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    widget.home.name,
                                    style: const TextStyle(color: ScenarioColors.secondary, fontSize: 22),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            right: 10,
                            child: Icon(
                              Icons.navigate_next_rounded,
                              color: ScenarioColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
