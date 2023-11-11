import 'package:flutter/material.dart';

class ParallaxScroll extends StatelessWidget {
  const ParallaxScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScrollContainer(),
    );
  }
}

class ScrollContainer extends StatelessWidget {
  const ScrollContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Places"),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 7,
            (context, index) => LocationListItem(
                name: locations[index].name,
                country: locations[index].place,
                imageUrl: locations[index].imageUrl),
          ),
        )
      ],
    );
  }
}

class LocationListItem extends StatelessWidget {
  LocationListItem(
      {super.key,
      required this.name,
      required this.country,
      required this.imageUrl});

  final String imageUrl;
  final String name;
  final String country;

  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
        delegate: ParallaxFlowDelegate(
            backgroundImageKey: _backgroundImageKey,
            listItemContext: context,
            scrollable: Scrollable.of(context)),
        children: [
          Image.network(
            imageUrl,
            key: _backgroundImageKey,
            fit: BoxFit.cover,
          )
        ]);
  }

  Widget _buildGradient() {
    return Positioned.fill(
        child: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              stops: const [0.6, 0.95])),
    ));
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
        left: 20,
        bottom: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              country,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ));
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate(
      {required this.scrollable,
      required this.backgroundImageKey,
      required this.listItemContext})
      : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final GlobalKey backgroundImageKey;
  final BuildContext listItemContext;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    // since we want to create a container for how to size our image and how wide it should be
    // we know that the controller should be just as wide as the image
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;

    // find the offset of the given container, from its origin, to list view it is a part of
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // finding the position in terms of percentage
    // of the container, in the list view
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(0, 1);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect = verticalAlignment.inscribe(backgroundSize,
        Rect.fromLTWH(0, 0, listItemSize.width, listItemSize.height));

    // Paint the background.
    // since our children list for delegate only has 1 child, we reference it by zeroth index
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const urlPrefix =
    'https://docs.flutter.dev/cookbook/img-files/effects/parallax';
const locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl: '$urlPrefix/01-mount-rushmore.jpg',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    imageUrl: '$urlPrefix/02-singapore.jpg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl: '$urlPrefix/03-machu-picchu.jpg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl: '$urlPrefix/04-vitznau.jpg',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl: '$urlPrefix/05-bali.jpg',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl: '$urlPrefix/06-mexico-city.jpg',
  ),
  Location(
    name: 'Cairo',
    place: 'Egypt',
    imageUrl: '$urlPrefix/07-cairo.jpg',
  ),
];


/**
https://www.phind.com/search?cache=mfru52lrs1dz0zl8ntwctxm7
 */