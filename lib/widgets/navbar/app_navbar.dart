import 'package:auto_route/auto_route.dart';
import 'package:chupp/pages/draggable_menus/profile_menu.dart';
import 'package:chupp/utils/router/app_router.gr.dart';
import 'package:chupp/utils/router/extensions.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/profile/profile_photo.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'src/navbar.dart';
import 'src/navitem.dart';

class AppNavBar extends StatelessWidget {
  final int? current;
  final Function()? activeTap;

  const AppNavBar({super.key, this.current, this.activeTap});

  @override
  Widget build(BuildContext context) {
    final StackRouter router = context.router;
    return Hero(
      tag: "app-nav-bar",
      child: NavBar(
        children: [
          NavItem(
            icon: FontAwesomeIcons.house,
            size: 22,
            active: current == 0,
            passiveTap: () => router.openBase(const HomeRoute()),
            activeTap: activeTap,
          ),
          NavItem(
            icon: FontAwesomeIcons.magnifyingGlass,
            size: 24,
            active: current == 1,
            passiveTap: () => router.open(const SearchRoute()),
            activeTap: activeTap,
          ),
          NavItem(
            icon: FontAwesomeIcons.solidSquarePlus,
            size: 26,
            passiveTap: () => router.open(const CreatePostRoute()),
            activeTap: activeTap,
          ),
          NavItem(
            icon: FontAwesomeIcons.solidHeart,
            size: 26,
            active: current == 2,
            passiveTap: () => router.open(const LikedPostsRoute()),
            activeTap: activeTap,
          ),
          NavItem(
            active: current == 3,
            passiveTap: () => router.open(ProfileRoute()),
            activeTap: activeTap,
            passiveLPress: () => DraggableMenu.open(
              context,
              const ProfileMenu(),
              barrierColor: context.theme.current.barrierColor,
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: current != 3
                      ? BorderSide.none
                      : BorderSide(
                          color: context.theme.current.primaryItem,
                          width: 2,
                        ),
                ),
              ),
              child: const ProfilePhoto(
                radius: 13,
                image: NetworkImage("https://picsum.photos/1920/1080"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
