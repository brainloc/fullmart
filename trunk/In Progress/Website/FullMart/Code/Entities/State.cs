using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class State
    {
        public Int64 ID { get; set; }
        public string StateName { get; set; }
        public int Order { get; set; }
        public State() {
            ID = 0;
            StateName = string.Empty;
            Order = 0;
        }
    }
}