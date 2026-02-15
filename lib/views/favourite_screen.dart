import 'package:flutter/material.dart';
import 'package:minicatalog_app/models/product_models.dart';

 class FavouriteScreen extends StatefulWidget {
   final List<Data> products;
   final Set<int> cardIds;
   const FavouriteScreen({super.key, required this.products, required this.cardIds});

   @override
   State<FavouriteScreen> createState()=> FavouriteScreenState();
   
 }
 class FavouriteScreenState extends State<FavouriteScreen> {
 @override
 Widget build(BuildContext context) {
  final cartProducts =widget.products.where((product) => widget.cardIds.contains(product.id)).toList();

  return Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(
    title: const Text("Favourite List", style: TextStyle(color: Colors.black)),
    leadingWidth: 20,
    backgroundColor: Colors.white,
    elevation: 0, 
  ),
  body: SafeArea(
   child: Column(
    children: [
     cartProducts.isEmpty? 
         Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: const [
                Icon(Icons.favorite_outline, size: 64, color: Colors.black),
                SizedBox(height: 2),
                Text("Your favourite list is empty", style: TextStyle(color: Colors.grey)),
              ],
            ),
          )
          :Expanded(
           child: ListView.builder(
            itemCount: cartProducts.length,
            itemBuilder: (context, index) {
              final item = cartProducts[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      
                      borderRadius: BorderRadius.circular(12), 
                      child: Image.network(item.image!, width: 70, height: 70, fit: BoxFit.cover),
                    ),
                    SizedBox(width:12),
                    Expanded(child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(item.tagline!),
                        Text(item.price.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.cardIds.remove(item.id);
                        });
                      },
                      icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          ),
  ),

  SizedBox(height: 20),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
  onPressed: () {}, 
  style: ElevatedButton.styleFrom(
  backgroundColor: Colors.black, 
  minimumSize: Size(double.infinity,45),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
  ),
  child:Text("Checkout",style: TextStyle(color:Colors.white),)
    ),
  ),
    ],
  ),
  ),
  );

  
 }

 }