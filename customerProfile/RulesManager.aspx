<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RulesManager.aspx.cs" Inherits="customerProfile.RulesManager" %>
<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>
<%@ Register src="ControlAddRule.ascx" tagname="ControlAddRule" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add New Rule" />
    <asp:Panel ID="Panel1" runat="server">
        <uc1:ControlAddRule ID="ControlAddRule1" runat="server" Visible="False" />
    </asp:Panel>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="RuleID" DataSourceID="dsRuleList" EnableModelValidation="True" style="z-index: -1" BorderStyle="Inset" BorderWidth="5px" Width="1275px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit.png" ShowEditButton="True" DeleteImageUrl="~/images/delete.png" ShowDeleteButton="True" />
            <asp:BoundField DataField="RuleID" HeaderText="RuleID" InsertVisible="False" ReadOnly="True" SortExpression="RuleID" Visible="False" />
            <asp:BoundField DataField="RuleLabel" HeaderText="Rule" SortExpression="RuleLabel" />
            <asp:BoundField DataField="RuleDescription" HeaderText="Description" SortExpression="RuleDescription" />
            <asp:BoundField DataField="RuleRank" HeaderText="Rank" SortExpression="RuleRank" />
            <asp:TemplateField HeaderText="POS" SortExpression="POSCode">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1" DataTextField="POSCode" DataValueField="POSCode" SelectedValue='<%# Bind("POSCode") %>'>
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="customerProfile.DataClasses1DataContext" Select="new (POSCode)" TableName="POs">
                    </asp:LinqDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("POSCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Metric" SortExpression="MetricName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsMetric" DataTextField="MetricName" DataValueField="MetricName" SelectedValue='<%# Bind("MetricName") %>'>
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="dsMetric" runat="server" ContextTypeName="customerProfile.DataClasses1DataContext" Select="new (MetricName)" TableName="Metrics">
                    </asp:LinqDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("MetricName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Operator" SortExpression="RuleOperatorName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="dsRuleOperator" DataTextField="RuleOperatorName" DataValueField="RuleOperatorName" SelectedValue='<%# Bind("RuleOperatorName") %>'>
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="dsRuleOperator" runat="server" ContextTypeName="customerProfile.DataClasses1DataContext" Select="new (RuleOperatorName)" TableName="RuleOperators">
                    </asp:LinqDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("RuleOperatorName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MetricValue" HeaderText="Value" SortExpression="MetricValue" />
            <asp:TemplateField HeaderText="Start Date" SortExpression="RuleStartDateTime">
                <EditItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" SelectedDate='<%# Bind("RuleStartDateTime") %>' Width="200px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("RuleStartDateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date" SortExpression="RuleEndDateTime">
                <EditItemTemplate>
                    <asp:Calendar ID="ruleEndDateTime" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" SelectedDate='<%# Bind("RuleEndDateTime") %>' Width="200px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("RuleEndDateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Menu Template" SortExpression="MenuTemplateName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="dsMenu" DataTextField="MenuTemplateName" DataValueField="MenuTemplateName" SelectedValue='<%# Bind("MenuTemplateName") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsMenu" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [MenuTemplateName] FROM [MenuTemplate]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("MenuTemplateName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#000099" BorderStyle="None" ForeColor="White" HorizontalAlign="Center" />
        <PagerSettings Mode="NextPreviousFirstLast" />
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle BackColor="#F3F3F3" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsRuleList" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" InsertCommand="AddRule" InsertCommandType="StoredProcedure" SelectCommand="getRulesList" SelectCommandType="StoredProcedure" UpdateCommand="updateRules" UpdateCommandType="StoredProcedure" DeleteCommand="DeleteRule" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="RuleID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="RuleRank" Type="Int32" />
            <asp:Parameter Name="POSCode" Type="String" />
            <asp:Parameter Name="RuleLabel" Type="String" />
            <asp:Parameter Name="RuleDescription" Type="String" />
            <asp:Parameter Name="MetricName" Type="String" />
            <asp:Parameter Name="RuleOperatorName" Type="String" />
            <asp:Parameter Name="MetricValue" Type="Int32" />
            <asp:Parameter Name="RuleStartDateTime" Type="DateTime" />
            <asp:Parameter Name="RuleEndDateTime" Type="DateTime" />
            <asp:Parameter Name="MenuTemplateName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="RuleID" Type="Int32" />
            <asp:Parameter Name="RuleRank" Type="Int32" />
            <asp:Parameter Name="POSCode" Type="String" />
            <asp:Parameter Name="RuleLabel" Type="String" />
            <asp:Parameter Name="RuleDescription" Type="String" />
            <asp:Parameter Name="MetricName" Type="String" />
            <asp:Parameter Name="RuleOperatorName" Type="String" />
            <asp:Parameter Name="MetricValue" Type="Int32" />
            <asp:Parameter Name="RuleStartDateTime" Type="DateTime" />
            <asp:Parameter Name="RuleEndDateTime" Type="DateTime" />
            <asp:Parameter Name="MenuTemplateName" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
