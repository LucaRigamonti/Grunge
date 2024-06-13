
  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
      } else {
        entry.target.classList.remove('visible');
      }
    });
  });

  // Osserva tutti gli elementi con la classe .element
  document.querySelectorAll('.room-container').forEach(element => {
    observer.observe(element);
  });

  // Osserva l'elemento con l'ID #recording
  const recordingElement = document.querySelector('#recording');
  if (recordingElement) {
    observer.observe(recordingElement);
  }

  document.querySelectorAll('.content-major').forEach(element => {
    observer.observe(element);
  });


  var modalBlue = document.getElementById("modal-blue");
  var modalRed = document.getElementById("modal-red");
  var modalGreen = document.getElementById("modal-green");
  var modalRec = document.getElementById("modal-rec");
  var closeBtns = document.getElementsByClassName("close");
  var contentInfos = document.getElementsByClassName("content-info");
  var contentInfos2 = document.getElementsByClassName("content-info2");
  var contentInfos3 = document.getElementsByClassName("content-info3");
  var contentInfos4 = document.getElementsByClassName("content-info4");
  var slideIndex = 0;

    // Open modal on content-info click
    for (var i = 0; i < contentInfos.length; i++) {
      contentInfos[i].onclick = function() {
        modalBlue.style.display = "block";
        showSlides(slideIndex, 'blue');
      }
    }

    // Open modal on content-info2 click
    for (var i = 0; i < contentInfos2.length; i++) {
      contentInfos2[i].onclick = function() {
        modalRed.style.display = "block";
        showSlides(slideIndex, 'red');
      }
    }

    // Open modal on content-info3 click
    for (var i = 0; i < contentInfos3.length; i++) {
      contentInfos3[i].onclick = function() {
        modalGreen.style.display = "block";
        showSlides(slideIndex, 'green');
      }
    }

    for (var i = 0; i < contentInfos4.length; i++) {
      contentInfos4[i].onclick = function() {
        modalRec.style.display = "block";
        showSlides(slideIndex, 'rec');
      }
    }

    // Close modal on close button click
    for (var i = 0; i < closeBtns.length; i++) {
      closeBtns[i].onclick = function() {
        this.parentElement.style.display = "none";
      }
    }

    // Close modal on outside click
    window.onclick = function(event) {
      if (event.target == modalBlue || event.target == modalRed || event.target == modalGreen || event.target == modalRec) {
        event.target.style.display = "none";
      }
    }

    function showSlides(n, color) {
      var i;
      var slides = document.querySelectorAll(`#modal-${color} .mySlides`);
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      slideIndex++;
      if (slideIndex > slides.length) {slideIndex = 1}
      slides[slideIndex-1].style.display = "block";
      setTimeout(function() { showSlides(slideIndex, color); }, 2000); // Change image every 2 seconds
    }





    const imgs = document.getElementsByClassName('form-img');
    
    Array.from(imgs).forEach(img => {
        img.addEventListener('click', function() {
            const input = document.getElementById('psw');
            if (input.type === "password") {
                input.type = "text";
                img.setAttribute('src', '../img/eye-black.svg');
            } else {
                input.type = "password";
                img.setAttribute('src', '../img/eye.png');
            }
        });
    });




  const roles = ["Drummer", "Guitarist", "Vocalist", "Bassist", "Audio Enginer"]; // Example roles
  const roleSelect = document.getElementById('role');

  roles.forEach(role => {
      let option = document.createElement('option');
      option.value = role.toLowerCase();
      option.textContent = role;
      roleSelect.appendChild(option);
  });

  const nick = document.getElementById('form-name');
  const welcome = document.getElementById('welcome-name');
  const btn = document.getElementById('invia');
  const role = document.getElementById('role');
  const pwd = document.getElementById('psw');
  
  const nome = () => {
    if (nick.value.trim() === "" || role.value === "" || pwd.value.trim() === "") {
      alert("Please fill in all required fields.");
      return;
    }
    welcome.innerHTML = `Welcome, ${nick.value}!`;
  };

  btn.addEventListener('click', nome);