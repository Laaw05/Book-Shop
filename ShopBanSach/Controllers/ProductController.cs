using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using ShopBanSach.Models;

namespace ShopBanSach.Controllers
{
    public class ProductController : Controller
    {
        SanPhamModels db = new SanPhamModels();
        LoaiSPModels lspModel = new LoaiSPModels();
        TacGiaModels thModel = new TacGiaModels();
        // GET: Product
        public ViewResult ProDetail(string id)
        {
            TacGia th;
            SanPham sp = db.get1sanPham(id);
            th = thModel.get1TH(sp.maTG);
            ViewBag.TH = th;
            ViewBag.LoaiSP = lspModel.get1LSP(sp.maLoai);
            return View(sp);
        }
        public ActionResult ProCata(string id, string searchString)
        {
            LoaiSP lsp;
            List<SanPham> listSp;
            List<LoaiSP> list = lspModel.getAllLSP();
            if (id == null )
            {
                listSp = db.getAllSP();
                ViewBag.tenLoai = "Tất cả sản phẩm";
               
            }
            else
            {
                lsp = lspModel.get1LSP(id);
                listSp = db.getSanPhambyLoai(id);
                var tenlsp = lsp.tenLoai;
                ViewBag.LoaiSP = lsp;
                ViewBag.tenLoai = tenlsp;
             
            }
            if (string.IsNullOrEmpty(searchString))
            {
                return View(listSp);
            }
            else
            {
                return View(listSp.Where(s => s.tenSP.ToLower().Contains(searchString.ToLower())));
            }
       
        }

     
        public ViewResult ProbyTG(string id)
        {
            TacGia th;
            SanPham sanPham = new SanPham();
            List<SanPham> listSp;
            if (id == null)
            {

                listSp = db.getAllSP();
                ViewBag.tenLoai = "Tất cả sản phẩm";
            }
            else
            {
                th = thModel.get1TH(id);
                listSp = db.getSPbyTacGia(id);
                var tenTG = th.tenTG;
                ViewBag.TH = th;
                ViewBag.tenTG = tenTG;
            }
            return View(listSp);
        }
    }
}