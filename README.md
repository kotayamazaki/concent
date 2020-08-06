# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## usersテーブル
| Column       | Type   | Options                  |
| ------------ | ------ | ------------------------ |
| first_name   | string | null: false              |
| family_name  | string | null: false              |
| first_kana   | string | null: false              |
| family_kana  | string | null: false              |
| nickname     | string | null: false,unique: true |
| mail_address | string | null: false,unique: true |
| birthday     | date   | null: false              |
### Association
- has_many :posts
- has_many :comments


## postsテーブル
| Column       | Type   | Options                       |
| ------------ | ------ | ----------------------------- |
| title        | text   | null: false                   |
| text         | text   | null: false                   |
| user_id      | integer| null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :posts_tags
- has_many  :tags,  through:  :posts_tags


## tagsテーブル
| Column       | Type   | Options                  |
| ------------ | ------ | ------------------------ |
| name         | string | null: false              |
### Association
- has_many :posts_tags
- has_many  :posts,  through:  :posts_tags


## posts_tagsテーブル
| Column       | Type   | Options                       |
| ------------ | ------ | ----------------------------- |
| posts_id     | integer| null: false, foreign_key: true|
| tags_id      | integer| null: false, foreign_key: true|
### Association
- belongs_to :posts
- belongs_to :tags


## commentsテーブル
| Column       | Type   | Options                       |
| ------------ | ------ | ----------------------------- |
| text         | text   | null: false                   |
| user_id      | integer| null: false, foreign_key: true|
| posts_id     | integer| null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user