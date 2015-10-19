Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BCDD61A0AC9
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:56:59 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259416274656.5404808251785;
 Mon, 19 Oct 2015 05:56:56 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 6/9] Add host IPMI DBUS to hw provider class
Date: Mon, 19 Oct 2015 07:56:42 -0500
Message-Id: <1445259405-10312-7-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
References: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:57:00 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 meta-phosphor/classes/obmc-phosphor-host-ipmi-hw.bbclass | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-phosphor/classes/obmc-phosphor-host-ipmi-hw.bbclass

diff --git a/meta-phosphor/classes/obmc-phosphor-host-ipmi-hw.bbclass b/meta-phosphor/classes/obmc-phosphor-host-ipmi-hw.bbclass
new file mode 100644
index 0000000..974c010
--- /dev/null
+++ b/meta-phosphor/classes/obmc-phosphor-host-ipmi-hw.bbclass
@@ -0,0 +1,4 @@
+# Common code for recipes that implement Phosphor OpenBMC IPMI HW to DBUS translation.
+
+RPROVIDES_${PN} += "virtual/obmc-phosphor-host-ipmi-hw"
+PROVIDES += "virtual/obmc-phosphor-host-ipmi-hw"
-- 
2.6.0
