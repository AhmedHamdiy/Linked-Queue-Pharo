# CTLinkedQueue
CTLinkedQueue is an implementation of a FIFO (First-In-First-Out) queue using a linked list.

A queue is a linear data structure where elements are added at the back and removed from the front. 
This linked list implementation ensures O(1) enqueue and dequeue operations by maintaining pointers to both the front and back of the queue. 
CTLinkedQueue uses instances of CTValueLink as nodes to store elements.

## Features
- Efficient Enqueue/Dequeue: Both operations run in constant time, O(1).

- FIFO Ordering: Maintains the order of insertion; first element enqueued is the first dequeued.

- Peek Operation: Allows viewing the front element without removing it.

- Dynamic Size: Grows as needed by linking nodes (using CTValueLink) rather than a fixed-size array.

## API Overview
### Instance Variables
- **front**: The first node in the queue.

- **back**: The last node in the queue.

- **size**: The number of elements currently in the queue.

### Methods
#### Initialization
- **initialize**

    - **Description**: Sets up an empty queue.

    - **Usage**: Automatically called when creating a new instance.

- **new: capacity**

(Optional variant for fixed-capacity implementations, if needed.)

#### Adding Elements
- **enqueue: anElement**

    - **Description**: Adds anElement to the back of the queue.

    - **Complexity**: O(1)

_Note_: Internally, the method wraps the element in a CTValueLink node.

#### Removing Elements
- **dequeue**

    - **Description**: Removes and returns the front element of the queue.

    - **Complexity**: O(1)

    - **Behavior**: Raises an error (or returns nil) if the queue is empty.

#### Accessing Elements
- **peek**

    - **Description**: Returns the front element without removing it.

    - **Complexity**: O(1)

    - **Behavior**: Raises an error (or returns nil) if the queue is empty.

- **asArray**

    - **Description**: Returns an array representation of the queue in FIFO order. Useful for debugging and inspection.

#### Status Check
- **isEmpty**

    - **Description**: Returns true if the queue has no elements.

- **size**

    - **Description**: Returns the number of elements in the queue.

## Usage Example

| queue |

"Create a new CTLinkedQueue instance"

queue := CTLinkedQueue new.

"Enqueue elements"

queue enqueue: 1.

queue enqueue: 2.

queue enqueue: 3.

"Dequeue the front element (should remove 1)"

queue dequeue.  "Returns 1"

"Peek at the next element (should return 2 without removal)"

queue peek.     "Returns 2"

"Check the state of the queue"

queue asArray.  "Should return an array #(2 3)"


## Testing

Ensure comprehensive tests are written using Pharo’s SUnit framework. Example test cases include:

**Initialization Test**: Verify that a newly created queue is empty.

**Enqueue Test**: Confirm that enqueue increases the size and that elements appear in FIFO order.

**Dequeue Test**: Check that dequeue returns the correct element and decreases the size.

**Peek Test**: Validate that peek returns the correct element without modifying the queue.

**Empty Queue Handling**: Ensure proper behavior (nil) when dequeue or peek is called on an empty queue.

Author
Ahmed Hamdy
Date: March 28, 2025
