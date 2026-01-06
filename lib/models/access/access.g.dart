// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccessModelAdapter extends TypeAdapter<AccessModel> {
  @override
  final int typeId = 3;

  @override
  AccessModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccessModel()
      .._isBos = fields[0] as bool?
      .._pos = fields[1] as bool?
      .._closeTicket = fields[2] as bool?
      .._wharehouseManager = fields[3] as bool?
      .._canSell = fields[4] as bool?
      .._printPreCheck = fields[5] as bool?
      .._receiptSaveAsDraft = fields[6] as bool?
      .._canChangePrice = fields[7] as bool?
      .._refund = fields[8] as bool?
      .._showAllReceipts = fields[9] as bool?
      .._payDebt = fields[10] as bool?
      .._showShiftHistory = fields[11] as bool?
      .._applyDiscount = fields[12] as bool?
      .._changeSettings = fields[13] as bool?
      .._editItems = fields[14] as bool?
      .._editTicket = fields[15] as bool?
      .._splitTicket = fields[16] as bool?
      .._changeWaiter = fields[17] as bool?
      .._deleteTicket = fields[18] as bool?
      .._showAllTickets = fields[19] as bool?
      .._canAccessToShift = fields[20] as bool?
      .._backOffice = fields[21] as bool?
      .._reports = fields[22] as bool?
      .._items = fields[23] as bool?
      .._employees = fields[24] as bool?
      .._customers = fields[25] as bool?
      .._settings = fields[26] as bool?
      .._editProfile = fields[27] as bool?
      .._setTheTaxes = fields[28] as bool?
      .._managePosDevices = fields[29] as bool?
      .._canDeleteItem = fields[30] as bool?
      .._inventory = fields[31] as bool?
      .._invPurchaseOrders = fields[32] as bool?
      .._invPurchaseMark = fields[33] as bool?
      .._invPurchaseOrdersCost = fields[34] as bool?
      .._invTransferOrders = fields[35] as bool?
      .._invStockAdjusment = fields[36] as bool?
      .._invStockAdjusmentCost = fields[37] as bool?
      .._invInventoryCounts = fields[38] as bool?
      .._invProductions = fields[39] as bool?
      .._invProductionsCost = fields[40] as bool?
      .._invSuppliers = fields[41] as bool?
      .._invSupplierTransaction = fields[42] as bool?
      .._invSupplierTransactionCorrector = fields[43] as bool?
      .._invFees = fields[44] as bool?
      .._invInventoryHistory = fields[45] as bool?
      .._invInventoryValuation = fields[46] as bool?
      .._workgroup = fields[47] as bool?
      .._workgroupEditCost = fields[48] as bool?
      .._id = fields[49] as String?
      .._organization = fields[50] as String?
      .._name = fields[51] as String?
      .._v = fields[52] as int?
      .._updatedAt = fields[53] as String?
      .._employeeAccessRights = fields[54] as bool?
      .._employeeAccessRightsAdd = fields[55] as bool?
      .._employeeAccessRightsDel = fields[56] as bool?
      .._employeeList = fields[57] as bool?
      .._employeeListAdd = fields[58] as bool?
      .._employeeListDel = fields[59] as bool?
      .._employeeTimeCards = fields[60] as bool?
      .._employeeTotalWorked = fields[61] as bool?
      .._itemAddFromWarehause = fields[62] as bool?
      .._itemCategories = fields[63] as bool?
      .._itemCompositeItem = fields[64] as bool?
      .._itemDiscount = fields[65] as bool?
      .._itemList = fields[66] as bool?
      .._itemModifiers = fields[67] as bool?
      .._itemMxikSearch = fields[68] as bool?
      .._itemPriceChangeHistory = fields[69] as bool?
      .._itemPrintLabel = fields[70] as bool?
      .._reportAbs = fields[71] as bool?
      .._reportAccaunt = fields[72] as bool?
      .._reportDebt = fields[73] as bool?
      .._reportDiscount = fields[74] as bool?
      .._reportEmployee = fields[75] as bool?
      .._reportReceipt = fields[76] as bool?
      .._reportSale = fields[77] as bool?
      .._reportSaleByCategory = fields[78] as bool?
      .._reportSaleByItem = fields[79] as bool?
      .._reportSaleByPayment = fields[80] as bool?
      .._reportSaleBySupplier = fields[81] as bool?
      .._reportShift = fields[82] as bool?
      .._reportTaxes = fields[83] as bool?
      .._settingButtons = fields[84] as bool?
      .._settingCurrency = fields[85] as bool?
      .._settingGeneral = fields[86] as bool?
      .._settingLoyalty = fields[87] as bool?
      .._settingNds = fields[88] as bool?
      .._settingOpenTickets = fields[89] as bool?
      .._settingOptions = fields[90] as bool?
      .._settingOrganization = fields[91] as bool?
      .._settingPaymentTypes = fields[92] as bool?
      .._settingPosDevices = fields[93] as bool?
      .._settingReceipt = fields[94] as bool?
      .._settingStores = fields[95] as bool?
      .._settingTaxes = fields[96] as bool?
      .._create = fields[97] as bool?
      .._createAccess = fields[98] as bool?
      .._createCustomer = fields[99] as bool?
      .._createDiscount = fields[100] as bool?
      .._createEmployee = fields[101] as bool?
      .._createFee = fields[102] as bool?
      .._createGoodCategory = fields[103] as bool?
      .._createGoodSale = fields[104] as bool?
      .._createInvCount = fields[105] as bool?
      .._createModifier = fields[106] as bool?
      .._createPosDevice = fields[107] as bool?
      .._createProduction = fields[108] as bool?
      .._createPurchase = fields[109] as bool?
      .._createReciept = fields[110] as bool?
      .._createStockAdjustmen = fields[111] as bool?
      .._createStore = fields[112] as bool?
      .._createSupplier = fields[113] as bool?
      .._createSupplierCreateDoc = fields[114] as bool?
      .._createTaxes = fields[115] as bool?
      .._createTimeCard = fields[116] as bool?
      .._createTransfer = fields[117] as bool?
      .._itemEdit = fields[118] as bool?;
  }

  @override
  void write(BinaryWriter writer, AccessModel obj) {
    writer
      ..writeByte(119)
      ..writeByte(0)
      ..write(obj._isBos)
      ..writeByte(1)
      ..write(obj._pos)
      ..writeByte(2)
      ..write(obj._closeTicket)
      ..writeByte(3)
      ..write(obj._wharehouseManager)
      ..writeByte(4)
      ..write(obj._canSell)
      ..writeByte(5)
      ..write(obj._printPreCheck)
      ..writeByte(6)
      ..write(obj._receiptSaveAsDraft)
      ..writeByte(7)
      ..write(obj._canChangePrice)
      ..writeByte(8)
      ..write(obj._refund)
      ..writeByte(9)
      ..write(obj._showAllReceipts)
      ..writeByte(10)
      ..write(obj._payDebt)
      ..writeByte(11)
      ..write(obj._showShiftHistory)
      ..writeByte(12)
      ..write(obj._applyDiscount)
      ..writeByte(13)
      ..write(obj._changeSettings)
      ..writeByte(14)
      ..write(obj._editItems)
      ..writeByte(15)
      ..write(obj._editTicket)
      ..writeByte(16)
      ..write(obj._splitTicket)
      ..writeByte(17)
      ..write(obj._changeWaiter)
      ..writeByte(18)
      ..write(obj._deleteTicket)
      ..writeByte(19)
      ..write(obj._showAllTickets)
      ..writeByte(20)
      ..write(obj._canAccessToShift)
      ..writeByte(21)
      ..write(obj._backOffice)
      ..writeByte(22)
      ..write(obj._reports)
      ..writeByte(23)
      ..write(obj._items)
      ..writeByte(24)
      ..write(obj._employees)
      ..writeByte(25)
      ..write(obj._customers)
      ..writeByte(26)
      ..write(obj._settings)
      ..writeByte(27)
      ..write(obj._editProfile)
      ..writeByte(28)
      ..write(obj._setTheTaxes)
      ..writeByte(29)
      ..write(obj._managePosDevices)
      ..writeByte(30)
      ..write(obj._canDeleteItem)
      ..writeByte(31)
      ..write(obj._inventory)
      ..writeByte(32)
      ..write(obj._invPurchaseOrders)
      ..writeByte(33)
      ..write(obj._invPurchaseMark)
      ..writeByte(34)
      ..write(obj._invPurchaseOrdersCost)
      ..writeByte(35)
      ..write(obj._invTransferOrders)
      ..writeByte(36)
      ..write(obj._invStockAdjusment)
      ..writeByte(37)
      ..write(obj._invStockAdjusmentCost)
      ..writeByte(38)
      ..write(obj._invInventoryCounts)
      ..writeByte(39)
      ..write(obj._invProductions)
      ..writeByte(40)
      ..write(obj._invProductionsCost)
      ..writeByte(41)
      ..write(obj._invSuppliers)
      ..writeByte(42)
      ..write(obj._invSupplierTransaction)
      ..writeByte(43)
      ..write(obj._invSupplierTransactionCorrector)
      ..writeByte(44)
      ..write(obj._invFees)
      ..writeByte(45)
      ..write(obj._invInventoryHistory)
      ..writeByte(46)
      ..write(obj._invInventoryValuation)
      ..writeByte(47)
      ..write(obj._workgroup)
      ..writeByte(48)
      ..write(obj._workgroupEditCost)
      ..writeByte(49)
      ..write(obj._id)
      ..writeByte(50)
      ..write(obj._organization)
      ..writeByte(51)
      ..write(obj._name)
      ..writeByte(52)
      ..write(obj._v)
      ..writeByte(53)
      ..write(obj._updatedAt)
      ..writeByte(54)
      ..write(obj._employeeAccessRights)
      ..writeByte(55)
      ..write(obj._employeeAccessRightsAdd)
      ..writeByte(56)
      ..write(obj._employeeAccessRightsDel)
      ..writeByte(57)
      ..write(obj._employeeList)
      ..writeByte(58)
      ..write(obj._employeeListAdd)
      ..writeByte(59)
      ..write(obj._employeeListDel)
      ..writeByte(60)
      ..write(obj._employeeTimeCards)
      ..writeByte(61)
      ..write(obj._employeeTotalWorked)
      ..writeByte(62)
      ..write(obj._itemAddFromWarehause)
      ..writeByte(63)
      ..write(obj._itemCategories)
      ..writeByte(64)
      ..write(obj._itemCompositeItem)
      ..writeByte(65)
      ..write(obj._itemDiscount)
      ..writeByte(66)
      ..write(obj._itemList)
      ..writeByte(67)
      ..write(obj._itemModifiers)
      ..writeByte(68)
      ..write(obj._itemMxikSearch)
      ..writeByte(69)
      ..write(obj._itemPriceChangeHistory)
      ..writeByte(70)
      ..write(obj._itemPrintLabel)
      ..writeByte(71)
      ..write(obj._reportAbs)
      ..writeByte(72)
      ..write(obj._reportAccaunt)
      ..writeByte(73)
      ..write(obj._reportDebt)
      ..writeByte(74)
      ..write(obj._reportDiscount)
      ..writeByte(75)
      ..write(obj._reportEmployee)
      ..writeByte(76)
      ..write(obj._reportReceipt)
      ..writeByte(77)
      ..write(obj._reportSale)
      ..writeByte(78)
      ..write(obj._reportSaleByCategory)
      ..writeByte(79)
      ..write(obj._reportSaleByItem)
      ..writeByte(80)
      ..write(obj._reportSaleByPayment)
      ..writeByte(81)
      ..write(obj._reportSaleBySupplier)
      ..writeByte(82)
      ..write(obj._reportShift)
      ..writeByte(83)
      ..write(obj._reportTaxes)
      ..writeByte(84)
      ..write(obj._settingButtons)
      ..writeByte(85)
      ..write(obj._settingCurrency)
      ..writeByte(86)
      ..write(obj._settingGeneral)
      ..writeByte(87)
      ..write(obj._settingLoyalty)
      ..writeByte(88)
      ..write(obj._settingNds)
      ..writeByte(89)
      ..write(obj._settingOpenTickets)
      ..writeByte(90)
      ..write(obj._settingOptions)
      ..writeByte(91)
      ..write(obj._settingOrganization)
      ..writeByte(92)
      ..write(obj._settingPaymentTypes)
      ..writeByte(93)
      ..write(obj._settingPosDevices)
      ..writeByte(94)
      ..write(obj._settingReceipt)
      ..writeByte(95)
      ..write(obj._settingStores)
      ..writeByte(96)
      ..write(obj._settingTaxes)
      ..writeByte(97)
      ..write(obj._create)
      ..writeByte(98)
      ..write(obj._createAccess)
      ..writeByte(99)
      ..write(obj._createCustomer)
      ..writeByte(100)
      ..write(obj._createDiscount)
      ..writeByte(101)
      ..write(obj._createEmployee)
      ..writeByte(102)
      ..write(obj._createFee)
      ..writeByte(103)
      ..write(obj._createGoodCategory)
      ..writeByte(104)
      ..write(obj._createGoodSale)
      ..writeByte(105)
      ..write(obj._createInvCount)
      ..writeByte(106)
      ..write(obj._createModifier)
      ..writeByte(107)
      ..write(obj._createPosDevice)
      ..writeByte(108)
      ..write(obj._createProduction)
      ..writeByte(109)
      ..write(obj._createPurchase)
      ..writeByte(110)
      ..write(obj._createReciept)
      ..writeByte(111)
      ..write(obj._createStockAdjustmen)
      ..writeByte(112)
      ..write(obj._createStore)
      ..writeByte(113)
      ..write(obj._createSupplier)
      ..writeByte(114)
      ..write(obj._createSupplierCreateDoc)
      ..writeByte(115)
      ..write(obj._createTaxes)
      ..writeByte(116)
      ..write(obj._createTimeCard)
      ..writeByte(117)
      ..write(obj._createTransfer)
      ..writeByte(118)
      ..write(obj._itemEdit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
