EMAIL = 'test@example.com'
PASSWORD = 'password'

user = User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts 'ユーザーの初期データインポートに成功しました。'
end
