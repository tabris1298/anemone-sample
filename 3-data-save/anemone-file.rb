# -*- encoding: utf-8 -*-
require 'anemone'

# ファイルで保存する

urls = []
urls.push("http://www.yahoo.co.jp")

# ストレージ形式にファイルを指定する
opts = {
    :storage => Anemone::Storage.PStore('file.txt'),
    :obey_robots_txt => true,
    :depth_limit => 0
}

Anemone.crawl(urls, opts){|anemone|
  anemone.on_every_page{|page|
    puts page.url
    puts page.doc.xpath("/head/title/text()").to_s if page.doc
  }
}
