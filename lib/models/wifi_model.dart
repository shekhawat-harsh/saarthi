class Wifi_data {
  double? aAcc1;
  double? aAcc2;
  double? aAcc3;
  double? aAngle1;
  double? aAngle2;
  double? aAngle3;
  double? bAcc1;
  double? bAcc2;
  double? bAcc3;
  double? bAngle1;
  double? bAngle2;
  double? bAngle3;
  int? fSR0;
  int? fSR1;
  int? fSR2;
  int? fSR3;
  int? fSR4;
  int? fSR5;
  int? fSR6;
  int? fSR7;
  int? fSR8;
  int? fSR9;
  int? fSR10;
  int? fSR11;
  int? fSR12;
  int? fSR13;
  int? fSR14;
  int? fSR15;

  Wifi_data(
      {this.aAcc1,
      this.aAcc2,
      this.aAcc3,
      this.aAngle1,
      this.aAngle2,
      this.aAngle3,
      this.bAcc1,
      this.bAcc2,
      this.bAcc3,
      this.bAngle1,
      this.bAngle2,
      this.bAngle3,
      this.fSR0,
      this.fSR1,
      this.fSR2,
      this.fSR3,
      this.fSR4,
      this.fSR5,
      this.fSR6,
      this.fSR7,
      this.fSR8,
      this.fSR9,
      this.fSR10,
      this.fSR11,
      this.fSR12,
      this.fSR13,
      this.fSR14,
      this.fSR15});

  Wifi_data.fromJson(Map<String, dynamic> json) {
    aAcc1 = json['1Acc1'];
    aAcc2 = json['1Acc2'];
    aAcc3 = json['1Acc3'];
    aAngle1 = json['1Angle1'];
    aAngle2 = json['1Angle2'];
    aAngle3 = json['1Angle3'];
    bAcc1 = json['2Acc1'];
    bAcc2 = json['2Acc2'];
    bAcc3 = json['2Acc3'];
    bAngle1 = json['2Angle1'];
    bAngle2 = json['2Angle2'];
    bAngle3 = json['2Angle3'];
    fSR0 = json['FSR0'];
    fSR1 = json['FSR1'];
    fSR2 = json['FSR2'];
    fSR3 = json['FSR3'];
    fSR4 = json['FSR4'];
    fSR5 = json['FSR5'];
    fSR6 = json['FSR6'];
    fSR7 = json['FSR7'];
    fSR8 = json['FSR8'];
    fSR9 = json['FSR9'];
    fSR10 = json['FSR10'];
    fSR11 = json['FSR11'];
    fSR12 = json['FSR12'];
    fSR13 = json['FSR13'];
    fSR14 = json['FSR14'];
    fSR15 = json['FSR15'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aAcc1'] = this.aAcc1;
    data['aAcc2'] = this.aAcc2;
    data['aAcc3'] = this.aAcc3;
    data['aAngle1'] = this.aAngle1;
    data['aAngle2'] = this.aAngle2;
    data['aAngle3'] = this.aAngle3;
    data['bAcc1'] = this.bAcc1;
    data['bAcc2'] = this.bAcc2;
    data['bAcc3'] = this.bAcc3;
    data['bAngle1'] = this.bAngle1;
    data['bAngle2'] = this.bAngle2;
    data['bAngle3'] = this.bAngle3;
    data['FSR0'] = this.fSR0;
    data['FSR1'] = this.fSR1;
    data['FSR2'] = this.fSR2;
    data['FSR3'] = this.fSR3;
    data['FSR4'] = this.fSR4;
    data['FSR5'] = this.fSR5;
    data['FSR6'] = this.fSR6;
    data['FSR7'] = this.fSR7;
    data['FSR8'] = this.fSR8;
    data['FSR9'] = this.fSR9;
    data['FSR10'] = this.fSR10;
    data['FSR11'] = this.fSR11;
    data['FSR12'] = this.fSR12;
    data['FSR13'] = this.fSR13;
    data['FSR14'] = this.fSR14;
    data['FSR15'] = this.fSR15;
    return data;
  }
}
