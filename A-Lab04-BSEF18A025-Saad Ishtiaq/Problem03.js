

window.onload = function(){

    const b1 = window.document.getElementById('button1');
    b1.addEventListener('click', function() {
        let cel= window.document.getElementById('temperature').value;
        document.getElementById("value").innerHTML = (9.0 / 5.0) * cel + 32 ;
    
    })


    const b2 = window.document.getElementById('button2');
    b2.addEventListener('click', function(){
        let far= window.document.getElementById('temperature').value;
        document.getElementById("value").innerHTML = (5.0 / 9.0) * (far- 32);
    
    })
}
