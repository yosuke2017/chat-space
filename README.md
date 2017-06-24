# __DB設計__
## __users table__
|Column|Type|Option|
|:-|:-:|:-|
|name|string|index: true, null: false,unique: true|
|mail|string|null:false| 

<br />

### __Association__ 

<br />

* has_many :groups,through: members
* has_many :messages
* has_many :members 

<br />
<br />

## __messages table__
|Column|Type|Option|
|:-|:-:|:-|
|body|text|
|image|string|
|group_id|integer|null:false, foreign_key: true|
|user_id|integer|null:false, foreign_key: true| 

<br />

## __Association__

<br />

* belongs_to :group
* belongs_to :user 

<br />
<br />

## __groups table__
|Column|Type|Option|
|:-|:-:|:-|
|name|string|null:false, unique:true|

<br />

## __Association__ 

<br />

* has_many :users, through: members
* has_many :

<br />
<br />

## __members table__
|Column|Type|Option|
|:-|:-:|:-|
|user_id|integer|null:false,foreign_key| 

<br />

## _Association__ 

<br />

* belongs_to :user
* belongs_to :group
