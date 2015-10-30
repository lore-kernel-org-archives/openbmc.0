Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id ACD511A0CD1
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:43:02 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208977794909.0339131522107;
 Fri, 30 Oct 2015 05:42:57 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 2/2] Set btbridged as default host-ipmi-hw provider
Date: Fri, 30 Oct 2015 07:42:52 -0500
Message-Id: <1446208972-26266-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446208972-26266-1-git-send-email-patches@stwcx.xyz>
References: <1446208972-26266-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:43:03 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
index 474dde8..b8f40e2 100644
--- a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
+++ b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
@@ -18,7 +18,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
        skeleton \
        "
 
-PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-bt"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "btbridged"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "skeleton"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "skeleton"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-fan-mgmt = "skeleton"
-- 
2.6.0
