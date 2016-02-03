import 'dart:html';
import 'package:reflectable/reflectable.dart';

class Reflector extends Reflectable{
  const Reflector():
        super(
//          instanceInvokeCapability, //including this line throws an error
          declarationsCapability,
          nameCapability,
          typeCapability,
          metadataCapability,
          classifyCapability
      );
}
const reflector = const Reflector();

@reflector
class CustomElement extends HtmlElement {
  CustomElement.created():super.created(){
  }
  factory CustomElement(){
    return new Element.tag('custom-element');
  }
}
