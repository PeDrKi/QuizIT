//Xủ lý các logic liên quan đến làm bài thi // Bình luận: Xử lý các logic liên quan đến làm bài thi. Lưu ý: Có lỗi chính tả "Xủ" (nên là "Xử").
$(document).ready(function () { // Đăng ký hàm xử lý khi tài liệu HTML được tải hoàn toàn (DOM ready).

    //#region SỰ KIỆN TÌM KIẾM BỘ ĐỀ // Bình luận: Nhóm các sự kiện liên quan đến tìm kiếm bộ đề.
    $(document).on("submit", "#form-filter", function () { // Gắn sự kiện submit cho form có ID form-filter, sử dụng on để hỗ trợ các phần tử động.
        const name = $("input", this).val(); // Lấy giá trị của input trong form (tên bộ đề).
        const categoryId = $("select[id='category']", this).val(); // Lấy giá trị của select có ID category (ID danh mục).
        const level = $("select[id='level']", this).val(); // Lấy giá trị của select có ID level (mức độ).
        if (categoryId == -1) { // Kiểm tra nếu không chọn danh mục (categoryId = -1).
            if (name == "") { // Nếu không nhập tên bộ đề.
                window.location.href = `/bo-de?level=${level}`; // Chuyển hướng đến URL danh sách bộ đề với tham số level.
            }
            else { // Nếu có nhập tên bộ đề.
                window.location.href = `/bo-de?name=${name}&level=${level}`; // Chuyển hướng đến URL với tham số name và level.
            }
        }
        else { // Nếu đã chọn danh mục.
            if (name == "") { // Nếu không nhập tên bộ đề.
                window.location.href = `/bo-de?category=${categoryId}&level=${level}`; // Chuyển hướng đến URL với tham số category và level.
            }
            else { // Nếu có nhập tên bộ đề.
                window.location.href = `/bo-de?category=${categoryId}&name=${name}&level=${level}`; // Chuyển hướng đến URL với tham số category, name, và level.
            }
        }
        return false; // Ngăn form gửi yêu cầu mặc định (tránh tải lại trang).
    });
    //#endregion // Kết thúc nhóm sự kiện tìm kiếm bộ đề.

    //#region SỰ KIỆN NỘP BÀI // Bình luận: Nhóm các sự kiện liên quan đến nộp bài thi.
    $(document).on("click", "#btn-submit", function () { // Gắn sự kiện click cho nút có ID btn-submit.
        //Kiểm tra người dùng đã chọn đủ đáp án hay chưa // Bình luận: Kiểm tra xem người dùng đã chọn đủ đáp án cho tất cả câu hỏi chưa.
        if ($(".question-item input").length / 4 != $(".question-item input:checked").length) { // So sánh số câu hỏi (mỗi câu có 4 input) với số input được chọn.
            //toastr.error("Hãy chọn đủ đáp án", "Thông báo"); // Dòng bị comment, trước đây hiển thị thông báo lỗi đơn giản.
            //Chưa chọn đủ đáp án // Bình luận: Nếu chưa chọn đủ đáp án.
            let mess = "Câu hỏi số"; // Khởi tạo chuỗi thông báo lỗi với phần đầu là "Câu hỏi số".
            $(".question-item").each(function () { // Duyệt qua từng phần tử có lớp question-item (mỗi phần tử đại diện cho một câu hỏi).
                const order = $(this).attr("data-order"); // Lấy số thứ tự câu hỏi từ thuộc tính data-order.
                if ($(this).find("input:checked").length == 0) { // Nếu câu hỏi này không có input nào được chọn.
                    mess += ` ${order},`; // Thêm số thứ tự câu hỏi vào chuỗi thông báo, theo sau là dấu phẩy.
                }
            })
            //Loại bỏ dấu , cuối // Bình luận: Loại bỏ dấu phẩy cuối cùng trong chuỗi thông báo.
            mess = mess.substring(0, mess.length - 1); // Cắt bỏ ký tự phẩy cuối cùng.
            mess += " chưa được chọn. Vui lòng hoàn thành tất cả câu hỏi trước khi nộp bài"; // Thêm phần cuối vào thông báo lỗi.
            toastr.error(mess, "Thông báo"); // Hiển thị thông báo lỗi bằng toastr với nội dung chi tiết.
        }
        //Đã chọn đủ đáp án // Bình luận: Nếu đã chọn đủ đáp án.
        else {
            submitExam(); // Gọi hàm submitExam để nộp bài.
        }
    });
    //#endregion // Kết thúc nhóm sự kiện nộp bài.

    //#region SỰ KIỆN CHẤM LẠI BÀI // Bình luận: Nhóm các sự kiện liên quan đến chấm lại bài thi.
    $(document).on("click", "#btn-submit-again", function () { // Gắn sự kiện click cho nút có ID btn-submit-again.
        const pathLst = window.location.pathname.split("/"); // Tách URL hiện tại thành mảng các phần tử, phân tách bằng dấu "/".
        const historyId = parseInt(pathLst[pathLst.length - 1]); // Lấy ID lịch sử từ phần tử cuối cùng của URL và chuyển thành số nguyên.
        const timeDo = $("#time-do-exam").attr("data-time"); // Lấy thời gian làm bài từ thuộc tính data-time của phần tử có ID time-do-exam.
        $.ajax({ // Gửi yêu cầu AJAX đến server.
            url: "/history/eventmarkpointagain", // URL endpoint để chấm lại bài.
            type: "POST", // Phương thức HTTP là POST.
            data: { // Dữ liệu gửi đi.
                historyId: historyId, // ID lịch sử bài thi.
                time局timeDoExam: timeDo // Thời gian làm bài (phút).
            },
            dataType: "json", // Định dạng phản hồi mong đợi là JSON.
            beforeSend: function () { // Hàm chạy trước khi gửi yêu cầu.
                showLoading(); // Hiển thị giao diện loading (không được định nghĩa trong mã này).
            },
            success: function (response) { // Hàm xử lý khi yêu cầu thành công.
                if (response.responseCode == "200") { // Nếu mã phản hồi là 200 (thành công).
                    toastr.success(response.responseMess, "Thông báo"); // Hiển thị thông báo thành công bằng toastr.
                    setTimeout(function () { // Đặt timeout để tải lại trang sau 800ms.
                        location.reload(); // Tải lại trang hiện tại.
                    }, 800)
                }
                else { // Nếu mã phản hồi không phải 200.
                    toastr.error(response.responseMess, "Thông báo"); // Hiển thị thông báo lỗi bằng toastr.
                }
            },
            error: function () { // Hàm xử lý khi yêu cầu thất bại.
                toastr.error("Máy chủ tạm thời không phản hồi, vui lòng thử lại sau", "Thông báo"); // Hiển thị thông báo lỗi server.
            },
        }).always(function () { // Hàm luôn chạy sau khi yêu cầu hoàn tất (thành công hoặc thất bại).
            hideLoading(); // Ẩn giao diện loading.
        });
    });
    //#endregion // Kết thúc nhóm sự kiện chấm lại bài.

    //#region SỰ KIỆN TÌM KIẾM LỊCH SỬ // Bình luận: Nhóm các sự kiện liên quan đến tìm kiếm lịch sử làm bài.
    $(document).on("submit", "#form-filter-history", function () { // Gắn sự kiện submit cho form có ID form-filter-history.
        const examId = $("#select-exam", this).val(); // Lấy giá trị của select có ID select-exam (ID bộ đề).
        const userId = $("#select-user", this).val(); // Lấy giá trị của select có ID select-user (ID người dùng).
        if (examId == -1) { // Nếu không chọn bộ đề (examId = -1).
            window.location.href = `/lich-su` + (userId != undefined && userId != -1 ? `?userId=${userId}` : ''); // Chuyển hướng đến URL lịch sử, thêm tham số userId nếu có.
        }
        else { // Nếu đã chọn bộ đề.
            window.location.href = `/lich-su?examId=${examId}` + (userId != undefined && userId != -1 ? `&userId=${userId}` : ''); // Chuyển hướng đến URL lịch sử với tham số examId và userId nếu có.
        }
        return false; // Ngăn form gửi yêu cầu mặc định.
    });
    //#endregion // Kết thúc nhóm sự kiện tìm kiếm lịch sử.

    //#region SỰ KIỆN EXPORT KẾT QUẢ THI // Bình luận: Nhóm các sự kiện liên quan đến xuất kết quả thi.
    $(document).on("click", "#btn-export-excels", function () { // Gắn sự kiện click cho nút có ID btn-export-excels.
        let lstExportHistory = []; // Khởi tạo mảng để lưu thông tin câu hỏi và đáp án.
        $(".question-item").each(function () { // Duyệt qua từng câu hỏi (phần tử có lớp question-item).
            let questionContent = $(this).find(".question-title").text().trim(); // Lấy nội dung câu hỏi, loại bỏ khoảng trắng thừa.
            let answerSelect, result = ""; // Khai báo biến cho đáp án đã chọn và kết quả.
            const lstInputChecked = $(this).find("input:checked"); // Lấy danh sách input được chọn trong câu hỏi.
            //Chưa chọn // Bình luận: Nếu không có đáp án nào được chọn.
            if (lstInputChecked.length == 0) { // Nếu không có input nào được chọn.
                answerSelect = "Chưa chọn"; // Gán giá trị "Chưa chọn" cho đáp án.
            }
            //Có chọn đáp án thì lấy ra nội dung đáp án đã chọn // Bình luận: Nếu có đáp án được chọn, lấy nội dung của nó.
            else {
                const idInput = $(lstInputChecked[0]).attr("id"); // Lấy ID của input được chọn.
                answerSelect = $(`label[for=${idInput}]`).text().trim(); // Lấy nội dung của label tương ứng với input, loại bỏ khoảng trắng.
            }
            result = $(this).find("p.font-weight-bold").text().trim(); // Lấy kết quả của câu hỏi (VD: Đúng/Sai), loại bỏ khoảng trắng.
            lstExportHistory.push({ // Thêm một đối tượng vào mảng lstExportHistory.
                QuestionContent: questionContent, // Nội dung câu hỏi.
                AnswerSelect: answerSelect, // Đáp án đã chọn.
                Result: result // Kết quả.
            });
        });
        const pathLst = window.location.pathname.split("/"); // Tách URL hiện tại thành mảng.
        const historyId = parseInt(pathLst[pathLst.length - 1]); // Lấy ID lịch sử từ phần tử cuối cùng của URL.
        $.ajax({ // Gửi yêu cầu AJAX để xuất kết quả.
            url: "/history/eventexporthistory", // URL endpoint để xuất lịch sử.
            type: "POST", // Phương thức HTTP là POST.
            data: { // Dữ liệu gửi đi.
                historyId: historyId, // ID lịch sử bài thi.
                lstExportHistory: lstExportHistory // Danh sách thông tin câu hỏi và đáp án.
            },
            beforeSend: function () { // Hàm chạy trước khi gửi yêu cầu.
                showLoading(); // Hiển thị giao diện loading.
            },
            success: function () { // Hàm xử lý khi yêu cầu thành công.
                console.log("a"); // In "a" ra console (có thể là để debug, nhưng không xử lý phản hồi).
                /*if (response.responseCode == "200") {
                    toastr.success(response.responseMess, "Thông báo");
                    setTimeout(function () {
                        location.reload();
                    }, 800)
                }
                else {
                    toastr.error(response.responseMess, "Thông báo");
                }*/ // Đoạn mã bị comment, trước đây xử lý phản hồi tương tự các AJAX khác.
            },
            error: function () { // Hàm xử lý khi yêu cầu thất bại.
                toastr.error("Máy chủ tạm thời không phản hồi, vui lòng thử lại sau", "Thông báo"); // Hiển thị thông báo lỗi server.
            },
        }).always(function () { // Hàm luôn chạy sau khi yêu cầu hoàn tất.
            hideLoading(); // Ẩn giao diện loading.
        });
    });
    //#endregion // Kết thúc nhóm sự kiện xuất kết quả.
});

getQuestionSelectLst = function () { // Định nghĩa hàm lấy danh sách câu hỏi và đáp án đã chọn.
    let questionSelectLst = []; // Khởi tạo mảng để lưu thông tin.
    $(".question-item").each(function () { // Duyệt qua từng câu hỏi.
        if ($(this).find("input:checked").val() != undefined) { // Nếu có input được chọn (có giá trị).
            questionSelectLst.push({ // Thêm một đối tượng vào mảng.
                QuestionId: $(this).attr("data-target"), // ID câu hỏi từ thuộc tính data-target.
                AnswerSelect: $(this).find("input:checked").val() // Giá trị của input được chọn (đáp án).
            })
        }
    });
    return questionSelectLst; // Trả về danh sách câu hỏi và đáp án.
}

getHistoryId = function () { // Định nghĩa hàm lấy ID lịch sử.
    return $("input[name='historyId']").val(); // Lấy giá trị của input có name là historyId.
}
//Hàm nộp bài // Bình luận: Hàm xử lý nộp bài thi.
submitExam = function () { // Định nghĩa hàm submitExam.
    const pathLst = window.location.pathname.split("/"); // Tách URL hiện tại thành mảng.
    const examId = parseInt(pathLst[pathLst.length - 2]); // Lấy ID bộ đề từ phần tử thứ hai từ cuối của URL.
    const questionSelectLst = getQuestionSelectLst(); // Gọi hàm để lấy danh sách câu hỏi và đáp án.
    const historyId = getHistoryId(); // Gọi hàm để lấy ID lịch sử.
    $.ajax({ // Gửi yêu cầu AJAX để nộp bài.
        url: "/exam/eventmarkpoint", // URL endpoint để chấm điểm bài thi.
        type: "POST", // Phương thức HTTP là POST.
        data: { // Dữ liệu gửi đi.
            historyId: historyId, // ID lịch sử bài thi.
            examId: examId, // ID bộ đề.
            timeDoExam: TIME_DO / 60, // Thời gian làm bài (chuyển từ giây sang phút).
            questionSelectLst: questionSelectLst, // Danh sách câu hỏi và đáp án.
        },
        dataType: "json", // Định dạng phản hồi mong đợi là JSON.
        beforeSend: function () { // Hàm chạy trước khi gửi yêu cầu.
            showLoading(); // Hiển thị giao diện loading.
        },
        success: function (response) { // Hàm xử lý khi yêu cầu thành công.
            if (response.responseCode == "200") { // Nếu mã phản hồi là 200 (thành công).
                toastr.success(response.responseMess, "Thông báo"); // Hiển thị thông báo thành công.
                const historyId = response.result[0]; // Lấy ID lịch sử từ phản hồi.
                setTimeout(function () { // Đặt timeout để chuyển hướng sau 800ms.
                    window.location.href = `/lich-su/chi-tiet/${historyId}`; // Chuyển hướng đến trang chi tiết lịch sử.
                }, 800)
            }
            else { // Nếu mã phản hồi không phải 200.
                toastr.error(response.responseMess, "Thông báo"); // Hiển thị thông báo lỗi.
            }
        },
        error: function () { // Hàm xử lý khi yêu cầu thất bại.
            toastr.error("Máy chủ tạm thời không phản hồi, vui lòng thử lại sau", "Thông báo"); // Hiển thị thông báo lỗi server.
        },
    }).always(function () { // Hàm luôn chạy sau khi yêu cầu hoàn tất.
        hideLoading(); // Ẩn giao diện loading.
    });
}