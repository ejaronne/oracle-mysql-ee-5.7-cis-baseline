{:id=>"V-76869",
 :title=>
  "The amount of virtual memory an application pool uses for each IIS 8.5 website must be explicitly set.",
 :desc=>
  "IIS application pools can be periodically recycled to avoid unstable states possibly leading to application crashes, hangs, or memory leaks. By default, application pool recycling is overlapped, which means the worker process to be shut down is kept running until after a new worker process is started. After a new worker process starts, new requests are passed to it. The old worker process shuts down after it finishes processing its existing requests, or after a configured time-out, whichever comes first. This way of recycling ensures uninterrupted service to clients.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000516-WSR-000174"},
   {:name=>"gid", :value=>"V-76869"},
   {:name=>"rid", :value=>"SV-91565r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000253"},
   {:name=>"fix_id", :value=>"F-83565r1_fix"},
   {:name=>"cci", :value=>["CCI-000366"]},
   {:name=>"nist", :value=>["CM-6 b", "Rev_4"]},
   {:name=>"false_negatives", :value=>nil},
   {:name=>"false_positives", :value=>nil},
   {:name=>"documentable", :value=>false},
   {:name=>"mitigations", :value=>nil},
   {:name=>"severity_override_guidance", :value=>false},
   {:name=>"potential_impacts", :value=>nil},
   {:name=>"third_party_tools", :value=>nil},
   {:name=>"mitigation_controls", :value=>nil},
   {:name=>"responsibility", :value=>nil},
   {:name=>"ia_controls", :value=>nil},
   {:name=>"check",
    :value=>
     "Note: Recycling Application Pools can create an unstable environment in a 64-bit SharePoint environment. If operational issues arise, mitigation steps can be set, to include setting the “Fixed number or requests”, “Specific time”, and “Private memory usage” in the recycling conditions lieu of the “Virtual memory” setting. If mitigation is used in lieu of this requirement, with supporting documentation from the ISSO, this check can be downgraded to a Cat III.\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Perform for each Application Pool.\n" +
     "\n" +
     "Click on “Application Pools”.\n" +
     "\n" +
     "Highlight an Application Pool and click \"Advanced Settings\" in the Action Pane.\n" +
     "\n" +
     "In the \"Advanced Settings\" dialog box scroll down to the \"Recycling\" section and verify the value for \"Virtual Memory Limit\" is not set to 0.\n" +
     "\n" +
     "If the value for \"Virtual Memory Limit\" is set to 0, this is a finding.\n"},
   {:name=>"fix",
    :value=>
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click on “Application Pools”.\n" +
     "\n" +
     "Perform for each Application Pool.\n" +
     "\n" +
     "Highlight an Application Pool and click \"Advanced Settings\" in the “Action” Pane.\n" +
     "\n" +
     "In the \"Advanced Settings\" dialog box scroll down to the \"Recycling\" section and set the value for \"Virtual Memory Limit\" to a value other than \"0\".\n" +
     "\n" +
     "Click “OK”."}]}