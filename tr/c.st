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
	    nl
    ]

    visitVariableDeclaration: aVariable [

        stream
            nextPutAll: aVariable name, ' ', aVariable type name;
            nl
    ]

    visitMov: aMov [

        aMov printOn: stream
    ]

    visitAdd: anAdd [

        anAdd printOn: stream
    ]

    visitSub: aSub [

        aSub printOn: stream
    ]

    visitMul: aMul [

        aMul printOn: stream
    ]

    visitDiv: aDiv [

        aDiv printOn: stream
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

