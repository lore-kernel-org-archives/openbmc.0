Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 89DBC1A03C3
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 00:12:03 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446469918848106.85419414012244;
 Mon, 2 Nov 2015 05:11:58 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] stop the build break for btbridge on qemu
Date: Mon,  2 Nov 2015 07:11:55 -0600
Message-Id: <1446469915-23163-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446469915-23163-1-git-send-email-patches@stwcx.xyz>
References: <1446469915-23163-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 02 Nov 2015 13:12:04 -0000

From: Chris Austen <austenc@us.ibm.com>

btbridge is not even part of the qemu image
---
 meta-phosphor/conf/machine/include/sample.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
index 2b8f986..e71b85f 100644
--- a/meta-phosphor/conf/machine/include/sample.inc
+++ b/meta-phosphor/conf/machine/include/sample.inc
@@ -20,8 +20,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
 VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers = " \
         host-ipmid-oem \
        "
-
-PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw ?= "host-ipmi-hw-example"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-hw-example"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "obmc-phosphor-chassisd"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "obmc-phosphor-eventd"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-fan-mgmt = "obmc-phosphor-fand"
-- 
2.6.0
