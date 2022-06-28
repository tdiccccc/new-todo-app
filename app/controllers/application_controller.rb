class ApplicationController < ActionController::Base
  ##protect_from_forgery と書くだけで CSRF 対策が有効になる
  ##本来 :exception と書いてある場所を、 :null_session に変えることで、protect_form_forgery で使用される
  ##CSRF Token がリクエスト元と一致しなかった場合に例外を投げるんじゃなくてセッションを空にするという動作になる。
  
  ##クロスサイトリクエストフォージェリ（CSRF）とは、Webアプリケーションに存在する脆弱性、もしくはその脆弱性を利用した攻撃方法のことです。
  掲示板や問い合わせフォームなどを処理するWebアプリケーションが、本来拒否すべき他サイトからのリクエストを受信し処理してしまいます。
  protect_from_forgery with: :null_session
end
