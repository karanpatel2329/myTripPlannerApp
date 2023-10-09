class APIRoute{
  static String baseURL = 'http://ec2-65-2-182-34.ap-south-1.compute.amazonaws.com:3000';
  static String getDestination = '$baseURL/destination/getAll';
  static String loginURL = '$baseURL/user/login';
  static String register = '$baseURL/user/register';
  static String myBookmark = '$baseURL/bookmark/get';
  static String addBookmark = '$baseURL/bookmark/add';
  static String addAttraction = '$baseURL/bookmark/addAttraction';
  static String removeBookmark = '$baseURL/bookmark/remove';
  static String removeAttraction = '$baseURL/bookmark/removeAttraction';
}