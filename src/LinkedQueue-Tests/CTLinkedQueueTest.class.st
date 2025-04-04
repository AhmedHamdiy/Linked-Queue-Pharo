TestCase subclass: #CTLinkedQueueTest
	instanceVariableNames: 'queue'
	classVariableNames: ''
	poolDictionaries: ''
	#category: #'LinkedQueue-Tests'.

{ #category : #setup }
CTLinkedQueueTest >> setUp [
	"Initialize a new queue before each test."
	queue := CTLinkedQueue new.
]

{ #category : #tests }
CTLinkedQueueTest >> testInitialize [
	"Test that a new queue is empty."
	self assert: queue isEmpty.
	self assert: queue size = 0.
]

{ #category : #tests }
CTLinkedQueueTest >> testAdd [
	"Test add operation."
	queue add: 1.
	queue add: 2.
	queue add: 3.
	self assert: queue isEmpty not.
	self assert: queue size = 3.
	self assert: (queue asArray = #(1 2 3)).
]

{ #category : #tests }
CTLinkedQueueTest >> testremove [
	"Test remove operation."
	queue add: 'a'.
	queue add: 'b'.
	queue add: 'c'.
	self assert: (queue remove = 'a').
	self assert: (queue remove = 'b').
	self assert: (queue remove = 'c').
	self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testPeek [
	"Test peek method."
	queue add: 100.
	queue add: 200.
	self assert: (queue peek = 100).
	self assert: queue size = 2.
]

{ #category : #tests }
CTLinkedQueueTest >> testremoveOnEmptyQueue [
	"Test that remove returns nil if the queue is empty."
	self assert: (queue remove isNil).
]

{ #category : #tests }
CTLinkedQueueTest >> testPeekOnEmptyQueue [
	"Test that peek return nil if it is an empty queue."
	self assert: (queue peek isNil).
]

{ #category : #tests }
CTLinkedQueueTest >> testFIFOBehavior [
	"Test that the queue follows FIFO order."
	queue add: 10.
	queue add: 20.
	queue add: 30.
	self assert: (queue remove = 10).
	self assert: (queue remove = 20).
	queue add: 40.
	self assert: (queue remove = 30).
	self assert: (queue remove = 40).
	self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testSizeAfterOperations [
    "Test that size updates correctly after adding and removing elements."
    queue add: 5.
    queue add: 6.
    queue add: 7.
    self assert: queue size = 3.
    queue remove.
    self assert: queue size = 2.
    queue remove.
    queue remove.
    self assert: queue size = 0.
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAndRemoveAlternating [
    "Test adding and removing elements alternately."
    queue add: 'x'.
    self assert: (queue remove = 'x').
    queue add: 'y'.
    queue add: 'z'.
    self assert: (queue remove = 'y').
    self assert: (queue remove = 'z').
    self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testClearQueue [
    "Test clearing the queue."
    queue add: 1.
    queue add: 2.
    queue add: 3.
    queue clear.
    self assert: queue isEmpty.
    self assert: queue size = 0.
    self assert: (queue remove isNil).
]

{ #category : #tests }
CTLinkedQueueTest >> testContains [
    "Test checking if the queue contains an element."
    queue add: 'apple'.
    queue add: 'banana'.
    queue add: 'cherry'.
    self assert: (queue contains: 'banana').
    self assert: (queue contains: 'apple').
    self deny: (queue contains: 'grape').
]

{ #category : #tests }
CTLinkedQueueTest >> testAsArrayAfterOperations [
    "Test that asArray correctly represents queue state."
    queue add: 42.
    queue add: 24.
    queue remove.
    self assert: (queue asArray = #(24)).
]

{ #category : #tests }
CTLinkedQueueTest >> testAddNil [
    "Test adding nil to the queue."
    queue add: nil.
    self assert: queue size = 1.
    self assert: (queue remove isNil).
    self assert: queue isEmpty.
]

""""""""""""""""


{ #category : #tests }
CTLinkedQueueTest >> testSizeAfterOperations [
    "Test that size updates correctly after adding and removing elements."
    queue add: 5.
    queue add: 6.
    queue add: 7.
    self assert: queue size = 3.
    queue remove.
    self assert: queue size = 2.
    queue remove.
    queue remove.
    self assert: queue size = 0.
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAndRemoveAlternating [
    "Test adding and removing elements alternately."
    queue add: 'x'.
    self assert: (queue remove = 'x').
    queue add: 'y'.
    queue add: 'z'.
    self assert: (queue remove = 'y').
    self assert: (queue remove = 'z').
    self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testClearQueue [
    "Test clearing the queue."
    queue add: 1.
    queue add: 2.
    queue add: 3.
    queue clear.
    self assert: queue isEmpty.
    self assert: queue size = 0.
    self assert: (queue remove isNil).
]

{ #category : #tests }
CTLinkedQueueTest >> testIncludes [
    "Test checking if the queue contains an element."
    queue add: 'apple'.
    queue add: 'banana'.
    queue add: 'cherry'.
    self assert: (queue includes: 'banana').
    self assert: (queue includes: 'apple').
    self deny: (queue includes: 'grape').
]

{ #category : #tests }
CTLinkedQueueTest >> testAsArrayAfterOperations [
    "Test that asArray correctly represents queue state."
    queue add: 42.
    queue add: 24.
    queue remove.
    self assert: (queue asArray = #(24)).
]

{ #category : #tests }
CTLinkedQueueTest >> testAddNil [
    "Test adding nil to the queue."
    queue add: nil.
    self assert: queue size = 1.
    self assert: (queue remove isNil).
    self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAll [
	"Test adding a collection to the queue."
	queue addAll: #(1 2 3).
	self assert: queue size = 3.
	self assert: (queue remove = 1).
	self assert: (queue remove = 2).
	self assert: (queue remove = 3).
	self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testPrintOn [
	"Test printing the queue."
	queue add: 1.
	queue add: 2.
	queue add: 3.
	self assert: (queue printString = 'CTLinkedQueue(1, 2, 3)').
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAllWithNil [
	"Test adding a collection with nil to the queue."
	queue addAll: #(1 nil 3).
	self assert: queue size = 3.
	self assert: (queue remove = 1).
	self assert: (queue remove isNil).
	self assert: (queue remove = 3).
	self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAllWithEmptyCollection [
	"Test adding an empty collection to the queue."
	queue addAll: #().
	self assert: queue size = 0.
	self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAllWithMixedTypes [
	"Test adding a collection with mixed types to the queue."
	queue addAll: #(1 'two' 3.0).
	self assert: queue size = 3.
	self assert: (queue remove = 1).
	self assert: (queue remove = 'two').
	self assert: (queue remove = 3.0).
	self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAllWithDuplicates [
	"Test adding a collection with duplicates to the queue."
	queue addAll: #(1 2 2 3).
	self assert: queue size = 4.
	self assert: (queue remove = 1).
	self assert: (queue remove = 2).
	self assert: (queue remove = 2).
	self assert: (queue remove = 3).
	self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAllWithNestedCollections [
	"Test adding a collection with nested collections to the queue."
	queue addAll: #(1 #(2 3) 4).
	self assert: queue size = 3.
	self assert: (queue remove = 1).
	self assert: (queue remove = #(2 3)).
	self assert: (queue remove = 4).
	self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAllWithNonCollection [
	"Test adding a non-collection to the queue."
	queue addAll: 5.
	self assert: queue size = 1.
	self assert: (queue remove = 5).
	self assert: queue isEmpty.
]

{ #category : #tests }
CTLinkedQueueTest >> testAddAllWithNilElement [
	"Test adding a collection with nil element to the queue."
	queue addAll: #(1 nil 3).
	self assert: queue size = 3.
	self assert: (queue remove = 1).
	self assert: (queue remove isNil).
	self assert: (queue remove = 3).
	self assert: queue isEmpty.
]