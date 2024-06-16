using Business_logic_Layer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Web_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminUserController : ControllerBase
    {
        private readonly BALAdminUser _balAdminUser;

        public AdminUserController(BALAdminUser balAdminUser)
        {
            _balAdminUser = balAdminUser;
        }

        [HttpGet("UserDetailList")]
        public async Task<IActionResult> GetUserDetailList()
        {
            try
            {
                var userDetailList = await _balAdminUser.UserDetailsAsync();
                return Ok(userDetailList);
            }
            catch (Exception ex)
            {
                return StatusCode(500);
            }
        }
    }
}
