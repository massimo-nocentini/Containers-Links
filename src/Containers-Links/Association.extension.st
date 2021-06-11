Extension { #name : #Association }

{ #category : #'*Containers-Links' }
Association >> decrementCountIfZero: zBlock forTopologicalSortAlgorithm: aTSA [

	^ (key := key - 1) ifZero: zBlock
]

{ #category : #'*Containers-Links' }
Association >> ifSink: sBlock otherwise: oBlock forTopologicalSortAlgorithm: aTSA [

	^ key ifZero: sBlock ifNotZero: oBlock
]
