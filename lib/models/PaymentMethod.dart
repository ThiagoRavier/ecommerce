class PaymentMethod {
  String nickname;
  String image;

  PaymentMethod(this.nickname, this.image);
}

class Boleto extends PaymentMethod {
  Boleto()
      : super('Boleto',
            'https://logospng.org/download/pix/logo-pix-icone-256.png');
}

class Pix extends PaymentMethod {
  Pix()
      : super(
            'Pix', 'https://logospng.org/download/pix/logo-pix-icone-256.png');
}

class CreditCard extends PaymentMethod {
  String creditCardNumber;
  CreditCardFlag flag;

  CreditCard(this.creditCardNumber, this.flag)
      : super(
          '**** **** **** ${creditCardNumber.substring(13, 16)}',
          flag.image,
        );
}

class CreditCardFlag {
  String name;
  String image;

  CreditCardFlag(this.name, this.image);
}
