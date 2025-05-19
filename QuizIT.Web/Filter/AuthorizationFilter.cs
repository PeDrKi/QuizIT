using QuizIT.Common.Helpers; // Nhập các tiện ích hỗ trợ từ không gian tên QuizIT.Common, có thể chứa các phương thức hoặc lớp dùng chung.
using Microsoft.AspNetCore.Mvc; // Nhập các chức năng của ASP.NET Core MVC, hỗ trợ các tính năng liên quan đến controller và kết quả hành động.
using Microsoft.AspNetCore.Mvc.Filters; // Nhập các lớp liên quan đến bộ lọc trong ASP.NET Core, dùng để triển khai bộ lọc tùy chỉnh.
using System; // Nhập các chức năng cơ bản của hệ thống, bao gồm các lớp nền tảng như Attribute.
using System.Linq; // Nhập LINQ để truy vấn tập hợp, ở đây dùng để kiểm tra claims.
using static QuizIT.Common.Constant; // Nhập các thành viên tĩnh của lớp Constant, cho phép truy cập trực tiếp các hằng số như Role.
using QuizIT.Common.Models; // Nhập các mô hình tùy chỉnh, có thể bao gồm cấu trúc dữ liệu liên quan đến người dùng như CurrentUser.

namespace QuizIT.Web.Filter // Định nghĩa không gian tên cho các bộ lọc liên quan đến web, tổ chức lớp bộ lọc trong dự án.
{
    public class AuthorizationFilter : Attribute, IAuthorizationFilter // Khai báo lớp kế thừa từ Attribute và triển khai IAuthorizationFilter để xử lý logic ủy quyền tùy chỉnh.
    {
        public bool IsAuthoriaztion { get; set; } = true; // Định nghĩa thuộc tính để bật/tắt kiểm tra ủy quyền, mặc định là true. Lưu ý: Có lỗi chính tả trong "IsAuthoriaztion" (nên là "IsAuthorization").
        public int RoleID { get; set; } = Role.ALL; // Định nghĩa thuộc tính cho ID vai trò yêu cầu, mặc định là Role.ALL, cho phép tất cả vai trò truy cập trừ khi được chỉ định.

        public void OnAuthorization(AuthorizationFilterContext filterContext) // Triển khai phương thức IAuthorizationFilter, được gọi trong giai đoạn ủy quyền của quy trình xử lý yêu cầu.
        {
            var hasClaim = filterContext.HttpContext.User.Claims.Any(); // Kiểm tra xem người dùng có claims nào không, điều này cho biết họ đã được xác thực hay chưa.

            //Kiểm tra xem đã đăng nhập chưa // Bình luận: Kiểm tra xem người dùng đã đăng nhập hay chưa.
            if (IsAuthoriaztion && !hasClaim) // Nếu yêu cầu ủy quyền và không có claims (người dùng chưa xác thực), tiến hành chuyển hướng.
            {
                filterContext.Result = new RedirectResult("~/"); // Đặt phản hồi để chuyển hướng về URL gốc (trang chủ), chặn truy cập không được phép.
                return; // Thoát khỏi phương thức để ngăn xử lý tiếp theo.
            }

            //Lấy thông tin người đang đăng nhập từ cookie của request // Bình luận: Lấy thông tin người dùng đang đăng nhập từ cookie của yêu cầu.
            HttpHelper.HttpContext.Items["CurrentUser"] = filterContext.HttpContext.User.Claims; // Lưu trữ claims của người dùng vào HttpContext.Items để sử dụng ở nơi khác trong yêu cầu.

            //Kiểm tra xem có quyền truy cập hay không // Bình luận: Kiểm tra xem người dùng có quyền truy cập hay không.
            if (RoleID != Role.ALL && CurrentUser.Role != RoleID) // Nếu yêu cầu một vai trò cụ thể (không phải ALL) và vai trò của người dùng hiện tại không khớp, tiến hành chuyển hướng.
            {
                filterContext.Result = new RedirectResult("~/"); // Đặt phản hồi để chuyển hướng về URL gốc, chặn truy cập đối với người dùng có vai trò không đúng.
                return; // Thoát khỏi phương thức để ngăn xử lý tiếp theo.
            }
        }
    }
}