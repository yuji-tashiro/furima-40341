const pay = () => {
  const payjp = Payjp('pk_test_4cbe5349e790defe77423d62')// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

    // セレクタが存在するか確認する
    if (document.getElementById('number-form')) {
      numberElement.mount('#number-form');
    }
    if (document.getElementById('expiry-form')) {
      expiryElement.mount('#expiry-form');
    }
    if (document.getElementById('cvc-form')) {
      cvcElement.mount('#cvc-form');
    }
    const form = document.getElementById('charge-form');
    if (form) { 
      form.addEventListener("submit", (e) => {
        e.preventDefault(); // フォームの送信を阻止
        payjp.createToken(numberElement).then(function (response) {
          if (response.error) {
            // エラーハンドリングをここに記述
          } else {
            const token = response.id;
            const renderDom = document.getElementById("charge-form");
            const tokenObj = `<input value=${token} name='token' type="hidden">`;
            renderDom.insertAdjacentHTML("beforeend", tokenObj);
          }
          numberElement.clear();
          expiryElement.clear();
          cvcElement.clear();
          document.getElementById("charge-form").submit();
        });
      });
    } // 追加したif文の終わり
  };

document.addEventListener("DOMContentLoaded", pay);
