CyberSource Secure Acceptance
=============================

## Prerequisite

1. Install IIS with ASP.NET support
2. Setup ASP.NET with .NET Framework 4.0

## Configuration

To run the examples first create a file `web.config` under directory `sa-wm`

```xml
<?xml version="1.0"?>
<configuration>
  <appSettings>
    <!-- ENVIRONMENT: TEST | LIVE -->
    <add key="ENVIRONMENT" value="TEST"/>
    <add key="MERCHANT_ID" value="<MERCHANT_ID>"/>
    <add key="PROFILE_ID" value="<PROFILE_ID>"/>
    <add key="ACCESS_KEY" value="<ACCESS_KEY>"/>
    <add key="SECRET_KEY" value="<SECRET_KEY>"/>
  </appSettings>
  <system.web>
    <compilation debug="true" targetFramework="4.0"/>
  </system.web>
  <system.webServer>
    <directoryBrowse enabled="false"/>
    <modules runAllManagedModulesForAllRequests="true"/>
  </system.webServer>
</configuration>
```

## Web/Mobile
http://localhost/sa-wm/payment_form.aspx
