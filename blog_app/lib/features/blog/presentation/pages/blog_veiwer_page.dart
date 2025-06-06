import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/calculate_reading_time.dart';
import 'package:blog_app/core/utils/format_date.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

class BlogVeiwerPage extends StatelessWidget {

  final Blog blog;
  const BlogVeiwerPage({super.key, required this.blog});
  static route(Blog blog) => MaterialPageRoute(builder: (context)=> BlogVeiwerPage(blog:blog));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(blog.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
            
                const SizedBox(height: 20,),
            
                Text('By ${blog.posterName}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                ),
                const SizedBox(height: 5,),
                 Text('${formatDateBydMMMYYYY(blog.updatedAt)} . ${calculateReadingTime(blog.content)} min',
                 style: TextStyle(
                  color:AppPallete.greyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                 ),
                 ),
                  const SizedBox(height: 20,),
            
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(blog.imageUrl),
                  ),
                  const SizedBox(height: 20,),
                  Text(blog.content,
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                  ),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}  