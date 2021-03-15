import 'package:flutter/material.dart';

class ProductCategory {
  final String name, image;
  final List<String> subcategories;

  ProductCategory(
      {this.subcategories = const [],
      @required this.name,
      @required this.image});
}

List<ProductCategory> productCategories = [
  ProductCategory(
    name: "Moda Feminina",
    image:
        "https://s3-alpha-sig.figma.com/img/5038/cb3b/c1aca521dc26292aa8ad303a45f15db6?Expires=1616371200&Signature=VG3smxRLbPD8ErSizbEVGrWTjUCpD~sKEbbW~80-LZeYKIWY36mB1brXCIyCUi1vQYmxl818Ozeptu2WxdYB8jdEMmAFBRN2fAByvGvpmguU3h-2WqLxC3DlZT4QdMOVI86NSAuNlhX~2H9Z88V3jAvbVLFGYoC~oLFo6wMdLAW0HQXIcs7PD6km6WoW3BJL84CMX3YlTM8RxjpNcY8-I9e4VYQchdUue6xyWkk4BT6lv482E~Y1Oj7QauJHCCUrv7UwzIp47rTIBbwWRCjJJu7E5yQOBpFtwnau24-h3D2sCuN8ylUMmsG~J-nkmb5dZLXuCR8cfuXB2wfBLMOALQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    subcategories: [
      'Blusa',
      'Calça',
      'Casaco',
      'Saia',
      'Vestido',
      'Moletom',
      'Calcinha',
      'Sutiã',
      'Biquíni'
    ],
  ),
  ProductCategory(
    name: "Moda Masculina",
    image:
        "https://s3-alpha-sig.figma.com/img/b2af/7191/b0d92e9d5c84d197d3262937f238cfaa?Expires=1616371200&Signature=b4yHAkf4XYnJu~jdq8Vp0nJwfmWpyJWMDEeWagrg0Ir0waEW6E59MZl8cB77txY~Is~MrBUwTEe4lEf4ayYflVoWdLFd~V7K8Hi-CMMB4j33-T3ZaV6kBuNLcBd-ypGNi9u3rRI5ngMg1B33Ee5hEl9YPOjJ15p2sr9niLZbw2oUulXSgNbVUI3Uviff5DxWCDLNDx4rxacPlHdhZss2PoHLzcJdiwQX1CSM5f6lGeNTOn1pUU7~3DLwGp1Wn02WuYCM5BAjHjOb9RcfxeD6MNmd9Sh6IMbqr8Y2EqEjxvk95WXRuxQ1XrQAAr5TIDuJnENTPK0acUr2wpMIAT~UsA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    subcategories: ['Blusa', 'Calça', 'Casaco'],
  ),
  ProductCategory(
    name: "Moda Bebê",
    image:
        "https://s3-alpha-sig.figma.com/img/4677/37db/892e8ba7c30ec21905cd790ef9c2caca?Expires=1616371200&Signature=CczjjlqlY0CRt~xTKfIf5kErIr0C3tp9W33EqF-6h8M0FqiC9QTNxBmPipDKOCr~awpp9qFBmAdWESIJebdS2oZJrriaVy1dwesdH0h83~so-W6vToSpshcnEk1m-rnxXi7FzKoa4stZ5mhN5UvSwcuMWp04zbbsdRzU6Lj-mOvxWQIVRUq-QS3-6zz3-qRYKDHlbWz-N1qJXxywdFKeV-h5RNVf34OjGPVECC8rNpKDDiURGYCtaCHYIdp1SAn~kY21Q4KBK3pyGLF~AU5OAqSo3zpJ9L9lmPhdEmPdSZLu8IjXHCa8o3fbj0Fz-UeNGpNNRADTqj8fM6HvzMzlwQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    subcategories: ['Blusa', 'Calça', 'Casaco', 'Macaquinho'],
  ),
  ProductCategory(
    name: "Acessórios",
    image:
        "https://s3-alpha-sig.figma.com/img/e022/b1c1/bfe9b22a4b6c42b01a7102adc92031c8?Expires=1616371200&Signature=NYmZl~0Pr6QuzNHFYd6yh4C7AG-qfOvvtpowCEALAgg7b7mpxYP3dp1Z~~GqgWwzB1Sz1rBYU5UJGDTp62fyk2uElmbK76inh3ti4niHtx37kgr1dDg08Yk45X3hFqOoe7mjRYIKIUFJv-opAe1Vja-t1bQv-asDInpy~J20CfF7iXHY2iMfxy6bEdfSqFQ~moDdc83jj3bgGawOAuBGc9cOr24lBefbUdV3yBFclw4YlHErr5ClqL1KYUBtQpRjHrG2GfZeg0RX5w-2P-rnd84D8kzk4OHsPyY9CQDSqNEz7N2g-dfunOe6zbxkAaLIbRjo44E0wBBKrR3HgD~DMA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    subcategories: ['Cueca', 'Carteira', 'Celular', 'Short'],
  )
];
