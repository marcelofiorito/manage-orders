using OrdersService as service from '../../srv/service';

// Labels nos campos do schema
annotate service.Orders with {
  title       @title: 'Title';
  customer    @title: 'Customer';
  status_code @title: 'Status'
              @Common.ValueListWithFixedValues: true
              @Common: {
                ValueList: {
                  CollectionPath: 'OrderStatus',
                  Parameters: [
                    { $Type: 'Common.ValueListParameterOut',
                      LocalDataProperty: status_code,
                      ValueListProperty: 'code' },
                    { $Type: 'Common.ValueListParameterDisplayOnly',
                      ValueListProperty: 'name' }
                  ]
                }
              };
  totalAmount @title: 'Total Amount';
}

annotate service.OrderItems with {
  description @title: 'Description';
  quantity    @title: 'Quantity';
  unitPrice   @title: 'Unit Price';
}

annotate service.Orders with @(
  UI: {
    SelectionFields: [ status_code, customer ],

    LineItem: [
      { $Type: 'UI.DataField', Value: title },
      { $Type: 'UI.DataField', Value: customer },
      { $Type: 'UI.DataField', Value: status_code },
      { $Type: 'UI.DataField', Value: totalAmount },
      { $Type: 'UI.DataField', Value: createdAt, Label: 'Created At' }
    ],

    HeaderInfo: {
      TypeName:       'Order',
      TypeNamePlural: 'Orders',
      Title:          { Value: title },
      Description:    { Value: customer }
    },

    Facets: [
      {
        $Type:  'UI.CollectionFacet',
        Label:  'Order Details',
        ID:     'OrderDetailsFacet',
        Facets: [
          {
            $Type:  'UI.ReferenceFacet',
            Label:  'General Information',
            ID:     'GeneralInfoFacet',
            Target: '@UI.FieldGroup#GeneralInfo'
          }
        ]
      },
      {
        $Type:  'UI.ReferenceFacet',
        Label:  'Order Items',
        ID:     'OrderItemsFacet',
        Target: 'items/@UI.LineItem'
      }
    ],

    FieldGroup #GeneralInfo: {
      $Type: 'UI.FieldGroupType',
      Data: [
        { $Type: 'UI.DataField', Value: title },
        { $Type: 'UI.DataField', Value: customer },
        { $Type: 'UI.DataField', Value: status_code },
        { $Type: 'UI.DataField', Value: totalAmount }
      ]
    }
  }
);

annotate service.OrderItems with @(
  UI: {
    LineItem: [
      { $Type: 'UI.DataField', Value: description },
      { $Type: 'UI.DataField', Value: quantity },
      { $Type: 'UI.DataField', Value: unitPrice }
    ]
  }
);
