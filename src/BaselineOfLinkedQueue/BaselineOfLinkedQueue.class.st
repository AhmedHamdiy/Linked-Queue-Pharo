"
I am a baseline
"
Class {
	#name : #BaselineOfLinkedQueue,
	#superclass : #BaselineOf,
	#category : #BaselineOfLinkedQueue
}

{ #category : #baselines }
BaselineOfLinkedQueue >> baseline: spec [
	<baseline>

	spec for: #pharo do: [		
		spec package: 'LinkedQueue'.
		spec package: 'LinkedQueue-Tests' with: [ spec requires: #('LinkedQueue')] 
	]
]
