"
Implementation of the Algorithm T in TAOCP by Donald Knuth, Volume 1 page 264.
"
Class {
	#name : #TopologicalSortAlgorithm,
	#superclass : #Object,
	#instVars : [
		'size',
		'relation'
	],
	#category : #'Containers-Links'
}

{ #category : #enumerating }
TopologicalSortAlgorithm >> handleCycleInValueLinksTable: table do: cycleBlock [

	| kk cycle qlink |
	"T9"
	qlink := Dictionary new.
	1 to: size do: [ :k | 
		| assoc p |
		assoc := table at: k.
		p := assoc value yourself: [ assoc value: 0 ].

		"T10"
		p do: [ :each | qlink at: each value put: k ] ].

	"T11"
	kk := qlink anyAssociation key.

	"T12"
	[ 
	(table at: kk) value: 1.
	kk := qlink at: kk.
	(table at: kk) value = 0 ] whileTrue.

	"T13"
	cycle := Array streamContents: [ :aStream | 
		         [ 
		         aStream nextPut: kk.
		         (table at: kk) value: 0.
		         kk := qlink at: kk.
		         (table at: kk) value = 1 ] whileTrue.
		         aStream nextPut: kk ].

	"Invoke the given block with the detected cycle."
	^ cycleBlock value:
		  (cycle overlappingPairsCollect: [ :a :b | b -> a ])
]

{ #category : #enumerating }
TopologicalSortAlgorithm >> initializeValueLinksTable: table [

	"T2: next relation."

	relation do: [ :anAssoc | 
		| j k |
		"Unpack `relation` such that `relation = (j -> k)` holds."
		j := anAssoc key.
		k := anAssoc value.

		"T3: Increase COUNT by one."
		(table at: k) in: [ :destAssoc | destAssoc key: destAssoc key + 1 ].

		"T3: record the relation."
		(table at: j) in: [ :sourceAssoc | "Operation (8)" 
			sourceAssoc value: k ~~> sourceAssoc value ] ]
]

{ #category : #enumerating }
TopologicalSortAlgorithm >> makeValueLinksTable [

	"COUNT: the number of direct predecessors of this object."

	"TOP: link to the beginning of the list of direct successors of this object."

	^ (1 to: size) collect: [ :k | 0 -> nil ]
]

{ #category : #accessing }
TopologicalSortAlgorithm >> relation: anObject [

	relation := anObject
]

{ #category : #enumerating }
TopologicalSortAlgorithm >> sinksOfValueLinksTable: table [

	^ (1 to: size)
		  foldr: [ :k :aValueLink | 
			  (table at: k)
				  ifSink: [ k ~~> aValueLink ]
				  otherwise: [ aValueLink ]
				  forTopologicalSortAlgorithm: self ]
		  init: nil
]

{ #category : #accessing }
TopologicalSortAlgorithm >> size: anObject [

	size := anObject
]

{ #category : #enumerating }
TopologicalSortAlgorithm >> sortOn: aStream sinksValueLink: qlink valueLinksTable: table [

	| f |
	f := qlink.
	[ f ] whileNotNil: [ 
		| aValueLink anIndex |
		"T5: output front of queue."
		anIndex := f value.
		aStream nextPut: anIndex.

		"T7: remove from queue."
		f := f nextLink.

		aValueLink := (table at: anIndex) in: [ :anAssoc | 
			              anAssoc value yourself: [ anAssoc value: nil ] ].

		"T6: erase relations."
		aValueLink do: [ :k | 
			| kIndex |
			kIndex := k value.
			(table at: kIndex)
				decrementCountIfZero: [ f := kIndex ~~> f ]
				forTopologicalSortAlgorithm: self ] ]
]

{ #category : #enumerating }
TopologicalSortAlgorithm >> value: aBlock onCycleDo: cycleBlock [

	| table sort qlink |
	table := self makeValueLinksTable.

	"T1: initialize. T4: scan for zeros."
	qlink := self
		         initializeValueLinksTable: table;
		         sinksOfValueLinksTable: table.

	sort := Array streamContents: [ :aStream | 
		        self
			        sortOn: aStream
			        sinksValueLink: qlink
			        valueLinksTable: table ].

	^ sort size < size
		  ifTrue: [ self handleCycleInValueLinksTable: table do: cycleBlock ]
		  ifFalse: [ aBlock value: sort ]
]
