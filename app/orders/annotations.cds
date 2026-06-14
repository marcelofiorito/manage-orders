using OrdersService as service from '../../srv/service';

annotate service.Orders with @(
  UI: {
    SelectionFields: [ status_code, customer ],

    LineItem: [
      { $Type: 'UI.DataField', Value: title,        Label: 'Title' },
      { $Type: 'UI.DataField', Value: customer,     Label: 'Customer' },
      { $Type: 'UI.DataField', Value: status_code,  Label: 'Status' },
      { $Type: 'UI.DataField', Value: totalAmount,  Label: 'Total Amount' },
      { $Type: 'UI.DataField', Value: createdAt,    Label: 'Created At' }
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
        { $Type: 'UI.DataField', Value: title,       Label: 'Title' },
        { $Type: 'UI.DataField', Value: customer,    Label: 'Customer' },
        { $Type: 'UI.DataField', Value: status_code, Label: 'Status' },
        { $Type: 'UI.DataField', Value: totalAmount, Label: 'Total Amount' }
      ]
    }
  }
);

annotate service.OrderItems with @(
  UI: {
    LineItem: [
      { $Type: 'UI.DataField', Value: description, Label: 'Description' },
      { $Type: 'UI.DataField', Value: quantity,    Label: 'Quantity' },
      { $Type: 'UI.DataField', Value: unitPrice,   Label: 'Unit Price' }
    ]
  }
);
