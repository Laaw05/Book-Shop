using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopBanSach.Areas.Admin.Models;

namespace ShopBanSach.Areas.Admin.Controllers
{
    public class TacGiasController : Controller
    {
        private DBContext db = new DBContext();

        // GET: Admin/TacGias
        public ActionResult Index()
        {
            return View(db.TacGia.ToList());
        }

        // GET: Admin/TacGias/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TacGia tacGia = db.TacGia.Find(id);
            if (tacGia == null)
            {
                return HttpNotFound();
            }
            return View(tacGia);
        }

        // GET: Admin/TacGias/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/TacGias/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "maTG,tenTG,moTa")] TacGia tacGia)
        {
            if (ModelState.IsValid)
            {
                db.TacGia.Add(tacGia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tacGia);
        }

        // GET: Admin/TacGias/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TacGia tacGia = db.TacGia.Find(id);
            if (tacGia == null)
            {
                return HttpNotFound();
            }
            return View(tacGia);
        }

        // POST: Admin/TacGias/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "maTG,tenTG,moTa")] TacGia tacGia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tacGia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tacGia);
        }

        // GET: Admin/TacGias/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TacGia tacGia = db.TacGia.Find(id);
            if (tacGia == null)
            {
                return HttpNotFound();
            }
            return View(tacGia);
        }

        // POST: Admin/TacGias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            TacGia tacGia = db.TacGia.Find(id);
            db.TacGia.Remove(tacGia);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
