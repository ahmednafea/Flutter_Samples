
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'Model/AppState.dart';
import 'Model/CartItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(appStateReducers,
      initialState: AppState.empty, middleware: [storeCartItemsMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ShoppingCart(),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List with Redux"),
      ),
      body: ShoppingList(),
    );
  }
}

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ShoppingListViewModel>(
      converter: (store) => ShoppingListViewModel.build(store),
      builder: (context, viewModel) {
        return Stack(children: <Widget>[
          ListView.builder(
              itemCount: viewModel.cartItems.length,
              itemBuilder: (context, position) => ShoppingListItem(
                  item: viewModel.cartItems[position],
                  onProductAdded: viewModel.onProductAdded,
                  onProductRemoved: viewModel.onProductRemoved)),
          Align(
            alignment: Alignment.bottomCenter,
            child: CartValueBar(cartValue: viewModel.cartValue),
          )
        ]);
      },
    );
  }
}

class ShoppingListItem extends StatelessWidget {
  final CartItem item;
  final Function(CartItem) onProductAdded;
  final Function(CartItem) onProductRemoved;

  ShoppingListItem({this.item, this.onProductAdded, this.onProductRemoved});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.store),
      title: Text(item.name),
      subtitle: Text('Price: ${item.price} zł'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => onProductRemoved(item),
          ),
          Text(item.quantity.toString()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => onProductAdded(item),
          ),
        ],
      ),
    );
  }
}

class ShoppingListViewModel {
  final double cartValue;
  final List<CartItem> cartItems;
  final Function(CartItem) onProductAdded;
  final Function(CartItem) onProductRemoved;

  ShoppingListViewModel({
    this.cartValue,
    this.cartItems,
    this.onProductAdded,
    this.onProductRemoved,
  });

  static build(Store<AppState> store) => ShoppingListViewModel(
    cartValue: _calculateCartValue(store.state.cartItems),
    cartItems: store.state.cartItems,
    onProductAdded: (cartItem) => store.dispatch(AddItemAction(cartItem)),
    onProductRemoved: (cartItem) =>
        store.dispatch(RemoveItemAction(cartItem)),
  );

  static double _calculateCartValue(List<CartItem> cartItems) {
    return cartItems
        .map((cartItem) => cartItem.price * cartItem.quantity)
        .fold(0.0, (previous, next) => previous + next);
  }
}

const CART_BAR_HEIGHT = 48.0;

class CartValueBar extends StatelessWidget {
  final double cartValue;

  const CartValueBar({Key key, this.cartValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: CART_BAR_HEIGHT,
      duration: Duration(milliseconds: 300),
      transform:
      Matrix4.translationValues(0, cartValue != 0 ? 0 : CART_BAR_HEIGHT, 0),
      color: Colors.orange,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              cartValue != 0 ? 'Cart value ${_getCartValue()} Gram' : '',
            ),
          ),
        ],
      ),
    );
  }

  String _getCartValue() => cartValue.toStringAsFixed(2);
}

AppState appStateReducers(AppState state, dynamic action) {
  if (action is AddItemAction) {
    return _addItem(state, action);
  } else if (action is RemoveItemAction) {
    return _removeItem(state, action);
  }
  return state;
}

AppState _addItem(AppState state, AddItemAction action) {
  return AppState(state.cartItems
      .map((item) =>
  item.id == action.item.id ? getIncreasedQuantityItem(item) : item)
      .toList());
}

AppState _removeItem(AppState state, RemoveItemAction action) {
  return AppState(state.cartItems
      .map((item) =>
  item.id == action.item.id ? getDecreasedQuantityItem(item) : item)
      .toList());
}

CartItem getIncreasedQuantityItem(CartItem item) {
  return item.copyWith(quantity: item.quantity + 1);
}

CartItem getDecreasedQuantityItem(CartItem item) {
  if (item.quantity <= 0) return item;
  return item.copyWith(quantity: item.quantity - 1);
}

const String App_State_Key = "APP_STATE";

void storeCartItemsMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  next(action);
}

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);
}

class RemoveItemAction {
  final CartItem item;

  RemoveItemAction(this.item);
}
