using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Secure1.DataBusiness;
using Microsoft.EntityFrameworkCore;
using Secure1.Models.BusinessViewModels;
using Newtonsoft.Json;

namespace Secure1.Controllers
{
    public class DashboardController : Controller
    {
		private BizDbContext _context;
		public DashboardController(BizDbContext context) {
			_context = context;
		}
		// GET: Dashboard
		public ActionResult Index() {
			ViewData["Message"] = "Getting Dashboard working.";

			var vu = _context.User
						.Include(o => o.OrganizationNavigation)
						.Include(p => p.Project).ThenInclude(t => t.Thing).ThenInclude(v => v.Version)
						.Where(u => u.Email == User.Identity.Name).First();
			var model = vu;
			return View(model);
			//			return View();
		}

		[HttpGet]
		[Route("Dashboard/KOData")]
		public ActionResult KOData() {
			//var x = 1;
			var vu = _context.User
						//.Include(o => o.OrganizationNavigation)
						//.Include(p => p.Project).ThenInclude(t => t.Thing).ThenInclude(v => v.Version)
						.Where(u => u.Email == User.Identity.Name).First();
			//var ve = from u in _context.User
			//			join p in _context.Project on u.Id equals p.User
			//			join t in _context.Thing on p.Id equals t.Project
			//			join v in _context.Version on t.Id equals v.Thing
			//			select new { Id = v.Id, Thing = v.Thing, CreateDate = v.CreateDate, DisplayName = v.DisplayName, Name = v.Name, FullPath = v.FullPath, FileType = v.FileType, Size = v.Size, Desc = v.Desc, Comment = v.Comment };

			//var jvu = new JsonResult(vu);
			//return jvu;
			return new JsonResult(vu);
		}

		//[HttpGet]
		//[Route("Dashboard/KOData2")]
		//public object KOData2() {
		//	//var x = 1;
		//	var vu = _context.User
		//				//.Include(o => o.OrganizationNavigation)
		//				//.Include(p => p.Project).ThenInclude(t => t.Thing)//.ThenInclude(v => v.Version)
		//				.Where(u => u.Email == User.Identity.Name).First();
		//	//var ve = from u in _context.User
		//	//			join p in _context.Project on u.Id equals p.User
		//	//			join t in _context.Thing on p.Id equals t.Project
		//	//			join v in _context.Version on t.Id equals v.Thing
		//	//			select new { Id = v.Id, Thing = v.Thing, CreateDate = v.CreateDate, DisplayName = v.DisplayName, Name = v.Name, FullPath = v.FullPath, FileType = v.FileType, Size = v.Size, Desc = v.Desc, Comment = v.Comment };

		//	//var jvu = new JsonResult(vu);
		//	////var j = new JsonResult(vu);
		//	////return j.ToString();
		//	//return vu;
		//	return new JsonResult(vu);
		//}

		[HttpPost]
		[Route("Dashboard/SaveArchive")]
		public bool SaveArchive([FromBody] Models.BusinessViewModels.ArchiveInbound inData) {
			try {
				var x = inData;
				var project = _context.Project
									.Where(p => p.Id == inData.Id).First();
				project.Archive = !inData.Archive;
				_context.SaveChanges();
				return true;
			} catch (Exception e) {
				return false;
			}
		}

		#region OtherPrebuilt
		// GET: Dashboard/Details/5
		public ActionResult Details(int id) {
			return View();
		}

		// GET: Dashboard/Create
		public ActionResult Create() {
			return View();
		}

		// POST: Dashboard/Create
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create(IFormCollection collection) {
			try {
				return RedirectToAction(nameof(Index));
			} catch {
				return View();
			}
		}

		// GET: Dashboard/Edit/5
		public ActionResult Edit(int id) {
			return View();
		}

		// POST: Dashboard/Edit/5
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit(int id, IFormCollection collection) {
			try {
				return RedirectToAction(nameof(Index));
			} catch {
				return View();
			}
		}

		// GET: Dashboard/Delete/5
		public ActionResult Delete(int id) {
			return View();
		}

		// POST: Dashboard/Delete/5
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Delete(int id, IFormCollection collection) {
			try {
				return RedirectToAction(nameof(Index));
			} catch {
				return View();
			}
		}
		#endregion
	}
}