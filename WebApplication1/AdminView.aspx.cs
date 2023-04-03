﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace WebApplication1
{
    public partial class AdminView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            welcomeHeader.InnerText = "Welcome, Administrator!";

        }

        protected void ButtonAP_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewPersonnel.aspx?");
        }
        protected void ButtonRP_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemPersonnel.aspx?");
        }
        protected void ButtonAO_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewOffice.aspx?");
        }
        protected void ButtonRO_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemOffice.aspx?");
        }

        protected void Report_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminReports.aspx?adminID=");
        }
    }
}