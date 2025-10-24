function imagepreview(input) {
    if (input.files && input.files[0]) {
        var fildr = new FileReader();
        fildr.onload = function (e) {
            $('#pictureBox1').attr('src', e.target.result);
        }
        fildr.readAsDataURL(input.files[0]);
    }
}