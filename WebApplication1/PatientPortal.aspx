﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientPortal.aspx.cs" Inherits="WebApplication1.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <title>Patient Portal</title>
        <style>      
        .navbar {
        background-color: #333;
        overflow: hidden;
                height: 48px;
            }
      .navbar a {
        float: right;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
      }
      .navbar a:hover {
        background-color: #ddd;
        color: black;
      }

        </style>


</head>

<body style:"Bold">
    <div class="navbar">
      <a href="#">About Us</a>
      <a href="#">Contact Us</a>
      <a href="PatientLogin.aspx">Patient Login</a>
      <a href="ProviderLogin.aspx">Provider Login</a>
      <a href="HomePage.aspx">Home</a>
    </div>

    <form id="form1" runat="server">
    <br />
        <asp:Button ID="Button1" BorderStyle="Double" BackColor="LightGray" runat="server" OnClick="Button1_Click" Text="Edit Personal Information" Height="51px" Width="302px" Font-Bold="True" Font-Size="Medium" Font-Strikeout="False" />
       <asp:Button ID="Button3" BorderStyle="Double" BackColor="LightGray" runat="server" OnClick="Button3_Click" Text="Schedule Specialist Appointment" Height="51px" Width="388px" Font-Bold="True" Font-Overline="False" Font-Size="Medium" />
       <asp:Button ID="Button2" BorderStyle="Double" BackColor="LightGray" runat="server" OnClick="Button2_Click" Text="Schedule PCP Follow-Up" Height="51px" Width="293px" BorderColor="Black" Font-Bold="True" Font-Size="Medium" />
       <asp:Button ID="Button4" BorderStyle="Double" BackColor="LightGray" runat="server" OnClick="Button2_Click" Text="Billing" Height="51px" Width="247px" BorderColor="Black" Font-Bold="True" Font-Size="Medium" style="margin-left: 0px" />
    <br />

        <div>
   <h1 id="welcomeHeader" runat="server"> 
       &nbsp;</h1>
            <p runat="server"> 
                &nbsp;</p>
            <h1>Upcoming Appointments</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID"
                OnRowCommand="GridView1_RowCommand" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="appointmentID" HeaderText="AppointmentID" />
                    <asp:BoundField DataField="DoctorName" HeaderText="Doctor" />
                    <asp:BoundField DataField="Spec" HeaderText="PCP or Specialist" />
                    <asp:BoundField DataField="OfficeLocation" HeaderText="Office Location" />
                    <asp:BoundField DataField="Approval" HeaderText="Approval Status" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="Time" HeaderText="Time" />
                    <asp:BoundField DataField="Confirm" HeaderText="Confirmation Status" />
                    <asp:BoundField DataField="TimeToConfirm" HeaderText="Time to Confirm" />
                    <asp:ButtonField ButtonType="button" Text="RESCHEDULE" CommandName="EditAppointment" HeaderText="Reschedule" />
                    <asp:ButtonField ButtonType="button" Text="CONFIRM" CommandName="ConfirmAppointment" HeaderText="Confirm" />
                    <asp:ButtonField ButtonType="button" Text="CANCEL" CommandName="CancelAppointment" HeaderText="Cancel" />

                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>

        <br />
        <br />
        <div>
            <h1>Previous Appointments</h1>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID"
                OnRowCommand="GridView2_RowCommand" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="appointmentID" HeaderText="AppointmentID" />
                    <asp:BoundField DataField="DoctorName" HeaderText="Doctor" />
                    <asp:BoundField DataField="Spec" HeaderText="PCP or Specialist" />
                    <asp:BoundField DataField="OfficeLocation" HeaderText="Office Location" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="Time" HeaderText="Time" />
                    <asp:ButtonField ButtonType="button" Text="VIEW" CommandName="ViewReport" HeaderText="Report" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>

        <script>
            $(document).ready(function () {
                // Attach click event handler to the approve and deny buttons
                $("input[type='button'][value='CONFIRM'], input[type='button'][value='CANCEL']").click(function (e) {
                    // Prevent the button from performing its default action
                    e.preventDefault();
                    // Open the dialog box
                    var message = "ARE YOU SURE YOU WANT TO " + $(this).val() + " THIS APPOINTMENT? PRESS OK TO CONFIRM YOUR CHOICE";
                    if (confirm(message)) {
                        // If the user confirms, submit the form
                        $(this).closest("form").submit();
                    }
                    else {
                        return false;
                    }
                });
            });
        </script>
    </form>
    </body>
</html>