
package ;

import haxeparser.HaxeParser;
import haxeparser.Data;
import sys.io.File;

class TypeDefPrinter
{
	public static function toString(t : TypeDecl) : String
	{
		var str = "";
		switch(t.decl)
		{
			// d:Definition<ClassFlag, Array<Field>>
			case EClass(d):
			{
				str += '\n';
				str += 'class ${d.name} {';
				str += '\n}';
			}

			// d:Definition<EnumFlag, Array<EnumConstructor>>
			case EEnum(d):
			{

			}

			// a:Definition<AbstractFlag, Array<Field>>
			case EAbstract(a):
			{

			}

			// sl:Array<{pack:String, pos:Position}>, mode:ImportMode
			case EImport(sl, mode):
			{
				str += 'import ';
				for (i in 0...sl.length)
				{
					str += '${sl[i].pack}';
					if (i<sl.length-1)	str += '.';
				}
				str += ';\n';
			}

			// d:Definition<EnumFlag, ComplexType>
			case ETypedef(d):
			{

			}

			// path:TypePath
			case EUsing(path):
			{

			}

		}
		return str;
	}
}

class Main 
{

	static function getTypeDefList(parserResult : { decls : Array<TypeDecl> }) : List<TypeDef>
	{
		var result = '';
		for (decl in parserResult.decls)
		{
			result += TypeDefPrinter.toString(decl);
		}
		trace(result);
		return null;
	}

	public static function main()
	{
		var testStr = File.getContent('test/AACSound.hx');
		var parser = new HaxeParser(byte.ByteData.ofString(testStr), '');
		//trace(parser.parse());
		getTypeDefList(parser.parse());
	}

}
