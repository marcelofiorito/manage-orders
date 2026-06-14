using com.manage as db from '../db/schema';

service OrdersService {
  @odata.draft.enabled
  entity Orders as projection on db.Orders;

  @readonly
  entity OrderItems as projection on db.OrderItems;

  @readonly
  entity OrderStatus as projection on db.OrderStatus;
}
