control "V-76785" do
  title "Both the log file and Event Tracing for Windows (ETW) for each IIS 8.5
  website must be enabled."
  desc  "Internet Information Services (IIS) on Windows Server 2012 provides
  basic logging capabilities. However, because IIS takes some time to flush logs
  to disk, administrators do not have access to logging information in real-time.
  In addition, text-based log files can be difficult and time-consuming to
  process.

      In IIS 8.5, the administrator has the option of sending logging information
  to Event Tracing for Windows (ETW). This option gives the administrator the
  ability to use standard query tools, or create custom tools, for viewing
  real-time logging information in ETW. This provides a significant advantage
  over parsing text-based log files that are not updated in real time.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000092-WSR-000055"
  tag "satisfies": ["SRG-APP-000092-WSR-000055", "SRG-APP-000108-WSR-000166"]
  tag "gid": "V-76785"
  tag "rid": "SV-91481r1_rule"
  tag "stig_id": "IISW-SI-000206"
  tag "fix_id": "F-83481r1_fix"
  tag "cci": ["CCI-000139", "CCI-001464"]
  tag "nist": ["AU-5 a", "AU-14 (1)", "Rev_4"]
  tag "false_negatives": nil
  tag "false_positives": nil
  tag "documentable": false
  tag "mitigations": nil
  tag "severity_override_guidance": false
  tag "potential_impacts": nil
  tag "third_party_tools": nil
  tag "mitigation_controls": nil
  tag "responsibility": nil
  tag "ia_controls": nil
  tag "check": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name.

  Click the \"Logging\" icon.

  Under Log Event Destination, verify the \"Both log file and ETW event\" radio
  button is selected.

  If the \"Both log file and ETW event\" radio button is not selected, this is a
  finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name.

  Click the \"Logging\" icon.

  Under Log Event Destination, select the \"Both log file and ETW event\" radio
  button.

  Select \"Apply\" from the \"Actions\" pane."

  get_names = command("Get-Website | select name | findstr /v 'name ---'").stdout.strip.split("\r\n")

  log_format = command('Get-WebConfigurationProperty -pspath "MACHINE/WEBROOT/APPHOST"  -filter "system.applicationHost/sites/*/logFile" -name "logFormat"').stdout.strip.split("\r\n")

  log_format.zip(get_names).each do |format, names|
    describe "The iss site: #{names} logging format" do
      subject { format }
        it { should cmp 'W3C' }
    end
  end
  iis_logging_configuration = command('Get-WebConfigurationProperty -pspath "MACHINE/WEBROOT/APPHOST" -filter "System.Applicationhost/Sites/*/logfile"  -name logTargetW3C').stdout.strip.split("\r\n")

  iis_logging_configuration.zip(get_names).each do |config, names|
    describe "The iss site: #{names} logging configuration" do
      subject { config }
        it { should include 'File' }
    it { should include 'ETW' }
    end
  end
  if get_names.empty?
    describe "There are no IIS sites configured" do
      impact 0.0
      skip "Control not applicable"
    end
  end
end
