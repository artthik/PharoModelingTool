"
I am the model that is generated.
"
Class {
	#name : #PMTModel,
	#superclass : #Object,
	#instVars : [
		'package',
		'packageName',
		'instances',
		'messages'
	],
	#category : #'PharoModelingTool-Model'
}

{ #category : #accessing }
PMTModel >> addInstance: anObject [
	instances add: anObject.
]

{ #category : #accessing }
PMTModel >> addMessage: anObject [
	messages add: anObject.
]

{ #category : #initialization }
PMTModel >> initialize [
	super initialize.
	instances := OrderedCollection new.
	messages := OrderedCollection new.
]

{ #category : #accessing }
PMTModel >> instances [
	^ instances
]

{ #category : #accessing }
PMTModel >> instances: anObject [
	instances := anObject
]

{ #category : #accessing }
PMTModel >> messages [
	^ messages
]

{ #category : #accessing }
PMTModel >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
PMTModel >> package [
	^ package
]

{ #category : #accessing }
PMTModel >> package: anObject [
	package := anObject
]

{ #category : #accessing }
PMTModel >> packageName [
	^ packageName
]

{ #category : #accessing }
PMTModel >> packageName: anObject [
	packageName := anObject
]
