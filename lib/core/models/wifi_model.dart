class Wifi_data {
  // double? aAcc1;
  // double? aAcc2;
  // double? aAcc3;
  // double? aAngle1;
  // double? aAngle2;
  // double? aAngle3;
  // double? bAcc1;
  // double? bAcc2;
  // double? bAcc3;
  // double? bAngle1;
  // double? bAngle2;
  // double? bAngle3;
  // double? fSR0;
  // double? fSR1;
  // double? fSR2;
  // double? fSR3;
  // double? fSR4;
  // double? fSR5;
  // double? fSR6;
  // double? fSR7;
  // double? fSR8;
  // double? fSR9;
  // double? fSR10;
  // double? fSR11;
  // double? fSR12;
  // double? fSR13;
  // double? fSR14;
  // double? fSR15;
  num? aAcc1;
  num? aAcc2;
  num? aAcc3;
  num? aAngle1;
  num? aAngle2;
  num? aAngle3;
  num? bAcc1;
  num? bAcc2;
  num? bAcc3;
  num? bAngle1;
  num? bAngle2;
  num? bAngle3;
  num? fSR0;
  num? fSR1;
  num? fSR2;
  num? fSR3;
  num? fSR4;
  num? fSR5;
  num? fSR6;
  num? fSR7;
  num? fSR8;
  num? fSR9;
  num? fSR10;
  num? fSR11;
  num? fSR12;
  num? fSR13;
  num? fSR14;
  num? fSR15;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aAcc1'] = aAcc1;
    data['aAcc2'] = aAcc2;
    data['aAcc3'] = aAcc3;
    data['aAngle1'] = aAngle1;
    data['aAngle2'] = aAngle2;
    data['aAngle3'] = aAngle3;
    data['bAcc1'] = bAcc1;
    data['bAcc2'] = bAcc2;
    data['bAcc3'] = bAcc3;
    data['bAngle1'] = bAngle1;
    data['bAngle2'] = bAngle2;
    data['bAngle3'] = bAngle3;
    data['FSR0'] = fSR0;
    data['FSR1'] = fSR1;
    data['FSR2'] = fSR2;
    data['FSR3'] = fSR3;
    data['FSR4'] = fSR4;
    data['FSR5'] = fSR5;
    data['FSR6'] = fSR6;
    data['FSR7'] = fSR7;
    data['FSR8'] = fSR8;
    data['FSR9'] = fSR9;
    data['FSR10'] = fSR10;
    data['FSR11'] = fSR11;
    data['FSR12'] = fSR12;
    data['FSR13'] = fSR13;
    data['FSR14'] = fSR14;
    data['FSR15'] = fSR15;
    return data;
  }
}
