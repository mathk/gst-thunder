IRVisitor subclass: CTranslator [

    CTranslator class >> on: aProgram [

        ^ self new
            initialize;
            visitProgram: aProgram;
            yourself
    ]

    | stream |

    initialize [

        stream := WriteStream on: String new
    ]

    stream [

        ^ stream
    ]

    visitProgram: aProgram [

        aProgram accept: self
    ]

    visitFunction: aFunction [

        | keywords |
	stream nextPutAll: aFunction return cname, ' '.
        keywords := aFunction name keywords.
        keywords size = 1 ifTrue: [ ^ stream
                                        nextPutAll: keywords first, '( void ) ';
                                        nl ].
	keywords do: [ :each | stream nextPutAll: (each copyFrom: 1 to: each size - 1) ].
	stream nextPutAll: ' ('.
        1 to: keywords size do: [ :i |
            stream
                nextPutAll: (aFunction argumentAt: i) type cname, ' ', (aFunction argumentAt: i) name.
            i = keywords size ifFalse: [ stream nextPutAll: ', ' ] ].
	stream 
	    nextPutAll: ')';
	    nl;
	    nextPutAll: '{';
	    nl.
	super visitFunction: aFunction.
	stream 
	    nextPutAll: '}';
	    nl
    ]

    visitVariableDeclaration: aVariable [

        stream
            nextPutAll: aVariable type cname, ' ', aVariable name, ';';
            nl
    ]

    visitInteger: anInteger [

	stream nextPutAll: anInteger asString
    ]

    visitVariable: aVariable [

	stream nextPutAll: aVariable
    ]

    visitMov: aMov [

	stream
	    nextPutAll: aMov destination;
	    nextPutAll: ' = '.
	aMov source accept: self.
	stream
	    nextPutAll: ';';
	    nl
    ]

    visitAdd: anAdd [

        stream
            nextPutAll: anAdd destination;
            nextPutAll: ' = '.
        anAdd source accept: self.
        stream nextPutAll: ' + '.
        anAdd param accept: self.
        stream
            nextPutAll: ';';
            nl
    ]

    visitSub: aSub [

        stream
            nextPutAll: aSub destination;
            nextPutAll: ' = '.
        aSub source accept: self.
        stream nextPutAll: ' - '.
        aSub param accept: self.
        stream
            nextPutAll: ';';
            nl
    ]

    visitMul: aMul [

        stream
            nextPutAll: aMul destination;
            nextPutAll: ' = '.
        aMul source accept: self.
        stream nextPutAll: ' * '.
        aMul param accept: self.
        stream
            nextPutAll: ';';
            nl
    ]

    visitDiv: aDiv [

        stream
            nextPutAll: aDiv destination;
            nextPutAll: ' = '.
        aDiv source accept: self.
        stream nextPutAll: ' / '.
        aDiv param accept: self.
        stream
            nextPutAll: ';';
            nl
    ]

    visitMod: aMod [

        aMod printOn: stream
    ]

    visitAnd: anAnd [

        anAnd printOn: stream
    ]

    visitOr: anOr [

        anOr printOn: stream
    ]

    visitXor: aXor [

        aXor printOn: stream
    ]

    visitLsh: aLsh [

        aLsh printOn: stream
    ]

    visitRsh: aRsh [

        aRsh printOn: stream
    ]

    visitLoad: aLoad [

        aLoad printOn: stream
    ]

    visitStore: aStore [

        aStore printOn: stream
    ]
]

