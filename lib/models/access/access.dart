/*
    Created by: Bakhromjon Polat
    Created on: Dec 29 2022 10:19:18

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
part 'access.g.dart';

@HiveType(typeId: HiveTypes.access, adapterName: HiveAdapters.accessAdapter)
class AccessModel {
  AccessModel({
    bool? isBos,
    bool? pos,
    bool? closeTicket,
    bool? wharehouseManager,
    bool? canSell,
    bool? printPreCheck,
    bool? receiptSaveAsDraft,
    bool? canChangePrice,
    bool? refund,
    bool? showAllReceipts,
    bool? payDebt,
    bool? showShiftHistory,
    bool? applyDiscount,
    bool? changeSettings,
    bool? editItems,
    bool? editTicket,
    bool? splitTicket,
    bool? changeWaiter,
    bool? deleteTicket,
    bool? showAllTickets,
    bool? canAccessToShift,
    bool? backOffice,
    bool? reports,
    bool? items,
    bool? employees,
    bool? customers,
    bool? settings,
    bool? editProfile,
    bool? setTheTaxes,
    bool? managePosDevices,
    bool? canDeleteItem,
    bool? inventory,
    bool? invPurchaseOrders,
    bool? invPurchaseMark,
    bool? invPurchaseOrdersCost,
    bool? invTransferOrders,
    bool? invStockAdjusment,
    bool? invStockAdjusmentCost,
    bool? invInventoryCounts,
    bool? invProductions,
    bool? invProductionsCost,
    bool? invSuppliers,
    bool? invSupplierTransaction,
    bool? invSupplierTransactionCorrector,
    bool? invFees,
    bool? invInventoryHistory,
    bool? invInventoryValuation,
    bool? workgroup,
    bool? workgroupEditCost,
    String? id,
    String? organization,
    String? name,
    int? v,
    String? updatedAt,
    bool? employeeAccessRights,
    bool? employeeAccessRightsAdd,
    bool? employeeAccessRightsDel,
    bool? employeeList,
    bool? employeeListAdd,
    bool? employeeListDel,
    bool? employeeTimeCards,
    bool? employeeTotalWorked,
    bool? itemAddFromWarehause,
    bool? itemCategories,
    bool? itemCompositeItem,
    bool? itemDiscount,
    bool? itemList,
    bool? itemModifiers,
    bool? itemMxikSearch,
    bool? itemPriceChangeHistory,
    bool? itemPrintLabel,
    bool? reportAbs,
    bool? reportAccaunt,
    bool? reportDebt,
    bool? reportDiscount,
    bool? reportEmployee,
    bool? reportReceipt,
    bool? reportSale,
    bool? reportSaleByCategory,
    bool? reportSaleByItem,
    bool? reportSaleByPayment,
    bool? reportSaleBySupplier,
    bool? reportShift,
    bool? reportTaxes,
    bool? settingButtons,
    bool? settingCurrency,
    bool? settingGeneral,
    bool? settingLoyalty,
    bool? settingNds,
    bool? settingOpenTickets,
    bool? settingOptions,
    bool? settingOrganization,
    bool? settingPaymentTypes,
    bool? settingPosDevices,
    bool? settingReceipt,
    bool? settingStores,
    bool? settingTaxes,
    bool? create,
    bool? createAccess,
    bool? createCustomer,
    bool? createDiscount,
    bool? createEmployee,
    bool? createFee,
    bool? createGoodCategory,
    bool? createGoodSale,
    bool? createInvCount,
    bool? createModifier,
    bool? createPosDevice,
    bool? createProduction,
    bool? createPurchase,
    bool? createReciept,
    bool? createStockAdjustmen,
    bool? createStore,
    bool? createSupplier,
    bool? createSupplierCreateDoc,
    bool? createTaxes,
    bool? createTimeCard,
    bool? createTransfer,
    bool? itemEdit,
  }) {
    _isBos = isBos;
    _pos = pos;
    _closeTicket = closeTicket;
    _wharehouseManager = wharehouseManager;
    _canSell = canSell;
    _printPreCheck = printPreCheck;
    _receiptSaveAsDraft = receiptSaveAsDraft;
    _canChangePrice = canChangePrice;
    _refund = refund;
    _showAllReceipts = showAllReceipts;
    _payDebt = payDebt;
    _showShiftHistory = showShiftHistory;
    _applyDiscount = applyDiscount;
    _changeSettings = changeSettings;
    _editItems = editItems;
    _editTicket = editTicket;
    _splitTicket = splitTicket;
    _changeWaiter = changeWaiter;
    _deleteTicket = deleteTicket;
    _showAllTickets = showAllTickets;
    _canAccessToShift = canAccessToShift;
    _backOffice = backOffice;
    _reports = reports;
    _items = items;
    _employees = employees;
    _customers = customers;
    _settings = settings;
    _editProfile = editProfile;
    _setTheTaxes = setTheTaxes;
    _managePosDevices = managePosDevices;
    _canDeleteItem = canDeleteItem;
    _inventory = inventory;
    _invPurchaseOrders = invPurchaseOrders;
    _invPurchaseMark = invPurchaseMark;
    _invPurchaseOrdersCost = invPurchaseOrdersCost;
    _invTransferOrders = invTransferOrders;
    _invStockAdjusment = invStockAdjusment;
    _invStockAdjusmentCost = invStockAdjusmentCost;
    _invInventoryCounts = invInventoryCounts;
    _invProductions = invProductions;
    _invProductionsCost = invProductionsCost;
    _invSuppliers = invSuppliers;
    _invSupplierTransaction = invSupplierTransaction;
    _invSupplierTransactionCorrector = invSupplierTransactionCorrector;
    _invFees = invFees;
    _invInventoryHistory = invInventoryHistory;
    _invInventoryValuation = invInventoryValuation;
    _workgroup = workgroup;
    _workgroupEditCost = workgroupEditCost;
    _id = id;
    _organization = organization;
    _name = name;
    _v = v;
    _updatedAt = updatedAt;
    _employeeAccessRights = employeeAccessRights;
    _employeeAccessRightsAdd = employeeAccessRightsAdd;
    _employeeAccessRightsDel = employeeAccessRightsDel;
    _employeeList = employeeList;
    _employeeListAdd = employeeListAdd;
    _employeeListDel = employeeListDel;
    _employeeTimeCards = employeeTimeCards;
    _employeeTotalWorked = employeeTotalWorked;
    _itemAddFromWarehause = itemAddFromWarehause;
    _itemCategories = itemCategories;
    _itemCompositeItem = itemCompositeItem;
    _itemDiscount = itemDiscount;
    _itemList = itemList;
    _itemModifiers = itemModifiers;
    _itemMxikSearch = itemMxikSearch;
    _itemPriceChangeHistory = itemPriceChangeHistory;
    _itemPrintLabel = itemPrintLabel;
    _reportAbs = reportAbs;
    _reportAccaunt = reportAccaunt;
    _reportDebt = reportDebt;
    _reportDiscount = reportDiscount;
    _reportEmployee = reportEmployee;
    _reportReceipt = reportReceipt;
    _reportSale = reportSale;
    _reportSaleByCategory = reportSaleByCategory;
    _reportSaleByItem = reportSaleByItem;
    _reportSaleByPayment = reportSaleByPayment;
    _reportSaleBySupplier = reportSaleBySupplier;
    _reportShift = reportShift;
    _reportTaxes = reportTaxes;
    _settingButtons = settingButtons;
    _settingCurrency = settingCurrency;
    _settingGeneral = settingGeneral;
    _settingLoyalty = settingLoyalty;
    _settingNds = settingNds;
    _settingOpenTickets = settingOpenTickets;
    _settingOptions = settingOptions;
    _settingOrganization = settingOrganization;
    _settingPaymentTypes = settingPaymentTypes;
    _settingPosDevices = settingPosDevices;
    _settingReceipt = settingReceipt;
    _settingStores = settingStores;
    _settingTaxes = settingTaxes;
    _create = create;
    _createAccess = createAccess;
    _createCustomer = createCustomer;
    _createDiscount = createDiscount;
    _createEmployee = createEmployee;
    _createFee = createFee;
    _createGoodCategory = createGoodCategory;
    _createGoodSale = createGoodSale;
    _createInvCount = createInvCount;
    _createModifier = createModifier;
    _createPosDevice = createPosDevice;
    _createProduction = createProduction;
    _createPurchase = createPurchase;
    _createReciept = createReciept;
    _createStockAdjustmen = createStockAdjustmen;
    _createStore = createStore;
    _createSupplier = createSupplier;
    _createSupplierCreateDoc = createSupplierCreateDoc;
    _createTaxes = createTaxes;
    _createTimeCard = createTimeCard;
    _createTransfer = createTransfer;
    _itemEdit = itemEdit;
  }

  AccessModel.fromJson(dynamic json) {
    _isBos = json['is_bos'];
    _pos = json['pos'];
    _closeTicket = json['close_ticket'];
    _wharehouseManager = json['wharehouse_manager'];
    _canSell = json['can_sell'];
    _printPreCheck = json['print_pre_check'];
    _receiptSaveAsDraft = json['receipt_save_as_draft'];
    _canChangePrice = json['can_change_price'];
    _refund = json['refund'];
    _showAllReceipts = json['show_all_receipts'];
    _payDebt = json['pay_debt'];
    _showShiftHistory = json['show_shift_history'];
    _applyDiscount = json['apply_discount'];
    _changeSettings = json['change_settings'];
    _editItems = json['edit_items'];
    _editTicket = json['edit_ticket'];
    _splitTicket = json['split_ticket'];
    _changeWaiter = json['change_waiter'];
    _deleteTicket = json['delete_ticket'];
    _showAllTickets = json['show_all_tickets'];
    _canAccessToShift = json['can_access_to_shift'];
    _backOffice = json['back_office'];
    _reports = json['reports'];
    _items = json['items'];
    _employees = json['employees'];
    _customers = json['customers'];
    _settings = json['settings'];
    _editProfile = json['edit_profile'];
    _setTheTaxes = json['set_the_taxes'];
    _managePosDevices = json['manage_pos_devices'];
    _canDeleteItem = json['can_delete_item'];
    _inventory = json['inventory'];
    _invPurchaseOrders = json['inv_purchase_orders'];
    _invPurchaseMark = json['inv_purchase_mark'];
    _invPurchaseOrdersCost = json['inv_purchase_orders_cost'];
    _invTransferOrders = json['inv_transfer_orders'];
    _invStockAdjusment = json['inv_stock_adjusment'];
    _invStockAdjusmentCost = json['inv_stock_adjusment_cost'];
    _invInventoryCounts = json['inv_inventory_counts'];
    _invProductions = json['inv_productions'];
    _invProductionsCost = json['inv_productions_cost'];
    _invSuppliers = json['inv_suppliers'];
    _invSupplierTransaction = json['inv_supplier_transaction'];
    _invSupplierTransactionCorrector =
        json['inv_supplier_transaction_corrector'];
    _invFees = json['inv_fees'];
    _invInventoryHistory = json['inv_inventory_history'];
    _invInventoryValuation = json['inv_inventory_valuation'];
    _workgroup = json['workgroup'];
    _workgroupEditCost = json['workgroup_edit_cost'];
    _id = json['_id'];
    _organization = json['organization'];
    _name = json['name'];
    _v = json['__v'];
    _updatedAt = json['updatedAt'];
    _employeeAccessRights = json['employee_access_rights'];
    _employeeAccessRightsAdd = json['employee_access_rights_add'];
    _employeeAccessRightsDel = json['employee_access_rights_del'];
    _employeeList = json['employee_list'];
    _employeeListAdd = json['employee_list_add'];
    _employeeListDel = json['employee_list_del'];
    _employeeTimeCards = json['employee_time_cards'];
    _employeeTotalWorked = json['employee_total_worked'];
    _itemAddFromWarehause = json['item_add_from_warehause'];
    _itemCategories = json['item_categories'];
    _itemCompositeItem = json['item_composite_item'];
    _itemDiscount = json['item_discount'];
    _itemList = json['item_list'];
    _itemModifiers = json['item_modifiers'];
    _itemMxikSearch = json['item_mxik_search'];
    _itemPriceChangeHistory = json['item_price_change_history'];
    _itemPrintLabel = json['item_print_label'];
    _reportAbs = json['report_abs'];
    _reportAccaunt = json['report_accaunt'];
    _reportDebt = json['report_debt'];
    _reportDiscount = json['report_discount'];
    _reportEmployee = json['report_employee'];
    _reportReceipt = json['report_receipt'];
    _reportSale = json['report_sale'];
    _reportSaleByCategory = json['report_sale_by_category'];
    _reportSaleByItem = json['report_sale_by_item'];
    _reportSaleByPayment = json['report_sale_by_payment'];
    _reportSaleBySupplier = json['report_sale_by_supplier'];
    _reportShift = json['report_shift'];
    _reportTaxes = json['report_taxes'];
    _settingButtons = json['setting_buttons'];
    _settingCurrency = json['setting_currency'];
    _settingGeneral = json['setting_general'];
    _settingLoyalty = json['setting_loyalty'];
    _settingNds = json['setting_nds'];
    _settingOpenTickets = json['setting_open_tickets'];
    _settingOptions = json['setting_options'];
    _settingOrganization = json['setting_organization'];
    _settingPaymentTypes = json['setting_payment_types'];
    _settingPosDevices = json['setting_pos_devices'];
    _settingReceipt = json['setting_receipt'];
    _settingStores = json['setting_stores'];
    _settingTaxes = json['setting_taxes'];
    _create = json['create'];
    _createAccess = json['create_access'];
    _createCustomer = json['create_customer'];
    _createDiscount = json['create_discount'];
    _createEmployee = json['create_employee'];
    _createFee = json['create_fee'];
    _createGoodCategory = json['create_good_category'];
    _createGoodSale = json['create_good_sale'];
    _createInvCount = json['create_inv_count'];
    _createModifier = json['create_modifier'];
    _createPosDevice = json['create_pos_device'];
    _createProduction = json['create_production'];
    _createPurchase = json['create_purchase'];
    _createReciept = json['create_reciept'];
    _createStockAdjustmen = json['create_stock_adjustmen'];
    _createStore = json['create_store'];
    _createSupplier = json['create_supplier'];
    _createSupplierCreateDoc = json['create_supplier_create_doc'];
    _createTaxes = json['create_taxes'];
    _createTimeCard = json['create_time_card'];
    _createTransfer = json['create_transfer'];
    _itemEdit = json['item_edit'];
  }

  @HiveField(0)
  bool? _isBos;
  @HiveField(1)
  bool? _pos;
  @HiveField(2)
  bool? _closeTicket;
  @HiveField(3)
  bool? _wharehouseManager;
  @HiveField(4)
  bool? _canSell;
  @HiveField(5)
  bool? _printPreCheck;
  @HiveField(6)
  bool? _receiptSaveAsDraft;
  @HiveField(7)
  bool? _canChangePrice;
  @HiveField(8)
  bool? _refund;
  @HiveField(9)
  bool? _showAllReceipts;
  @HiveField(10)
  bool? _payDebt;
  @HiveField(11)
  bool? _showShiftHistory;
  @HiveField(12)
  bool? _applyDiscount;
  @HiveField(13)
  bool? _changeSettings;
  @HiveField(14)
  bool? _editItems;
  @HiveField(15)
  bool? _editTicket;
  @HiveField(16)
  bool? _splitTicket;
  @HiveField(17)
  bool? _changeWaiter;
  @HiveField(18)
  bool? _deleteTicket;
  @HiveField(19)
  bool? _showAllTickets;
  @HiveField(20)
  bool? _canAccessToShift;
  @HiveField(21)
  bool? _backOffice;
  @HiveField(22)
  bool? _reports;
  @HiveField(23)
  bool? _items;
  @HiveField(24)
  bool? _employees;
  @HiveField(25)
  bool? _customers;
  @HiveField(26)
  bool? _settings;
  @HiveField(27)
  bool? _editProfile;
  @HiveField(28)
  bool? _setTheTaxes;
  @HiveField(29)
  bool? _managePosDevices;
  @HiveField(30)
  bool? _canDeleteItem;
  @HiveField(31)
  bool? _inventory;
  @HiveField(32)
  bool? _invPurchaseOrders;
  @HiveField(33)
  bool? _invPurchaseMark;
  @HiveField(34)
  bool? _invPurchaseOrdersCost;
  @HiveField(35)
  bool? _invTransferOrders;
  @HiveField(36)
  bool? _invStockAdjusment;
  @HiveField(37)
  bool? _invStockAdjusmentCost;
  @HiveField(38)
  bool? _invInventoryCounts;
  @HiveField(39)
  bool? _invProductions;
  @HiveField(40)
  bool? _invProductionsCost;
  @HiveField(41)
  bool? _invSuppliers;
  @HiveField(42)
  bool? _invSupplierTransaction;
  @HiveField(43)
  bool? _invSupplierTransactionCorrector;
  @HiveField(44)
  bool? _invFees;
  @HiveField(45)
  bool? _invInventoryHistory;
  @HiveField(46)
  bool? _invInventoryValuation;
  @HiveField(47)
  bool? _workgroup;
  @HiveField(48)
  bool? _workgroupEditCost;
  @HiveField(49)
  String? _id;
  @HiveField(50)
  String? _organization;
  @HiveField(51)
  String? _name;
  @HiveField(52)
  int? _v;
  @HiveField(53)
  String? _updatedAt;
  @HiveField(54)
  bool? _employeeAccessRights;
  @HiveField(55)
  bool? _employeeAccessRightsAdd;
  @HiveField(56)
  bool? _employeeAccessRightsDel;
  @HiveField(57)
  bool? _employeeList;
  @HiveField(58)
  bool? _employeeListAdd;
  @HiveField(59)
  bool? _employeeListDel;
  @HiveField(60)
  bool? _employeeTimeCards;
  @HiveField(61)
  bool? _employeeTotalWorked;
  @HiveField(62)
  bool? _itemAddFromWarehause;
  @HiveField(63)
  bool? _itemCategories;
  @HiveField(64)
  bool? _itemCompositeItem;
  @HiveField(65)
  bool? _itemDiscount;
  @HiveField(66)
  bool? _itemList;
  @HiveField(67)
  bool? _itemModifiers;
  @HiveField(68)
  bool? _itemMxikSearch;
  @HiveField(69)
  bool? _itemPriceChangeHistory;
  @HiveField(70)
  bool? _itemPrintLabel;
  @HiveField(71)
  bool? _reportAbs;
  @HiveField(72)
  bool? _reportAccaunt;
  @HiveField(73)
  bool? _reportDebt;
  @HiveField(74)
  bool? _reportDiscount;
  @HiveField(75)
  bool? _reportEmployee;
  @HiveField(76)
  bool? _reportReceipt;
  @HiveField(77)
  bool? _reportSale;
  @HiveField(78)
  bool? _reportSaleByCategory;
  @HiveField(79)
  bool? _reportSaleByItem;
  @HiveField(80)
  bool? _reportSaleByPayment;
  @HiveField(81)
  bool? _reportSaleBySupplier;
  @HiveField(82)
  bool? _reportShift;
  @HiveField(83)
  bool? _reportTaxes;
  @HiveField(84)
  bool? _settingButtons;
  @HiveField(85)
  bool? _settingCurrency;
  @HiveField(86)
  bool? _settingGeneral;
  @HiveField(87)
  bool? _settingLoyalty;
  @HiveField(88)
  bool? _settingNds;
  @HiveField(89)
  bool? _settingOpenTickets;
  @HiveField(90)
  bool? _settingOptions;
  @HiveField(91)
  bool? _settingOrganization;
  @HiveField(92)
  bool? _settingPaymentTypes;
  @HiveField(93)
  bool? _settingPosDevices;
  @HiveField(94)
  bool? _settingReceipt;
  @HiveField(95)
  bool? _settingStores;
  @HiveField(96)
  bool? _settingTaxes;
  @HiveField(97)
  bool? _create;
  @HiveField(98)
  bool? _createAccess;
  @HiveField(99)
  bool? _createCustomer;
  @HiveField(100)
  bool? _createDiscount;
  @HiveField(101)
  bool? _createEmployee;
  @HiveField(102)
  bool? _createFee;
  @HiveField(103)
  bool? _createGoodCategory;
  @HiveField(104)
  bool? _createGoodSale;
  @HiveField(105)
  bool? _createInvCount;
  @HiveField(106)
  bool? _createModifier;
  @HiveField(107)
  bool? _createPosDevice;
  @HiveField(108)
  bool? _createProduction;
  @HiveField(109)
  bool? _createPurchase;
  @HiveField(110)
  bool? _createReciept;
  @HiveField(111)
  bool? _createStockAdjustmen;
  @HiveField(112)
  bool? _createStore;
  @HiveField(113)
  bool? _createSupplier;
  @HiveField(114)
  bool? _createSupplierCreateDoc;
  @HiveField(115)
  bool? _createTaxes;
  @HiveField(116)
  bool? _createTimeCard;
  @HiveField(117)
  bool? _createTransfer;
  @HiveField(118)
  bool? _itemEdit;

  AccessModel copyWith({
    bool? isBos,
    bool? pos,
    bool? closeTicket,
    bool? wharehouseManager,
    bool? canSell,
    bool? printPreCheck,
    bool? receiptSaveAsDraft,
    bool? canChangePrice,
    bool? refund,
    bool? showAllReceipts,
    bool? payDebt,
    bool? showShiftHistory,
    bool? applyDiscount,
    bool? changeSettings,
    bool? editItems,
    bool? editTicket,
    bool? splitTicket,
    bool? changeWaiter,
    bool? deleteTicket,
    bool? showAllTickets,
    bool? canAccessToShift,
    bool? backOffice,
    bool? reports,
    bool? items,
    bool? employees,
    bool? customers,
    bool? settings,
    bool? editProfile,
    bool? setTheTaxes,
    bool? managePosDevices,
    bool? canDeleteItem,
    bool? inventory,
    bool? invPurchaseOrders,
    bool? invPurchaseMark,
    bool? invPurchaseOrdersCost,
    bool? invTransferOrders,
    bool? invStockAdjusment,
    bool? invStockAdjusmentCost,
    bool? invInventoryCounts,
    bool? invProductions,
    bool? invProductionsCost,
    bool? invSuppliers,
    bool? invSupplierTransaction,
    bool? invSupplierTransactionCorrector,
    bool? invFees,
    bool? invInventoryHistory,
    bool? invInventoryValuation,
    bool? workgroup,
    bool? workgroupEditCost,
    String? id,
    String? organization,
    String? name,
    int? v,
    String? updatedAt,
    bool? employeeAccessRights,
    bool? employeeAccessRightsAdd,
    bool? employeeAccessRightsDel,
    bool? employeeList,
    bool? employeeListAdd,
    bool? employeeListDel,
    bool? employeeTimeCards,
    bool? employeeTotalWorked,
    bool? itemAddFromWarehause,
    bool? itemCategories,
    bool? itemCompositeItem,
    bool? itemDiscount,
    bool? itemList,
    bool? itemModifiers,
    bool? itemMxikSearch,
    bool? itemPriceChangeHistory,
    bool? itemPrintLabel,
    bool? reportAbs,
    bool? reportAccaunt,
    bool? reportDebt,
    bool? reportDiscount,
    bool? reportEmployee,
    bool? reportReceipt,
    bool? reportSale,
    bool? reportSaleByCategory,
    bool? reportSaleByItem,
    bool? reportSaleByPayment,
    bool? reportSaleBySupplier,
    bool? reportShift,
    bool? reportTaxes,
    bool? settingButtons,
    bool? settingCurrency,
    bool? settingGeneral,
    bool? settingLoyalty,
    bool? settingNds,
    bool? settingOpenTickets,
    bool? settingOptions,
    bool? settingOrganization,
    bool? settingPaymentTypes,
    bool? settingPosDevices,
    bool? settingReceipt,
    bool? settingStores,
    bool? settingTaxes,
    bool? create,
    bool? createAccess,
    bool? createCustomer,
    bool? createDiscount,
    bool? createEmployee,
    bool? createFee,
    bool? createGoodCategory,
    bool? createGoodSale,
    bool? createInvCount,
    bool? createModifier,
    bool? createPosDevice,
    bool? createProduction,
    bool? createPurchase,
    bool? createReciept,
    bool? createStockAdjustmen,
    bool? createStore,
    bool? createSupplier,
    bool? createSupplierCreateDoc,
    bool? createTaxes,
    bool? createTimeCard,
    bool? createTransfer,
    bool? itemEdit,
  }) =>
      AccessModel(
        isBos: isBos ?? _isBos,
        pos: pos ?? _pos,
        closeTicket: closeTicket ?? _closeTicket,
        wharehouseManager: wharehouseManager ?? _wharehouseManager,
        canSell: canSell ?? _canSell,
        printPreCheck: printPreCheck ?? _printPreCheck,
        receiptSaveAsDraft: receiptSaveAsDraft ?? _receiptSaveAsDraft,
        canChangePrice: canChangePrice ?? _canChangePrice,
        refund: refund ?? _refund,
        showAllReceipts: showAllReceipts ?? _showAllReceipts,
        payDebt: payDebt ?? _payDebt,
        showShiftHistory: showShiftHistory ?? _showShiftHistory,
        applyDiscount: applyDiscount ?? _applyDiscount,
        changeSettings: changeSettings ?? _changeSettings,
        editItems: editItems ?? _editItems,
        editTicket: editTicket ?? _editTicket,
        splitTicket: splitTicket ?? _splitTicket,
        changeWaiter: changeWaiter ?? _changeWaiter,
        deleteTicket: deleteTicket ?? _deleteTicket,
        showAllTickets: showAllTickets ?? _showAllTickets,
        canAccessToShift: canAccessToShift ?? _canAccessToShift,
        backOffice: backOffice ?? _backOffice,
        reports: reports ?? _reports,
        items: items ?? _items,
        employees: employees ?? _employees,
        customers: customers ?? _customers,
        settings: settings ?? _settings,
        editProfile: editProfile ?? _editProfile,
        setTheTaxes: setTheTaxes ?? _setTheTaxes,
        managePosDevices: managePosDevices ?? _managePosDevices,
        canDeleteItem: canDeleteItem ?? _canDeleteItem,
        inventory: inventory ?? _inventory,
        invPurchaseOrders: invPurchaseOrders ?? _invPurchaseOrders,
        invPurchaseMark: invPurchaseMark ?? _invPurchaseMark,
        invPurchaseOrdersCost: invPurchaseOrdersCost ?? _invPurchaseOrdersCost,
        invTransferOrders: invTransferOrders ?? _invTransferOrders,
        invStockAdjusment: invStockAdjusment ?? _invStockAdjusment,
        invStockAdjusmentCost: invStockAdjusmentCost ?? _invStockAdjusmentCost,
        invInventoryCounts: invInventoryCounts ?? _invInventoryCounts,
        invProductions: invProductions ?? _invProductions,
        invProductionsCost: invProductionsCost ?? _invProductionsCost,
        invSuppliers: invSuppliers ?? _invSuppliers,
        invSupplierTransaction:
            invSupplierTransaction ?? _invSupplierTransaction,
        invSupplierTransactionCorrector:
            invSupplierTransactionCorrector ?? _invSupplierTransactionCorrector,
        invFees: invFees ?? _invFees,
        invInventoryHistory: invInventoryHistory ?? _invInventoryHistory,
        invInventoryValuation: invInventoryValuation ?? _invInventoryValuation,
        workgroup: workgroup ?? _workgroup,
        workgroupEditCost: workgroupEditCost ?? _workgroupEditCost,
        id: id ?? _id,
        organization: organization ?? _organization,
        name: name ?? _name,
        v: v ?? _v,
        updatedAt: updatedAt ?? _updatedAt,
        employeeAccessRights: employeeAccessRights ?? _employeeAccessRights,
        employeeAccessRightsAdd:
            employeeAccessRightsAdd ?? _employeeAccessRightsAdd,
        employeeAccessRightsDel:
            employeeAccessRightsDel ?? _employeeAccessRightsDel,
        employeeList: employeeList ?? _employeeList,
        employeeListAdd: employeeListAdd ?? _employeeListAdd,
        employeeListDel: employeeListDel ?? _employeeListDel,
        employeeTimeCards: employeeTimeCards ?? _employeeTimeCards,
        employeeTotalWorked: employeeTotalWorked ?? _employeeTotalWorked,
        itemAddFromWarehause: itemAddFromWarehause ?? _itemAddFromWarehause,
        itemCategories: itemCategories ?? _itemCategories,
        itemCompositeItem: itemCompositeItem ?? _itemCompositeItem,
        itemDiscount: itemDiscount ?? _itemDiscount,
        itemList: itemList ?? _itemList,
        itemModifiers: itemModifiers ?? _itemModifiers,
        itemMxikSearch: itemMxikSearch ?? _itemMxikSearch,
        itemPriceChangeHistory:
            itemPriceChangeHistory ?? _itemPriceChangeHistory,
        itemPrintLabel: itemPrintLabel ?? _itemPrintLabel,
        reportAbs: reportAbs ?? _reportAbs,
        reportAccaunt: reportAccaunt ?? _reportAccaunt,
        reportDebt: reportDebt ?? _reportDebt,
        reportDiscount: reportDiscount ?? _reportDiscount,
        reportEmployee: reportEmployee ?? _reportEmployee,
        reportReceipt: reportReceipt ?? _reportReceipt,
        reportSale: reportSale ?? _reportSale,
        reportSaleByCategory: reportSaleByCategory ?? _reportSaleByCategory,
        reportSaleByItem: reportSaleByItem ?? _reportSaleByItem,
        reportSaleByPayment: reportSaleByPayment ?? _reportSaleByPayment,
        reportSaleBySupplier: reportSaleBySupplier ?? _reportSaleBySupplier,
        reportShift: reportShift ?? _reportShift,
        reportTaxes: reportTaxes ?? _reportTaxes,
        settingButtons: settingButtons ?? _settingButtons,
        settingCurrency: settingCurrency ?? _settingCurrency,
        settingGeneral: settingGeneral ?? _settingGeneral,
        settingLoyalty: settingLoyalty ?? _settingLoyalty,
        settingNds: settingNds ?? _settingNds,
        settingOpenTickets: settingOpenTickets ?? _settingOpenTickets,
        settingOptions: settingOptions ?? _settingOptions,
        settingOrganization: settingOrganization ?? _settingOrganization,
        settingPaymentTypes: settingPaymentTypes ?? _settingPaymentTypes,
        settingPosDevices: settingPosDevices ?? _settingPosDevices,
        settingReceipt: settingReceipt ?? _settingReceipt,
        settingStores: settingStores ?? _settingStores,
        settingTaxes: settingTaxes ?? _settingTaxes,
        create: create ?? _create,
        createAccess: createAccess ?? _createAccess,
        createCustomer: createCustomer ?? _createCustomer,
        createDiscount: createDiscount ?? _createDiscount,
        createEmployee: createEmployee ?? _createEmployee,
        createFee: createFee ?? _createFee,
        createGoodCategory: createGoodCategory ?? _createGoodCategory,
        createGoodSale: createGoodSale ?? _createGoodSale,
        createInvCount: createInvCount ?? _createInvCount,
        createModifier: createModifier ?? _createModifier,
        createPosDevice: createPosDevice ?? _createPosDevice,
        createProduction: createProduction ?? _createProduction,
        createPurchase: createPurchase ?? _createPurchase,
        createReciept: createReciept ?? _createReciept,
        createStockAdjustmen: createStockAdjustmen ?? _createStockAdjustmen,
        createStore: createStore ?? _createStore,
        createSupplier: createSupplier ?? _createSupplier,
        createSupplierCreateDoc:
            createSupplierCreateDoc ?? _createSupplierCreateDoc,
        createTaxes: createTaxes ?? _createTaxes,
        createTimeCard: createTimeCard ?? _createTimeCard,
        createTransfer: createTransfer ?? _createTransfer,
        itemEdit: itemEdit ?? _itemEdit,
      );

  bool? get isBos => _isBos;

  bool? get pos => _pos;

  bool? get closeTicket => _closeTicket;

  bool? get wharehouseManager => _wharehouseManager;

  bool? get canSell => _canSell;

  bool? get printPreCheck => _printPreCheck;

  bool? get receiptSaveAsDraft => _receiptSaveAsDraft;

  bool? get canChangePrice => _canChangePrice;

  bool? get refund => _refund;

  bool? get showAllReceipts => _showAllReceipts;

  bool? get payDebt => _payDebt;

  bool? get showShiftHistory => _showShiftHistory;

  bool? get applyDiscount => _applyDiscount;

  bool? get changeSettings => _changeSettings;

  bool? get editItems => _editItems;

  bool? get editTicket => _editTicket;

  bool? get splitTicket => _splitTicket;

  bool? get changeWaiter => _changeWaiter;

  bool? get deleteTicket => _deleteTicket;

  bool? get showAllTickets => _showAllTickets;

  bool? get canAccessToShift => _canAccessToShift;

  bool? get backOffice => _backOffice;

  bool? get reports => _reports;

  bool? get items => _items;

  bool? get employees => _employees;

  bool? get customers => _customers;

  bool? get settings => _settings;

  bool? get editProfile => _editProfile;

  bool? get setTheTaxes => _setTheTaxes;

  bool? get managePosDevices => _managePosDevices;

  bool? get canDeleteItem => _canDeleteItem;

  bool? get inventory => _inventory;

  bool? get invPurchaseOrders => _invPurchaseOrders;

  bool? get invPurchaseMark => _invPurchaseMark;

  bool? get invPurchaseOrdersCost => _invPurchaseOrdersCost;

  bool? get invTransferOrders => _invTransferOrders;

  bool? get invStockAdjusment => _invStockAdjusment;

  bool? get invStockAdjusmentCost => _invStockAdjusmentCost;

  bool? get invInventoryCounts => _invInventoryCounts;

  bool? get invProductions => _invProductions;

  bool? get invProductionsCost => _invProductionsCost;

  bool? get invSuppliers => _invSuppliers;

  bool? get invSupplierTransaction => _invSupplierTransaction;

  bool? get invSupplierTransactionCorrector => _invSupplierTransactionCorrector;

  bool? get invFees => _invFees;

  bool? get invInventoryHistory => _invInventoryHistory;

  bool? get invInventoryValuation => _invInventoryValuation;

  bool? get workgroup => _workgroup;

  bool? get workgroupEditCost => _workgroupEditCost;

  String? get id => _id;

  String? get organization => _organization;

  String? get name => _name;

  int? get v => _v;

  String? get updatedAt => _updatedAt;

  bool? get employeeAccessRights => _employeeAccessRights;

  bool? get employeeAccessRightsAdd => _employeeAccessRightsAdd;

  bool? get employeeAccessRightsDel => _employeeAccessRightsDel;

  bool? get employeeList => _employeeList;

  bool? get employeeListAdd => _employeeListAdd;

  bool? get employeeListDel => _employeeListDel;

  bool? get employeeTimeCards => _employeeTimeCards;

  bool? get employeeTotalWorked => _employeeTotalWorked;

  bool? get itemAddFromWarehause => _itemAddFromWarehause;

  bool? get itemCategories => _itemCategories;

  bool? get itemCompositeItem => _itemCompositeItem;

  bool? get itemDiscount => _itemDiscount;

  bool? get itemList => _itemList;

  bool? get itemModifiers => _itemModifiers;

  bool? get itemMxikSearch => _itemMxikSearch;

  bool? get itemPriceChangeHistory => _itemPriceChangeHistory;

  bool? get itemPrintLabel => _itemPrintLabel;

  bool? get reportAbs => _reportAbs;

  bool? get reportAccaunt => _reportAccaunt;

  bool? get reportDebt => _reportDebt;

  bool? get reportDiscount => _reportDiscount;

  bool? get reportEmployee => _reportEmployee;

  bool? get reportReceipt => _reportReceipt;

  bool? get reportSale => _reportSale;

  bool? get reportSaleByCategory => _reportSaleByCategory;

  bool? get reportSaleByItem => _reportSaleByItem;

  bool? get reportSaleByPayment => _reportSaleByPayment;

  bool? get reportSaleBySupplier => _reportSaleBySupplier;

  bool? get reportShift => _reportShift;

  bool? get reportTaxes => _reportTaxes;

  bool? get settingButtons => _settingButtons;

  bool? get settingCurrency => _settingCurrency;

  bool? get settingGeneral => _settingGeneral;

  bool? get settingLoyalty => _settingLoyalty;

  bool? get settingNds => _settingNds;

  bool? get settingOpenTickets => _settingOpenTickets;

  bool? get settingOptions => _settingOptions;

  bool? get settingOrganization => _settingOrganization;

  bool? get settingPaymentTypes => _settingPaymentTypes;

  bool? get settingPosDevices => _settingPosDevices;

  bool? get settingReceipt => _settingReceipt;

  bool? get settingStores => _settingStores;

  bool? get settingTaxes => _settingTaxes;

  bool? get create => _create;

  bool? get createAccess => _createAccess;

  bool? get createCustomer => _createCustomer;

  bool? get createDiscount => _createDiscount;

  bool? get createEmployee => _createEmployee;

  bool? get createFee => _createFee;

  bool? get createGoodCategory => _createGoodCategory;

  bool? get createGoodSale => _createGoodSale;

  bool? get createInvCount => _createInvCount;

  bool? get createModifier => _createModifier;

  bool? get createPosDevice => _createPosDevice;

  bool? get createProduction => _createProduction;

  bool? get createPurchase => _createPurchase;

  bool? get createReciept => _createReciept;

  bool? get createStockAdjustmen => _createStockAdjustmen;

  bool? get createStore => _createStore;

  bool? get createSupplier => _createSupplier;

  bool? get createSupplierCreateDoc => _createSupplierCreateDoc;

  bool? get createTaxes => _createTaxes;

  bool? get createTimeCard => _createTimeCard;

  bool? get createTransfer => _createTransfer;

  bool? get itemEdit => _itemEdit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_bos'] = _isBos;
    map['pos'] = _pos;
    map['close_ticket'] = _closeTicket;
    map['wharehouse_manager'] = _wharehouseManager;
    map['can_sell'] = _canSell;
    map['print_pre_check'] = _printPreCheck;
    map['receipt_save_as_draft'] = _receiptSaveAsDraft;
    map['can_change_price'] = _canChangePrice;
    map['refund'] = _refund;
    map['show_all_receipts'] = _showAllReceipts;
    map['pay_debt'] = _payDebt;
    map['show_shift_history'] = _showShiftHistory;
    map['apply_discount'] = _applyDiscount;
    map['change_settings'] = _changeSettings;
    map['edit_items'] = _editItems;
    map['edit_ticket'] = _editTicket;
    map['split_ticket'] = _splitTicket;
    map['change_waiter'] = _changeWaiter;
    map['delete_ticket'] = _deleteTicket;
    map['show_all_tickets'] = _showAllTickets;
    map['can_access_to_shift'] = _canAccessToShift;
    map['back_office'] = _backOffice;
    map['reports'] = _reports;
    map['items'] = _items;
    map['employees'] = _employees;
    map['customers'] = _customers;
    map['settings'] = _settings;
    map['edit_profile'] = _editProfile;
    map['set_the_taxes'] = _setTheTaxes;
    map['manage_pos_devices'] = _managePosDevices;
    map['can_delete_item'] = _canDeleteItem;
    map['inventory'] = _inventory;
    map['inv_purchase_orders'] = _invPurchaseOrders;
    map['inv_purchase_mark'] = _invPurchaseMark;
    map['inv_purchase_orders_cost'] = _invPurchaseOrdersCost;
    map['inv_transfer_orders'] = _invTransferOrders;
    map['inv_stock_adjusment'] = _invStockAdjusment;
    map['inv_stock_adjusment_cost'] = _invStockAdjusmentCost;
    map['inv_inventory_counts'] = _invInventoryCounts;
    map['inv_productions'] = _invProductions;
    map['inv_productions_cost'] = _invProductionsCost;
    map['inv_suppliers'] = _invSuppliers;
    map['inv_supplier_transaction'] = _invSupplierTransaction;
    map['inv_supplier_transaction_corrector'] =
        _invSupplierTransactionCorrector;
    map['inv_fees'] = _invFees;
    map['inv_inventory_history'] = _invInventoryHistory;
    map['inv_inventory_valuation'] = _invInventoryValuation;
    map['workgroup'] = _workgroup;
    map['workgroup_edit_cost'] = _workgroupEditCost;
    map['_id'] = _id;
    map['organization'] = _organization;
    map['name'] = _name;
    map['__v'] = _v;
    map['updatedAt'] = _updatedAt;
    map['employee_access_rights'] = _employeeAccessRights;
    map['employee_access_rights_add'] = _employeeAccessRightsAdd;
    map['employee_access_rights_del'] = _employeeAccessRightsDel;
    map['employee_list'] = _employeeList;
    map['employee_list_add'] = _employeeListAdd;
    map['employee_list_del'] = _employeeListDel;
    map['employee_time_cards'] = _employeeTimeCards;
    map['employee_total_worked'] = _employeeTotalWorked;
    map['item_add_from_warehause'] = _itemAddFromWarehause;
    map['item_categories'] = _itemCategories;
    map['item_composite_item'] = _itemCompositeItem;
    map['item_discount'] = _itemDiscount;
    map['item_list'] = _itemList;
    map['item_modifiers'] = _itemModifiers;
    map['item_mxik_search'] = _itemMxikSearch;
    map['item_price_change_history'] = _itemPriceChangeHistory;
    map['item_print_label'] = _itemPrintLabel;
    map['report_abs'] = _reportAbs;
    map['report_accaunt'] = _reportAccaunt;
    map['report_debt'] = _reportDebt;
    map['report_discount'] = _reportDiscount;
    map['report_employee'] = _reportEmployee;
    map['report_receipt'] = _reportReceipt;
    map['report_sale'] = _reportSale;
    map['report_sale_by_category'] = _reportSaleByCategory;
    map['report_sale_by_item'] = _reportSaleByItem;
    map['report_sale_by_payment'] = _reportSaleByPayment;
    map['report_sale_by_supplier'] = _reportSaleBySupplier;
    map['report_shift'] = _reportShift;
    map['report_taxes'] = _reportTaxes;
    map['setting_buttons'] = _settingButtons;
    map['setting_currency'] = _settingCurrency;
    map['setting_general'] = _settingGeneral;
    map['setting_loyalty'] = _settingLoyalty;
    map['setting_nds'] = _settingNds;
    map['setting_open_tickets'] = _settingOpenTickets;
    map['setting_options'] = _settingOptions;
    map['setting_organization'] = _settingOrganization;
    map['setting_payment_types'] = _settingPaymentTypes;
    map['setting_pos_devices'] = _settingPosDevices;
    map['setting_receipt'] = _settingReceipt;
    map['setting_stores'] = _settingStores;
    map['setting_taxes'] = _settingTaxes;
    map['create'] = _create;
    map['create_access'] = _createAccess;
    map['create_customer'] = _createCustomer;
    map['create_discount'] = _createDiscount;
    map['create_employee'] = _createEmployee;
    map['create_fee'] = _createFee;
    map['create_good_category'] = _createGoodCategory;
    map['create_good_sale'] = _createGoodSale;
    map['create_inv_count'] = _createInvCount;
    map['create_modifier'] = _createModifier;
    map['create_pos_device'] = _createPosDevice;
    map['create_production'] = _createProduction;
    map['create_purchase'] = _createPurchase;
    map['create_reciept'] = _createReciept;
    map['create_stock_adjustmen'] = _createStockAdjustmen;
    map['create_store'] = _createStore;
    map['create_supplier'] = _createSupplier;
    map['create_supplier_create_doc'] = _createSupplierCreateDoc;
    map['create_taxes'] = _createTaxes;
    map['create_time_card'] = _createTimeCard;
    map['create_transfer'] = _createTransfer;
    map['item_edit'] = _itemEdit;
    return map;
  }
}
