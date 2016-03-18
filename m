Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRX6h08lhzDq5s
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2016 04:20:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14583216225251019.8983954986196;
 Fri, 18 Mar 2016 10:20:22 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH docs] Add documentation for associations
Date: Fri, 18 Mar 2016 12:20:10 -0500
Message-Id: <1458321610-31076-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458321610-31076-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458321610-31076-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Mar 2016 17:20:28 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 dbus-interfaces.md | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index b2a8ab0..51aa114 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -184,3 +184,64 @@ properties:
   *  `debug_data`
 
   *  `time`
+
+# Associations
+OpenBMC uses associations to extend the DBUS API without impacting existing objects and interfaces.
+## `org.openbmc.Associations`
+A object wishing to create an association implements this interface.
+
+methods:
+* None
+
+properties:
+* `associations signature=a(sss):` An array of forward, reverse, endpoint tuples where:
+ * fowrard - the type of the association to create
+ * reverse - the type of the association to create for the endpoint
+ * endpoint - the endpoint of the association
+
+For example, given an object: `/org/openbmc/events/1`
+that implements `org.openbmc.Associations` and sets the `associations` property to:
+
+`associations: [`
+
+`    ["events", "frus", "/org/openbmc/piece_of_hardware"],`
+
+`    ["events", "times", "/org/openbmc/timestamps/1"]`
+
+`]`
+
+would result in the following associations:
+
+* /org/openbmc/events/1/frus
+* /org/openbmc/events/1/times
+* /org/openbmc/piece_of_hardware/events
+* /org/openbmc/timestamps/1/events
+
+It is up to the specific OpenBMC implementation to decide, what, if anything to do with these.
+For example, the Phosphor mapper application looks for objects that implement this interface
+and creates objects in its /org/openbmc DBUS namespace.
+
+## `org.openbmc.Association`
+OpenBMC implementations use this interface to insert associations into the DBUS namespace.
+
+methods:
+* None
+
+properties:
+* `endpoints signature=as:` An array of association endpoints.  
+		   
+For example, given:
+
+/org/openbmc/events/1/frus:
+
+`endpoints: [`
+
+`    ["/org/openbmc/hardware/cpu0"],`
+
+`    ["/org/openbmc/hardware/cpu1"],`
+
+`]`
+   
+Denotes the following:
+* /org/openbmc/events/1 => fru => /org/openbmc/hardware/cpu0
+* /org/openbmc/events/1 => fru => /org/openbmc/hardware/cpu1
-- 
2.7.1
