class CartState {
  final List<String> items;

  CartState({
    this.items = const [], 
  });

  CartState copyWith({
    List<String>? items,
  }){
    return CartState(
      items: items ?? this.items,
    );
  }

  int get itemCount => items.length;
}