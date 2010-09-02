Object subclass: Thunder [

    Thunder class >> new [

	^ self basicNew
		initialize;
		yourself
    ]

    | instructions variables |

    initialize [

	variables := Dictionary new.
	instructions := OrderedCollection new
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

    variables [
	^ variables keys    
    ]

    instructions [

	^ instructions
    ]

    instructionsDo: aOneArgBlock [

	self instructions do: aOneArgBlock
    ]

    mov: anObject to: aSymbol [

	instructions add: (Mov from: anObject to: aSymbol)
    ]

    add: anObject and: anObject2 to: aSymbol [

	instructions add: (Add add: anObject and: anObject2 to: aSymbol)
    ]

    sub: anObject minus: anObject2 to: aSymbol [

	instructions add: (Sub sub: anObject minus: anObject2 to: aSymbol)
    ]

    mul: anObject by: anObject2 to: aSymbol [

	instructions add: (Mul mul: anObject by: anObject2 to: aSymbol)
    ]

    div: anObject by: anObject2 to: aSymbol [

	instructions add: (Div div: anObject by: anObject2 to: aSymbol)
    ]

    mod: anObject with: anObject2 to: aSymbol [

	instructions add: (Mod mod: anObject with: anObject2 to: aSymbol)
    ]

    and: anObject with: anObject2 to: aSymbol [

	instructions add: (And and: anObject with: anObject2 to: aSymbol)
    ]

    or: anObject with: anObject2 to: aSymbol [

        instructions add: (Or or: anObject with: anObject2 to: aSymbol)
    ]

    xor: anObject with: anObject2 to: aSymbol [

        instructions add: (Xor xor: anObject with: anObject2 to: aSymbol)
    ]

    lsh: anObject with: anObject2 to: aSymbol [
    
        instructions add: (Lsh lsh: anObject with: anObject2 to: aSymbol)
    ]

    rsh: anObject with: anObject2 to: aSymbol [
    
        instructions add: (Rsh rsh: anObject with: anObject2 to: aSymbol)
    ]

    load: aType from: anObject to: aSymbol [

        instructions add: (Load load: aType from: anObject to: aSymbol)
    ]

    store: aType value: anObject to: anObject2 [

        instructions add: (Store store: aType value: anObject to: anObject2)
    ]

    alloca: aType [
    ]

    alloca: aType number: anInteger [
    ]

    alloca: aType align: anInteger [
    ]

    alloca: aType number: anInteger align: anInteger2 [
    ]

    cCall: aSymbol with: anArray [
    ]

    call: aSymbol with: anArray [
    ]

    ret [

	instructions add: (Ret new) 
    ]

    accept: aVisitor [

	variables do: [ :each |
	    each accept: aVisitor ].
	instructions do: [ :each |
	    each accept: aVisitor ]
    ]
]

