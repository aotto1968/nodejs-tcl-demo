document.getElementById('inputText').addEventListener('input', function() {
  const inputText = this.value;
  const reversedText = inputText.split('').reverse().join('');
  document.getElementById('outputText').textContent = reversedText;
});
