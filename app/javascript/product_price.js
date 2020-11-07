function input( ) {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const saleProfitLoss = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    saleProfitLoss.innerHTML = Math.floor(inputValue - (inputValue * 0.1));
  });
}

window.addEventListener('load', input);