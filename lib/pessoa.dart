import 'package:flutter/material.dart';

class Pessoa 
{
   double peso, altura, imc;
   String genero, classificacao, imcResult;
   Color cor;

   void calculoIMC(double peso, double altura, String genero)
   {
      imc=  peso / (altura * altura);
      if(genero=="masculino")//Homem
      {
          imcResult = "IMC = ${imc.toStringAsPrecision(2)}\n";
          if (imc < 20)
          {
            classificacao = "Abaixo do peso"; 
            cor = Colors.blue;
          } 
          else if (imc < 26)
          {
            classificacao = "Peso ideal";
            cor = Colors.green;
          }
          else if (imc < 33)
          {
            classificacao = "Levemente acima do peso";
            cor = Colors.grey;
          }
          else if (imc < 38)
          {
            classificacao = "Obesidade Grau I";
            cor = Colors.orange;
          } 
          else if (imc < 42)
          {
            classificacao = "Obesidade Grau II";
            cor = Colors.red;
          }
          else
          {
            classificacao = "Obesidade Grau IIII";
            cor = Colors.redAccent;
          }
            
      }
      /*else//Mulher
      {
          classificacao = "IMC = ${imc.toStringAsPrecision(2)}\n";
          if (imc < 18.6)
          {
            classificacao += "Abaixo do peso";
            cor = Colors.blue;
          }
          else if (imc < 25)
          {
            classificacao += "Peso ideal";
            cor = Colors.green;
          }
          else if (imc < 30)
          {
            classificacao += "Levemente acima do peso";
            cor = Colors.grey;
          }
          else if (imc < 35)
          {
            classificacao += "Obesidade Grau I";
            cor = Colors.orange;
          }
          else if (imc < 40)
          {
            classificacao += "Obesidade Grau II";
            cor = Colors.red;
          }
          else
          {
            classificacao += "Obesidade Grau IIII";
            cor = Colors.redAccent;
          }
      }*/
   }
}