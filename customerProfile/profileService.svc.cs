using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web.UI.WebControls;

namespace customerProfile
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "profileService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select profileService.svc or profileService.svc.cs at the Solution Explorer and start debugging.
    public class ProfileService : IProfileService
    {

        public DataClasses1DataContext Dc = new DataClasses1DataContext();
        public void DoWork()
        {
        }


        public List<GetOverrideResult> GetOverride(string pos, string itin)
        {
            var query = Dc.GetOverride(pos, itin);

            

            return query.ToList();
        }




   

    }



}



