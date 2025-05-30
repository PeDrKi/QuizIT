﻿using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using QuizIT.Common.Helpers;
using QuizIT.Common.Models;
using QuizIT.Service.Entities;
using QuizIT.Service.IServices;
using QuizIT.Service.Models;
using QuizIT.Web.Filter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QuizIT.Web.Controllers
{
    public class ExamController : BaseController
    {
        private readonly ICategoryService categoryService;
        private readonly IQuestionService questionService;
        private readonly IExamService examService;

        public ExamController(ICategoryService categoryService, IQuestionService questionService, IExamService examService)
        {
            this.categoryService = categoryService;
            this.questionService = questionService;
            this.examService = examService;
        }

        [Route("/bo-de")]
        public IActionResult Index(FilterExam filter)
        {
            ViewBag.ActivePage = "exam";
            //Chỉ hiện những bộ đề đang hoạt động
            filter.IsActive = 1;
            //Lấy ra tất cả thể loại để filter
            var categoryServiceResult = categoryService.GetPage(new FilterCategory
            {
                PageSize = int.MaxValue
            });
            //Lấy danh sách bộ đề
            var examServiceResult = examService.GetPage(filter);
            //Gọi service bị lỗi
            if (categoryServiceResult.ResponseCode != ResponseCode.SUCCESS ||
                examServiceResult.ResponseCode != ResponseCode.SUCCESS)
            {
                return Redirect("~/internal-server-error");
            }
            ViewBag.CategoryLst = categoryServiceResult.Result;
            ViewBag.PaginationModel = PaginationHelper.GetPaginationModel(filter.PageNumber, filter.PageSize, examServiceResult.TotalRecord);
            ViewBag.Filter = filter;
            return View(examServiceResult.Result);
        }

        [Route("/bo-de/chi-tiet/{examId}")]
        public IActionResult Detail(int examId)
        {
            ViewBag.ActivePage = "exam";
            //Lấy thông tin exam
            var examServiceResult = examService.GetById(examId);
            //Lấy bảng xếp hạng
            var rankServiceResult = examService.GetAllRank(examId);
            //Sai id
            if (examServiceResult.ResponseCode == ResponseCode.NOT_FOUND)
            {
                return Redirect("~/error");
            }
            //Gọi service bị lỗi
            if (examServiceResult.ResponseCode != ResponseCode.SUCCESS ||
                rankServiceResult.ResponseCode != ResponseCode.SUCCESS)
            {
                return Redirect("~/internal-server-error");
            }
            ViewBag.RankLst = rankServiceResult.Result;
            ViewBag.SessionId = Guid.NewGuid().ToString();
            return View(examServiceResult.Result.FirstOrDefault());
        }

        [Route("/bo-de/lam-de/{examId}/{sessionId}")]
        public async Task<IActionResult> DoExam(int examId, Guid sessionId)
        {
            ViewBag.ActivePage = "exam";
            //Lấy thông tin exam
            var examServiceResult = examService.GetById(examId);

            //Sai id
            if (examServiceResult.ResponseCode == ResponseCode.NOT_FOUND)
            {
                return Redirect("~/error");
            }
            //Gọi service bị lỗi
            if (examServiceResult.ResponseCode != ResponseCode.SUCCESS)
            {
                return Redirect("~/internal-server-error");
            }

            // Tạo bộ đề mới và thêm mới example id
            var history = await examService.CreateNewHistoryWithExample(examId, sessionId);

            if (history.ResponseCode == ResponseCode.NOT_FOUND)
            {
                return Redirect("~/error");
            }
            //Gọi service bị lỗi
            if (history.ResponseCode != ResponseCode.SUCCESS)
            {
                return Redirect("~/internal-server-error");
            }

            Exam exam = JsonConvert.DeserializeObject<Exam>(history.Result.FirstOrDefault().JsonExamp);
            ViewBag.HistoryId = history.Result.FirstOrDefault().Id;
            return View(exam);
        }

        //Sự kiện chấm điểm khi nộp bài
        [HttpPost]
        public async Task<IActionResult> EventMarkPoint(int historyId, int examId, double timeDoExam, List<QuestionSelect> questionSelectLst)
        {
            var serviceResult = await examService.MarkPoint(historyId, examId, timeDoExam, questionSelectLst);
            return Json(serviceResult);
        }
    }
}