SmallInteger extend [

    bitRShift: anInteger [

	^ self bitShift: anInteger negated
    ]

    accept: aVisitor [

	^ aVisitor visitInteger: self
    ]
]

Symbol extend [

    accept: aVisitor [

	^ aVisitor visitVariable: self
    ]
]

