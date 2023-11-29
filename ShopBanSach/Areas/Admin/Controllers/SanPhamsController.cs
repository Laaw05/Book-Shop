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
    public class SanPhamsController : Controller
    {
        private DBContext db = new DBContext();
        private LoaiSPModels lspModel = new LoaiSPModels();
        private SanPhamModels spModel = new SanPhamModels();
        private TacGiaModels thModel = new TacGiaModels();

        // GET: Admin/SanPhams
        public ActionResult Index()
        {
            var sanPham = db.SanPham.Include(s => s.LoaiSP).Include(s => s.TacGia);
            return View(sanPham.ToList());
        }

        // GET: Admin/SanPhams/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPham.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Create
        public ActionResult Create()
        {
            ViewBag.maLoai = new SelectList(db.LoaiSP, "maLoai", "tenLoai");
            ViewBag.maTG = new SelectList(db.TacGia, "maTG", "tenTG");
            return View();
        }

        // POST: Admin/SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "maSP,tenSP,maLoai,maTG,moTa,donGia,soLuong,Anh")] SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                db.SanPham.Add(sanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.maLoai = new SelectList(db.LoaiSP, "maLoai", "tenLoai", sanPham.maLoai);
            ViewBag.maTG = new SelectList(db.TacGia, "maTG", "tenTG", sanPham.maTG);
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPham.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.maLoai = new SelectList(db.LoaiSP, "maLoai", "tenLoai", sanPham.maLoai);
            ViewBag.maTG = new SelectList(db.TacGia, "maTG", "tenTG", sanPham.maTG);
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "maSP,tenSP,maLoai,maTG,moTa,donGia,soLuong,Anh")] SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.maLoai = new SelectList(db.LoaiSP, "maLoai", "tenLoai", sanPham.maLoai);
            ViewBag.maTG = new SelectList(db.TacGia, "maTG", "tenTG", sanPham.maTG);
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPham.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            SanPham sanPham = db.SanPham.Find(id);
            db.SanPham.Remove(sanPham);
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

        public ViewResult ProductsbyCata(string id)
        {
            LoaiSP lsp;
            List<SanPham> listSp;
            List<LoaiSP> list = lspModel.getAllLSP();
            if (id == null)
            {
                listSp = spModel.getAllSP();

            }
            else
            {
                lsp = lspModel.get1LSP(id);
                listSp = spModel.getSanPhambyLoai(id);
                var tenlsp = lsp.tenLoai;
                ViewBag.LoaiSP = lsp;
                ViewBag.tenLoai = tenlsp;
            }

            return View(listSp);
        }
        public ViewResult ProductsbyTG(string id)
        {
            TacGia tg;
            SanPham sanPham = new SanPham();
            List<SanPham> listSp;
            if (id == null)
            {

                listSp = spModel.getAllSP();
                ViewBag.tenLoai = "Tất cả sản phẩm";
            }
            else
            {
                tg = thModel.get1TH(id);
                listSp = spModel.getSPbyTacGia(id);
                var tenTG = tg.tenTG;
                ViewBag.TG = tg;
                ViewBag.tenTG = tenTG;
            }
            return View(listSp);
        }
    }
}
