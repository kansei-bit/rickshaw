# アプリケーション名
rickshaw

# アプリケーション概要
人力車を引く人のことを俥夫(しゃふ)と呼びます。
現場では現在、紙媒体で領収書を作成しており、業務終了後の集計に時間がかかります。
繁茂期(紅葉、桜、連休、祭事など)には1日に80台もの人力車が稼働することもあり、1台分の集計が2分で終わるとしても2x80=160分(2時間40分)も集計にかかってしまいます。（実際にはもっとかかっていると思われます）
この集計作業を自動化することができれば大幅な時間短縮とヒューマンエラー（集計する人が入力を間違える）を防ぐことができると考えます。
そこで、本アプリでは領収書の作成をスマホで行い、その領収書データを俥夫ごとに管理して自動集計することを目指しました。（もともと出発連絡にスマホを使っていたので、俥夫は全員スマホを持っています）

# URL

# テスト用アカウント
## 管理者

## 俥夫

# 利用方法
俥夫は領収書作成と、自分の売り上げを確認することができます。
管理者は全俥夫の売り上げの確認と、その集計結果を確認することができます。

# 目指した課題解決
集計時間をなくすことで、業務終了後、疲れた俥夫、スタッフが少しでも早く帰れるようにする。

# 要件定義

# 実装した機能についてのGIFと説明

# 実装予定の機能

# ローカルでの動作方法

# テーブル設計

## shafu テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| password_confirmation | string | null: false |
| lname | string | null: false |
| fname | string | null: false |
| lname_katakana | string | null: false |
| fname_katakana | string | null: false |
| birthday | date | null: false |

##l# Association

- has_many :receipts

## receipts テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| customer_name   | string | null: false |
| fee   | integer | null: false |
| cashless   | boolean | null: false |
| course_id   | integer | null: false |
| adult_id   | integer |
| child_id   | integer |
| group   | boolean | null: false |
| departure_from   | string | null: false |
| arrive_at   | string | null: false |
| departure_time   | time | null: false |
| arrival_time   | time | null: false |
| overtime   | integer |
| course_time   | integer |
| shafu_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :shafu
-- activerecord
- belongs_to :course
- belongs_to :adult
- belongs_to :child
