Object subclass: IRVisitor [

    IRVisitor class >> on: aProgram [

	^ self new
	    visitProgram: aProgram;
	    yourself
    ]

    visitProgram: aProgram [

	aProgram accept: self
    ]

    visitFunction: aFunction [

        aFunction variablesDo: [ :each |
            each accept: self ].
        aFunction instructionsDo: [ :each |
            each accept: self ]
    ]

    visitInteger: anInteger [
    ]

    visitVariableDeclaration: aVariable [
    ]

    visitVariable: aVariable [
    ]

    visitMov: aMov [

	aMov source accept: self.
	aMov destination accept: self
    ]   

    visitAdd: anAdd [

	anAdd source accept: self.
	anAdd param accept: self.
	anAdd destination accept: self
    ]

    visitSub: aSub [

	aSub source accept: self.
	aSub param accept: self.
	aSub destination accept: self
    ]

    visitMul: aMul [

	aMul source accept: self.
	aMul param accept: self.
	aMul destination accept: self
    ]

    visitDiv: aDiv [

	aDiv source accept: self.
	aDiv param accept: self.
	aDiv destination accept: self
    ]

    visitMod: aMod [

	aMod source accept: self.
	aMod param accept: self.
	aMod destination accept: self
    ]

    visitAnd: anAnd [

	anAnd source accept: self.
	anAnd param accept: self.
	anAnd destination accept: self
    ]

    visitOr: anOr [

	anOr source accept: self.
	anOr param accept: self.
	anOr destination accept: self
    ]

    visitXor: aXor [

	aXor source accept: self.
	aXor param accept: self.
	aXor destination accept: self
    ]

    visitLsh: aLsh [

	aLsh source accept: self.
	aLsh param accept: self.
	aLsh destination accept: self
    ]

    visitRsh: aRsh [

	aRsh source accept: self.
	aRsh param accept: self.
	aRsh destination accept: self
    ]

    visitLoad: aLoad [

	aLoad type accept: self.
	aLoad source accept: self.
	aLoad destination accept: self
    ]

    visitStore: aStore [

        aStore type accept: self.
        aStore value accept: self.
        aStore destination accept: self
    ]
]

