"
I create and am responsible of the package created or opened by PMT.
"
Class {
	#name : #PMTController,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'package',
		'view',
		'model'
	],
	#category : #'PharoModelingTool-Controller'
}

{ #category : #undefined }
PMTController >> createInstance: anInstanceName [
	| className instance |
	className := 'Instance_' , anInstanceName.
	PMTInstance
		subclass: className
		instanceVariableNames: ''
		classVariableNames: ''
		package: self packageName.
	instance := className asClass new.
	self model addInstance: instance.
	self view addInstance: instance.
	"instance := blabla new. TODO: how to create a class with only the class name as a string?"
	"instance := PMTInstance new."
	"instances add: instance. TODO how to make ArrayLists with classes and [add] them"
	self
		inform: 'Instance: ' , 'Instance_' , anInstanceName , ' has been created.'
]

{ #category : #undefined }
PMTController >> createMessage: aMessageName [
	| className message |
	className := 'Message_' , aMessageName.
	"creates a message"
	PMTMessage
		subclass: className
		instanceVariableNames: ''
		classVariableNames: ''
		package: self packageName.
		message := className asClass new.
	self model addMessage: message.
	self view addMessage: message.
	self inform: 'Message: ' , aMessageName , ' has been created.'
]

{ #category : #undefined }
PMTController >> createPackage: aPackageName [
	"TODO: if there already exists a package with this name throw exception"
	| tmpPackage |
	
	tmpPackage := RPackage organizer createPackageNamed: aPackageName.
	self package: tmpPackage.
	self packageName: aPackageName.
	self inform: 'Package: ' , packageName , ' has been created.'
]

{ #category : #accessing }
PMTController >> initialize [
	<gtExample>
	super initialize. "TODO is this even necessary?"
	self model: PMTModel new.
	self view: PMTView new.
	self view controller: self.
]

{ #category : #accessing }
PMTController >> model [
	^ model
]

{ #category : #accessing }
PMTController >> model: anObject [
	model := anObject
]

{ #category : #undefined }
PMTController >> openPackage: aPackageName [
	"| tmpPackage |"
	"TODO: get the package with the name like: tmpPackage := getPackage: aPackageName"
	"self package: tmpPackage."
	self packageName: aPackageName.
	self inform: 'Package: ', packageName, ' has been opened'.
	"TODO: load instances and stuff."
	
	
]

{ #category : #accessing }
PMTController >> package [
	^ package
]

{ #category : #accessing }
PMTController >> package: aPackage [
	package := aPackage
]

{ #category : #accessing }
PMTController >> packageName [
	^ packageName
]

{ #category : #accessing }
PMTController >> packageName: aPackageName [
	packageName := aPackageName
]

{ #category : #accessing }
PMTController >> view [
	^ view
]

{ #category : #accessing }
PMTController >> view: anObject [
	view := anObject
]
