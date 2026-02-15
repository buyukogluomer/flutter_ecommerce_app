import 'package:flutter/material.dart';
import 'package:minicatalog_app/models/product_models.dart';

class ProductCard extends StatelessWidget {
  final Data product;

  const ProductCard({super.key, required this.product});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                 BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(tag: product.id!,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.vertical(top:Radius.circular(12),),
                child: Image.network(
                  product.image ?? '',
                  width: double.infinity, 
                  fit: BoxFit.cover, 
                ),
                ),
                ),
                 SizedBox(height:2),
                 Text(
                  product.name ?? "",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),
                 ),
                 SizedBox(height:2),
                 Text(product.tagline ?? "",style:TextStyle(fontSize:10,color: Colors.grey, ),),
                 
                 SizedBox(height:2),
                 Text(product.price ?? "",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold))
              ],
              ),
             );
  }
}