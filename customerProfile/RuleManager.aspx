<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RuleManager.aspx.cs" Inherits="customerProfile.RuleManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
    
    </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RuleID" DataSourceID="RulesDataSource1" EnableModelValidation="True" AllowPaging="True">
            <Columns>
                <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit.png" ShowEditButton="True" />
                <asp:BoundField DataField="RuleID" HeaderText="RuleID" InsertVisible="False" ReadOnly="True" SortExpression="RuleID" ShowHeader="False" Visible="False" />
                <asp:BoundField DataField="RuleLabel" HeaderText="RuleLabel" SortExpression="RuleLabel" />
                <asp:BoundField DataField="RuleDescription" HeaderText="RuleDescription" SortExpression="RuleDescription" />
                <asp:BoundField DataField="RuleRank" HeaderText="RuleRank" SortExpression="RuleRank" />
                <asp:TemplateField HeaderText="POSCode" SortExpression="POSCode">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsPOS" DataTextField="POSCode" DataValueField="POSCode" SelectedValue='<%# Bind("POSCode") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsPOS" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [POSCode] FROM [POS]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("POSCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MetricName" SortExpression="MetricName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsMetric" DataTextField="MetricName" DataValueField="MetricName" SelectedValue='<%# Bind("MetricName") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsMetric" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [MetricName] FROM [Metric]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("MetricName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RuleOperatorName" SortExpression="RuleOperatorName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="dsRuleOperator" DataTextField="RuleOperatorName" DataValueField="RuleOperatorName" SelectedValue='<%# Bind("RuleOperatorName") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsRuleOperator" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [RuleOperatorName] FROM [RuleOperator]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("RuleOperatorName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="MetricValue" HeaderText="MetricValue" SortExpression="MetricValue" />
                <asp:BoundField DataField="RuleStartDateTime" HeaderText="RuleStartDateTime" SortExpression="RuleStartDateTime" />
                <asp:BoundField DataField="RuleEndDateTime" HeaderText="RuleEndDateTime" SortExpression="RuleEndDateTime" />
            </Columns>
            <PagerSettings Mode="NextPreviousFirstLast" />
        </asp:GridView>
        <asp:SqlDataSource ID="RulesDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="getRulesList" SelectCommandType="StoredProcedure" UpdateCommand="updateRules" UpdateCommandType="StoredProcedure" InsertCommand="AddRule" InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="RuleRank" Type="Int32" />
                <asp:Parameter Name="POSID" Type="Int32" />
                <asp:Parameter Name="RuleLabel" Type="String" />
                <asp:Parameter Name="RuleDescription" Type="String" />
                <asp:Parameter Name="MetricID" Type="Int32" />
                <asp:Parameter Name="RuleOperatorID" Type="Int32" />
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
        <p>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/add.png" OnClick="ImageButton1_Click" />
&nbsp;Add Rule</p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="RuleID" DataSourceID="RulesDataSource1" DefaultMode="Insert" EnableModelValidation="True" EnableTheming="False" OnItemInserted="FormView1_ItemInserted" Visible="False">
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
                RuleLabel:<br />&nbsp;
                <asp:TextBox ID="RuleLabelTextBox" runat="server" height="22px" Text='<%# Bind("RuleLabel") %>' width="334px" />
                <br />
                RuleDescription:<br />&nbsp;
                <asp:TextBox ID="RuleDescriptionTextBox" runat="server" Text='<%# Bind("RuleDescription") %>' width="334px" />
                <br />
                RuleRank:
                <br />
                <asp:TextBox ID="RuleRankTextBox" runat="server" height="22px" Text='<%# Bind("RuleRank") %>' width="128px" />
                <br />
                POSCode:<br />&nbsp;
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="dsPOS" DataTextField="POSCode" DataValueField="POSCode" height="22px" SelectedValue='<%# Bind("POSCode") %>' width="128px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsPOS" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [POSCode] FROM [POS]"></asp:SqlDataSource>
                <br />
                MetricName:<br /> &nbsp;<asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="dsMetric" DataTextField="MetricName" DataValueField="MetricName" height="22px" SelectedValue='<%# Bind("MetricName") %>' width="136px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsMetric" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [MetricName] FROM [Metric]"></asp:SqlDataSource>
                <br />
                RuleOperatorName:<br />&nbsp;
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="dsRuleOperator" DataTextField="RuleOperatorName" DataValueField="RuleOperatorName" height="22px" SelectedValue='<%# Bind("RuleOperatorName") %>' width="136px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsRuleOperator" runat="server" ConnectionString="<%$ ConnectionStrings:IVRCPRConnectionString %>" SelectCommand="SELECT [RuleOperatorName] FROM [RuleOperator]"></asp:SqlDataSource>
                <br />
                MetricValue:<br /> &nbsp;<asp:TextBox ID="MetricValueTextBox" runat="server" height="22px" Text='<%# Bind("MetricValue") %>' width="136px" />
                <br />
                RuleStartDateTime:<br />&nbsp;
                <asp:TextBox ID="RuleStartDateTimeTextBox" runat="server" height="22px" Text='<%# Bind("RuleStartDateTime") %>' width="136px" />
                <br />
                RuleEndDateTime:<br /> &nbsp;<asp:TextBox ID="RuleEndDateTimeTextBox" runat="server" height="22px" Text='<%# Bind("RuleEndDateTime") %>' width="136px" />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add Rule" />
                &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancel" />
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
    </form>
    <p>
        \</p>
</body>
</html>
