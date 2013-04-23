# ModifiableSetVarBlockプラグイン

MTSetVarBlockタグでmodifierを使えるようにするプラグイン。MT4専用。

## 更新履歴

 * 0.01 (2007-09-14 12:58:16 +0900):
   * 公開。

## 概要

Movable TypeのオリジナルのMTSetVarBlockタグではmodifierが使えません。!ModifiableSetVarBlockプラグインはmodifierを使えるようにするものです。

分かりやすさのために例を挙げて説明します。以下のようなテンプレート片があったとします。

    <MTSetVarBlock name="hello" trim="1">
      hello!
    </MTSetVarBlock>
    <pre>|<$MTGetVarName name="hello"$>|</pre>

プラグインがインストールされていない場合、以下のようなHTMLが生成されます。つまり、MTSetVarBlockに与えたtrim modifier(前後の空白文字・改行文字を削除する)が機能しません。

    <pre>|
      hello!
    |</pre>

これに対して、プラグインがインストールされている場合には、以下のようなHTMLが生成されます。

    <pre>|hello!|</pre>

Movable Type 4.0の機能を利用して実現しているため、3.xでは動作しません。

## 使い方

プラグインをインストールするには、パッケージに含まれる!ModifiableSetVarBlockディレクトリをMovable Typeのプラグインディレクトリ内にアップロードもしくはコピーしてください。正しくインストールできていれば、Movable Typeのメインメニューにプラグインが新規にリストアップされます。

以降はテンプレート内のMTSetVarBlockでmodifierが利用可能になります。

## TODO

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html]().

## Author & Copyright

Copyright 2007, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
