import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../../../../services/payment-service.dart';
import '../../../../utils/my_colors.dart';

class ClientPay extends StatefulWidget {
  ClientPay({Key key}) : super(key: key);

  @override
  ClientPayPageState createState() => ClientPayPageState();
}

class ClientPayPageState extends State<ClientPay> {

  onItemPress(BuildContext context, int index) async {
    switch(index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.pushNamed(context, 'client/payments/existing');
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(
        message: 'Porfavor Espera...'
    );
    await dialog.show();
    var response = await StripeService.payWithNewCard(
        amount: '15000',
        currency: 'USD'
    );
    await dialog.hide();
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          duration: new Duration(milliseconds: response.success == true ? 1200 : 3000),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pago'),
        backgroundColor: MyColors.primaryColorDark,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch(index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: theme.primaryColor);
                  text = Text('Pagar con una tajeta Nueva');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: theme.primaryColor);
                  text = Text('Pagar con una tarjeta existente');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: theme.primaryColor,
            ),
            itemCount: 2
        ),
      ),
    );;
  }
}