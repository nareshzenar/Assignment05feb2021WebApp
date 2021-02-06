using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment05feb2021
{
    public partial class Assignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                PopulateContinentsDropDownList();
            }
        }

        private void PopulateContinentsDropDownList()
        {
            ddlCountries.DataSource = GetData("spGetCountries", null);
            ddlCountries.DataBind();

            ListItem liCountry = new ListItem("Select Country", "-1");
            ddlCountries.Items.Insert(0, liCountry);

            ListItem liState = new ListItem("Select State", "-1");
            ddlStates.Items.Insert(0, liState);

            ListItem liCity = new ListItem("Select City", "-1");
            ddlCities.Items.Insert(0, liCity);

            ddlStates.Enabled = false;
            ddlCities.Enabled = false;
        }

        private DataSet GetData(string SPName, SqlParameter SPParameter)
        {
            string CS = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter(SPName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SPParameter != null)
            {
                da.SelectCommand.Parameters.Add(SPParameter);
            }
            DataSet DS = new DataSet();
            da.Fill(DS);
            return DS;
        }

        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountries.SelectedValue == "-1")
            {
                ddlCities.SelectedIndex = 0;
                ddlStates.SelectedIndex = 0;
                ddlCities.Enabled = false;
                ddlStates.Enabled = false;
            }
            else
            {
                ddlStates.Enabled = true;

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@CountryId";
                parameter.Value = ddlCountries.SelectedValue;

                ddlStates.DataSource = GetData("spGetStatesByCountryId", parameter);
                ddlStates.DataBind();

                ListItem liState = new ListItem("Select State", "-1");
                ddlStates.Items.Insert(0, liState);

                ddlCities.SelectedIndex = 0;
                ddlCities.Enabled = false;
            }
        }

        protected void ddlStates_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStates.SelectedValue == "-1")
            {
                ddlCities.SelectedIndex = 0;
                ddlCities.Enabled = false;
            }
            else
            {
                ddlCities.Enabled = true;

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@StateId";
                parameter.Value = ddlStates.SelectedValue;

                ddlCities.DataSource = GetData("spGetCitiesByStateId", parameter);
                ddlCities.DataBind();

                ListItem liCity = new ListItem("Select City", "-1");
                ddlCities.Items.Insert(0, liCity);
            }
        }
    }
}