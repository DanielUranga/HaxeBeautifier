
package ;

import haxeparser.Data;

abstract PTypeDecl(TypeDecl) from TypeDecl
{

	public function print(printer : Printer) : String {
		var str = '';
		switch (this.decl) {
			// d:Definition<ClassFlag, Array<Field>>
			case EClass(d): {
				str += '\n';
				str += 'class ${d.name} {\n';
				for (field in d.data) {
					str += printer.printField(field);
					str += switch(field.kind) {
						case FVar(t, eo):				';';
						case FProp(get, set, t, eo): 	';';
						case FFun(func): 				'';
					}
					str += '\n';
				}
				str += '}';
			}

			// d:Definition<EnumFlag, Array<EnumConstructor>>
			case EEnum(d): {

			}

			// a:Definition<AbstractFlag, Array<Field>>
			case EAbstract(a): {

			}

			// sl:Array<{pack:String, pos:Position}>, mode:ImportMode
			case EImport(sl, mode): {
				str += 'import ';
				for (i in 0...sl.length) {
					str += '${sl[i].pack}';
					if (i<sl.length-1)	str += '.';
				}
				str += ';\n';
			}

			// d:Definition<EnumFlag, ComplexType>
			case ETypedef(d): {

			}

			// path:TypePath
			case EUsing(path): {

			}

		}
		return str;
	}

}
