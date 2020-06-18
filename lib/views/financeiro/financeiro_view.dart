import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:portaldocliente/constants/colors_constants.dart';
import 'package:portaldocliente/models/financeiro_model.dart';

class FinanceiroView extends StatelessWidget {
  FinanceiroModel financeiro = FinanceiroModel();
  Map<String, double> dataMap = new Map();
  List<Color> colorList = [
    kAccentColor,
    kPrimaryColor,
  ];

  @override
  Widget build(BuildContext context) {
    dataMap.putIfAbsent("Pago", () => 40000);
    dataMap.putIfAbsent("Em Aberto", () => 130000);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Financeiro',
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: kAccentColor,
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.angleLeft, color: kAccentColor),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.only(left: 8),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Acompanhe sua posiçao financeira com a SN Construtora',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: kAccentColor,
                ),
              ),
            ),
            Container(
              child: Center(
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 1500),
                  chartLegendSpacing: 32.0,
                  chartRadius: MediaQuery.of(context).size.width / 1.4,
                  showChartValuesInPercentage: true,
                  showChartValues: true,
                  showChartValuesOutside: true,
                  chartValueBackgroundColor: Colors.grey[200],
                  colorList: colorList,
                  showLegends: true,
                  legendPosition: LegendPosition.bottom,
                  decimalPlaces: 2,
                  showChartValueLabel: true,
                  initialAngle: 0,
                  chartValueStyle: defaultChartValueStyle.copyWith(
                    color: Colors.blueGrey[900].withOpacity(0.9),
                  ),
                  chartType: ChartType.ring,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buttonFinanceiro('Resumo', 'Resumo Financeiro',
                      FontAwesomeIcons.wallet, context, '/boletos'),
                  _buttonFinanceiro('Parcelas', 'Visualizar Parcelas',
                      FontAwesomeIcons.listAlt, context, '/boletos'),
                  _buttonFinanceiro('Boletos', 'Acessar Boletos',
                      FontAwesomeIcons.barcode, context, '/boletos')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonFinanceiro(String nameBotton, String tooltipBotton,
      IconData icon, BuildContext context, String route) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Color(0x10000000),
                blurRadius: 10,
                spreadRadius: 4,
                offset: Offset(0.0, 8.0))
          ],
          color: kWhiteColor,
        ),
        child: Column(children: <Widget>[
          IconButton(
            icon: FaIcon(icon, size: 30, color: kPrimaryColor),
            tooltip: tooltipBotton,
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              nameBotton,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kAccentColor,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
