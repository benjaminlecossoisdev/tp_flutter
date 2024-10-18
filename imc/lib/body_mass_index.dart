class BodyMassIndex {

  static num calculateBMI( int taille, int poids) {
      double tailleCm = taille/100;

      return poids / (tailleCm * tailleCm);
  }

  static String getCategoryFromBMI(num bmi){
    if (bmi<18.5){
      return 'underweight';
    }else if (bmi>= 18.5 && bmi<25){
      return 'normal';
    }else if (bmi>= 25 && bmi<30){
      return 'overweight';
    }else if (bmi>= 30){
      return 'obesity';
    }
    throw Exception("Can't determinate Category");
  }
}

