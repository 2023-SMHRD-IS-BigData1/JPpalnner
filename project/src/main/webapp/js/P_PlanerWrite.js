// textarea 길이 조절
function resize(obj) {
    obj.style.height = '560px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
}

// 여행지 추천 
const btn = document.querySelector('.btn-select');
const list = document.querySelector('.list-member');
btn.addEventListener('click', () => {
    btn.classList.toggle('on');
});
list.addEventListener('click', (event) => {
    if (event.target.nodeName === "BUTTON") {
        btn.innerText = event.target.innerText;
        btn.classList.remove('on');
        }
});


// 초기화 
function resetForm() {
    document.querySelector("form").reset();
}


    
