using AngularServer01.Classes;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Serialization;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AngularServer01.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        // GET: api/<CartController>
        [HttpGet]
        public string Get()
        {

            DataTable dt = new DataTable();
            string connectionString =
                @"Server=(localdb)\MSSQLLocalDB ;Database=RobotShop;Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                //connection.Open();
                using (SqlCommand command = new SqlCommand("CartItemSelectAllByUserID", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    /*
                     * DJS: this is a hack for now.  We need to get the UserID from the session
                     * at the Client and pass it to the server.  For now, we are hardcoding the
                     * UserID at the server just to make it work.
                     */
                    command.Parameters.AddWithValue("@UserID", 1);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        connection.Open();
                        adapter.Fill(dt);
                    }
                }
            }
            var jsonSerializerSettings = new JsonSerializerSettings
            {
                // DJS: I have no idea how the following line of code works
                // apparently there are *many* options available.
                ContractResolver = new CamelCasePropertyNamesContractResolver()
            };
            string sJsonOutput = JsonConvert.SerializeObject(dt, jsonSerializerSettings);

            return (sJsonOutput);
        }

        // GET api/<CartController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<CartController>
        [HttpPost]
        public int Post([FromBody] Product newproduct )
        {
            int nCartID = 0;
            // insert new product into the database via the CatalogInsert stored procedure
            string connectionString =
                @"Server=(localdb)\MSSQLLocalDB ;Database=RobotShop;Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("CartInsert", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ProductID", newproduct.ProductID);
                    command.Parameters.AddWithValue("@CategoryID", newproduct.CategoryID);
                    command.Parameters.AddWithValue("@Name", newproduct.Name);
                    command.Parameters.AddWithValue("@Description", newproduct.Description);
                    command.Parameters.AddWithValue("@ImageName", newproduct.ImageName);
                    command.Parameters.AddWithValue("@Price", newproduct.Price);
                    command.Parameters.AddWithValue("@Discount", newproduct.Discount);

                    // retrieve the new CartID as an output parameter
                    SqlParameter param = new SqlParameter("@NewCartID", SqlDbType.Int);
                    param.Direction = ParameterDirection.Output;
                    command.Parameters.Add(param);

                    command.ExecuteNonQuery();
                    nCartID = (int)param.Value;
                }
            }
            return nCartID;
        }

        // PUT api/<CartController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DJS: need to update the Cart table with a valid UserID

        // DELETE api/<CartController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            // code for deleting a product from the cart
            string connectionString =
                @"Server=(localdb)\MSSQLLocalDB ;Database=RobotShop;Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("CartDeleteByCartID", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@CartID", id);
                    command.ExecuteNonQuery();
                }
            }

        }
    }
}
