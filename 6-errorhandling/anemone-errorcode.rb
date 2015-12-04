require 'anemone'
# 存在しないURLを設定
urls=[]
urls.push("http://www.hatena1.ne.jp/hogehoge")

opts = {
    :depth_limit => 1,
    :obey_robots_txt => true
  }

Anemone.crawl(urls, opts) do |anemone|
   #HTTPエラー500の場合はraiseで強制終了
   anemone.on_every_page do |page|
    puts page.url
    raise '500 Error!: ' + page.url.path.to_s if page.code = 500
   end
   anemone.after_crawl do |pages|
      puts "hoge"
   end
end

