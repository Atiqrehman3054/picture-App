import 'dart:async';
void main(){

  final baker  = new StreamTransformer.fromHandlers(

      handleData: (caketype,sink){
        if(caketype == 'chocolate'){
          sink.add(cake());
        }
        else {
          sink.addError('we dont bake this type cake');
        }
      }

  );
  final controller  = new StreamController();
  final order = new Order('banana');
  controller.sink.add(order);
  controller.stream.map(
          (order) => order.type)
  .transform(baker)
  .listen((cake)=> print('here is your cake $cake'),
    onError: (err) => print(err)
  );




}

class Order{

  String type;
  Order(this.type);

}

class cake{

}
