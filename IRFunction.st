Instruction subclass: IRFunction [

    IRFunction class >> function: aSymbol return: aType [

	^ self function: aSymbol parameters: #() return: aType
    ]

    IRFunction class >> function: aSymbol parameters: anArray return: aType [

	^ self new
	    function: aSymbol parameters: anArray return: aType;
	    yourself
    ]

    IRFunction class >> new [

        ^ self basicNew
                initialize;
                yourself
    ]

    | args return name instructions variables |

    initialize [

        variables := Dictionary new.
        instructions := OrderedCollection new
    ]

    function: aSymbol return: aType [

        self function: aSymbol parameters: #() return: aType
    ]

    function: aSymbol parameters: anArray return: aType [

	| keywords |
        name := aSymbol.
        args := OrderedCollection new.
        return := aType.
	keywords := name keywords.
	anArray do: [ :each |
	    args addLast: (Variable named: each key type: each value) ]
    ]

    name [

	^ name
    ]

    arguments [

	^ args
    ]

    argumentAt: anInteger [

        ^ self arguments at: anInteger
    ]

    argumentDo: aOneArgBlock [

        ^ self arguments do: aOneArgBlock
    ]

    return [

	^ return
    ]

    variables [

	^ variables keys
    ]

    variable: aSymbol type: aType [

        variables at: aSymbol ifPresent: [ self error: 'Register ', aSymbol, ' is already in' ].
        variables at: aSymbol put: (Variable named: aSymbol type: aType)
    ]

    variableAt: aSymbol [

        ^ self variableAt: aSymbol ifAbsent: [ self ]
    ]

    variableAt: aSymbol ifAbsent: aBlock [

        ^ variables at: aSymbol ifAbsent: aBlock
    ]

    variablesDo: aOneArgBlock [

	^ variables do: aOneArgBlock
    ]

    instructions [

	^ instructions
    ]

    addInstruction: anInstruction [

	self instructions add: anInstruction
    ]

    instructionsDo: aOneArgBlock [

        self instructions do: aOneArgBlock
    ]

    accept: aVisitor [

        aVisitor visitFunction: self
    ]
]

