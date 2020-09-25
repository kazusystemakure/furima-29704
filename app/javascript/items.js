function item() {
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("change", (e) => {
    item_price = price.value;
    const tax_price = item_price * 0.1
    const sales_profit = item_price - tax_price
    tax.textContent = tax_price
    profit.textContent = sales_profit
    e.preventDefault();
  });
    
}
window.addEventListener("load", item);