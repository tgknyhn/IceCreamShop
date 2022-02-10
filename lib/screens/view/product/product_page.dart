import 'package:flutter/material.dart';
import '../../../core/init/constants/border_constants.dart';
import '../../../core/init/constants/button_size_constants.dart';
import '../../../core/init/constants/dollar_size_constants.dart';
import '../../../core/init/constants/padding_constants.dart';
import '../../../core/init/enums/star_size_enum.dart';
import '../../../core/init/theme/color_scheme.dart';
import '../../../core/widgets/dollar_sign.dart';
import '../../../core/widgets/star.dart';
import '../../../models/product_model.dart';
import 'package:like_button/like_button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _productCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productPageAppBar(),
      body: productPageBaseColumn(),
    );
  }

  Column productPageBaseColumn() {
    return Column(
      children: [
        Expanded(child: productImageView()),
        productNameView(),
        ratingRow(),
        productCountPriceRow(),
        productDescriptionView(),
        addToCardButton(),
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  Widget addToCardButton() {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingVeryHigh),
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Add To Card", style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.product.lightColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(BorderConstants.instance.circularRadiusLow))),
        ),
      ),
    );
  }

  Widget productDescriptionView() {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingVeryHigh),
      child: Text(
        widget.product.description,
        style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget productCountPriceRow() {
    return Padding(
      padding: EdgeInsets.fromLTRB(PaddingConstants.instance.paddingVeryHigh, PaddingConstants.instance.paddingMedium, PaddingConstants.instance.paddingVeryHigh, 0),
      child: Row(
        children: [
          minusButton(),
          productCountView(),
          plusButton(),
          const Spacer(),
          DollarSign(size: DollarSizeConstants.instance.sizeMax),
          currentPriceView(),
        ],
      ),
    );
  }

  Widget currentPriceView() {
    final String currentPrice = (widget.product.price * _productCount).toStringAsFixed(2);

    return Text(currentPrice, style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold));
  }

  Widget productCountView() {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
      child: Text(
        '$_productCount Kg',
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  Widget ratingRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingConstants.instance.paddingVeryHigh, vertical: PaddingConstants.instance.paddingMedium),
      child: Row(
        children: [
          calculateStars(),
          scoreView(),
          reviewCountView(),
        ],
      ),
    );
  }

  Widget reviewCountView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingConstants.instance.paddingMedium),
      child: Text(
        '(${widget.product.reviewCount.toInt().toString()} Reviews)',
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  Text scoreView() => Text(widget.product.score.toStringAsFixed(1));

  Widget calculateStars() {
    final int score = widget.product.score.floor();

    switch (score) {
      case 0:
        return starRow(true, true, true, true, true);
      case 1:
        return starRow(false, true, true, true, true);
      case 2:
        return starRow(false, false, true, true, true);
      case 3:
        return starRow(false, false, false, true, true);
      case 4:
        return starRow(false, false, false, false, true);
      case 5:
        return starRow(false, false, false, false, false);
      default:
        return starRow(true, true, true, true, true);
    }
  }

  Widget starRow(bool star1, bool star2, bool star3, bool star4, bool star5) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, PaddingConstants.instance.paddingMedium, 0),
      child: Row(
        children: [
          StarImage(isEmpty: star1, size: StarSizes.MEDIUM),
          StarImage(isEmpty: star2, size: StarSizes.MEDIUM),
          StarImage(isEmpty: star3, size: StarSizes.MEDIUM),
          StarImage(isEmpty: star4, size: StarSizes.MEDIUM),
          StarImage(isEmpty: star5, size: StarSizes.MEDIUM)
        ],
      ),
    );
  }

  Widget productNameView() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        PaddingConstants.instance.paddingVeryHigh,
        PaddingConstants.instance.paddingUltraHigh,
        0,
        PaddingConstants.instance.paddingMedium,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          widget.product.name,
          style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold, color: HomeColorScheme.instance?.black),
        ),
      ),
    );
  }

  Container productImageView() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(BorderConstants.instance.circularRadiusUltraHigh),
          bottomEnd: Radius.circular(BorderConstants.instance.circularRadiusUltraHigh),
        ),
        color: widget.product.lightColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
        child: widget.product.image,
      ),
    );
  }

  AppBar productPageAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: widget.product.lightColor,
      elevation: 0,
      actions: [
        Expanded(flex: 1, child: backArrowButton()),
        const Spacer(flex: 3),
        Expanded(flex: 1, child: favouriteButton()),
      ],
    );
  }

  Widget favouriteButton() {
    return const LikeButton();
  }

  IconButton backArrowButton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: HomeColorScheme.instance?.pink,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget minusButton() {
    return Container(
      decoration: addMinusButtonDecoration(),
      child: IconButton(
        onPressed: () {
          if (_productCount > 1) {
            setState(() {
              _productCount--;
            });
          }
        },
        icon: Icon(
          Icons.remove,
          color: HomeColorScheme.instance?.white,
          size: ButtonSizeConstants.instance.medium,
        ),
      ),
      width: ButtonSizeConstants.instance.medium * 2,
      height: ButtonSizeConstants.instance.medium * 2,
    );
  }

  Widget plusButton() {
    return Container(
      decoration: addMinusButtonDecoration(),
      child: IconButton(
        onPressed: () {
          setState(() {
            _productCount++;
          });
        },
        icon: Icon(
          Icons.add,
          color: HomeColorScheme.instance?.white,
          size: ButtonSizeConstants.instance.medium,
        ),
      ),
      width: ButtonSizeConstants.instance.medium * 2,
      height: ButtonSizeConstants.instance.medium * 2,
    );
  }

  BoxDecoration addMinusButtonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusLow),
      color: HomeColorScheme.instance?.pink,
    );
  }
}
