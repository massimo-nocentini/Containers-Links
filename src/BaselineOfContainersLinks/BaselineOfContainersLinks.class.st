Class {
	#name : #BaselineOfContainersLinks,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersLinks
}

{ #category : #baselines }
BaselineOfContainersLinks >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'ContainersEssentials'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Essentials' ].

		spec
			package: 'Containers-Links';
			package: 'Containers-Links-Tests';
			package: 'Containers-DoubleValueLink';
			package: 'Containers-DoubleValueLink-Visualizations' ]
]
