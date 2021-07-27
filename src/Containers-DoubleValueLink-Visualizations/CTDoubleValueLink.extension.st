Extension { #name : #CTDoubleValueLink }

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTDoubleValueLink >> acceptSlotDescriptorsVisitor: aVisitor [

	^ aVisitor visitCTDoubleValueLink: self
]
