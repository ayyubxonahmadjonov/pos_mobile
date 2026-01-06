/*
  Created by: Azizbek
  Created on: Feb 22 2023 13:44:50
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv
  Documentation:
*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/bloc/creat_purches/bloc.dart';
import 'package:pos_mobile/bloc/select_service/select_service_bloc.dart';
import 'package:pos_mobile/bloc/update_purchase_order/bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/purches/components/purchase_sms_checkbox_widget.dart';
import '../../../../hive_helper/app_prefs.dart';
import '../search/search_service.dart';
import 'create_purchase_footer.dart';
import '../../../../bloc/add_purches/bloc.dart';
import '../../../../bloc/edit_purches/bloc.dart';
import '../../../../bloc/items/bloc.dart';
import '../../../../models/purchase/purchase_model.dart';
import '../../../../models/service_list/service_list.dart';
import '../../../widgets/dialogs/app_dialogs.dart';
import '../search/search_supplier.dart';
import 'purchase_product_tile.dart';

class CreateNewPurchase extends StatefulWidget {
  final bool? editC;
  final Purchase? purchaseC;
  const CreateNewPurchase({
    super.key,
    this.editC = false,
    this.purchaseC,
  });
  @override
  State<StatefulWidget> createState() => _CreateNewPurchaseState();
}

class _CreateNewPurchaseState extends State<CreateNewPurchase> {
  final _formKey = GlobalKey<FormState>();
  bool pinned = true;
  bool snap = false;
  bool floating = false;
  List locations = [
    'Пожалуйста, подождите',
  ];
  bool sms = false;
  String? supplierSId = '';
  String? serviceSId = '';

  ServiceList service = ServiceList(name: 'Филиал ');
  final String time = AppFormatter.formatDate(
    DateTime.now(),
    pattern: 'dd.mm.yyyy',
  );
  final TextEditingController commentController = TextEditingController();
  final TextEditingController supplierController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController initialDateController = TextEditingController();
  final TextEditingController finishedDateController = TextEditingController();
  List<Product> list = [];
  late CreatPurchesOrderBloc creatPurchesBloc;
  @override
  void initState() {
    super.initState();
    creatPurchesBloc = BlocProvider.of(context);
    final productListBloc = BlocProvider.of<PurchaseproductListBloc>(context);

    creatPurchesBloc.stream.listen((state) {
      if (state is CreatPurchesOrderSuccesState) {
        productListBloc.add(ClearPurchaseProductList());
        AppNavigator.pop();
      }
    });
    initialDateController.text = widget.editC == false
        ? time
        : AppFormatter.formatDateFromMills(
            widget.purchaseC?.purchaseOrderDate as int,
            pattern: 'dd.mm.yyyy');
    finishedDateController.text = widget.editC == false
        ? time
        : AppFormatter.formatDateFromMills(widget.purchaseC?.expectedOn as int,
            pattern: 'dd.mm.yyyy');
    if (widget.editC != false) {
      commentController.text = widget.purchaseC!.notes.toString();
      service = ServiceList(
        name: widget.purchaseC!.serviceName,
        sId: widget.purchaseC!.supplierId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseproductListBloc, PurchaseproductListState>(
      builder: (context, state) {
        // PurchaseproductListBloc bloc = BlocProvider.of(context);
        return BlocBuilder<EditPurchaseproductListBloc,
            EditPurchaseproductListState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: CreatePurchaseFooter(
                editC: widget.editC,
              ),
              body: Form(
                key: _formKey,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: TextButton(
                            onPressed: () {
                              FormState? formState = _formKey.currentState;
                              bool validate = (formState?.validate() ?? false);
                              if (!validate) return;

                              if (PurchaseproductListBloc.products.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: AppStrings.addOneItem,
                                );
                                return;
                              }

                              // bool validate =
                              //     _formKey.currentState?.validate() ?? false;
                              Purchase purchase = Purchase(
                                type: "",
                                // status: "pending",
                                totalCurrency: "uzs",
                                items: PurchaseproductListBloc.products,
                                supplierId: supplierSId,
                                purchaseOrderDate: AppFormatter.parseDate(
                                        initialDateController.text)
                                    .millisecondsSinceEpoch,
                                expectedOn: AppFormatter.parseDate(
                                        finishedDateController.text)
                                    .millisecondsSinceEpoch,
                                service: serviceSId,
                                notes: commentController.text,
                                partiationNo: '',
                                additionalCost: [],
                                sendMessageToSupplier: sms,
                                refund: 'refund',
                              );

                              // ======================================= //

                              // if (validate) {
                              if (widget.editC == false) {
                                creatPurchesBloc.add(
                                    GetStartCreatPurchesOrderEvent(purchase));
                              } else {
                                Purchase editingPurchase = Purchase(
                                  additionalCost: [],
                                  expectedOn: AppFormatter.parseDate(
                                          finishedDateController.text)
                                      .millisecondsSinceEpoch,
                                  items: EditPurchaseproductListBloc
                                      .editingProducts,
                                  refund: purchase.refund,
                                  notes: commentController.text,
                                  service: widget.purchaseC?.service,
                                  supplierId: widget.purchaseC?.supplierId,
                                  // service: service.serviceId,
                                  // supplierId: supplierSId,
                                  totalCurrency: purchase.totalCurrency,
                                  type: purchase.type,
                                );
                                BlocProvider.of<UpdatePurchaseOrderBloc>(
                                        context)
                                    .add(
                                  StartUpdatePurcheseOrderEvent(
                                    purchase: editingPurchase,
                                    purchaseId: widget.purchaseC!.id.toString(),
                                  ),
                                );
                              }
                              // }
                            },
                            child: widget.editC == true
                                ? BlocConsumer<UpdatePurchaseOrderBloc,
                                    UpdatePurchaseOrderState>(
                                    listener: (context, state) {
                                      if (state
                                          is UpdatePurchaseOrderSuccesState) {
                                        Navigator.pop(context, "refresh");
                                      }
                                    },
                                    builder: (context, state) {
                                      return state
                                              is UpdatePurchaseOrderProccesState
                                          ? SizedBox(
                                              height: 30.0.h,
                                              width: 24.0.w,
                                              child:
                                                  const CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              'Сохранить',
                                              style: AppTextStyle.medium()
                                                  .copyWith(
                                                      color: Colors.white),
                                            );
                                    },
                                  )
                                : Text(
                                    'Сохранить',
                                    style: AppTextStyle.medium()
                                        .copyWith(color: Colors.white),
                                  ),
                          ),
                        )
                      ],
                      pinned: pinned,
                      snap: snap,
                      floating: floating,
                      expandedHeight: 280.0.h,
                      flexibleSpace: FlexibleSpaceBar(
                        // title: Text("FlexibleSpace title"),
                        background: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              dropButtonBuild(),
                              SizedBox(height: 15.h),
                              buildDate(),
                              SizedBox(height: 15.h),
                              buildComment(),
                              widget.editC == false
                                  ? PurchaseSmsCheckboxWidget(
                                      onChanged: (v) => setState(() {
                                        sms = v!;
                                      }),
                                      value: sms,
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: PurchasePersistentHeader(),
                      pinned: true,
                      floating: true,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: widget.editC == false
                            ? PurchaseproductListBloc.products.length
                            : EditPurchaseproductListBloc
                                .editingProducts.length,
                        (context, index) {
                          return widget.editC == true
                              ? BlocBuilder<EditPurchaseproductListBloc,
                                  EditPurchaseproductListState>(
                                  builder: (context, state) {
                                    return PurchaseProductTile(
                                      index: index,
                                      product: EditPurchaseproductListBloc
                                          .editingProducts[index],
                                      //list[index],
                                      clickable: true,
                                      isEditing: widget.editC!,
                                      isAction: true,
                                    );
                                  },
                                )
                              : BlocBuilder<PurchaseproductListBloc,
                                  PurchaseproductListState>(
                                  builder: (context, state) {
                                    return PurchaseProductTile(
                                      index: index,
                                      product: PurchaseproductListBloc
                                          .products[index],
                                      //list[index],
                                      clickable: true,
                                      isEditing: widget.editC!,
                                      isAction: true,
                                    );
                                  },
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ).screenLoading(
              visible: context.watch<CreatPurchesOrderBloc>().state
                  is CreatPurchesOrderProccesState,
            );
          },
        );
      },
    );
  }

//////////////// build comment widget/////////////////////
  Widget buildComment() {
    return SizedBox(
      // height: 55.h,
      child: TextFormField(
        // validator: AppValidators.general,
        style: AppTextStyle.medium(size: 14),
        controller: commentController,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          hintText: 'Комментария',
          hintStyle: AppTextStyle.medium(size: 14),
        ),
      ),
    );
  }

//////////////// build buildDate widget/////////////////////
  Widget buildDate() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            controller: initialDateController,
            readOnly: true,
            onTap: () {
              _showDateTimePicker(initialDateController);
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.edit_calendar_outlined,
                  color: Color(0xff429A8A),
                ),
                hintText: initialDateController.text),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: TextField(
            controller: finishedDateController,
            readOnly: true,
            onTap: () {
              _showDateTimePicker(finishedDateController);
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.edit_calendar_outlined,
                  color: Color(0xff429A8A),
                ),
                hintText: finishedDateController.text),
          ),
        ),
      ],
    );
  }

//////////////// build dropButtonBuild widget/////////////////////
  Widget dropButtonBuild() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            // height: 50.w,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: BlocBuilder<SelectServiceBloc, SelectServiceState>(
              builder: (context, state) {
                if (widget.editC == true) {
                  serviceController.text = widget.purchaseC!.serviceName;
                  serviceSId = widget.purchaseC!.service;
                  AppPrefs.instance.setService(serviceSId);
                }
                if (state is SetServiceIdName) {
                  if (widget.editC == false) {
                    serviceSId = state.serviceSid;
                    serviceController.text = state.serviceName;
                    AppPrefs.instance.setService(serviceSId);
                  } else {
                    serviceSId = widget.purchaseC!.service;
                    serviceController.text = widget.purchaseC!.serviceName;
                    AppPrefs.instance.setService(serviceSId);
                  }
                }

                return Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextFormField(
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: SearchSercide(),
                        );
                      },
                      validator: AppValidators.general,
                      style: AppTextStyle.medium(size: 14),
                      readOnly: true,
                      controller: serviceController,
                      decoration: InputDecoration(
                        // suffixIconConstraints:
                        //     const BoxConstraints(maxWidth: 15, minWidth: 15),
                        suffix: const Text(''),
                        errorStyle: const TextStyle(height: 0, fontSize: 0),

                        hintText: 'Филиал',
                        hintStyle: AppTextStyle.medium(size: 14),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xff429A8A),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: 20.h,
        ),
        Expanded(
          flex: 1,
          child: Container(
            // height: 50.w,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: BlocBuilder<SupplierItemBloc, SupplierItemState>(
              builder: (context, state) {
                if (widget.editC == true) {
                  supplierController.text = widget.purchaseC!.supplierName;
                  supplierSId = widget.purchaseC!.supplierId;
                }
                if (state is SetSupplierIdName) {
                  widget.editC == false
                      ? supplierSId = state.supplierSId
                      : supplierSId = widget.purchaseC!.supplierId;

                  widget.editC == false
                      ? supplierController.text = state.supplierName
                      : supplierController.text =
                          widget.purchaseC!.supplierName;
                }
                return Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextFormField(
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: SearchSupplier(),
                        );
                      },
                      validator: AppValidators.general,
                      style: AppTextStyle.medium(size: 14),
                      readOnly: true,
                      controller: supplierController,
                      decoration: InputDecoration(
                        // suffixIconConstraints:
                        //     const BoxConstraints(maxWidth: 15, minWidth: 15),
                        suffix: const Text(''),
                        errorStyle: const TextStyle(height: 0, fontSize: 0),

                        hintText: 'Поставщик',
                        hintStyle: AppTextStyle.medium(size: 14),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xff429A8A),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showDateTimePicker(TextEditingController control) async {
    AppDialog dialog = AppDialog(context);
    dialog.setBirthDate(control);
  }
}

class PurchasePersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          const Text('№'),
          SizedBox(width: 8.w),
          const Text(AppStrings.name),
          const Spacer(),
          const Text(AppStrings.quantity),
          SizedBox(width: 25.w),
          const Text('Цена'),
        ],
      ).symmetricPadding(h: 16.0),
    );
  }

  @override
  double get maxExtent => 56.h;

  @override
  double get minExtent => 56.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
