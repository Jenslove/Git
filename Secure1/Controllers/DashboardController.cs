using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Secure1.DataBusiness;
using Microsoft.EntityFrameworkCore;
using Secure1.Models.BusinessViewModels;

namespace Secure1.Controllers
{
    public class DashboardController : Controller
    {
		private BizDbContext _context;
		public DashboardController(BizDbContext context) {
			_context = context;
		}
		// GET: Dashboard
		public ActionResult Index()
        {
			ViewData["Message"] = "Getting Dashboard working.";

			var vu = _context.User
						.Include(o => o.OrganizationNavigation)
						.Include(p => p.Project).ThenInclude(t => t.Thing).ThenInclude(v => v.Version)
						.Where(u => u.Id == 1).First();

			var model = vu;

			return View(model);

//			return View();
        }

		#region OtherPrebuilt
		// GET: Dashboard/Details/5
		public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Dashboard/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Dashboard/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Dashboard/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Dashboard/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Dashboard/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Dashboard/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
		#endregion
	}
}