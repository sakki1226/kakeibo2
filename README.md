## アプリケーション名
「share money」

## アプリケーション概要
家族（夫婦）間で各自の収支を登録し、家族全体の収支を管理できる

## URL
https://kakeibo2.onrender.com/

## テスト用アカウント
・Basic 認証パスワード：1006<br>
・Basic 認証ID：admin<br>
<山田家><br>
ユーザー① メールアドレス→test@test  パスワード→111111<br>
ユーザー② メールアドレス→test1@test  パスワード→222222<br>
## 利用方法

### ユーザー毎の収支投稿
1.ユーザーの新規登録の際、家族名とユーザー２人を同時に登録する<br>
2.ログイン後、ヘッダーの収入ボタンから、収入の種類、金額、日付を入力し登録する<br>
3.ログイン後、ヘッダーの支出ボタンから、支出の種類、金額、支払方法、日付を入力し登録する<br>

### 家族で合算した日毎、月毎の一覧表を表示
1.ログイン後カレンダーを表示できるようにし、カレンダーに日毎の合計金額を表示させる<br>
2.カレンダーの日にちの数字を押すと、その日毎の収支の詳細を表示させることができる<br>
3.カレンダー上部の月（例：2023年11月）の部分のリンクを押すと、月毎の支出の詳細を一覧で表示させる<br>
4.月毎のページの日にちのリンクを押すと、日毎の詳細ページに遷移することができる

## アプリケーションを作成した背景
家計簿は女性が管理することが多いと感じ、<br>
各自の収支を一つのアプリで関することで、<br>
女性の負担を減らしながら家計の管理ができるアプリを作成したかったため。<br>

## 洗い出した要件
https://docs.google.com/spreadsheets/d/1E96JTc1ybsUnWgsrSLKQ15x9WdxPlv5usPx5OmsT7zE/edit#gid=982722306

## 実装した機能についての画像やGIFおよびその説明※

ユーザー１のログイン画面
[![Image from Gyazo](https://i.gyazo.com/ed54b54d2ea411aaf49744557e75801f.gif)](https://gyazo.com/ed54b54d2ea411aaf49744557e75801f)

ユーザー２のログイン画面
[![Image from Gyazo](https://i.gyazo.com/49a2b88d22196d870fbc9a1ef09502c4.gif)](https://gyazo.com/49a2b88d22196d870fbc9a1ef09502c4)

日毎の詳細ページ（家族ごとのデータを合算して表示。登録したユーザーが自分のデータを編集、削除ができる）
[![Image from Gyazo](https://i.gyazo.com/37c65ad7a494154b50c55d5520c89933.png)](https://gyazo.com/37c65ad7a494154b50c55d5520c89933)

月毎の一覧ページ（日付に入ると上記の日毎詳細ページに遷移）
[![Image from Gyazo](https://i.gyazo.com/2b5b6a99078bd621ada4ba842bd1bee5.png)](https://gyazo.com/2b5b6a99078bd621ada4ba842bd1bee5)

収入の登録ページ
[![Image from Gyazo](https://i.gyazo.com/d8fbc0c0b53eee5283a41b451e6d4b2a.png)](https://gyazo.com/d8fbc0c0b53eee5283a41b451e6d4b2a)

支出の登録ページ
[![Image from Gyazo](https://i.gyazo.com/c36098f82c10e00c6b35b8894ce851b4.png)](https://gyazo.com/c36098f82c10e00c6b35b8894ce851b4)

新規ユーザー登録ページ①
[![Image from Gyazo](https://i.gyazo.com/b1d5c5b4c91a4ca855d9bf893bba951a.gif)](https://gyazo.com/b1d5c5b4c91a4ca855d9bf893bba951a)

新規ユーザー登録ページ②
[![Image from Gyazo](https://i.gyazo.com/24a0a366993d8795f65cd52a011ea12a.gif)](https://gyazo.com/24a0a366993d8795f65cd52a011ea12a)

ログイン画面
[![Image from Gyazo](https://i.gyazo.com/738731f4138fdbbe22a687e0b471b7c9.png)](https://gyazo.com/738731f4138fdbbe22a687e0b471b7c9)

## 実装予定の機能
・マイページ<br>
・毎月の支出を円グラフで表示<br>
・支出を前月と比較できるように表示<br>

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/9899938f52ed9ae063e1c839dd9637a9.png)](https://gyazo.com/9899938f52ed9ae063e1c839dd9637a9)

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/2485d65e3084ea9f9ba25ff3b3834b9a.png)](https://gyazo.com/2485d65e3084ea9f9ba25ff3b3834b9a)

## 開発環境
・フロントエンド<br>
・バッグエンド<br>
・インフラ<br>
・テスト<br>
・テキストエディタ<br>


## ローカルでの動作方法

## 工夫したポイント
新規登録の際に2人分のユーザーを同時登録できるようにし、同じ家族名での登録ができないように実装したことで、セキュリティに配慮したユーザー登録を実現。<br>
各ユーザーの登録したデータを合算し、家族全体での収支を一覧で見られるようにしたことで、普段家計を気にしていないユーザーに意識付けができるような構造を心掛けた。

## 改善点
・JavaScript等を用いて、もっと動きのあるアプリケーションを今後実装していきたい。

## 制作時間
120時間

