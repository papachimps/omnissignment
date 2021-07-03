// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);
import 'dart:convert';

class Response {
    Response({
        required this.firstname,
        required this.storeDetails,
        required this.countryNumberCode,
        required this.sellerStoreId,
        required this.clickAndCollect,
        required this.presentation,
        required this.loyaltyExclusive,
        required this.sellerId,
        required this.pos,
        required this.isTest,
        required this.email,
        required this.pwdExpiredInDays,
        required this.currencySymbol,
        required this.roleId,
        required this.currencyIso,
        required this.isPasswordExpiringSoon,
        required this.roleCode,
        required this.accessToken,
        required this.userId,
        required this.lastname,
        required this.loyaltyEnabled,
        required this.isPasswordExpired,
        required this.isFirstSignin,
        required this.phone,
        required this.defaultStoreId,
        required this.response,
        required this.fulfillment,
        required this.tokenType,
        required this.defaultSmpId,
        required this.sellerDetails,
    });

    final String firstname;
    final dynamic storeDetails;
    final String countryNumberCode;
    final dynamic sellerStoreId;
    final bool clickAndCollect;
    final String presentation;
    final bool loyaltyExclusive;
    final String sellerId;
    final bool pos;
    final bool isTest;
    final String email;
    final int pwdExpiredInDays;
    final String currencySymbol;
    final int roleId;
    final String currencyIso;
    final bool isPasswordExpiringSoon;
    final String roleCode;
    final String accessToken;
    final String userId;
    final String lastname;
    final bool loyaltyEnabled;
    final bool isPasswordExpired;
    final bool isFirstSignin;
    final dynamic phone;
    final String defaultStoreId;
    final String response;
    final bool fulfillment;
    final String tokenType;
    final String defaultSmpId;
    final SellerDetails sellerDetails;

    factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Response.fromMap(Map<String, dynamic> json) => Response(
        firstname: json["firstname"],
        storeDetails: json["store_details"],
        countryNumberCode: json["country_number_code"],
        sellerStoreId: json["sellerStoreId"],
        clickAndCollect: json["click_and_collect"],
        presentation: json["presentation"],
        loyaltyExclusive: json["loyaltyExclusive"],
        sellerId: json["sellerId"],
        pos: json["pos"],
        isTest: json["is_test"],
        email: json["email"],
        pwdExpiredInDays: json["pwd_expired_in_days"],
        currencySymbol: json["currency_symbol"],
        roleId: json["roleId"],
        currencyIso: json["currency_iso"],
        isPasswordExpiringSoon: json["is_password_expiring_soon"],
        roleCode: json["role_code"],
        accessToken: json["accessToken"],
        userId: json["userId"],
        lastname: json["lastname"],
        loyaltyEnabled: json["loyaltyEnabled"],
        isPasswordExpired: json["is_password_expired"],
        isFirstSignin: json["is_first_signin"],
        phone: json["phone"],
        defaultStoreId: json["default_store_id"],
        response: json["response"],
        fulfillment: json["fulfillment"],
        tokenType: json["tokenType"],
        defaultSmpId: json["default_smp_id"],
        sellerDetails: SellerDetails.fromMap(json["seller_details"]),
    );

    Map<String, dynamic> toMap() => {
        "firstname": firstname,
        "store_details": storeDetails,
        "country_number_code": countryNumberCode,
        "sellerStoreId": sellerStoreId,
        "click_and_collect": clickAndCollect,
        "presentation": presentation,
        "loyaltyExclusive": loyaltyExclusive,
        "sellerId": sellerId,
        "pos": pos,
        "is_test": isTest,
        "email": email,
        "pwd_expired_in_days": pwdExpiredInDays,
        "currency_symbol": currencySymbol,
        "roleId": roleId,
        "currency_iso": currencyIso,
        "is_password_expiring_soon": isPasswordExpiringSoon,
        "role_code": roleCode,
        "accessToken": accessToken,
        "userId": userId,
        "lastname": lastname,
        "loyaltyEnabled": loyaltyEnabled,
        "is_password_expired": isPasswordExpired,
        "is_first_signin": isFirstSignin,
        "phone": phone,
        "default_store_id": defaultStoreId,
        "response": response,
        "fulfillment": fulfillment,
        "tokenType": tokenType,
        "default_smp_id": defaultSmpId,
        "seller_details": sellerDetails.toMap(),
    };
}

class SellerDetails {
    SellerDetails({
        required this.sellerLogo,
        required this.name,
        required this.termConditionUrl,
        required this.isTermCondition,
        required this.buisnessName,
        required this.sellerId,
    });

    final String sellerLogo;
    final String name;
    final dynamic termConditionUrl;
    final bool isTermCondition;
    final String buisnessName;
    final String sellerId;

    factory SellerDetails.fromJson(String str) => SellerDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SellerDetails.fromMap(Map<String, dynamic> json) => SellerDetails(
        sellerLogo: json["seller_logo"],
        name: json["name"],
        termConditionUrl: json["term_condition_url"],
        isTermCondition: json["is_term_condition"],
        buisnessName: json["buisness_name"],
        sellerId: json["seller_id"],
    );

    Map<String, dynamic> toMap() => {
        "seller_logo": sellerLogo,
        "name": name,
        "term_condition_url": termConditionUrl,
        "is_term_condition": isTermCondition,
        "buisness_name": buisnessName,
        "seller_id": sellerId,
    };
}
