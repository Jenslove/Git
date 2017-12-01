using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Secure1.Models.BusinessViewModels;
using Serilog;

namespace Secure1.Controllers
{
	[Authorize]
	[Route("[controller]/[action]")]
	public class UploadController : Controller
    {
        // GET: Upload
        public ActionResult Index()
        {
			ViewData["Message"] = "Getting upload working.";
			return View();
        }

		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> UploadFile(UploadViewModel model, string returnUrl = null) {
			ViewData["ReturnUrl"] = returnUrl;
			List<IFormFile> files = new List<IFormFile>(model.FilePath);
			string filePath = "";
			string msg = "";
			string ret = "";
			if (ModelState.IsValid) {
				//long size = files.Sum(f => f.Length);
				//string loggedUser = User.Identity.Name;

				foreach (var formFile in files) {
					if (formFile.Length > 0) {
						filePath = Path.Combine(Directory.GetCurrentDirectory(), "Business", (Guid.NewGuid().ToString() + "-" + DateTime.Now.ToString("yyyyMMddHHmmssff")));
						using (var stream = new FileStream(filePath, FileMode.Create)) {
							await formFile.CopyToAsync(stream);
							msg = String.Format("File {0} from at {1} was successfully uploaded to {2}.", formFile.FileName, formFile.Name, filePath);
							Log.Information(msg);
							ret += msg + Environment.NewLine;
						}
					}
				}
				// Don't rely on or trust the FileName property without validation.
				ViewData["Message"] = ret;
			} else {
				ViewData["Message"] = "Something was wrong with the submitted information. Please check input and try again.";
				Log.Error(msg);
			}
			return View("Index");
			//return RedirectToAction(nameof(UploadController.Index), "Upload");
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> UploadFileByte(UploadViewModel model, string returnUrl = null) {
			ViewData["ReturnUrl"] = returnUrl;
			List<IFormFile> files = new List<IFormFile>(model.FilePath);
			string filePath = "";
			string msg = "";
			string ret = "";
			if (ModelState.IsValid) {
				//long size = files.Sum(f => f.Length);
				//string loggedUser = User.Identity.Name;

				foreach (var formFile in files) {
					if (formFile.Length > 0) {
						filePath = Path.Combine(Directory.GetCurrentDirectory(), "Business", (Guid.NewGuid().ToString() + "-" + DateTime.Now.ToString("yyyyMMddHHmmssff")));
						using (var stream = new FileStream(filePath, FileMode.Create)) {
							await formFile.CopyToAsync(stream);
							msg = String.Format("File {0} from at {1} was successfully uploaded to {2}.", formFile.FileName, formFile.Name, filePath);
							Log.Information(msg);
							ret += msg + Environment.NewLine;
						}
					}
				}
				// Don't rely on or trust the FileName property without validation.  
				ViewData["Message"] = ret;
			} else {
				ViewData["Message"] = "Something was wrong with the submitted information. Please check input and try again.";
				Log.Error(msg);
			}
			return View("Index");
			//return RedirectToAction(nameof(UploadController.Index), "Upload");
		}

		#region OtherPrebuilt
		// GET: Upload/Details/5
		public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Upload/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Upload/Create
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

        // GET: Upload/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Upload/Edit/5
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

        // GET: Upload/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Upload/Delete/5
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