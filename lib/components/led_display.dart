import 'package:flutter/material.dart';

class LedDisplay extends StatelessWidget{
  double _deslocamentoVertical, _deslocamentoHorizontal;
  LedDisplay(this._deslocamentoVertical, this._deslocamentoHorizontal);
  @override
  Widget build(BuildContext context){
    return ClipPath(
      clipper: ClipHome(_deslocamentoVertical, _deslocamentoHorizontal),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/2.7,
        decoration: BoxDecoration(
          color: Colors.pink[500]
        ),
      ),
    );
  }
}

class ClipHome extends CustomClipper<Path>{
  double _deslocamentoVertical, _deslocamentoHorizontal;
  ClipHome(this._deslocamentoVertical, this._deslocamentoHorizontal);
  @override
  Path getClip(Size size) {
    double _scale = size.height/32;
    Path path = Path();
    path.lineTo(_deslocamentoHorizontal + 0*_scale, _deslocamentoVertical + 0.7*_scale); //A
    path.lineTo(_deslocamentoHorizontal + 1*_scale, _deslocamentoVertical + 2*_scale); //B
    path.lineTo(_deslocamentoHorizontal + 6*_scale, _deslocamentoVertical + 2*_scale); //C
    path.lineTo(_deslocamentoHorizontal + 7*_scale, _deslocamentoVertical + 0.7*_scale); //D
    path.lineTo(_deslocamentoHorizontal + 6*_scale, _deslocamentoVertical + 0*_scale); //E
    path.lineTo(_deslocamentoHorizontal + 1*_scale, _deslocamentoVertical + 0*_scale); //F
    path.lineTo(_deslocamentoHorizontal + 0*_scale, _deslocamentoVertical + 1*_scale); //A
    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }

}