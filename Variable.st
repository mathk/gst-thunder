Instruction subclass: Variable [

    Variable class >> named: aSymbol type: aType [
	<category: 'instance creation'>

	^ self new
	    name: aSymbol;
	    type: aType;
	    yourself
    ]

    | name type |

    name: aSymbol [
	<category: 'accessing'>
    
	name := aSymbol
    ]

    name [
	<category: 'accessing'>

	^ name
    ]

    type: aType [
	<category: 'accessing'>

	type := aType
    ]

    type [
	<category: 'accessing'>

	^ type
    ]

    accept: aVisitor [
	<category: 'visitor'>

	aVisitor visitVariableDeclaration: self
    ]

    printOn: aStream [

	aStream 
	    nextPutAll: name;
	    cr
    ]
]

