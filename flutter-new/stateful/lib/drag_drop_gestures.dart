import 'package:flutter/material.dart';

class DragDrop extends StatelessWidget {
  const DragDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drag and Drop"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                SliverList.separated(itemBuilder: (context, index) {
                  return LongPressDraggable(
                    child: MenuListItem(), feedback: )
                }, separatorBuilder: (context, index) => const SizedBox(height: 20,),)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: 100,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  const MenuListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}