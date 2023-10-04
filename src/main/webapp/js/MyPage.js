   
    // 삭제 
function deleteSelectedPosts() {
 
    var checkboxes = document.querySelectorAll('.myschedule-list input[type="checkbox"]');
    
    var selectedPosts = [];
      
for (var i = 0; i < checkboxes.length; i++) {
    
    if (checkboxes[i].checked) {
              
        var row = checkboxes[i].closest('tr');
        var postNumber = row.querySelector('td').textContent;     
        selectedPosts.push(postNumber);      
    }
}    
console.log('선택된 게시글 번호: ', selectedPosts);
}
   
   
   
     