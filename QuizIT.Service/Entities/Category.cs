using System;
using System.Collections.Generic;

namespace QuizIT.Service.Entities
{
    public partial class Category
    {
        public Category()
        {
            Exam = new HashSet<Exam>();
            Question = new HashSet<Question>();
        }

        public int Id { get; set; }
        public string CategoryName { get; set; }
        public DateTime CreateAt { get; set; }

        [Newtonsoft.Json.JsonIgnore]
        public virtual ICollection<Exam> Exam { get; set; }
        [Newtonsoft.Json.JsonIgnore]
        public virtual ICollection<Question> Question { get; set; }
    }
}
