function PreviewImage(input) {
    // 파일리더 생성 
    var preview = new FileReader();
    preview.onload = function (e) {
    // img id 값 
    document.getElementById("select_image").src = e.target.result;
// };
// 현재 input 요소에 가장 가까운 select-img 요소를 찾음
    var selectImg = input.closest('.boardwrite-box').querySelector('.select-img img');
    selectImg.src = e.target.result;
    };
// input id 값 
 preview.readAsDataURL(document.getElementById("select_imgfile").files[0]);
    // preview.readAsDataURL(input.files[0]);
};

function resize(obj) {
obj.style.height = '100px';
obj.style.height = (12 + obj.scrollHeight) + 'px';
}

// 내용추가작성

const boardContainer = document.querySelector('.boardwrite-box');
const addbutton = document.getElementById('addbutton');

    function newContainer() {
        
        const boardwriteBox = document.querySelector('#addtext').cloneNode(true);
        
        // 이미지 초기화
        const selectImage = boardwriteBox.querySelector('#select_image');
        selectImage.src = ""; 
        
        // 파일 선택값 초기화
        const fileInput = boardwriteBox.querySelector('#select_imgfile');
        fileInput.value = "";
        
        // 텍스트 입력값 초기화
        const textInput = boardwriteBox.querySelector('textarea');
        textInput.value = "";
       
        boardContainer.appendChild(boardwriteBox);

    }

    addbutton.addEventListener('click', newContainer);

    function PreviewImage(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const selectImage = input.closest('.addtext').querySelector('#select_image');
                selectImage.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }  else {
            // 이미지 파일이 선택되지 않은 경우, 이미지를 초기화하거나 다른 작업을 수행할 수 있습니다.
            const selectImage = input.closest('.addtext').querySelector('#select_image');
            selectImage.src = ""; // 이미지 초기화
            
            input.value = "";
            
            const textInput = input.closest('.addtext').querySelector('textarea');
            textInput.value = ""; //

        }

    }





// 내용추가작성
     