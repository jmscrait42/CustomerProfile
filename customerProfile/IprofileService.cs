﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace customerProfile
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IprofileService" in both code and config file together.
    [ServiceContract]
    public interface IProfileService
    {


        [OperationContract]
        ProfileService.Menu[] GetOverride(string pos, string itin);
    }
}
