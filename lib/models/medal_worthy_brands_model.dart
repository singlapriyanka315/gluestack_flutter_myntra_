class BrandItem {
  final String image;
  final String brand;
  final String offer;

  BrandItem({
    required this.image,
    required this.brand,
    required this.offer,
  });

  factory BrandItem.fromMap(Map<String, String> map) {
    return BrandItem(
      image: map['image'] ?? '',
      brand: map['brand'] ?? '',
      offer: map['offer'] ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'image': image,
      'brand': brand,
      'offer': offer,
    };
  }
}

// Converted data using the GroupedBrandItems model
final List<Map<String, String>> medalWorthyRawData = [
  {
    'image': 'assets/images/bodyShop.webp',
    'brand': 'The Body Shop',
    'offer': 'Buy 1 Get 1'
  },
  {
    'image': 'assets/images/nautica.jpg',
    'brand': 'Nautica',
    'offer': 'Min 40% OFF'
  },
  {
    'image': 'assets/images/ethnic.webp',
    'brand': 'Ethnic wear',
    'offer': 'Flat 65% OFF'
  },
  {
    'image': 'assets/images/saree.webp',
    'brand': 'Designer Saree',
    'offer': 'Under ₹899'
  },
  {
    'image': 'assets/images/tommybags.webp',
    'brand': 'Tommy Hilfiger ',
    'offer': 'Min 40% OFF'
  },
  {
    'image': 'assets/images/skybag.webp',
    'brand': 'SkyBag',
    'offer': 'GET EXTRA ₹499 OFF'
  },
  {
    'image': 'assets/images/allen.jpg',
    'brand': 'Allen Solly',
    'offer': 'Min. 70% Off'
  },
  {
    'image': 'assets/images/next.webp',
    'brand': 'Next',
    'offer': 'Min. 55% Off'
  },
  {
    'image': 'assets/images/arrow.jpg',
    'brand': 'Arrow',
    'offer': 'Min. 50% Off'
  },
  {
    'image': 'assets/images/louis.webp',
    'brand': 'Louis Philippe',
    'offer': '30-50% Off'
  },
  {
    'image': 'assets/images/levis.webp',
    'brand': 'Levis',
    'offer': 'Min. 30% Off'
  },
  {
    'image': 'assets/images/boohooMan.jpg',
    'brand': 'BoohooMan',
    'offer': 'UP TO 25% Off'
  },
  {
    'image': 'assets/images/uspolo.webp',
    'brand': 'U.S Polo',
    'offer': 'Min. 70% Off'
  },
  {
    'image': 'assets/images/mochi.jpg',
    'brand': 'Mochi',
    'offer': 'Flat 50% OFF'
  },
  {
    'image': 'assets/images/redtape.webp',
    'brand': 'Red Tape',
    'offer': 'Min. 50% Off'
  },
  {
    'image': 'assets/images/metro.webp',
    'brand': 'Metro',
    'offer': 'Starting ₹2399'
  },
  {'image': 'assets/images/puma.jpg', 'brand': 'Puma', 'offer': 'Min. 30% Off'},
  {'image': 'assets/images/aldo.jpg', 'brand': 'Aldo', 'offer': 'Min. 60% Off'},
];

final List<BrandItem> brandItems =
    medalWorthyRawData.map((map) => BrandItem.fromMap(map)).toList();
