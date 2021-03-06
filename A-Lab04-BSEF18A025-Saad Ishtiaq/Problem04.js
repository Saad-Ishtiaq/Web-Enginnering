


window.onload = function(){

    const b1 = window.document.getElementById('button1');
    b1.addEventListener('click', function() {
        let n1= window.document.getElementById('number1').value;
        let n2= window.document.getElementById('number2').value;
        document.getElementById("result").innerHTML = n1 * n2 ;
    
    })


    const b2 = window.document.getElementById('button2');
    b2.addEventListener('click', function() {
        let n1= window.document.getElementById('number1').value;
        let n2= window.document.getElementById('number2').value;
        document.getElementById("result").innerHTML = n1 / n2 ;
    })
}

