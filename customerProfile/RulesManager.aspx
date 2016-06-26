<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RulesManager.aspx.cs" Inherits="customerProfile.RulesManager" %>
<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add New Rule" />
    <asp:Panel ID="Panel1" runat="server">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="RuleID" DataSourceID="dsRuleList" DefaultMode="Insert" EnableModelValidation="True" OnItemUpdated="FormView1_ItemUpdated" Visible="False" OnItemInserted="FormView1_ItemInserted">
            <EditItemTemplate>
                RuleID:
                <asp:Label ID="RuleIDLabel1" runat="server" Text='<%# Eval("RuleID") %>' />
                <br />
                RuleLabel:
                <asp:TextBox ID="RuleLabelTextBox" runat="server" Text='<%# Bind("RuleLabel") %>' />
                <br />
                RuleDescription:
                <asp:TextBox ID="RuleDescriptionTextBox" runat="server" Text='<%# Bind("RuleDescription") %>' />
                <br />
                RuleRank:
                <asp:TextBox ID="RuleRankTextBox" runat="server" Text='<%# Bind("RuleRank") %>' />
                <br />
                POSCode:
                <asp:TextBox ID="POSCodeTextBox" runat="server" Text='<%# Bind("POSCode") %>' />
                <br />
                MetricName:
                <asp:TextBox ID="MetricNameTextBox" runat="server" Text='<%# Bind("MetricName") %>' />
                <br />
                RuleOperatorName:
                <asp:TextBox ID="RuleOperatorNameTextBox" runat="server" Text='<%# Bind("RuleOperatorName") %>' />
                <br />
                MetricValue:
                <asp:TextBox ID="MetricValueTextBox" runat="server" Text='<%# Bind("MetricValue") %>' />
                <br />
                RuleStartDateTime:
                <asp:TextBox ID="RuleStartDateTimeTextBox" runat="server" Text='<%# Bind("RuleStartDateTime") %>' />
                <br />
                RuleEndDateTime:
                <asp:TextBox ID="RuleEndDateTimeTextBox" runat="server" Text='<%# Bind("RuleEndDateTime") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Rule<br />&nbsp;
                <asp:TextBox ID="RuleLabelTextBox" runat="server" Text='<%# Bind("RuleLabel") %>' />
                <br />
                Description<br />&nbsp;
                <asp:TextBox ID="RuleDescriptionTextBox" runat="server" Text='<%# Bind("RuleDescription") %>' />
                <br />
                Rank<br />&nbsp;
                <asp:TextBox ID="RuleRankTextBox" runat="server" Text='<%# Bind("RuleRank") %>' />
                <br />
                POS<br />&nbsp;
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="dsPOS" DataTextField="POSCode" DataValueField="POSCode" SelectedValue='<%# Bind("POSCode") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsPOS" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [POSCode] FROM [POS]"></asp:SqlDataSource>
                <br />
                Metric<br /> <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="dsMetric" DataTextField="MetricName" DataValueField="MetricName" SelectedValue='<%# Bind("MetricName") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsMetric" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [MetricName] FROM [Metric]"></asp:SqlDataSource>
                <br />
                Operator<br />&nbsp;
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="dsOperator" DataTextField="RuleOperatorName" DataValueField="RuleOperatorName" SelectedValue='<%# Bind("RuleOperatorName") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsOperator" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [RuleOperatorName] FROM [RuleOperator]"></asp:SqlDataSource>
                <br />
                Value<br />&nbsp;
                <asp:TextBox ID="MetricValueTextBox" runat="server" Text='<%# Bind("MetricValue") %>' />
                <br />
                Start Date<asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" SelectedDate='<%# Bind("RuleStartDateTime") %>' Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
                <br />
&nbsp;<br />End Date<br /> <asp:Calendar ID="Calendar3" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" SelectedDate='<%# Bind("RuleEndDateTime") %>' Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add Rule" OnClick="InsertButton_Click" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClick="InsertCancelButton_Click" />
            </InsertItemTemplate>
            <ItemTemplate>
                RuleID:
                <asp:Label ID="RuleIDLabel" runat="server" Text='<%# Eval("RuleID") %>' />
                <br />
                RuleLabel:
                <asp:Label ID="RuleLabelLabel" runat="server" Text='<%# Bind("RuleLabel") %>' />
                <br />
                RuleDescription:
                <asp:Label ID="RuleDescriptionLabel" runat="server" Text='<%# Bind("RuleDescription") %>' />
                <br />
                RuleRank:
                <asp:Label ID="RuleRankLabel" runat="server" Text='<%# Bind("RuleRank") %>' />
                <br />
                POSCode:
                <asp:Label ID="POSCodeLabel" runat="server" Text='<%# Bind("POSCode") %>' />
                <br />
                MetricName:
                <asp:Label ID="MetricNameLabel" runat="server" Text='<%# Bind("MetricName") %>' />
                <br />
                RuleOperatorName:
                <asp:Label ID="RuleOperatorNameLabel" runat="server" Text='<%# Bind("RuleOperatorName") %>' />
                <br />
                MetricValue:
                <asp:Label ID="MetricValueLabel" runat="server" Text='<%# Bind("MetricValue") %>' />
                <br />
                RuleStartDateTime:
                <asp:Label ID="RuleStartDateTimeLabel" runat="server" Text='<%# Bind("RuleStartDateTime") %>' />
                <br />
                RuleEndDateTime:
                <asp:Label ID="RuleEndDateTimeLabel" runat="server" Text='<%# Bind("RuleEndDateTime") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </asp:Panel>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="RuleID" DataSourceID="dsRuleList" EnableModelValidation="True" style="z-index: -1" BorderStyle="Inset" BorderWidth="5px" Width="1275px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit.png" ShowEditButton="True" />
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
        </Columns>
        <HeaderStyle BackColor="#000099" BorderStyle="None" ForeColor="White" HorizontalAlign="Center" />
        <PagerSettings Mode="NextPreviousFirstLast" />
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle BackColor="#99CCFF" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsRuleList" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" InsertCommand="AddRule" InsertCommandType="StoredProcedure" SelectCommand="getRulesList" SelectCommandType="StoredProcedure" UpdateCommand="updateRules" UpdateCommandType="StoredProcedure">
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
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
