"
I am a variant that customizes the way we look at ValueLink objects, by nesting the #nextLink slot recursively.
"
Class {
	#name : #CTSlotDescriptorsVisitorNestedLinks,
	#superclass : #CTSlotDescriptorsVisitor,
	#category : #'Containers-Links'
}

{ #category : #visiting }
CTSlotDescriptorsVisitorNestedLinks >> visitLink: aLink [

	^ { ((self
		    newSlotDescriptor: #nextLink
		    fullAccessor: [ aLink nextLink ])
		   inline;
		   quote: [ :anObj :nextLink :aDfsWalker | 
			   nextLink asShapeSlotsDfsTree: aDfsWalker ]) }
]
