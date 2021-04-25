import 'package:ecommerce/models/ProductColor.dart';
import 'package:flutter/material.dart';
import 'ProductCategory.dart';

class Product {
  String name;
  double price;
  double discountRate;
  ProductCategory category;
  double rating;
  List<String> images;
  bool isFavorite;
  List<String> availableSizes;
  Map<ProductColor, String> availableColors;
  bool isFeatured;
  String description;

  Product({
    @required this.name,
    @required this.price,
    @required this.category,
    @required this.rating,
    @required this.images,
    @required this.description,
    this.availableColors = const {},
    this.discountRate = 0,
    this.isFavorite = false,
    this.isFeatured = false,
    List<String> availableSizes,
  }) : this.availableSizes = availableSizes ?? ['U'];

  double getPriceWithDiscount() {
    return this.price * (1 - this.discountRate);
  }

  void toggleFavorite() {
    this.isFavorite = !(this.isFavorite ?? false);
  }

  Map<String, dynamic> _toMap() {
    return {
      'name': name,
      'price': price,
      'priceWithDiscount': getPriceWithDiscount(),
      'category': category,
      'rating': rating,
      'images': images,
      'discountRate': discountRate,
      'isFavorite': isFavorite,
      'availableSizes': availableSizes,
    };
  }

  dynamic get(String propertyName) {
    var _mapRep = _toMap();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('propery not found');
  }
}

String formattedPrice(double value) {
  return 'R\$ ' + value.toStringAsFixed(2).replaceAll('.', ',');
}

List<Product> products = [
  ...List.filled(
    10,
    Product(
      name:
          'Saodimallsu Womens Turtleneck Oversized not quite, pretty lol, imdb...',
      price: 99.0,
      discountRate: 0.5,
      category: productCategories[0],
      rating: 4.5,
      images: [
        'https://s3-alpha-sig.figma.com/img/0233/7f64/8e691796cc9d9faf8fe69b66f4612d4d?Expires=1616976000&Signature=ZWanKo9F7wec3vwy0TRGareGMQUs-CDJHu3AiiSOHK3H5s9ozG7y2Fg7NsaA5LadvTin9uRpE05yZxss7cEK6HCFCTOh05C39SkNFN8NjF8sgPQOtsIpWPeE~4ocEOf4FDWqpV-rKJ62r3wCuNtGJB-wg~qpfV6m9QeE-kPIv~~vs02SJ1yVS7Nx79kgN6rCwdjVvEFriRfoZe25CZefJVCAbj~Oh4gzP~AvEF7jSPm1ENpj~j6RBbyxkm2IT3213yM3-TNuQE3~hrZaoNoSaDp4TqgISJqzI1iC7OcJTEKW1qdT7K3m-A8jcoZvvabIMiEQtj~iLuqVTx3MN1KyBw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
        'https://s3-alpha-sig.figma.com/img/f9f3/5747/5f93780317d4182ef3c8b6f6b2b04bdf?Expires=1616976000&Signature=M~DT4XoeJ7fYmkG9K40K~pNwoE-6C17rssaxMumlwRoEFxiW2q~ObRHhOHp7Zh0PLdoJfd~RG8zbqsoZM975oQ8A6eqDbyn~RI9rimKs5ZwDQ23ycaAaLqTmzWDyjYm67mC9Who1NTAuGxz7GEkgOgo-4Fvc6yGh5oUqSJcbf7QEMhHsydnzSq6xhNDUGhTXXv1rqKItb~UymNhBWxvO65RlrYDwDb5sNpSpb4tZQD4-yRKNQ78F56uN4EL8vNxRtihj5eMhEJax6VYihgbLp7J3S3HSXQrOWzUbnsREpXlyeUPpMqtcMvvQv42Y7hsMkspG8sPGeoUN3WtyL0W20w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
        'https://s3-alpha-sig.figma.com/img/68e9/cd82/02d3cc5904792dc8ed5fcda8dab346cb?Expires=1616976000&Signature=D2pNlxaWQm7THp3Gndiden~I4HbucpsaC-VfJxOmTFB0S-4JaNLSnZkrH~ApMZ55lzZRVYmM8cWLOSUXVXxeeYZSAN2SDqpB712okig6ILYv73NmuGn5Fx8hRgUs7DpY1z-4tLmaJ9BaNUeF8ZJdKmJZZpqxzPL4R3DmEbX1WyUoT5yfvC6a1cvdj3eHdGBCRn~VLpFIJHkIBqSiWKAs1tog3WVr01bk0oDF-62cpEoBsFoCicGCj1zWTh6Gf5JXCzeC3UGbHOQeui305PaT1OLCQQx6lIGGbFMo~t~e~u9NZ1o1CTUizYCt3ZWLIq-Uj~YmU-6YhS-9xdM2lcaj0Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
      ],
      isFavorite: true,
      description:
          'Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. ',
      availableColors: {
        productColors[4]:
            'https://s3-alpha-sig.figma.com/img/f9f3/5747/5f93780317d4182ef3c8b6f6b2b04bdf?Expires=1616976000&Signature=M~DT4XoeJ7fYmkG9K40K~pNwoE-6C17rssaxMumlwRoEFxiW2q~ObRHhOHp7Zh0PLdoJfd~RG8zbqsoZM975oQ8A6eqDbyn~RI9rimKs5ZwDQ23ycaAaLqTmzWDyjYm67mC9Who1NTAuGxz7GEkgOgo-4Fvc6yGh5oUqSJcbf7QEMhHsydnzSq6xhNDUGhTXXv1rqKItb~UymNhBWxvO65RlrYDwDb5sNpSpb4tZQD4-yRKNQ78F56uN4EL8vNxRtihj5eMhEJax6VYihgbLp7J3S3HSXQrOWzUbnsREpXlyeUPpMqtcMvvQv42Y7hsMkspG8sPGeoUN3WtyL0W20w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
        productColors[3]:
            'https://s3-alpha-sig.figma.com/img/895d/8c02/cb7a7c15e2900a5cb9fad2d27d63dcf3?Expires=1616976000&Signature=BkiHLXzkFo0VQ0-kpCIqRMmtKdf~yY3E-xsvsZ-NxE3mDd~aY-6bMUjmvP7bmucMX3y9QNSjCyU-o3yF6rYLXYhCvpBdTeUuTYpgsY4XBDAEGCBgnDl7l6ps7y7UeS6URs5MRjrGGlLujgRwCDQRlshL5pOYoRQ4Cx1e2Y~y4HkpkIVHgwnjMAVks1gi5XuJdwRo7voMv7tvPh960NL5UeF0SruP~1nY0DOVPuRs0WPsialRQkjKvZAq7nWrBrBWbxGmkRsEIW65wT8~t5VQEs1-EU5DEbnMKWzczL7jSLCQ-n1TAW9KmkcSlL1jI91lLf0oXEJVfEbaTlDZz0Ik8A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
        productColors[5]:
            'https://s3-alpha-sig.figma.com/img/2066/961c/1afe1790fb50f15fe4af4e54c5c80972?Expires=1616976000&Signature=P7VNSZIbdM-28xjEkbZzHEEKtd7XwHZ2qPguwY7oQXnGIks3KNHBdRqGUiJeXACzO7feZExlNgGnLA-d0-qe~U6jO8ecEDvEYShE9FbSD9tiiuu-CfyRW8mjDiO3-mOQ9h3Ga8PIJfO9NzZIhiVFyoay7OMJdcvgIecHpU7QIoh990hPcZ6O4Q19w9q9KQQxJBeeIunyXwpQ1NWnIBB707EYIuwK2NhodGAOMd9DmDNlcMxNH4nBuciWYYrL09CEQzk8lzpwpCafOztahz8zB-t9Z0PROWMVUjsCzMnFkxveBOSl3vJPEWsP23HoBNt6luMDZsdJgALOBAiTHAXWHA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
        productColors[2]:
            'https://s3-alpha-sig.figma.com/img/0aed/5eec/af8ac11c9e679a0342c890227b392afa?Expires=1616976000&Signature=ZzfcF45FX1jNAnBwR518uc~qliZRpF~HUOKESjYVtJZpzy8vnn2GsTDJujfaTHE31ZBbupZGmcE0v4uThVRKxrgpRM2NZPlvVSDNANBYxSMCDhIMR1~bEnL2U5duaFkjqQb9xvT4cLGrxdA~L3VWmCf-YqMaiRWDIDpKsfximtasdZ69LDgsq9afbE104ZZoUT976NfFqL7sKCr5oFyO3AgfBosLZKEJtnum0~krGjo9g4ZfKpsVIBVykkuynbhA~gBK0Fb~oLV1iNAm3MGzGm9Z-7AXaKp9vIcS9NZbp5YPd4H9ZTHicJn6eEx3zqHZkqrzyRXQt0LPSAnuIs5-qA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
        productColors[6]:
            'https://s3-alpha-sig.figma.com/img/ad2e/2fc7/7c42d4e3722ea7174b0ffe92b80e3db9?Expires=1616976000&Signature=aB0ygf-Vx6xVBqwnNMfZy6Gpad2Nrxj6rOkt9RV5zvT7MaAXETcNgVP9ytK7fX1~ZVVzZ1VUXNBA2haFVaYwmJnt48Ci--42ip9HkQgao4GQppS-~zBPuu32usXuI44F9juH0KZWXCQhJ3bzi9DamVSN0HvujVpnu-puT0apODa1VOlap4k3mq-LT0VN6LOv-6wPGHsuZkW2NswoXlWIEprPDoDNMBVKfhIfycHI8FSfhmvgTEUbbzFXMneMCnM-v7zA1YxsjqUxxAg-wVVEUhkZNgOMwKaEA44Jn2xqP01ES7DTjDb2dRD~sM2tuf6ZrKhwqZ~XZUJMuvuMivs0Ng__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
        productColors[7]:
            'https://s3-alpha-sig.figma.com/img/3ca6/9e20/0a66d91af782208ffd32399fd0e61983?Expires=1616976000&Signature=JiLEADTjdaxMGVLFD80TR9SB0mCpHdgU5xDR9Or11z2LLklBhAAgIMbQw~XdT5M0dQbOAtVIUDxBL82bhvhGwA2fajcLSxL4OKOPsOfI1sLF4NpYYnsHYcG5RWEcHEGae3W6hFv6qtGxyJnVQydgnRhUS8u3LymjzI6WWxYWalS~0JMdSEcdtSpYA71s~8OwZwRkuKG~BDVS93YivD-VoWlzF~8jqSeSepi0dtGenEMR375JnzUQ2Z~v66rO1i4~DotXQdsG~3kQQoRTteO1CTcKhvRrZwEULpbwlBL8ZEcDQ59QUIGFMwcnJip9270FF8i~8Nnu6NVJziZQKLLDTw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
      },
    ),
  ),
  ...List.filled(
    10,
    Product(
        name: 'Terno',
        price: 200,
        discountRate: 0.1,
        images: [productCategories[1].image],
        isFavorite: false,
        category: productCategories[1],
        rating: 3.9,
        isFeatured: true,
        description:
            'Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. '),
  ),
  ...List.filled(
    10,
    Product(
        name: 'Macaquinho',
        price: 20,
        discountRate: 0.1,
        images: [productCategories[2].image],
        isFavorite: false,
        category: productCategories[0],
        rating: 4.9,
        description:
            'Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. Uma roupa bonita. '),
  ),
];
