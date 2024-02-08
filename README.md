# usersテーブル
| Column             | Type   | Option                    |
|:------------------:|:------:|:-------------------------:|
| name               | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| profile            | text   | null: false               |
| occupation         | text   | null: false               |
| position           | text   | null: false               |

- has_many :comments
- has_many :prototypes


# prototypeテーブル
| Column         | Type       |  Option                      |
|:--------------:|:----------:|:----------------------------:|
| title          | string     | null: false                  |
|  catch_copy    | text       | null: false                  |
|  concept       | text       | null: false                  |
|  user          | references | null: false,foreign_key:true |


- belongs_to :user
- has_many :comments

# commentsテーブル
| Column         | Type       |  Option                      |
|:--------------:|:----------:|:----------------------------:|
| content        | text       |                              |
| user           | references |null: false, foreign_key:true |
| prototype      | references |null: false, foreign_key:true |

- belongs_to :prototype
- belongs_to :user
