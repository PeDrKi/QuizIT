//Xủ lý các logic liên quan đến làm bài thi // Bình luận: Xử lý các logic liên quan đến việc làm bài thi. Lưu ý: Có lỗi chính tả "Xủ" (nên là "Xử").
var TIME_DO = 0; // Khởi tạo biến TIME_DO để theo dõi thời gian đã làm bài (tính bằng giây), bắt đầu từ 0.

$(document).ready(function () { // Đăng ký hàm xử lý khi tài liệu HTML được tải hoàn toàn (DOM ready).
    startCountDown(); // Gọi hàm startCountDown để bắt đầu đếm ngược thời gian làm bài.
});

startCountDown = function () { // Định nghĩa hàm startCountDown (không dùng từ khóa 'function' trực tiếp, sử dụng biểu thức hàm).
    var timer = $("#count-down-wrapper").attr("data-time"); // Lấy giá trị thời gian (tính bằng giây) từ thuộc tính data-time của phần tử có ID count-down-wrapper.
    let hour, minute, second; // Khai báo các biến để lưu trữ giờ, phút, giây (sử dụng let để giới hạn phạm vi khối).
    var countDown = setInterval(function () { // Tạo một interval chạy mỗi 1000ms (1 giây) để cập nhật bộ đếm ngược.

        hour = parseInt(timer / 3600); // Tính số giờ bằng cách chia tổng số giây cho 3600 (số giây trong 1 giờ).
        minute = parseInt(parseInt(timer % 3600) / 60); // Tính số phút bằng cách lấy dư của tổng giây chia 3600, rồi chia cho 60 (số giây trong 1 phút).
        second = parseInt(parseInt(timer % 3600) % 60); // Tính số giây bằng cách lấy dư của tổng giây chia 3600, rồi lấy dư tiếp cho 60.
        hour = hour < 10 ? "0" + hour : hour; // Nếu giờ nhỏ hơn 10, thêm "0" phía trước để đảm bảo định dạng 2 chữ số (VD: 05 thay vì 5).
        minute = minute < 10 ? "0" + minute : minute; // Nếu phút nhỏ hơn 10, thêm "0" phía trước để đảm bảo định dạng 2 chữ số.
        second = second < 10 ? "0" + second : second; // Nếu giây nhỏ hơn 10, thêm "0" phía trước để đảm bảo định dạng 2 chữ số.
        $("#count-down-wrapper").html(`<i class='bx bx-time'></i> ${hour}:${minute}:${second}`); // Cập nhật nội dung HTML của phần tử count-down-wrapper với biểu tượng đồng hồ và thời gian định dạng HH:mm:ss.
        //Hiện giao diện // Bình luận: Hiển thị giao diện của bộ đếm ngược.
        $("#count-down-wrapper").removeClass("d-none"); // Xóa lớp CSS d-none (thường là display: none) để hiển thị bộ đếm ngược.
        if (timer == 60) { // Kiểm tra nếu thời gian còn lại là 60 giây (1 phút).
            toastr.warning("Thời gian làm còn 1 phút nữa", "Thông báo"); // Hiển thị thông báo cảnh báo bằng thư viện toastr với nội dung "Thời gian làm còn 1 phút nữa".
        }
        if (timer == 10) { // Kiểm tra nếu thời gian còn lại là 10 giây.
            toastr.warning("Sau 10 giây hệ thống sẽ tự nộp bài", "Thông báo"); // Hiển thị thông báo cảnh báo bằng toastr với nội dung "Sau 10 giây hệ thống sẽ tự nộp bài".
        }
        if (timer == 0) { // Kiểm tra nếu thời gian còn lại là 0 (hết giờ).
            //Xoá interval // Bình luận: Xóa interval để dừng đếm ngược.
            clearInterval(countDown) // Dừng interval countDown để không tiếp tục chạy hàm callback.
            //Nộp bài // Bình luận: Nộp bài thi.
            submitExam(); // Gọi hàm submitExam (không được định nghĩa trong đoạn mã này) để tự động nộp bài.
        }
        else { // Nếu thời gian vẫn còn (timer > 0).
            timer--; // Giảm giá trị timer đi 1 để đếm ngược thời gian còn lại.
            TIME_DO++; // Tăng giá trị TIME_DO lên 1 để theo dõi tổng thời gian đã làm bài.
        }

    }, 1000); // Đặt interval chạy mỗi 1000ms (1 giây).
}