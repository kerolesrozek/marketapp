import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitesapp/features/cart/presentation/cubit/delet_cart_cubit/delete_cart_cubit.dart';
import 'package:fruitesapp/features/cart/presentation/cubit/get_carts_cubit/get_carts_cubit.dart';
import '../../../domain/entities/cart_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartEntity,
  });
  final CartEntity cartEntity;
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteCartCubit, DeleteCartState>(
      builder: (context, state) {
        log('im rebult');
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 0.2, color: Colors.grey),
            )),
            height: MediaQuery.sizeOf(context).height * 0.14,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  color: Color(0xffF3F5F7),
                  child: AspectRatio(
                    aspectRatio: 1.2 / 1.5,
                    child: CachedNetworkImage(
                      imageUrl: cartEntity.productEntity.imagePath,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cartEntity.productEntity.name,
                              style: GoogleFonts.cairo(
                                  fontSize: 13, fontWeight: FontWeight.w700)),
                          GestureDetector(
                              onTap: () {
                                BlocProvider.of<DeleteCartCubit>(context)
                                    .deleteCart(cartEntity: cartEntity);
                                BlocProvider.of<GetCartsCubit>(context)
                                    .getCarts();
                              },
                              child: SvgPicture.asset(
                                  'lib/assets/images/trash_icon.svg'))
                        ],
                      ),
                      Text('${cartEntity.calcTotalweight().toString()}كج',
                          style: GoogleFonts.cairo(
                              fontSize: 13, color: Color(0xffF4A91F))),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              cartEntity.count++;
                              BlocProvider.of<GetCartsCubit>(context)
                                  .getCarts();
                            },
                            child: SvgPicture.asset(
                              'lib/assets/images/plus_item_in_cart_view.svg',
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            cartEntity.count.toString(),
                            style: GoogleFonts.cairo(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (cartEntity.count == 0) {
                                return;
                              } else {
                                cartEntity.count--;
                                BlocProvider.of<GetCartsCubit>(context)
                                    .getCarts();
                                return;
                              }
                            },
                            child: SvgPicture.asset(
                                'lib/assets/images/minus_item_in_cart_view.svg'),
                          ),
                          Spacer(),
                          Text('${cartEntity.calcTotalPrice().toString()}جنية',
                              style: GoogleFonts.cairo(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffF4A91F)))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
