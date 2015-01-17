
package ;

import haxeparser.Data;

abstract PTypeDecl(TypeDecl) from TypeDecl
{

	public function print() : String
	{
		var str = '';
		switch (this.decl)
		{
			// d:Definition<ClassFlag, Array<Field>>
			case EClass(d):
			{
				str += '\n';
				str += 'class ${d.name} {\n';
				for (data in d.data)
				{
					var field : PField = data;
					str += field.print();
				}
				str += '}';
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
