Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTDoubleValueLink: aValueLink [

	^ { (self newSlotDescriptor
		   selector: #previousLink;
		   yourself) } , (self visitValueLink: aValueLink)
]
