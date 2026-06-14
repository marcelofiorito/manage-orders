namespace com.manage;
using { managed, sap } from '@sap/cds/common';

entity Orders : managed {
  key ID      : UUID;
  title       : String(100);
  customer    : String(100);
  status_code : String(1) default 'N';
  totalAmount : Decimal(10,2);
  items       : Composition of many OrderItems on items.order = $self;
}

entity OrderItems : managed {
  key ID       : UUID;
  order        : Association to Orders;
  description  : String(200);
  quantity     : Integer;
  unitPrice    : Decimal(10,2);
}

entity OrderStatus : sap.common.CodeList {
  key code : String(1);
}
