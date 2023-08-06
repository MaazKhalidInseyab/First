class LoginResponse {
  PayLoad? payLoad;
  int? code;
  String? res;

  LoginResponse({this.payLoad, this.code, this.res});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    payLoad =
    json['PayLoad'] != null ? new PayLoad.fromJson(json['PayLoad']) : null;
    code = json['code'];
    res = json['res'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payLoad != null) {
      data['PayLoad'] = this.payLoad!.toJson();
    }
    data['code'] = this.code;
    data['res'] = this.res;
    return data;
  }
}

class PayLoad {
  String? email;
  String? fullName;
  int? gptUserId;
  int? messageCount;
  bool? oTP;
  String? packageName;
  String? phoneNumber;
  String? source;
  int? wordCount;
  int? wordLimit;

  PayLoad(
      {this.email,
        this.fullName,
        this.gptUserId,
        this.messageCount,
        this.oTP,
        this.packageName,
        this.phoneNumber,
        this.source,
        this.wordCount,
        this.wordLimit});

  PayLoad.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    fullName = json['Full_Name'];
    gptUserId = json['Gpt_User_Id'];
    messageCount = json['Message_Count'];
    oTP = json['OTP'];
    packageName = json['Package_Name'];
    phoneNumber = json['Phone_Number'];
    source = json['Source'];
    wordCount = json['Word_Count'];
    wordLimit = json['Word_Limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['Full_Name'] = this.fullName;
    data['Gpt_User_Id'] = this.gptUserId;
    data['Message_Count'] = this.messageCount;
    data['OTP'] = this.oTP;
    data['Package_Name'] = this.packageName;
    data['Phone_Number'] = this.phoneNumber;
    data['Source'] = this.source;
    data['Word_Count'] = this.wordCount;
    data['Word_Limit'] = this.wordLimit;
    return data;
  }
}
