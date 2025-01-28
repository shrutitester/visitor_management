 class ConvertFormat {
  static String convertDateFormat(String dateTimeString) {
    List<String> strDate = dateTimeString.split(' ');
    List<String> strDateUpdate = strDate[0].split('/');
    String dd = strDateUpdate[0];
    String mm = strDateUpdate[1];
    String yy = strDateUpdate[2];
    String outputDate = '$dd/$mm/$yy';
    return outputDate;
  }

//for client
  static String convertDTFormat(String dateTimeString) {
    List<String> strDate = dateTimeString.split(' ');
    List<String> strDateUpdate = strDate[0].split('/');
    String mm = strDateUpdate[0];
    String yy = strDateUpdate[2];
    String dd = strDateUpdate[1];
    String outputDate = '$dd/$mm/$yy';
    return outputDate;
  }
}
