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
|body|text|null:false|
|image|string|null:true|
|group_id|integer|null:false|
|user_id|integer|null:false|
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
|key|varchar|null:true|
|detail|text|null:true|
|member_id|integer|null:false|
<br />
## __Association__
<br />
* has_many :users, through: members
* belongs_to :member
<br />
<br />
## __members table__
|Column|Type|Option|
|:-|:-:|:-|
|user_id|integer|null:false|
<br />
## _Association__
<br />
* belongs_to :user
* has_many :groups
