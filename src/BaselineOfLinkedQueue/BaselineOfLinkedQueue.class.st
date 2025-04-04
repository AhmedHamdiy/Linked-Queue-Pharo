"
I am a baseline
"
Class {
	#name : #BaselineOfContainersLinkedQueue,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersLinkedQueue
}

{ #category : #baselines }
BaselineOfContainersLinkedQueue >> baseline: spec [

	<baseline>

	spec for: #pharo do: [		
		spec package: 'Containers-Linked-Queue'.
		spec package: 'Containers-Linked-Queue-Tests' with: [ spec requires: #('Containers-Linked-Queue')] 
	]
]
