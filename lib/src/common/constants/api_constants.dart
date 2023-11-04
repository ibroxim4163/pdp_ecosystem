String tokenAccess = "";
String tokenRefresh = "";

abstract class ApiConst {
  static const baseUrl = "https://docs.bionix.uz";

  static const balancePath = "$baseUrl/api/balance";

  static const categoryPath = "$baseUrl/api/category";

  static String categoryIdPath(int id) => "$baseUrl/api/category/$id";

  static const inputGetPath = "$baseUrl/api/input";

  static const inputPostPath = "$baseUrl/api/input";

  static String deleteInputIdPath(int id) => "$baseUrl/api/input/$id";

  static String deleteOutputPath(int id) => "$baseUrl/api/output/$id";

  static const getOutputPath = "$baseUrl/api/output";

  static const postOutputPath = "$baseUrl/api/output";

  static const createProductPath = "$baseUrl/api/product";

  static const searchPath = "$baseUrl/api/search?search=";

  static const postToken = "$baseUrl/api/token/";

  static const postRefreshToken = "$baseUrl/api/token/refresh/";


  static Map<String, String> header(String token) => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };
}