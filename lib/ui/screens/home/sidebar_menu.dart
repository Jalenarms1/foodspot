import 'package:flutter/material.dart';

class SidebarMenu extends StatefulWidget {
  final void Function() toggleSidebar;
  const SidebarMenu({super.key, required this.toggleSidebar});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: widget.toggleSidebar,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withValues(alpha: 0.45),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * .6,
              height: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Menu Item 1"),
                  SizedBox(height: 16),
                  Text("Menu Item 2"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
