import 'package:flutter/material.dart';

class DragDrop extends StatelessWidget {
  const DragDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drag and Drop"),
        backgroundColor: Colors.grey[900],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomScrollView(
                slivers: [
                  SliverList.separated(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      const url = "https://picsum.photos/200/300";
                      return const LongPressDraggable(
                        data: url,
                        feedback: LongPressDraggingItem(
                          imageProvider:
                              NetworkImage("https://picsum.photos/200/300"),
                        ),
                        child: MenuListItem(
                          title:
                              "Long Press the Image, then drop it in drop zone!",
                          imageProvider:
                              NetworkImage("https://picsum.photos/200/300"),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3 + 10,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DragTarget(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: 100,
                  color: Colors.white70,
                  child: const Center(
                    child: Text(
                      "DROP ZONE!!!!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ),
                );
              },
              onAccept: (data) {
                const snackBar = SnackBar(
                  content: Text("image dropped!"),
                  duration: Duration(milliseconds: 500),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          )
        ],
      ),
    );
  }
}

class MenuListItem extends StatefulWidget {
  const MenuListItem(
      {super.key, required this.imageProvider, required this.title});

  final ImageProvider imageProvider;
  final String title;

  @override
  State<MenuListItem> createState() => _MenuListItemState();
}

class _MenuListItemState extends State<MenuListItem>
    with SingleTickerProviderStateMixin {
  double borderRadius = 20;

  bool pressed = false;
  late AnimationController _controller;
  late Animation<double> _borderRadiusAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _borderRadiusAnimation =
        Tween<double>(begin: 10.0, end: 30.0).animate(_controller);

    // when _borderRadiusAnimation value changes, the tree is rebuilt, to point to value provided by _borderRadiusAnimation
    _controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.circular(borderRadius),
        shadowColor: Colors.grey,
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: GestureDetector(
                  onTapDown: (_) {
                    _controller.forward();
                  },
                  onTapUp: (_) {
                    _controller.reverse();
                  },
                  onTapCancel: () {
                    _controller.reset();
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ClipRRect(
                        borderRadius:
                            BorderRadius.circular(_borderRadiusAnimation.value),
                        child: Image(
                          image: widget.imageProvider,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800]),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _borderRadiusAnimation.removeListener(() => setState(() {}));
    _controller.dispose();
    super.dispose();
  }
}

class LongPressDraggingItem extends StatelessWidget {
  const LongPressDraggingItem({
    super.key,
    required this.imageProvider,
  });
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 150,
        height: 150,
        child: Image(
          image: imageProvider,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
