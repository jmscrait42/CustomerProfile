using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Linq;
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
    

        public Menu[] GetOverride(string pos, string itin)
        {
         
           var data= Dc.GetOverride(pos, itin);

           var menus=  TransformToMenu(data.ToList());

            return menus;

        }


        private static Menu[] TransformToMenu(List<GetOverrideResult> menuWithOptions)
        {
            List<Menu> menus = new List<Menu>(menuWithOptions.Count);

            foreach (GetOverrideResult menu in menuWithOptions)
            {
                menus.Add(new Menu
                {
                    Type = menu.MenuTypeName,
                    MessageID = menu.MessageID,
                    Options = new Option(menu.OptionList.Replace(", ", string.Empty)),
                    RepeatMenu = menu.RepeatMenu
                });
            }

            return menus.ToArray();
        }


        [DataContract(Name = "Menu")]
        public class Menu
        {
            [DataMember(Name = "Type", Order = 1)]
            public string Type;

            [DataMember(Name = "MessageID", Order = 2)]
            public int? MessageID;

            [DataMember(Name = "RepeatMenu", Order = 3)]
            public bool? RepeatMenu;

            [DataMember(Name = "Options", Order = 4)]
            public Option Options { get; set; }
        }

        [CollectionDataContract(ItemName = "Option")]
        public class Option : Collection<string>
        {
            public Option() // default constructor, do not remove, WCF generates "System.Runtime.Serialization.InvalidDataContractException: Type 'Expedia.ContactCenter.IVRWebService.Option' with CollectionDataContractAttribute attribute is an invalid collection type since it does not have a default constructor."
            {
            }

            public Option(string optionsCSV)
            {
                string[] options = optionsCSV.Split(new char[] { ',' }, StringSplitOptions.None);

                foreach (string option in options)
                {
                    this.Add(option);
                }
            }
        }



    }



}



