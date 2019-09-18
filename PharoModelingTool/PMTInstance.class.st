"
I am the template instance for the PMT.
"
Class {
	#name : #PMTInstance,
	#superclass : #Object,
	#instVars : [
		'outbox',
		'inbox',
		'model',
		'connectedActors'
	],
	#category : #'PharoModelingTool-Model'
}

{ #category : #accessing }
PMTInstance >> connectedActors [
	^ connectedActors
]

{ #category : #accessing }
PMTInstance >> connectedActors: anObject [
	connectedActors := anObject
]

{ #category : #initialization }
PMTInstance >> createActor [
	<gtExample>
	| className actor |
	className := 'ActorUNO'.
	"PMTMessage
		subclass: className
		instanceVariableNames: ''
		classVariableNames: ''
		package: self packageName,'-Message'."
	PMTInstance duplicateClassWithNewName: className.
	"TODO: move to the right package."
	actor := className asClass new.
	self connectedActors add: actor.
	self inform: 'Message: ' , className , ' has been created.'
]

{ #category : #initialization }
PMTInstance >> createMessage [
	<gtExample>
	| className message |
	className := 'MessageUNO'.
	"PMTMessage
		subclass: className
		instanceVariableNames: ''
		classVariableNames: ''
		package: self packageName,'-Message'."
	PMTMessage duplicateClassWithNewName: className.
	"TODO: move to the right package."
	message := className asClass new.
	self outbox add: message.
	self inform: 'Message: ' , className , ' has been created.'
]

{ #category : #accessing }
PMTInstance >> inbox [
	^ inbox
]

{ #category : #accessing }
PMTInstance >> inbox: anObject [
	inbox := anObject
]

{ #category : #initialization }
PMTInstance >> initialize [
	outbox := OrderedCollection new.
	inbox := OrderedCollection new.
	connectedActors := OrderedCollection new.
	self inform: 'ZERO'
]

{ #category : #accessing }
PMTInstance >> model [
	^ model
]

{ #category : #accessing }
PMTInstance >> model: anObject [
	model := anObject
]

{ #category : #accessing }
PMTInstance >> outbox [
	^ outbox
]

{ #category : #accessing }
PMTInstance >> outbox: anObject [
	outbox := anObject
]

{ #category : #initialization }
PMTInstance >> receive [
	self inform: 'Message received.'
]

{ #category : #initialization }
PMTInstance >> send: aDocument [
	self inform: 'Message sent'
]
