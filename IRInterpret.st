IRVisitor subclass: IRInterpret [

    IRInterpret class >> on: aProgram with: anArray [

        ^ self new
	    argumentsValue: anArray;
            visitProgram: aProgram;
            yourself
    ]

    IRInterpret class >> new [
	<category: 'instance creation'>

	^ self basicNew
		    initialize;
		    yourself
    ]

    | argsValue memory variables |

    initialize [

	memory := Array new: 1000000.
	variables := Dictionary new
    ]

    argumentsValue: anArray [

	argsValue := anArray
    ]

    visitFunction: aFunction [

	| i |
	i := 0.
	aFunction argumentDo: [ :each |
	    i := i + 1.
	    variables at: each name put: (argsValue at: i) ].
	super visitFunction: aFunction
    ]

    variableValue: aSymbol [

	^ variables at: aSymbol
    ]

    visitVariableDeclaration: aVariable [

	variables at: aVariable name put: nil
    ]

    visitInteger: anInteger [

	^ anInteger
    ]

    visitVariable: aSymbol [

	^ self variableValue: aSymbol
    ]

    visitMov: aMov [

	| i |
	i := aMov source accept: self.
	variables at: aMov destination put: i
    ]

    do: aSymbol on: anIRCommand [

        | i j |
        i := anIRCommand source accept: self.
        j := anIRCommand param accept: self.
        variables at: anIRCommand destination put: (i perform: aSymbol with: j)
    ]

    visitAdd: anAdd [

	self do: #+ on: anAdd
    ]

    visitSub: aSub [

	self do: #- on: aSub
    ]

    visitMul: aMul [

	self do: #* on: aMul
    ]

    visitDiv: aDiv [

	self do: #// on: aDiv
    ]

    visitMod: aMod [

	self do: #\\ on: aMod
    ]

    visitAnd: anAnd [

	self do: #bitAnd: on: anAnd
    ]

    visitOr: anOr [

	self do: #bitOr: on: anOr
    ]

    visitXor: aXor [

	self do: #bitXor: on: aXor
    ]

    visitLsh: aLsh [

	self do: #bitShift: on: aLsh
    ]

    visitRsh: aRsh [

	self do: #bitRShift: on: aRsh
    ]

    visitLoad: aLoad [

	variables 
		at: aLoad destination 
		put: (aLoad readFrom: memory at: (aLoad source accept: self))
    ]

    visitStore: aStore [

        (aStore writeFrom: memory at: (aStore destination accept: self) put: (aStore value accept: self))
    ]
]

