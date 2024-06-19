<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="School_form.aspx.cs" Inherits="Webform.School_form" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 277px;
        }
    </style>


     <script type="text/javascript" language="javascript">
    function numeric(evt)
    {
   var charCode = (evt.which) ? evt.which : event.keyCode
   if(charCode > 31 && ((charCode >= 48 && charCode <= 57) || charCode == 46))
   return true;
   else
   {
    alert('Please Enter Numeric values.');
    return false;
   }
}
     </script>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <table>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="SchoolCode" Text="Code"></asp:Label>
                        <br />
                        <asp:TextBox runat="server" ID="Schoolcodetxt" Style="margin-bottom: 0px" onkeypress="return numeric(event)"></asp:TextBox>
                    
         

                    </td>
                    <td>
                        <asp:Label runat="server" ID="Schoolname" Text="School Name"></asp:Label>
                        <br />
                        <asp:DropDownList ID="SchoolNamedrop" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SchoolNamedrop_SelectedIndexChanged">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Classname" Text="Class Name"></asp:Label>
                        <br />
                        <asp:DropDownList ID="Classnamedrop" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList></td>
                    <td class="auto-style1">
                        <asp:Label runat="server" ID="Streanname" Text="Stream Name"></asp:Label>
                        <br />
                        <%--  <asp:DropDownList ID="Streannametxt" runat="server"></asp:DropDownList>--%>
                        <asp:TextBox runat="server" ID="streamnametxt" Style="margin-bottom: 0px"></asp:TextBox>
                        <br />
                        <br />

                        <asp:CheckBox ID="Defaultchx" runat="server" Text=" is Default" />
                        <br />
                        <br />
                        <asp:Button ID="Savebtn" runat="server" Text="Save" OnClick="Savebtn_Click" />
                    </td>
                    <td>

                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        
                         </td>
                </tr>
            </table>
          
                                <asp:GridView ID="GridView1" DataKeyNames="school_code" runat="server" DataSourceID="SqlDataSource1"
                                    AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
                                    ShowFooter="true" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                                    OnRowCommand="GridView1_RowCommand" GridLines="Horizontal" Height="341px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1062px" OnRowEditing="GridView1_RowEditing">
                                    <Columns>
                                        <asp:TemplateField>
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/project_Images/OK_Check.png" ToolTip="Update" Height="20px" Width="20px" />
                                                <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/project_Images/Cancel.png" ToolTip="Cancel" Height="20px" Width="20px" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="~/project_Images/Edit.png" ToolTip="Edit" Height="20px" Width="20px" OnClick="imgbtnEdit_Click" />
                                                <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server" ImageUrl="~/project_Images/Delete.png" ToolTip="Delete" Height="20px" Width="20px" />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Code">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="grid_school_code" runat="server" Text='<%#Eval("school_code") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_grid_school_code" runat="server" Text='<%#Eval("school_code") %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="School Name">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="gridSchoolNamedrop" runat="server"
                                                    AutoPostBack="true">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSchoolname" runat="server" Text='<%#Eval("Schoolname") %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Class Name">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="gridClassNamedrop" runat="server"
                                                    AutoPostBack="true">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblclassname" runat="server" Text='<%#Eval("classname") %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Stream Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="var_grid_stream_name" runat="server" Text='<%#Eval("var_stream_name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_grid_stream_name" runat="server" Text='<%#Eval("var_stream_name") %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Default">
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="bit_grid_Default" runat="server" Checked='<%#Eval("bit_Default") %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_grid_Default" runat="server" Text='<%#Eval("bit_Default") %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Image">
                                            <EditItemTemplate>
                                                <asp:FileUpload ID="gridFileUpload1" runat="server" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Image ID="images" runat="server" ImageUrl='<%#Eval("image_file") %>' Height="150px" Width="120px" />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                    </Columns>

                                    <HeaderStyle BackColor="#61A6F8" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                </asp:GridView>
                           
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolprojectConnectionString %>" 
                            SelectCommand="exec proc_bind_schooldatalist"
                            
                            ></asp:SqlDataSource>
                   

 

        </div>
    </form>
</body>
</html>
