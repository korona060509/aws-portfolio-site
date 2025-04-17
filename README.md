# AWS ポートフォリオサイトプロジェクト

このプロジェクトは、AWSサービスを使用して静的ポートフォリオサイトをホスティングするためのTerraformコードを提供します。

## アーキテクチャ

このプロジェクトは以下のAWSサービスを使用しています：

- **Amazon S3**: 静的ウェブサイトのホスティング
- **Amazon CloudFront**: コンテンツ配信ネットワーク（CDN）
- **Amazon Cognito**: ユーザー認証（今後実装予定）
- **Amazon DynamoDB**: 記事データの保存（今後実装予定）

## ディレクトリ構造

```
/
├── main.tf           # メインのTerraformコード
├── variables.tf      # 変数定義
├── outputs.tf        # 出力定義
├── modules/
│   ├── s3/           # S3バケットモジュール
│   ├── cloudfront/   # CloudFrontモジュール
│   └── bucket_policy/ # S3バケットポリシーモジュール
├── index.html        # サイトのホームページ
└── error.html        # エラーページ
```

## 使用方法

### 前提条件

- Terraform v1.0.0以上
- AWS CLIがインストールされ、設定済み
- 一意のS3バケット名

### デプロイ手順

1. `variables.tf`ファイルの`bucket_name`変数を一意の名前に変更します。

2. Terraformを初期化します：
   ```
   terraform init
   ```

3. 実行計画を確認します：
   ```
   terraform plan
   ```

4. インフラストラクチャをデプロイします：
   ```
   terraform apply
   ```

5. デプロイが完了すると、CloudFrontのドメイン名が出力されます。このURLを使用してウェブサイトにアクセスできます。

### クリーンアップ

リソースを削除するには：
```
terraform destroy
```

## 今後の拡張予定

- Amazon Cognitoを使用したユーザー認証の追加
- DynamoDBを使用した記事データの保存
- API Gatewayを使用したRESTful API
- Lambda関数によるバックエンド処理

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。
