function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    console.log("イベント発火")
  });
};
window.addEventListener('load', price);