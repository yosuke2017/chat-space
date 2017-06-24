# __DB設計__
## __users table__
|Column|Type|Option|
|:-|:-:|:-|
|name|string|index: true, null: false,unique: true|
|mail|string|null:false|  

### __Association__

* has_many :groups,through: members
* has_many :messages
* has_many :members    


## __messages table__
|Column|Type|Option|
|:-|:-:|:-|
|body|text|null:false|
|image|string|null:true|
|group_id|integer|null:false|
|user_id|integer|null:false|  

## __Association__

* belongs_to :group
* belongs_to :user    


## __groups table__
|Column|Type|Option|
|:-|:-:|:-|
|key|varchar|null:true|
|detail|text|null:true|
|member_id|integer|null:false|  

## __Association__

* has_many :users, through: members
* belongs_to :member    


## __members table__
|Column|Type|Option|
|:-|:-:|:-|
|user_id|integer|null:false|  

## _Association__

* belongs_to :user
* has_many :groups
