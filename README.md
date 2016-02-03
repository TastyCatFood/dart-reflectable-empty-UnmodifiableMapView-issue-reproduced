# A reproduction of an issue where InstanceMirror.type.instanceMembers return an empty map

The code(found in index.dart):
<pre><code>
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
</pre></code>


Returns type: UnmodifiableMapView<String, MethodMirror><br>
Size:0

