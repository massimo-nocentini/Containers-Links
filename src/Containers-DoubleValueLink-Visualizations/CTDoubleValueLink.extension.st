Extension { #name : #CTDoubleValueLink }

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTDoubleValueLink >> asSlotsGroupKnownReferences: aSet recursiveReferences: links layoutBlock: lBlock shapes: shapes [
	| aGroup edges line pointsController |
	pointsController := RSBlockCPController new
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
					                    left := shapes first encompassingRectangle
						                            left - offset.
					                    Array
						                    with: f
						                    with: left @ f y
						                    with: left @ bottom
						                    with: t x @ bottom
						                    with: t ]
				                    ifFalse: [ Array with: f with: t ] ];
		                    yourself.
	line := RSPolyline new
		        border: (RSBorder new width: 1);
		        cornerRadii: 5;
		        markerEnd: RSArrowedLine new defaultHead asMarker;
		        controlPointsController: pointsController;
		        yourself.
	edges := (RSEdgeBuilder new: line)
		         color: Color gray;
		         toShapes: shapes;
		         fromShapes: (links
				          with: shapes
				          collect: [ :link :shape | 
					          shape shapeFromModel: link previousLink ]);
		         useAssociations:
			         (links collect: [ :r | r asReflexiveAssociation ]).
	aGroup := super
		          asSlotsGroupKnownReferences: aSet
		          recursiveReferences: links
		          layoutBlock: lBlock
		          shapes: shapes.
	^ aGroup
		  addAll: edges;
		  yourself
]

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTDoubleValueLink >> instVarsNamesOrderedCollection [
	"We choose the following order in which the `value` slot is 
	the rightmost because that allows us to compose better shapes 
	pointed by its reference."

	^ { 
		  #previousLink asReflexiveAssociation.
		  #nextLink asReflexiveAssociation.
		  #value asReflexiveAssociation }
]
