class GlobalBrandItem {
  final String image;
  final String brand;
  final String offer;

  GlobalBrandItem({
    required this.image,
    required this.brand,
    required this.offer,
  });

  factory GlobalBrandItem.fromMap(Map<String, String> map) {
    return GlobalBrandItem(
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

// Sample Data List
final List<Map<String, String>> globalBrandRawData = [
  {
    'image': 'assets/images/brand1.png',
    'brand': 'Hottest Pair',
    'offer': 'Buy 1 Get 1'
  },
  {
    'image': 'assets/images/brand2.png',
    'brand': 'Everyday Go To Find',
    'offer': 'Min 40% OFF'
  },
  {
    'image': 'assets/images/brand3.png',
    'brand': 'Everyday Wear',
    'offer': 'Flat 65% OFF'
  },
  {
    'image': 'assets/images/brand4.png',
    'brand': 'Trending',
    'offer': 'Under ₹899'
  },
  {
    'image': 'assets/images/brand5.png',
    'brand': 'Easy Going Style',
    'offer': 'Min 40% OFF'
  },
  {
    'image': 'assets/images/brand6.png',
    'brand': 'Laid-Back Styles',
    'offer': 'GET EXTRA ₹499 OFF'
  },
  {
    'image': 'assets/images/brand7.png',
    'brand': 'Everyday Go To Find',
    'offer': 'Min. 70% Off'
  },
  {
    'image': 'assets/images/brand8.png',
    'brand': 'Cool Casuals',
    'offer': 'Min. 55% Off'
  },
  {
    'image': 'assets/images/brand9.png',
    'brand': 'Trendiest Fits',
    'offer': 'Min. 50% Off'
  },
  {
    'image': 'assets/images/brand10.png',
    'brand': 'Must Have',
    'offer': '30-50% Off'
  },
  {
    'image': 'assets/images/brand11.png',
    'brand': 'Everyday wear',
    'offer': 'Min. 30% Off'
  },
  {
    'image': 'assets/images/brand12.png',
    'brand': 'Easy Going Style',
    'offer': 'UP TO 25% Off'
  },
];

final List<GlobalBrandItem> globalBrandItems =
    globalBrandRawData.map((map) => GlobalBrandItem.fromMap(map)).toList();
