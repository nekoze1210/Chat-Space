# Chat-Space
====
🍺
## Models
- message
- group
- user
- group_user

## Tables

### messages
|text|  thumbnail  |  group_id   |  user_id |
|:--:|:-----------:|:-----------:|:--------:|
|text|   text      |  references |references|

### groups
|title |
|:----:|
|string|

### users(devise)
|nickname| email| password |
|:------:|:----:|:--------:|
| string |string| string   |

### group_users
|  group_id  |   user_id  |
|:----------:|:----------:|
| references | references |

## Associations

### Message
- belongs_to :user
- belongs_to :group

### Group
- has_many :messages
- has_many :users

### User
- has_many :groups, through: :group_users
- has_many :messages

### Group_user
- belongs_to :group
- belongs_to :user