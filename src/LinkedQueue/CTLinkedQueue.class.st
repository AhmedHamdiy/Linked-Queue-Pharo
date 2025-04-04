"
I am Linked Queue,a FIFO (First-In-First-Out) queue using a linked list.

I am a linear data structure where elements are added at the back and removed from the front. This linked list implementation ensures O(1) enqueue and dequeue operations by maintaining pointers to both the front and back of the queue.

API Overview

initialize
Description: Sets up an empty queue.
Usage: Automatically called when creating a new instance.

new: capacity
(Optional variant for fixed-capacity implementations, if needed.)

add: anElement
Description: Adds anElement to the back of the queue.
Complexity: O(1)

remove
Description: Removes and returns the front element of the queue.
Complexity: O(1)
Behavior: Raises an error (or returns nil) if the queue is empty.

peek
Description: Returns the front element without removing it.
Complexity: O(1)
Behavior: Raises an error (or returns nil) if the queue is empty.

asArray
Description: Returns an array representation of the queue in FIFO order. Useful for debugging and inspection.

isEmpty
Description: Returns true if the queue has no elements.

size
Description: Returns the number of elements in the queue.
"

Class {
	#name : #CTLinkedQueue,
	#superclass : #Object,
	#instVars : [
		'front', 'back', 'size'
	],
	#category : #'LinkedQueue'
}

{ #category : #'instance creation' }
CTLinkedQueue class >> new [
	^ super new initialize.
]

{ #category : #initialization }
CTLinkedQueue >> initialize [
	"Initialize an empty queue"
	size := 0.
]

{ #category : #adding }
CTLinkedQueue >> add: anElement [
	"Adds anElement to the back of the queue."
	| newNode |
	newNode := CTValueLink value: anElement.
	back ifNil: [
		front := newNode.
		back := newNode.
	] ifNotNil: [
		back nextLink: newNode.
		back := newNode.
	].
	size := size + 1.
]

{ #category : #adding }
CTLinkedQueue >> addAll: aCollection [
	"Adds all elements from aCollection to the back of the queue."
	aCollection do: [:each | self add: each].
]

{ #category : #printing }
CTLinkedQueue >> printOn: aStream [
	"Prints the queue elements in FIFO order."
	aStream nextPutAll: 'CTLinkedQueue('.
	front ifNil: [aStream nextPutAll: 'empty'] ifNotNil: [
		| currentNode |
		currentNode := front.
		[currentNode isNil] whileFalse: [
			currentNode value printOn: aStream.
			currentNode := currentNode nextLink.
			currentNode isNil ifFalse: [aStream nextPutAll: ', '].
		].
	].
	aStream nextPut: $).
]

{ #category : #removing }
CTLinkedQueue >> remove [
    "Removes and returns the front element of the queue, or nil if empty."
    
    | removedValue |
    self isEmpty ifTrue: [^ nil].
    removedValue := front value.
    front := front nextLink.
    
    (front isNil) ifTrue: [back := nil]. "Reset back if queue becomes empty"
    size := size - 1.
    
    ^ removedValue.

]

{ #category : #removing }
CTLinkedQueue >> clear [
	"Clears the queue."
	[
		front isNil
	] whileFalse: [
		| temp |
		temp := front.
		front := front nextLink.
		temp nextLink: nil.
		].
	front := nil.
	back := nil.
	size := 0.
]

{ #category : #accessing }
CTLinkedQueue >> peek [
	"Returns the front element without removing it. Raises an error if empty."
	^front value.
]

{ #category : #accessing }
CTLinkedQueue >> size [
	"Returns the number of elements in the queue."
	^size.
]

{ #category : #testing }
CTLinkedQueue >> isEmpty [
	"Returns true if the queue has no elements."
	^size = 0.
]

{ #category : #testing }
CTLinkedQueue >> includes: anElement [
	"Checks if the queue contains anElement."
	| currentNode |
	currentNode := front.
	[currentNode isNil] whileFalse: [
		(currentNode value = anElement) ifTrue: [^ true].
		currentNode := currentNode nextLink.
	].
	^ false.
]

{ #category : #enumerating }
CTLinkedQueue >> asArray [
	"Returns an array containing all elements in FIFO order."
	| elements currentNode |
	elements := OrderedCollection new.
	currentNode := front.
	[currentNode isNil] whileFalse: [
		elements add: currentNode value.
		currentNode := currentNode nextLink.
	].
	^elements asArray.
]
