
import 'package:flutter/material.dart';
import 'package:minicatalog_app/components/product_card.dart';
import 'package:minicatalog_app/models/product_models.dart';
import 'package:minicatalog_app/services/api_services.dart';
import 'package:minicatalog_app/views/card_screen.dart';
import 'package:minicatalog_app/views/favourite_screen.dart';
import 'package:minicatalog_app/views/product_detail_screen.dart';
class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();

}
class HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController= TextEditingController();
  ApiServices apiServices =ApiServices();
  bool isLoading = false;
  String errorMessage ="";
  List<Data> allProducts = [];
  
  Set<int> cartIds = {};

  Future<void> fetchProducts() async {
   try {
    setState(() {
      isLoading = true;
    });
     ProductModels data = await apiServices.fetchProducts();
     setState((){
      allProducts =data.data ?? [];

     });
   } catch(e) {
    setState(() {
      errorMessage = "Ürün yüklenemedi.";
    });
   } finally {
    setState(() => isLoading = false);
   }

  }
  @override
  void initState() {
    fetchProducts();
    super.initState();
   
  }
  
  

@override
Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: Colors.white,
  body:SafeArea(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
       Row(
        children: [
        Text("Discover",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
        IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CardScreen(products: allProducts,cardIds: cartIds ,)));
        }, 
        iconSize: 32, 
        icon:Icon(Icons.shopping_bag_outlined),
        
        ),
        
        IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouriteScreen(products: allProducts,cardIds: cartIds ,)));
        }, 
        iconSize: 32, 
        icon:Icon(Icons.favorite_outline),
        
        ),
        
        ],

    ),

     SizedBox(height: 8),
     Text("Find your perfect device.",style:TextStyle(color: Colors.grey),),
     
     SizedBox(height:14),
     Container(
      decoration: BoxDecoration(
        color: Color(0xfff5f5f7),
        borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: SearchController(),
          decoration:InputDecoration(
           hintText: "Search products",
           hintStyle: TextStyle(color: const Color.fromARGB(255, 82, 78, 78)),
           border: InputBorder.none,
           prefixIcon: Icon(Icons.search,color:Colors.grey),
           contentPadding: EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
        SizedBox(height:20),
        
        Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            image: DecorationImage(
            image: NetworkImage("https://beyazkaretasarim.com/wp-content/uploads/2021/02/alisveris-sitesi-logo-tasarimi-1.jpg"),
            fit: BoxFit.fitWidth,
            ),
          ),
        ),
         
         SizedBox(height:10),

         if(isLoading) 
          Center(child: CircularProgressIndicator())
         else if(errorMessage != "")
          Center(child: Text(errorMessage))
         else 
          Expanded(
            child: GridView.builder(
            itemCount: allProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:0.7,
              ), 
              itemBuilder: (context, index) {
               final product = allProducts[index];
               return GestureDetector(
                   onTap: () {
                    Navigator.push(
                    context,
                   MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product,cardIds: cartIds,),
      ),
    );
  },
  child: ProductCard(product: product),
);
             
              }
            ),
          ),


      ], 
      ),
     ),
    ),
  );
   
}

}


