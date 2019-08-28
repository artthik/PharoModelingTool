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
		'model',
		'uid'
	],
	#category : #'PharoModelingTool-Controller'
}

{ #category : #undefined }
PMTController >> createInstance [
	| className instance |
	className := 'Instance_' , self uid asRopedText.
	PMTInstance
		subclass: className
		instanceVariableNames: ''
		classVariableNames: ''
		package: self packageName.
	instance := className asClass new.
	self model addInstance: instance.
	self view addInstance: instance.
	"instances add: instance. TODO how to make ArrayLists with classes and [add] them"
	self
		inform: 'Instance: ' , className , ' has been created.'
]

{ #category : #undefined }
PMTController >> createMessage [
	| className message |
	className := 'Message_' , self uid asRopedText..
	PMTMessage
		subclass: className
		instanceVariableNames: ''
		classVariableNames: ''
		package: self packageName.
	message := className asClass new.
	self model addMessage: message.
	self view addMessage: message.
	self inform: 'Message: ' , className , ' has been created.'
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
	uid:= 0.
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
PMTController >> uid [
	"identifier / over glorifiprintString"

	uid := uid + 1.
	^ uid printString
]

{ #category : #accessing }
PMTController >> uid: anInteger [
	uid:= anInteger.
]

{ #category : #accessing }
PMTController >> view [
	^ view
]

{ #category : #accessing }
PMTController >> view: anObject [
	view := anObject
]
