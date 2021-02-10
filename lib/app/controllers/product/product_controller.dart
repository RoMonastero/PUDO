//API para ser possivel identificar o produto pelo leitor de codigo

class ProductController {
  String description;
  int gtin;
  String thumbnail;
  int width;
  int height;
  int length;
  int netWeight;
  int grossWeight;
  String createdAt;
  String updatedAt;
  String price;
  double avgPrice;
  double maxPrice;
  double minPrice;
  List<Gtins> gtins;
  String origin;
  String barcodeImage;
  Gpc gpc;
  Ncm ncm;
  Cest cest;

  ProductController(
      {this.description,
      this.gtin,
      this.thumbnail,
      this.width,
      this.height,
      this.length,
      this.netWeight,
      this.grossWeight,
      this.createdAt,
      this.updatedAt,
      this.price,
      this.avgPrice,
      this.maxPrice,
      this.minPrice,
      this.gtins,
      this.origin,
      this.barcodeImage,
      this.gpc,
      this.ncm,
      this.cest});

  ProductController.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    gtin = json['gtin'];
    thumbnail = json['thumbnail'];
    width = json['width'];
    height = json['height'];
    length = json['length'];
    netWeight = json['net_weight'];
    grossWeight = json['gross_weight'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    price = json['price'];
    avgPrice = json['avg_price'];
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
    if (json['gtins'] != null) {
      gtins = new List<Gtins>();
      json['gtins'].forEach((v) {
        gtins.add(new Gtins.fromJson(v));
      });
    }
    origin = json['origin'];
    barcodeImage = json['barcode_image'];
    gpc = json['gpc'] != null ? new Gpc.fromJson(json['gpc']) : null;
    ncm = json['ncm'] != null ? new Ncm.fromJson(json['ncm']) : null;
    cest = json['cest'] != null ? new Cest.fromJson(json['cest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['gtin'] = this.gtin;
    data['thumbnail'] = this.thumbnail;
    data['width'] = this.width;
    data['height'] = this.height;
    data['length'] = this.length;
    data['net_weight'] = this.netWeight;
    data['gross_weight'] = this.grossWeight;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['price'] = this.price;
    data['avg_price'] = this.avgPrice;
    data['max_price'] = this.maxPrice;
    data['min_price'] = this.minPrice;
    if (this.gtins != null) {
      data['gtins'] = this.gtins.map((v) => v.toJson()).toList();
    }
    data['origin'] = this.origin;
    data['barcode_image'] = this.barcodeImage;
    if (this.gpc != null) {
      data['gpc'] = this.gpc.toJson();
    }
    if (this.ncm != null) {
      data['ncm'] = this.ncm.toJson();
    }
    if (this.cest != null) {
      data['cest'] = this.cest.toJson();
    }
    return data;
  }
}

class Gtins {
  int gtin;
  CommercialUnit commercialUnit;

  Gtins({this.gtin, this.commercialUnit});

  Gtins.fromJson(Map<String, dynamic> json) {
    gtin = json['gtin'];
    commercialUnit = json['commercial_unit'] != null
        ? new CommercialUnit.fromJson(json['commercial_unit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gtin'] = this.gtin;
    if (this.commercialUnit != null) {
      data['commercial_unit'] = this.commercialUnit.toJson();
    }
    return data;
  }
}

class CommercialUnit {
  String typePackaging;
  int quantityPackaging;
  int ballast;
  int layer;

  CommercialUnit(
      {this.typePackaging, this.quantityPackaging, this.ballast, this.layer});

  CommercialUnit.fromJson(Map<String, dynamic> json) {
    typePackaging = json['type_packaging'];
    quantityPackaging = json['quantity_packaging'];
    ballast = json['ballast'];
    layer = json['layer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_packaging'] = this.typePackaging;
    data['quantity_packaging'] = this.quantityPackaging;
    data['ballast'] = this.ballast;
    data['layer'] = this.layer;
    return data;
  }
}

class Gpc {
  String code;
  String description;

  Gpc({this.code, this.description});

  Gpc.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}

class Ncm {
  String code;
  String description;
  String fullDescription;

  Ncm({this.code, this.description, this.fullDescription});

  Ncm.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    fullDescription = json['full_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    data['full_description'] = this.fullDescription;
    return data;
  }
}

class Cest {
  int id;
  String code;
  String description;
  int parentId;

  Cest({this.id, this.code, this.description, this.parentId});

  Cest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    description = json['description'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['description'] = this.description;
    data['parent_id'] = this.parentId;
    return data;
  }
}
