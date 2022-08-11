
# アプリケーション名
旅日和 Treasure every meeting

## アプリケーション概要
自身の観光ルートを投稿し思い出を残す場としても使え、
また旅行に行った生の声を見て次の旅行へ思いを馳せることができる。

## 制作背景
旅行の観光ルートを考える際には「じゃらん」や「るるぶ」といった旅行雑誌を使ったり
○○の魅力！のような記事サイトを参考にすることが多いと思います。
ですがそういった雑誌やサイトでは生の声を見ることはできず想像することしかできません。
そこでユーザー同士が旅行やその感想、旅行の評価を投稿することで実体験としてどうだったのかなどが
見られる仕組みがあると喜ばれるのではないかと思いこのアプリを開発することにしました。



## 洗い出した要件


## 実装した機能
ユーザー登録機能
記事投稿機能
旅行名・ユーザー名での検索機能
タグ付け機能
タグ検索機能
投稿時の星評価機能
各種編集機能

## 実装予定の機能
楽天トラベルAPIを用いた旅館・ホテル検索機能
旅行先の都道府県での検索機能

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
