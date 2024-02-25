const calculateProfit = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) { return false; } // item-priceがないページでは何もしない

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 販売手数料と販売利益の計算
    const addTaxPrice = Math.floor(inputValue * 0.1);
    const profit = Math.floor(inputValue - addTaxPrice);

    // 計算結果の表示
    document.getElementById('add-tax-price').innerText = addTaxPrice;
    document.getElementById('profit').innerText = profit;
  });
};

window.addEventListener("turbo:load", calculateProfit);
window.addEventListener("turbo:render", calculateProfit);