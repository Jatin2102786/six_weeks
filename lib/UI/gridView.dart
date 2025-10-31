import 'package:flutter/material.dart';


class FadeGrid extends StatelessWidget {
  const FadeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade Grid'),
      ),
      body: GridView.builder(

        // giving the number of columns in grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

        // item count
          itemCount: 24,

        // for animation
        itemBuilder: (context,index) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(milliseconds: 500 + index * 100),
            builder: (context, value, child) {
              return Opacity(opacity: value, child: child);
            },
            child: _buildItem(index),

          );
        }

      )
    );
  }

  Widget _buildItem(int index) => Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12)),
    alignment: Alignment.center,
    child: Text('Item $index', style: TextStyle(color: Colors.white)),
  );
}

class ScaleGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scale Animation")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.5, end: 1),
            duration: Duration(milliseconds: 300 + index * 100),
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: _buildItem(index),
          );
        },
      ),
    );
  }

  Widget _buildItem(int index) => Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
    alignment: Alignment.center,
    child: Text('Item $index', style: TextStyle(color: Colors.white)),
  );
}

class SlideGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slide Animation")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return TweenAnimationBuilder<Offset>(
            tween: Tween(begin: Offset(1, 0), end: Offset(0, 0)),
            duration: Duration(milliseconds: 300 + index * 100),
            builder: (context, offset, child) {
              return Transform.translate(offset: offset * 100, child: child);
            },
            child: _buildItem(index),
          );
        },
      ),
    );
  }

  Widget _buildItem(int index) => Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
    alignment: Alignment.center,
    child: Text('Item $index', style: TextStyle(color: Colors.white)),
  );
}

class BounceGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bounce Animation")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.5, end: 1.0),
            duration: Duration(milliseconds: 400 + index * 100),
            curve: Curves.bounceOut,
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: _buildItem(index),
          );
        },
      ),
    );
  }

  Widget _buildItem(int index) => Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(12)),
    alignment: Alignment.center,
    child: Text('Item $index', style: TextStyle(color: Colors.white)),
  );
}

class RotateGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rotate Animation")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: -1, end: 0),
            duration: Duration(milliseconds: 500 + index * 100),
            builder: (context, value, child) {
              return Transform.rotate(angle: value, child: child);
            },
            child: _buildItem(index),
          );
        },
      ),
    );
  }

  Widget _buildItem(int index) => Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(12)),
    alignment: Alignment.center,
    child: Text('Item $index', style: TextStyle(color: Colors.white)),
  );
}

class FlipGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flip Animation")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.0, end: 0.0),
            duration: Duration(milliseconds: 300 + index * 100),
            builder: (context, value, child) {
              final angle = value * 3.1415; // flip on y-axis
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle),
                child: child,
              );
            },
            child: _buildItem(index),
          );
        },
      ),
    );
  }

  Widget _buildItem(int index) => Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(12)),
    alignment: Alignment.center,
    child: Text('Item $index', style: TextStyle(color: Colors.white)),
  );
}



