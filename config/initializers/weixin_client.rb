account = YAML.load_file(File.join("#{Rails.root}", "config", "keys", "weixin_account.yml"))[Rails.env]
YAML.load ''

if account.blank? || account.size == 0
  raise "not found correct account ...."
end
$client ||= WeixinAuthorize::Client.new(account["appID"], account["appSecret"])

menu = {
    "button" => [
        {
            "type" => "click", "name" => "今日歌曲", "key" => "V1001_TODAY_MUSIC"
        },
        {
            "name" => "菜单",
            "sub_button" => [
                {
                    "type" => "view",
                    "name" => "搜索",
                    "url" => "http://www.soso.com/"
                },
                {
                    "type" => "view",
                    "name" => "视频",
                    "url" => "http://v.qq.com/"
                },
                {
                    "type" => "click",
                    "name" => "赞一下我们",
                    "key" => "V1001_GOOD"
                }]
        }]
}

$client.create_menu(menu)