using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Secure1.Models.BusinessViewModels;
using Secure1.DataBusiness;
using Serilog;

namespace Secure1.Controllers
{
	[Authorize]
	public class UploadController : Controller {
		private BizDbContext _context;
		public UploadController(BizDbContext context) {
			_context = context;
		}
        // GET: Upload
        public ActionResult Index()
        {
			ViewData["Message"] = "Getting upload working.";

			List<DataBusiness.Version> versionList = new List<DataBusiness.Version>();
			versionList = (from version in _context.Version
								select version).ToList();
			var model = new UploadViewModel() {
				ListOfVersions = versionList
			};

			return View(model);
        }

		[HttpPost]
		[ValidateAntiForgeryToken]
		[Route("[controller]/[action]")]
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
							Serilog.Log.Information(msg);
							ret += msg + Environment.NewLine;
						}
					}
				}
				// Don't rely on or trust the FileName property without validation.
				ViewData["Message"] = ret;
			} else {
				ViewData["Message"] = "Something was wrong with the submitted information. Please check input and try again.";
				Serilog.Log.Error(msg); //logging anything that might have been in msg
			}
			return View("Index");
			//return RedirectToAction(nameof(UploadController.Index), "Upload");
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		[Route("[controller]/[action]")]
		public async Task<IActionResult> UploadFileByte(UploadViewModel model, string returnUrl = null) {
			ViewData["ReturnUrl"] = returnUrl;
			List<IFormFile> files = new List<IFormFile>(model.FilePath);
			string msg = "";
			string ret = "";
			int loc = 0;
			string fileName = "";
			if (ModelState.IsValid) {
				foreach (var formFile in files) {
					if (formFile.Length > 0) {
						loc = formFile.FileName.LastIndexOf('\\');
						fileName = formFile.FileName.Substring(loc+1);
						using (var memoryStream = new MemoryStream()) {
							await formFile.CopyToAsync(memoryStream);
							var version = new DataBusiness.Version {
								Thing = 3,
								CreateDate = DateTime.Now,
								DisplayName = model.DisplayName,
								Name = fileName,
								FullPath = formFile.FileName,
								FileType = formFile.ContentType,
								Size = (int)formFile.Length,
								Desc = model.Desc,
								Comment = model.Comment,
								Item = memoryStream.ToArray()
							};
							_context.Version.Add(version);
							await _context.SaveChangesAsync();
							msg = String.Format("File {0} from at {1} was successfully uploaded.", formFile.FileName, formFile.Name);
							Serilog.Log.Information(msg);
							ret += msg + Environment.NewLine;
						}
					}
				}
				// Don't rely on or trust the FileName property without validation.  
				ViewData["Message"] = ret;
			} else {
				ViewData["Message"] = "Something was wrong with the submitted information. Please check input and try again.";
				Serilog.Log.Error(String.Format("Error uploading file for User {0}.", User.Identity.Name)); //logging anything that might have been in msg
			}
			//return View("Index");
			return RedirectToAction(nameof(Index));
			//return RedirectToAction(nameof(UploadController.Index), "Upload");
		}

		[HttpGet]
		//[ValidateAntiForgeryToken]		//For some reason this breaks the download process - look into it when I have the time
		//[Route("[controller]/[action]")]
		public ActionResult DownloadFileByte(string id) {
			//return View("Index");
			int fileID = 0;
			if (!int.TryParse(id, out fileID)) {
				ViewData["Message"] = "Invalid File Request. Please check you selection and try again. If this persists please contact Support.";
				Serilog.Log.Information("Invalid file version request. Version ID: {0}; User: {1};", id, User.Identity.Name);
				return View("Index");
			}
			DataBusiness.Version downloadVersion = (from version in _context.Version
																 where version.Id == fileID
																 select version).First();
			return File(downloadVersion.Item, downloadVersion.FileType,downloadVersion.Name);
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