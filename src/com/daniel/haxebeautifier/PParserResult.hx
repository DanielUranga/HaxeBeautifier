package com.daniel.haxebeautifier;

import haxeparser.Data;
using Lambda;

typedef ParserResult = { pack : Array<String>, decls : Array<haxeparser.TypeDecl> };

abstract PParserResult(ParserResult) from ParserResult
{

	public function print(printer : Printer) : String
	{
		var result = '\npackage ' + this.pack.map(function(v) {return v;}).join(".") + ';\n\n';
		for (decl in this.decls)
		{
			var decl : PTypeDecl = decl;
			result += decl.print(printer);
		}
		return result;
	}

}
