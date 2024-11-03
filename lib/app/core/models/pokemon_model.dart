class PokemonModel {
  final String name;
  final String url;

  PokemonModel({
    required this.name,
    required this.url,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }

  int get id {
    final urlParts = url.split('/');
    return int.parse(urlParts[urlParts.length - 2]);
  }
} 