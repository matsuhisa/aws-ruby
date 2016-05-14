require "aws-sdk-core"
require 'securerandom'

Aws.config[:region] = 'ap-northeast-1'
s3 = Aws::S3::Client.new

resp = s3.list_buckets
puts resp.buckets.map(&:name)

file_open = File.open("foo.jpg")
file_name = "#{SecureRandom.base64(10)}.jpg"

s3.put_object(
    bucket: "static-rails",
    body: file_open,
    key: file_name
)
