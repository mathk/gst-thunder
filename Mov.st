Instruction subclass: Mov [

    Mov class >> from: aSrcObject to: aSymbol [

	^ self new
		source: aSrcObject destination: aSymbol;
		yourself
    ]

    | src dest |

    source: anObject destination: aSymbol [

	src := anObject.
	dest := aSymbol
    ]

    source [
    
	^ src
    ]

    destination [

	^ dest
    ]

    check [

	" check if source is initialized "
	self register: dest ifAbsent: [ self error: 'Register ', dest, ' is not present' ].
	self register: src ifAbsent: [ anObject isNumber ifFalse: [ self error: 'Cannot accept ', anObject ] ].
    ]

    accept: aVisitor [

        aVisitor visitMov: self
    ]

    printOn: aStream [

	aStream
	    nextPutAll: 'mov '.
	src printOn: aStream.
	aStream
	    nextPutAll: ' to '.
	dest printOn: aStream
    ]
]

