/**
 * 
 */


/**
 * メーラーを起動してメールを送信する
 */

window.onload = function() {

    /**
   * メールに記載する情報を格納する変数
   */
    var address, ccAddress, subject, body, hiddenData;
    var sendmail = document.getElementById('mail');

    sendmail.onclick = function() {

        // メールに記載したい情報をhiddenタグから取得
        hiddenData = document.getElementById('hidden_data').value;
        address = '~@co.jp';
        ccAddress = 'sub@co.jp';
        subject = '件名';
        body = '本文' + '%0D%0A' + hiddenData; // 「'%0D%0A'」を入れて改行

        // 「'?cc='」部分でCC追加
        location.href = 'mailto:' + address + '?cc=' + ccAddress + '&subject=' + subject + '&body=' + body;
    };

};