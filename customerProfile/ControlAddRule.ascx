<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlAddRule.ascx.cs" Inherits="customerProfile.ControlAddRule" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 339px;
    }
</style>
<asp:Label ID="Rule" runat="server" Text="Rule"></asp:Label>
&nbsp;<asp:TextBox ID="txtRule" runat="server"></asp:TextBox>
&nbsp;&nbsp;
<asp:Label ID="Decription" runat="server" Text="Description"></asp:Label>
&nbsp;<asp:TextBox ID="txtDescrip" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="Rank" runat="server" Text="Rank"></asp:Label>
&nbsp;<asp:TextBox ID="txtRank" runat="server"></asp:TextBox>
&nbsp;<p>
    &nbsp;</p>
<asp:Label ID="POS" runat="server" Text="POS"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlPOS" runat="server" DataSourceID="dsPOS" DataTextField="POSCode" DataValueField="POSCode">
</asp:DropDownList>
<asp:SqlDataSource ID="dsPOS" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [POSCode] FROM [POS]"></asp:SqlDataSource>
<asp:SqlDataSource ID="dsMetric" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [MetricName] FROM [Metric]"></asp:SqlDataSource>
<asp:SqlDataSource ID="dsOperator" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [RuleOperatorName] FROM [RuleOperator]"></asp:SqlDataSource>
<p>
    &nbsp;</p>
<asp:Label ID="Metric" runat="server" Text="Metric"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlMetric" runat="server" DataSourceID="dsMetric" DataTextField="MetricName" DataValueField="MetricName">
</asp:DropDownList>
<asp:Label ID="Operator" runat="server" Text="Operator"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlOp" runat="server" DataSourceID="dsOperator" DataTextField="RuleOperatorName" DataValueField="RuleOperatorName">
</asp:DropDownList>
&nbsp;
<asp:Label ID="Value" runat="server" Text="Value"></asp:Label>
&nbsp;<asp:TextBox ID="txtValue" runat="server"></asp:TextBox>
<p>
    &nbsp;</p>
<table class="auto-style1">
    <tr>
        <td class="auto-style2">
            <asp:Label ID="StartDate" runat="server" Text="Start Date" Font-Size="Large"></asp:Label>
        </td>
        <td>
            <asp:Label ID="EndDate" runat="server" Text="End  Date" Font-Size="Large"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Calendar ID="calStart" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
        </td>
        <td>
            <asp:Calendar ID="calEnd" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
        </td>
    </tr>
</table>
<br />
<asp:Label ID="MenuTemplate" runat="server" Text="Menu Template"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlMenu" runat="server" DataSourceID="dsMenu" DataTextField="MenuTemplateName" DataValueField="MenuTemplateName">
</asp:DropDownList>
<asp:SqlDataSource ID="dsMenu" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [MenuTemplateName] FROM [MenuTemplate] ORDER BY [MenuTemplateName]"></asp:SqlDataSource>
<br />
<br />
<asp:Button ID="Button1" runat="server" Text="Add Rule" OnClick="Button1_Click" />



&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />



