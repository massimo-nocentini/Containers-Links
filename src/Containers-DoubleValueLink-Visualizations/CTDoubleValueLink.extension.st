Extension { #name : #CTDoubleValueLink }

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTDoubleValueLink >> asSlotsGroupKnownReferences: aSet recursiveReferences: links layoutBlock: lBlock shapes: shapes [
	| aGroup edges line pointsController |
	pointsController := self 
		                    loopingForwardControlPointsControllerOverShapes:
		                    shapes.
	line := self lineShapeWithControlPointsController: pointsController.
	edges := self
		         edgesConnectingShapes: shapes
		         references: links
		         lineShape: line
		         modelBlock: [ :link | link previousLink ].
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

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTDoubleValueLink >> loopingForwardControlPointsControllerOverShapes: shapes [
	^ RSBlockCPController new
		  block: [ :edge | 
			  | f t ap |
			  ap := edge attachPoint.
			  f := ap startingPointOf: edge.
			  t := ap endingPointOf: edge.
			  edge to model == shapes last model
				  ifTrue: [ 
					  | bottom left offset |
					  offset := 10.
					  bottom := shapes last encompassingRectangle bottom + offset.
					  left := shapes first encompassingRectangle left - offset.
					  Array
						  with: f
						  with: left @ f y
						  with: left @ bottom
						  with: t x @ bottom
						  with: t ]
				  ifFalse: [ Array with: f with: t ] ];
		  yourself
]
