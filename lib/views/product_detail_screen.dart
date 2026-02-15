import 'package:flutter/material.dart';
import 'package:minicatalog_app/models/product_models.dart';

class ProductDetailScreen extends StatefulWidget {
  final Data product;
  final Set<int> cardIds;
  const ProductDetailScreen({super.key, required this.product,required this.cardIds});

  @override
  State<ProductDetailScreen> createState() => ProductDetailScreenState();

}
class ProductDetailScreenState extends State<ProductDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Back",style: TextStyle(color: Colors.black),),
        leadingWidth: 20,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
        children: [
          Hero(tag: widget.product.id!,
          child: Image.network(widget.product.image ?? "", height: 350,width: double.infinity,fit:BoxFit.cover),
          ),
          SizedBox(height:2),
          Padding(padding: EdgeInsets.all(30),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(widget.product.name ?? "",style: TextStyle(fontSize:28,fontWeight:FontWeight.bold, ),
                    ),
                  
          SizedBox(height:2),
          Text(widget.product.tagline ?? "",style: TextStyle(fontStyle:FontStyle.italic,color: Colors.grey)),

          SizedBox(height:4),
          Text("Description",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold)),

          SizedBox(height:2),
          Text(widget.product.description ?? ""),

          SizedBox(height:2),
          Text(widget.product.price ?? "",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,)),
          
          SizedBox(height:2),
          ElevatedButton(onPressed: () {
            setState(() {
              widget.cardIds.add(widget.product.id!);
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Added to cart"),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
              bottom: 80,
              left: 20,
              right: 20, 
              ),

            ),
            
            );
            
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.maxFinite,50),
          ),
          child: Text("Add to Cart",style: TextStyle(color: Colors.black),
          ),
          
          ),
          SizedBox(height:2),
          ElevatedButton(onPressed: () {
            setState(() {
              widget.cardIds.add(widget.product.id!);
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Added to my favourites."),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
              bottom: 80,
              left: 20,
              right: 20, 
              ),

            ),
            
            );
            
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.maxFinite,50),
          ),
          child: Text("My Favourite",style: TextStyle(color: Colors.black),
          ),
          
          ),
                    ],
                    ),
          ),
        ],
      ),
      ),
      ),
    );
  }
}