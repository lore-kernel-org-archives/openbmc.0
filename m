Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B684B1A0A52
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:56:57 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259414892239.67269118284491;
 Mon, 19 Oct 2015 05:56:54 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 5/9] Add PROVIDES to all provider classes
Date: Mon, 19 Oct 2015 07:56:41 -0500
Message-Id: <1445259405-10312-6-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:56:58 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

When multiple recipes provide a package PREFERRED_PROVIDER
is used to pick one.  However bitbake doesn't look at
RPROVIDES when it figures this out.
---
 meta-phosphor/classes/obmc-phosphor-chassis-mgmt.bbclass | 1 +
 meta-phosphor/classes/obmc-phosphor-event-mgmt.bbclass   | 1 +
 meta-phosphor/classes/obmc-phosphor-fan-mgmt.bbclass     | 1 +
 meta-phosphor/classes/obmc-phosphor-flash-mgmt.bbclass   | 1 +
 meta-phosphor/classes/obmc-phosphor-policy-mgmt.bbclass  | 1 +
 meta-phosphor/classes/obmc-phosphor-sensor-mgmt.bbclass  | 1 +
 meta-phosphor/classes/obmc-phosphor-system-mgmt.bbclass  | 1 +
 7 files changed, 7 insertions(+)

diff --git a/meta-phosphor/classes/obmc-phosphor-chassis-mgmt.bbclass b/meta-phosphor/classes/obmc-phosphor-chassis-mgmt.bbclass
index 377da0a..edf18c0 100644
--- a/meta-phosphor/classes/obmc-phosphor-chassis-mgmt.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-chassis-mgmt.bbclass
@@ -1,3 +1,4 @@
 # Common code for recipes that implement Phosphor OpenBMC chassis management.
 
 RPROVIDES_${PN} += "virtual/obmc-phosphor-chassis-mgmt"
+PROVIDES += "virtual/obmc-phosphor-chassis-mgmt"
diff --git a/meta-phosphor/classes/obmc-phosphor-event-mgmt.bbclass b/meta-phosphor/classes/obmc-phosphor-event-mgmt.bbclass
index 01f2edf..afab38f 100644
--- a/meta-phosphor/classes/obmc-phosphor-event-mgmt.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-event-mgmt.bbclass
@@ -1,3 +1,4 @@
 # Common code for recipes that implement Phosphor OpenBMC event management.
 
 RPROVIDES_${PN} += "virtual/obmc-phosphor-event-mgmt"
+PROVIDES += "virtual/obmc-phosphor-event-mgmt"
diff --git a/meta-phosphor/classes/obmc-phosphor-fan-mgmt.bbclass b/meta-phosphor/classes/obmc-phosphor-fan-mgmt.bbclass
index 973376d..2e64773 100644
--- a/meta-phosphor/classes/obmc-phosphor-fan-mgmt.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-fan-mgmt.bbclass
@@ -1,3 +1,4 @@
 # Common code for recipes that implement Phosphor OpenBMC fan management.
 
 RPROVIDES_${PN} += "virtual/obmc-phosphor-fan-mgmt"
+PROVIDES += "virtual/obmc-phosphor-fan-mgmt"
diff --git a/meta-phosphor/classes/obmc-phosphor-flash-mgmt.bbclass b/meta-phosphor/classes/obmc-phosphor-flash-mgmt.bbclass
index d166949..4898c20 100644
--- a/meta-phosphor/classes/obmc-phosphor-flash-mgmt.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-flash-mgmt.bbclass
@@ -1,3 +1,4 @@
 # Common code for recipes that implement Phosphor OpenBMC flash management.
 
 RPROVIDES_${PN} += "virtual/obmc-phosphor-flash-mgmt"
+PROVIDES += "virtual/obmc-phosphor-flash-mgmt"
diff --git a/meta-phosphor/classes/obmc-phosphor-policy-mgmt.bbclass b/meta-phosphor/classes/obmc-phosphor-policy-mgmt.bbclass
index 86e0cbe..35397b8 100644
--- a/meta-phosphor/classes/obmc-phosphor-policy-mgmt.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-policy-mgmt.bbclass
@@ -1,3 +1,4 @@
 # Common code for recipes that implement Phosphor OpenBMC policy management.
 
 RPROVIDES_${PN} += "virtual/obmc-phosphor-policy-mgmt"
+PROVIDES += "virtual/obmc-phosphor-policy-mgmt"
diff --git a/meta-phosphor/classes/obmc-phosphor-sensor-mgmt.bbclass b/meta-phosphor/classes/obmc-phosphor-sensor-mgmt.bbclass
index 9939386..0d9982e 100644
--- a/meta-phosphor/classes/obmc-phosphor-sensor-mgmt.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-sensor-mgmt.bbclass
@@ -1,3 +1,4 @@
 # Common code for recipes that implement Phosphor OpenBMC sensor management.
 
 RPROVIDES_${PN} += "virtual/obmc-phosphor-sensor-mgmt"
+PROVIDES += "virtual/obmc-phosphor-sensor-mgmt"
diff --git a/meta-phosphor/classes/obmc-phosphor-system-mgmt.bbclass b/meta-phosphor/classes/obmc-phosphor-system-mgmt.bbclass
index 4939d2f..07c89c4 100644
--- a/meta-phosphor/classes/obmc-phosphor-system-mgmt.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-system-mgmt.bbclass
@@ -1,3 +1,4 @@
 # Common code for recipes that implement Phosphor OpenBMC system management.
 
 RPROVIDES_${PN} += "virtual/obmc-phosphor-system-mgmt"
+PROVIDES += "virtual/obmc-phosphor-system-mgmt"
-- 
2.6.0
