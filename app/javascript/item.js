function profit(){
  const data = document.getElementById('item-price')
  data.addEventListener('input', function(){
    const data_val = data.value;
    const profit = Math.round(data_val * 0.9)
    const tax = (data_val - profit)
    const tax_input = document.getElementById("add-tax-price")
    const profit_input = document.getElementById("profit")
    tax_input.innerHTML = tax
    profit_input.innerHTML = profit
  })
}
window.addEventListener("load", profit);
