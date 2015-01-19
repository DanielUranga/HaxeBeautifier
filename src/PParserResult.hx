
package ;

import haxeparser.Data;

typedef ParserResult = { pack : Array<String>, decls : Array<haxeparser.TypeDecl> };

abstract PParserResult(ParserResult) from ParserResult
{

	public function print(printer : Printer) : String
	{
		var result = '\n';
		for (decl in this.decls)
		{
			var decl : PTypeDecl = decl;
			result += decl.print(printer);
		}
		return result;
	}

}
