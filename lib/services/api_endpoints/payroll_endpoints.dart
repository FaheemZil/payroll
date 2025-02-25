class PayrollApiEndpoints {
  static const String rootUrl = 'https://your.api.url'; 

  static const String createManualPayrollSystem = '$rootUrl/integrations/merge/create-manual-payroll-system';
  static const String createManualPayroll = '$rootUrl/integrations/merge/create-manual-payroll';
  static const String processPayroll = '$rootUrl/payroll-by-cc/create-manual-payroll';
  static const String feeCheck = '$rootUrl/payroll-by-cc/card/service-fee';
  static const String saveMetaData = '$rootUrl/update-guest-user';
  static const String getMetaData = '$rootUrl/get-guest-user-data';
  static const String getPayrollApps = '$rootUrl/integrations/merge/get-payroll-apps';
  static const String sendJourneyNotification = '$rootUrl/outside/payroll-by-cc/manage-event';
  static String savePayrollSystem(String appId) => '$rootUrl/integrations/merge/save-payroll-app-settings/$appId';
  static String processPayrollById(String payrollId) => '$rootUrl/payroll-by-cc/create-manual-payroll'; 
}
