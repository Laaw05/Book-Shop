using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ShopBanSach.Areas.Admin.Models
{
    public class TacGiaModels
    {
        DBContext dbsp = new DBContext();

        public List<TacGia> getAllTacGia()
        {
            DataTable dt = dbsp.readData("SELECT * FROM TacGia");
            List<TacGia> listTH = new List<TacGia>();
            foreach (DataRow dr in dt.Rows)
            {
                TacGia th = new TacGia();
                th.maTG = dr[0].ToString();
                th.tenTG = dr[1].ToString();
                th.moTa = dr[2].ToString();
                listTH.Add(th);
            }
            return listTH;
        }
        public TacGia get1TH(string id)
        {
            DataTable dt = dbsp.readData("SELECT * FROM TacGia WHERE maTG = '" + id + "'");
            TacGia th = new TacGia();
            th.maTG = dt.Rows[0][0].ToString();
            th.tenTG = dt.Rows[0][1].ToString();
            th.moTa = dt.Rows[0][2].ToString();
            return th;
        }
    }
}