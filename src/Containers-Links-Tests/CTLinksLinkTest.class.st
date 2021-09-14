Class {
	#name : #CTLinksLinkTest,
	#superclass : #TestCase,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'Containers-Links-Tests'
}

{ #category : #tests }
CTLinksLinkTest >> testEmptyLink [

	| l |
	l := Link new.

	^ self exportSlotsGraphOf: l
]

{ #category : #tests }
CTLinksLinkTest >> testLinkNext3 [

	| l1 l2 l3 l |
	l1 := Link new.
	l2 := Link new.
	l3 := Link new.

	l1 next: l2.
	l2 next: l3.
	l3 next: l1.

	l := l1 next: 3.

	self assert: l nextLink nextLink nextLink equals: nil.

	^ self exportSlotsGraphOf: l
]

{ #category : #tests }
CTLinksLinkTest >> testLinkReferencingAnotherLink [

	| l1 l2 |
	l1 := Link new.
	l2 := Link new.

	l1 next: l2.

	^ self exportSlotsGraphOf: l1
]

{ #category : #tests }
CTLinksLinkTest >> testLinkReferencingItself [

	| l |
	l := Link new.
	
	l next: l.

	^ self exportSlotsGraphOf: l
]

{ #category : #tests }
CTLinksLinkTest >> testThreeLinksReferencingEachOther [

	| l1 l2 l3 |
	l1 := Link new.
	l2 := Link new.
	l3 := Link new.
	
	l1 next: l2.
	l2 next: l3.
	l3 next: l1.

	^ self exportSlotsGraphOf: l1
]

{ #category : #tests }
CTLinksLinkTest >> testThreeLinksTooMuchSkipping [

	| l1 l2 l3 |
	l1 := Link new.
	l2 := Link new.
	l3 := Link new.

	l1 next: l2.
	l2 next: l3.

	^ self shouldnt: [ l1 next: 10 ] raise: SubscriptOutOfBounds
]
