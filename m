Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qc0nx43RmzDqBH
 for <openbmc@lists.ozlabs.org>; Fri,  1 Apr 2016 23:20:21 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459513212551103.23061581307911;
 Fri, 1 Apr 2016 05:20:12 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] RFC on the OBMC Service Interface.
Date: Fri,  1 Apr 2016 07:20:09 -0500
Message-Id: <1459513209-18633-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459513209-18633-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459513209-18633-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2016 12:20:22 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 rfc-obmc-service-iface.md | 145 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 rfc-obmc-service-iface.md

diff --git a/rfc-obmc-service-iface.md b/rfc-obmc-service-iface.md
new file mode 100644
index 0000000..eacf0a3
--- /dev/null
+++ b/rfc-obmc-service-iface.md
@@ -0,0 +1,145 @@
+# Request for Comments: OBMC Service Interface
+Various services provided by OBMC will have the need to expose methods to
+configure, enable, disable and start, stop, reset the service. It is hence
+desirable for a generic interface which has the above methods in its namespace.
+
+Each of the service will then implement one or more methods of this interface
+as applicable. If Enable and Start are semantically equivalent to the service,
+then only one of them may be implemented. Similar is the case with the Disable
+and Stop methods.
+
+## org.obmc.Service Interface
+
+### Methods
+```
+  <interface name="org.openbmc.Service">
+    <method name="Enable">
+      <arg direction="in"  type="a{sv}" name="argv_dict" />
+      <arg direction="out" type="x" />
+    </method>
+    <method name="Disable">
+      <arg direction="in"  type="as" name="argv_list" />
+      <arg direction="out" type="x" />
+    </method>
+    <method name="Reset">
+      <arg direction="in"  type="" name="" />
+      <arg direction="out" type="x" />
+    </method>
+    <method name="Start">
+      <arg direction="in"  type="" name="" />
+      <arg direction="out" type="x" />
+    </method>
+    <method name="Stop">
+      <arg direction="in"  type="" name="" />
+      <arg direction="out" type="x" />
+    </method>
+  </interface>
+```
+
+### Description
+#### Enable method
+```
+Enable (IN a{sv} argv_dict,
+    OUT x return_code);
+```
+Configure and Enable the service. Parameters for configuration of the service
+are provided as a dictionary / map. 
+
++ IN a{av} argv_dict: Each dictionary entry is a name variant pair
+corresponding to the name of the property and the value respectively.
++ OUT x return_value : 0 on Success, else Failure.
+
+An empty dictionary may be passed to reenable a service post a disable operation.
+
+### Disable method
+```
+Disable (IN as argv_list,
+    OUT x return_code);
+```
+UnConfigure and Disable the service. Parameters for (un)configuration of the
+service are provided as a list.
+
++ IN as argv_list: Each list item is a string corresponding to the name of the
+property to be disabled.
++ OUT x return_value : 0 on Success, else Failure.
+An empty list may be passed to disable ALL the parameters of the service.
+
+### Reset method
+```
+Reset (OUT x return_code);
+```
+Reset all the configurable properties of the service to the distribution
+specific default.
+
++ OUT x return_value : 0 on Success, else Failure.
+
+
+### Start method
+```
+Start (OUT x return_code);
+```
+Start the service.
+
++ OUT x return_value : 0 on Success, else Failure.
+
+### Stop method
+```
+Stop (OUT x return_code);
+```
+Stop the service.
+
++ OUT x return_value : 0 on Success, else Failure.
+
+
+### Examples
+A journal/syslog management service (org.openbmc.LogManager) is considered as
+an example for the purpose of illustration. org.openbmc.Logmanager implements
+the following interfaces:
+```
+org.freedesktop.DBus.Properties
+org.openbmc.Service
+org.openbmc.Errl
+```
+The log management service can be configured with the IP address and port
+number of the remote syslog server. When Configured with the above properties
+and Enabled, journal logs will be streamed as syslog entries to the remote
+syslog server. When disabled, journal as well as syslog will be logged on the
+locally. When Enabled again, the previous configuration will be restored and
+streaming of logs will resume.
+
+Start/Stop/Reset are not implemented by this service.
+
+#### Configure the IP address and Port number for the remote logging service
+and Enable it.
+```
+busctl call org.openbmc.LogManager /org/openbmc/LogManager org.openbmc.Service Enable a{sv} 2 ipaddr s 9.109.116.67 port u 514
+```
+#### Disable the remote logging service.
+
+```
+busctl call org.openbmc.LogManager /org/openbmc/LogManager/rsyslog org.openbmc.Service Disable as 0
+```
+
+#### Restore previous configuration and Enable the remote logging service.
+```
+busctl call org.openbmc.LogManager /org/openbmc/LogManager/rsyslog org.openbmc.Service Enable a{sv} 0
+```
+
+#### Get the IP address configured as the remote syslog server.
+```
+busctl call org.openbmc.LogManager /org/openbmc/LogManager/rsyslog org.freedesktop.DBus.Properties Get ss org.openbmc.Errl ipaddr
+```
+
+#### Get the Port number configured as the remote syslog server.
+```
+busctl call org.openbmc.LogManager /org/openbmc/LogManager/rsyslog org.freedesktop.DBus.Properties Get ss org.openbmc.Errl port
+```
+
+#### Get All configuration properties of the logging sevice.
+```
+busctl call org.openbmc.LogManager /org/openbmc/LogManager/rsyslog org.freedesktop.DBus.Properties GetAll s org.openbmc.Errl
+```
+---
+Signed-off-by: Hari R. <iamrhari@gmail.com>
+---
+---
-- 
2.7.1
