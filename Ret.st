Instruction subclass: Ret [

    Ret class >> value: anObject [
    ]

    | value |

    value: anobject [

	value := anObject
    ]

    value [

	^ value
    ]
]

