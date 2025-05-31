import 'package:flutter/material.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/build_rating_bar.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductReviewViewBody extends StatelessWidget {
  const ProductReviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProductEntity productEntity =
        GoRouter.of(context).state.extra as ProductEntity;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: Card(
            color: Color(0xffFFFFFF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            elevation: 0.1,
            shadowColor: Colors.grey.shade100,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: CircleAvatar(
                  child: Image.asset(
                    'lib/assets/images/profile_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'اكتب التعليق..',
                hintStyle: GoogleFonts.cairo(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff949D9E),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            '${productEntity.reviews.length} مراجعه ',
            style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w700),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('الملخص',
                  style: GoogleFonts.cairo(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          BuildRatinBar(label: '5', value: 1.9),
          SizedBox(
            height: 8,
          ),
          BuildRatinBar(label: '4', value: 0.8),
          SizedBox(
            height: 8,
          ),
          BuildRatinBar(label: '3', value: 0.4),
          SizedBox(
            height: 8,
          ),
          BuildRatinBar(label: '2', value: 0.2),
          SizedBox(
            height: 8,
          ),
          BuildRatinBar(label: '1', value: 0.1),
        ])),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverList.builder(
          
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: 25,
                      child: Image.asset(
                        'lib/assets/images/profile_image.png',
                      ),
                    ),
                    title: Text('keroles rozek',
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff0C0D0D))),
                    subtitle: Text('25/06/2020',
                        style: GoogleFonts.cairo(
                            fontSize: 13, fontWeight: FontWeight.w400)),
                  ),
                  Text(
                      'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
                      style: GoogleFonts.cairo(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff949D9E))),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            })
      ],
    );
  }
}
