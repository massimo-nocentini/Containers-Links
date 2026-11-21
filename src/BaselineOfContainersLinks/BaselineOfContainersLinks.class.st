Class {
	#name : #BaselineOfContainersLinks,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersLinks
}

{ #category : #baselines }
BaselineOfContainersLinks >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'ContainersEssentials'
			with: [ spec repository: 'github://massimo-nocentini/Containers-Essentials:master' ].

		"Packages"
		spec
			package: 'Containers-Links'
			with: [ spec requires: #( 'ContainersEssentials' ) ];
			package: 'Containers-Links-Tests'
			with: [ spec requires: #( 'Containers-Links' ) ];
			package: 'Containers-DoubleValueLink'
			with: [ spec requires: #( 'Containers-Links' ) ];
			package: 'Containers-DoubleValueLink-Visualizations'
			with: [ spec requires: #( 'Containers-DoubleValueLink' ) ] ]
]
