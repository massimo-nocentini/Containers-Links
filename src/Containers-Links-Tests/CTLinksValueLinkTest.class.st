Class {
	#name : #CTLinksValueLinkTest,
	#superclass : #TestCase,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'Containers-Links-Tests'
}

{ #category : #utilities }
CTLinksValueLinkTest >> imagesPath [

	^ self iceWorkingDirectory / 'images'
]

{ #category : #tests }
CTLinksValueLinkTest >> test11ValueLinksLoop [

	| l |
	l := 1 ~~> nil.
	l nextLink: l.

	^ self exportSlotsGraphOf: l
]

{ #category : #tests }
CTLinksValueLinkTest >> test21ValueLinks [

	| l |
	l := 2 ~~> self testSimpleValueLink.

	^ self exportSlotsGraphOf: l
]

{ #category : #tests }
CTLinksValueLinkTest >> test321ValueLinks [

	| l |
	l := 3 ~~> self test21ValueLinks.

	^ self exportSlotsGraphOf: l
]

{ #category : #tests }
CTLinksValueLinkTest >> test43214ValueLinks [

	| l1 l |
	l1 := 1 ~~> nil.
	l := 4 ~~> (3 ~~> (2 ~~> l1)).
	l1 nextLink: l.

	^ self exportSlotsGraphOf: l
]

{ #category : #tests }
CTLinksValueLinkTest >> test4321ValueLinks [

	| l |
	l := 4 ~~> self test321ValueLinks.

	^ self exportSlotsGraphOf: l
]

{ #category : #tests }
CTLinksValueLinkTest >> testAsLinkedList [

	^ self exportSlotsGraphOf: self testSimpleValueLink asLinkedList
]

{ #category : #tests }
CTLinksValueLinkTest >> testAsLinkedList4321 [

	^ self exportSlotsGraphOf: self test4321ValueLinks asLinkedList
]

{ #category : #tests }
CTLinksValueLinkTest >> testAsLinkedListFromInterval [

	^ self exportSlotsGraphOf: ((4 to: 1 by: -1) as: LinkedList)
]

{ #category : #tests }
CTLinksValueLinkTest >> testAsValueLink [

	^ self exportSlotsGraphOf: (4 to: 1 by: -1) asValueLink
]

{ #category : #tests }
CTLinksValueLinkTest >> testAsValueLinkInjectInto [

	| l |
	l := (4 to: 1 by: -1)
		     inject: nil
		     into: [ :aValueLink :each | each ~~> aValueLink ].
	^ self exportSlotsGraphOf: l
]

{ #category : #tests }
CTLinksValueLinkTest >> testNilAsLinkedList [

	^ self exportSlotsGraphOf: nil asLinkedList
]

{ #category : #tests }
CTLinksValueLinkTest >> testSimpleValueLink [

	| l |
	l := 1 ~~> nil.

	^ self exportSlotsGraphOf: l
]
