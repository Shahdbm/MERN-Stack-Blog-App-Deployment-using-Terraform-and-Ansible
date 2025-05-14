provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_user" "media_user" {
  name = "media-upload-user"
}

resource "aws_iam_access_key" "media_key" {
  user = aws_iam_user.media_user.name
}

resource "aws_iam_user_policy" "media_policy" {
  name = "media-upload-policy"
  user = aws_iam_user.media_user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject"
        ],
        Resource = "arn:aws:s3:::media-bucket-name/*"
      }
    ]
  })
}

output "s3_user_access_key" {
  value = aws_iam_access_key.media_key.id
}

output "s3_user_secret_key" {
  value = aws_iam_access_key.media_key.secret
}
