using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{

    [OperationContract]
    bool IsValidAccount(string id, string password);

    [OperationContract]
    string getStaffName(string staffId);

    [OperationContract]
    string staffInfo(string staffId);

    [OperationContract]
    bool editProfile(string staffId, string password, string email, string phoneNo, string title);
    


}
