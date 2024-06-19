using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.IO;
using Microsoft.AspNetCore.Mvc;
using System.Drawing;

namespace Webform
{
    public partial class School_form : System.Web.UI.Page
    {
     
        //string connection = @"Data Source=DESKTOP-F1BBQ1N\SK;Initial Catalog=Schoolproject;User ID=sa;Password=San@1234";
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-F1BBQ1N\SK;Initial Catalog=Schoolproject;User ID=sa;Password=San@1234");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Conquery = "exec proc_SchoolNamelist";
                conn.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter(Conquery, conn);
                DataTable dt = new DataTable();
                sqlda.Fill(dt);
                ListItemCollection collection = new ListItemCollection();
                collection.Add(new ListItem("Select"));
                SchoolNamedrop.DataSource = collection;
                SchoolNamedrop.DataSource = dt;
                SchoolNamedrop.DataBind();
                SchoolNamedrop.DataTextField = "varSchool_Name";
                SchoolNamedrop.DataValueField = "School_id";
                SchoolNamedrop.DataBind();
                conn.Close();
            }
            bindgrid();
        }

        protected void SchoolNamedrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Conquery = "exec proc_class_Namewithschoolid_list '" + SchoolNamedrop.Text + "'";
            conn.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter(Conquery, conn);
            DataTable dt = new DataTable();
            sqlda.Fill(dt);
            Classnamedrop.DataSource = dt;
            Classnamedrop.DataBind();
            Classnamedrop.DataTextField = "varclass_Name";
            Classnamedrop.DataValueField = "Class_id";
            Classnamedrop.DataBind();
            conn.Close();
        }
        
        [HttpPost]
        protected void Savebtn_Click(object sender, EventArgs e)
        {
                try
                {
                    string folderpath = Server.MapPath(@"~\Images\");
                    if (!Directory.Exists(folderpath))
                    {
                        Directory.CreateDirectory(folderpath);
                    }
                    FileUpload1.SaveAs(folderpath + Path.GetFileName(FileUpload1.FileName));
                    SqlCommand comm = new SqlCommand
                    {
                        CommandText = "Proc_insert_schooldata",
                        CommandType = CommandType.StoredProcedure,
                        Connection = conn
                    };
                    comm.Parameters.Add("@school_code", SqlDbType.Int).Value = Schoolcodetxt.Text;
                    comm.Parameters.Add("@Schoolname", SqlDbType.Int).Value = SchoolNamedrop.Text;
                    comm.Parameters.Add("@classname", SqlDbType.Int).Value = Classnamedrop.Text;
                    comm.Parameters.Add("@var_stream_name", SqlDbType.VarChar).Value = streamnametxt.Text;
                    comm.Parameters.Add("@bit_Default", SqlDbType.Bit).Value = Defaultchx.Checked;
                    comm.Parameters.Add("@image_file", SqlDbType.VarChar).Value = FileUpload1.PostedFiles[0].FileName;
                    conn.Open();
                    comm.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception ex) { }
            
            Cleardata();
            bindgrid();
        }

        public void bindgrid()
        {
            //SqlCommand bindcomm = new SqlCommand("exec proc_bind_schooldatalist", conn);
            //SqlDataAdapter dataAdapter = new SqlDataAdapter(bindcomm);
            //DataSet ds = new DataSet();
            //dataAdapter.Fill(ds);
            //GridView1.DataSource = ds;
            GridView1.DataBind();
        }

       

        public void Cleardata()
        {
            Schoolcodetxt.Text = "";
            // SchoolNamedrop.Text = "";
            // Classnamedrop.Text = "";
            streamnametxt.Text = "";
            Defaultchx.Checked = false;
        }

        

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

       

        

       

        protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
        {
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}