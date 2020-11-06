Class {
	#name : #CTDoubleValueLink,
	#superclass : #ValueLink,
	#instVars : [
		'previousLink'
	],
	#category : #'Containers-DoubleValueLink'
}

{ #category : #converting }
CTDoubleValueLink >> asSlotsGroupKnownReferences: aSet recursiveReferences: links layoutBlock: lBlock [
	| aGroup edges shapes |
	aGroup := super
		          asSlotsGroupKnownReferences: aSet
		          recursiveReferences: links
		          layoutBlock: lBlock.
	shapes := aGroup select: [ :aShape | 
		          aShape model class == self class ].
	edges := (RSEdgeBuilder new: (RSPolyline new
				           border: (RSBorder new width: 1);
				           cornerRadii: 5;
				           markerEnd: RSArrowedLine new defaultHead asMarker;
				           controlPointsController: (RSBlockCPController new
						            block: [ :edge | 
							            | f t ap |
							            ap := edge attachPoint.
							            f := ap startingPointOf: edge.
							            t := ap endingPointOf: edge.
							            edge to model == shapes last model
								            ifTrue: [ 
									            | bottom left offset |
									            offset := 10.
									            bottom := shapes last encompassingRectangle
										                      bottom + offset.
									            left := (shapes collect: [ :s | 
											                     s encompassingRectangle left ]) min
									                    - offset.
									            Array
										            with: f
										            with: left @ f y
										            with: left @ bottom
										            with: t x @ bottom
										            with: t ]
								            ifFalse: [ Array with: f with: t ] ];
						            yourself);
				           yourself))
		         color: Color gray;
		         toShapes: shapes;
		         fromShapes: (links
				          with: shapes
				          collect: [ :link :shape | 
				          shape shapeFromModel: link previousLink ]);
		         useAssociations:
		         (links collect: [ :r | r asReflexiveAssociation ]).
	^ aGroup
		  addAll: edges;
		  yourself
]

{ #category : #accessing }
CTDoubleValueLink >> previousLink [
	^ previousLink
]

{ #category : #accessing }
CTDoubleValueLink >> previousLink: anObject [
	previousLink := anObject
]
