class Apis {
  static const baseUrl = "https://technocometsolutions.com/client/metro-cupboard/public";
  static const name = "api";
  static const version = "v1";
  static const url = "$baseUrl/$name/$version";

  static const adminLogin = "/auth/admin-login";

  static const getAllCategory = "/admin/category";
  static const getSingleCategory = "/admin/category/view";
  static const addCategory = "/admin/category/create";
  static const editCategory = "/admin/category/edit";
  static const deleteCategory = "/admin/category/delete";
  static const editCategoryIndex = "/admin/category/edit/index";

  static const logout = "/auth/logout";

}
