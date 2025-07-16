function updateMirror() {
  const inputTop = document.getElementById('inputTop').value;
  const inputBottom = document.getElementById('inputBottom').value;
  const mirroredTop = inputTop.split('').reverse().join('');
  const mirroredBottom = inputBottom.split('').reverse().join('');
  let html = '';
  if (mirroredTop) {
    html += `<div class='blue' style='text-align:right;'>${mirroredTop}</div>`;
  }
  if (mirroredBottom) {
    html += `<div class='green' style='text-align:right;'>${mirroredBottom}</div>`;
  }
  document.getElementById('outputText').innerHTML = html;
}
document.getElementById('inputTop').addEventListener('input', updateMirror);
document.getElementById('inputBottom').addEventListener('input', updateMirror);
window.addEventListener('DOMContentLoaded', updateMirror);
