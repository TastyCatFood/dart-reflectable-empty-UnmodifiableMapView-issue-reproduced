// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library my_project.web.index;

import 'dart:html';
import 'package:mirror_error_example/custom_element.dart';
import 'package:reflectable/reflectable.dart';
/// [MainApp] used!
main() async {
  document.registerElement('custom-element',CustomElement);
  var ce = new CustomElement();
  ce.text = 'hello world';
  querySelector('body').append(ce);

  var selfMirror = reflector.reflect(querySelector('custom-element'));
//  InstanceMirror selfMirror = reflector.reflect(ce);
  print(querySelector('custom-element').toString());
  selfMirror = (selfMirror as InstanceMirror);
  var methods = selfMirror.type.instanceMembers;
  print(methods.runtimeType);
  print(methods.length);
  for(var k in methods.keys){
    print('key:'+k.toString());
  }
}
