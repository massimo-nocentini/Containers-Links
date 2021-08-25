Extension { #name : #SlotDescriptorsVisitor }

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
SlotDescriptorsVisitor >> visitCTDoubleValueLink: aValueLink [

	^ { #previousLink asSlotDescriptor }
	  , (self visitValueLink: aValueLink)
]
