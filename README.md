
# アプリケーション名
Travel Trader
旅行先の情報を交換して旅行をもっと楽しいものに

## アプリケーション概要
自身の観光ルートを投稿し思い出を残す場としても使え、
また他ユーザーの投稿を見て次の旅行へ思いを馳せることができる。

## 制作背景
友人にヒアリングし、また自分自身においても
旅行の観光ルートを考える際には「じゃらん」や「るるぶ」といった旅行雑誌を使ったり
○○の魅力！のような記事サイトを参考にすることが多かったです。
その度にでは他の人はどんな旅行をしているのだろうか？と気になっていました。
そこでユーザーが観光ルートを投稿することで実体験としてどうだったのかなどが
見られる仕組みがあると嬉しいと思いこのアプリを開発することにしました。

## 洗い出した要件

## 実装した機能

## 実装予定の機能

## データベース設計

### travelsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| travel_time_one_id    | integer    | null: false                    |
| travel_time_two_id    | integer    | null: false                    |
| destination_id        | integer    | null: false                    |
| transportation_id     | integer    | null: false                    |
| travel_title          | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### association
- has_one travel_impression
- has_many tags
- has_many favorites

### usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### association
- has_many favorites
- has_many travels
- has_many travel_impressions

### travel_impressionテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| impression | text       | null: false                    |
| travel     | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### association
- belongs_to: travel
- belongs_to: user

### travel_tagsテーブル
| Colum  | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| travel | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### association
- belongs_to: travel
- belongs_to: tag

### tagsテーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### association
- has_many: travel

### favoriteテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| travel | references | null: false, foreign_key: true |

### association
- belongs_to: user
- belongs_to: travel
