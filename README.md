# A reproduction of the issue where InstanceMirror.type.instanceMembers return an empty map

After consulting sigurdm here:https://github.com/dart-lang/reflectable/issues/74
This behaviour is determined feature rather than misbehaviour.

To populate the map, including instanceInvokeCapability as the following:
<code><pre>
class Reflector extends Reflectable{
  const Reflector():
        super(
          instanceInvokeCapability,
          declarationsCapability,
          nameCapability,
          typeCapability,
          metadataCapability,
          classifyCapability
      );
}
const reflector = const Reflector();
</pre></code>
If there was an  Uncaught Unhandled exception:Invalid argument(s), update pubspec: https://github.com/dart-lang/reflectable/issues/73


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

