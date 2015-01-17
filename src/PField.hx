
package ;

import haxeparser.Data;
import haxe.macro.Expr;

abstract PField(Field) from Field
{

	public function print() : String
	{
		var ret = '';
		switch (this.kind)
		{
			// (t:Null<ComplexType>, e:Expr)
			case FVar(t, e):
			{
				ret += 'var ';
			}
			// f:Function
			case FFun(f):
			{
				ret += 'function ';
			}
			// get:String, set:String, t:ComplexType, e:Expr
			case FProp(get, set, t, e):
			{

			}
		}
		ret += '${this.name}\n';
		return ret;
	}

}