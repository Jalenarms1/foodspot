import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodspot/extensions/padding_ext.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/managers/cart_notifier.dart';
import 'package:foodspot/models/menu_item.dart';
import 'package:foodspot/models/order_item.dart';
import 'package:foodspot/shop_data.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/shared/app_button.dart';
import 'package:provider/provider.dart';

class MenuItemScreen extends StatefulWidget {
  final MenuItem menuItem;
  const MenuItemScreen({super.key, required this.menuItem});

  @override
  State<MenuItemScreen> createState() => _MenuItemScreenState();
}

class _MenuItemScreenState extends State<MenuItemScreen> {
  late OrderItem _orderItem;
  TextEditingController _specialInstrctions = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orderItem = OrderItem(
      id: UniqueKey().toString(),
      menuItem: widget.menuItem,
      selectedMeats: List.from(widget.menuItem.defaultMeat),
      selectedToppings: List.from(widget.menuItem.defaultToppings),
      specialInstructions: "",
      quantity: 1,
    );

    print(_orderItem.id);
  }

  @override
  Widget build(BuildContext context) {
    final cartNotifier = Provider.of<CartNotifier>(context, listen: false);

    void addToCart() {
      _orderItem.specialInstructions = _specialInstrctions.text;

      cartNotifier.addToCart(_orderItem);
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: kIsWeb ? 250 : 300,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        widget.menuItem.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: kIsWeb ? 25 : 50,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              blurRadius: 2,
                              spreadRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.close_rounded, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 125),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          bottom: 20.0,
                          left: 10,
                          right: 10,
                        ),
                        width: double.infinity,
                        color: Colors.black.withValues(alpha: 0.75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.menuItem.label).appFontStyle(
                                  weight: FontWeight.bold,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 300,
                                  child: Text(
                                    widget.menuItem.description,
                                  ).appFontStyle(
                                    weight: FontWeight.w400,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.menuItem.price.toString(),
                            ).appFontStyle(color: Colors.white, size: 12),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Meat",
                            ).appFontStyle(size: 18, weight: FontWeight.w600),
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  ShopData.Meats.map((meat) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_orderItem.selectedMeats.contains(
                                            meat,
                                          )) {
                                            _orderItem.selectedMeats =
                                                _orderItem.selectedMeats
                                                    .where((m) => m != meat)
                                                    .toList();
                                            return;
                                          }

                                          _orderItem.selectedMeats.add(meat);
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                        ),
                                        child: Row(
                                          spacing: 10,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  color: Colors.grey.withValues(
                                                    alpha: 0.25,
                                                  ),
                                                ),
                                                if (_orderItem.selectedMeats
                                                    .contains(meat))
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    color: AppColors.darkRed,
                                                  ),
                                              ],
                                            ),
                                            Text(meat).appFontStyle(size: 14),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                            Text(
                              "Toppings",
                            ).appFontStyle(size: 18, weight: FontWeight.w600),
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  ShopData.Toppings.map((topping) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_orderItem.selectedToppings
                                              .contains(topping)) {
                                            _orderItem.selectedToppings =
                                                _orderItem.selectedToppings
                                                    .where((t) => t != topping)
                                                    .toList();
                                            return;
                                          }

                                          _orderItem.selectedToppings.add(
                                            topping,
                                          );
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                        ),
                                        child: Row(
                                          spacing: 10,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  color: Colors.grey.withValues(
                                                    alpha: 0.25,
                                                  ),
                                                ),
                                                if (_orderItem.selectedToppings
                                                    .contains(topping))
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    color: AppColors.darkRed,
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              topping,
                                            ).appFontStyle(size: 14),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Special Instructions",
                                ).appFontStyle(weight: FontWeight.bold),
                                TextField(
                                  controller: _specialInstrctions,
                                  maxLines: 5,
                                  minLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ],
                            ).padding(
                              edgeInsets: EdgeInsets.only(top: 10, bottom: 10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Quantity",
                                ).appFontStyle(weight: FontWeight.bold),
                                Text(_orderItem.quantity.toString()),
                              ],
                            ),
                          ],
                        ).padding(edgeInsets: EdgeInsets.all(10.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                spacing: 10,
                children: [
                  FloatingActionButton(
                    heroTag: "minus",
                    onPressed: () {
                      if (_orderItem.quantity == 1) {
                        return;
                      }
                      setState(() {
                        _orderItem.quantity -= 1;
                      });
                    },
                    child: Text("-").appFontStyle(weight: FontWeight.bold),
                    splashColor: Colors.transparent,
                    backgroundColor: Colors.white.withValues(alpha: 0.95),
                  ),
                  FloatingActionButton(
                    heroTag: "add",
                    onPressed: () {
                      setState(() {
                        _orderItem.quantity += 1;
                      });
                    },
                    child: Text("+").appFontStyle(weight: FontWeight.bold),
                    splashColor: Colors.transparent,
                    backgroundColor: Colors.white.withValues(alpha: 0.95),
                  ),
                  Expanded(
                    child: FloatingActionButton.extended(
                      heroTag: "ato",
                      backgroundColor: AppColors.darkRed,
                      onPressed: () {
                        addToCart();
                        print(cartNotifier.numOfItems);
                        // Navigator.pop(context);
                        showModalBottomSheet(
                          constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height *
                                (kIsWeb ? .9 : .75),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0),
                                ),
                              ),
                              padding: EdgeInsets.all(20.0),
                              height: MediaQuery.of(context).size.height,
                              width: double.infinity,
                              child: Column(
                                spacing: 20,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Done!").appFontStyle(
                                        color: AppColors.darkRed,
                                        size: 24,
                                        weight: FontWeight.w600,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(
                                            context,
                                          ).popUntil((route) => route.isFirst);
                                        },
                                        icon: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withValues(
                                              alpha: 0.45,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          width: 30,
                                          height: 30,
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "New item added to your order",
                                  ).appFontStyle(
                                    color: Colors.grey,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    // height: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          spacing: 5,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.asset(
                                                widget.menuItem.imagePath,
                                                width: 75,
                                                height: 75,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.menuItem.label,
                                                ).appFontStyle(
                                                  weight: FontWeight.w600,
                                                  size: 14,
                                                ),
                                                Text(
                                                  "Qty: ${_orderItem.quantity}",
                                                ).appFontStyle(
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "\$ ${(_orderItem.quantity * _orderItem.menuItem.price).toStringAsFixed(2)}",
                                        ).appFontStyle(size: 16),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Meat",
                                      ).appFontStyle(weight: FontWeight.bold),
                                      Text(
                                        _orderItem.selectedMeats.join(", "),
                                      ).appFontStyle(
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Toppings",
                                      ).appFontStyle(weight: FontWeight.bold),
                                      Text(
                                        _orderItem.selectedToppings.join(", "),
                                      ).appFontStyle(
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  if (_orderItem.specialInstructions.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Special Instructions",
                                        ).appFontStyle(weight: FontWeight.bold),
                                        Text(
                                          _orderItem.specialInstructions,
                                        ).appFontStyle(
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      spacing: 20,
                                      children: [
                                        AppButton(
                                          onPressed: () {},
                                          label: Text(
                                            "Review order",
                                          ).appFontStyle(
                                            color: Colors.white,
                                            size: 14,
                                            weight: FontWeight.w600,
                                          ),
                                          bgColor: AppColors.darkRed,
                                        ),
                                        AppButton(
                                          onPressed: () {
                                            Navigator.of(context).popUntil(
                                              (route) => route.isFirst,
                                            );
                                          },
                                          label: Text("Continue").appFontStyle(
                                            color: AppColors.darkRed,
                                            size: 14,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ).padding(
                                      edgeInsets: EdgeInsets.only(
                                        top: 20,
                                        bottom: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).then((v) {
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                        });
                      },
                      label: Text(
                        "Add to order: (${_orderItem.quantity}) \$${(widget.menuItem.price * _orderItem.quantity).toStringAsFixed(2)}",
                      ).appFontStyle(
                        size: 14,
                        color: Colors.white,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ).padding(
                edgeInsets: EdgeInsets.only(
                  bottom: kIsWeb ? 15.0 : 30.0,
                  left: 15,
                  right: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
