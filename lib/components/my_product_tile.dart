import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatefulWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  @override
  _MyProductTileState createState() => _MyProductTileState();
}

class _MyProductTileState extends State<MyProductTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() { _controller.forward(); }),
      onExit: (_) => setState(() { _controller.reverse(); }),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(widget.product.imagepath, fit: BoxFit.cover),
                ),
              ),
              Text(widget.product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
              const SizedBox(height: 5),
              Expanded(
                child: Text(widget.product.description, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey)),
              ),
              Row(
                children: widget.product.colorOptions.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() { _selectedColor = color; });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: _selectedColor == color ? Colors.black : Colors.grey, width: 2),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${widget.product.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.red)),
                  ElevatedButton(
                    onPressed: _selectedColor != null
                        ? () {
                      Provider.of<Shop>(context, listen: false).addtocart(widget.product, _selectedColor!);
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[300], // Lemon color
                    ),
                    child: const Text("Add to Cart"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
