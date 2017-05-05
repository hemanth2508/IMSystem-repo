using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InstituteManagementSystemDB
{
   public static class Utils
    {

       public static List<MarqeeText> GetMarqeeTextFromDB()
       {
           IMSystemEntities entity = new IMSystemEntities();
           return entity.MarqeeTexts.ToList<MarqeeText>();

       }
    }
}
