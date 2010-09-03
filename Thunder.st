Object subclass: Thunder [

    | function |

    function [

	^ function
    ]

    function: aSymbol return: aType [

	function := IRFunction function: aSymbol return: aType
    ]

    function: aSymbol parameters: anArray return: aType [

	function := IRFunction function: aSymbol parameters: anArray return: aType
    ]

    variable: aSymbol type: aType [

	function variable: aSymbol type: aType
    ]

    addInstruction: anInstruction [

	function addInstruction: anInstruction
    ]

    mov: anObject to: aSymbol [

	self addInstruction: (Mov from: anObject to: aSymbol)
    ]

    add: anObject and: anObject2 to: aSymbol [

	self addInstruction: (Add add: anObject and: anObject2 to: aSymbol)
    ]

    sub: anObject minus: anObject2 to: aSymbol [

	self addInstruction: (Sub sub: anObject minus: anObject2 to: aSymbol)
    ]

    mul: anObject by: anObject2 to: aSymbol [

	self addInstruction: (Mul mul: anObject by: anObject2 to: aSymbol)
    ]

    div: anObject by: anObject2 to: aSymbol [

	self addInstruction: (Div div: anObject by: anObject2 to: aSymbol)
    ]

    mod: anObject with: anObject2 to: aSymbol [

	self addInstruction: (Mod mod: anObject with: anObject2 to: aSymbol)
    ]

    and: anObject with: anObject2 to: aSymbol [

	self addInstruction: (And and: anObject with: anObject2 to: aSymbol)
    ]

    or: anObject with: anObject2 to: aSymbol [

        self addInstruction: (Or or: anObject with: anObject2 to: aSymbol)
    ]

    xor: anObject with: anObject2 to: aSymbol [

        self addInstruction: (Xor xor: anObject with: anObject2 to: aSymbol)
    ]

    lsh: anObject with: anObject2 to: aSymbol [
    
        self addInstruction: (Lsh lsh: anObject with: anObject2 to: aSymbol)
    ]

    rsh: anObject with: anObject2 to: aSymbol [
    
        self addInstruction: (Rsh rsh: anObject with: anObject2 to: aSymbol)
    ]

    load: aType from: anObject to: aSymbol [

        self addInstruction: (Load load: aType from: anObject to: aSymbol)
    ]

    store: aType value: anObject to: anObject2 [

        self addInstruction: (Store store: aType value: anObject to: anObject2)
    ]

    alloca: aType [

        self addInstruction: (Alloca type: aType)
    ]

    alloca: aType number: anObject [

        self addInstruction: (Alloca type: aType number: anObject)
    ]

    alloca: aType align: anObject [

        self addInstruction: (Alloca type: aType align: anObject)
    ]

    alloca: aType number: anObject align: anObject2 [

        self addInstruction: (Alloca type: aType number: anObject align: anObject2)
    ]

    cCall: aSymbol with: anArray [
    ]

    call: aSymbol with: anArray [
    ]

    ret [

	self addInstruction: (Ret new) 
    ]
]

