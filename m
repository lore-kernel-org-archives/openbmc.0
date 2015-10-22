Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 28F711A051F
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:31:40 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445481098638426.40438151625244;
 Wed, 21 Oct 2015 19:31:38 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/2] Remove example applications from build.
Date: Wed, 21 Oct 2015 21:31:34 -0500
Message-Id: <1445481095-29630-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445481095-29630-1-git-send-email-patches@stwcx.xyz>
References: <1445481095-29630-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:31:41 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

They can still be built.
Not included in any images.
Part 1 of 2 (meta-palmetto, meta-phosphor).
---
 .../meta-openpower/conf/machine/include/openpower.inc     | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
index 10fa40c..474dde8 100644
--- a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
+++ b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
@@ -6,16 +6,23 @@ OBMC_MACHINE_FEATURES += "\
         "
 
 VIRTUAL-RUNTIME_obmc-phosphor-fan-ctl = " \
-       obmc-phosphor-example-sdbus \
+       skeleton \
        "
 VIRTUAL-RUNTIME_obmc-phosphor-sensor-ctl = " \
-       obmc-phosphor-example-sdbus \
+       skeleton \
        "
 VIRTUAL-RUNTIME_obmc-phosphor-chassis-ctl = " \
-       obmc-phosphor-example-pydbus \
+       skeleton \
        "
 VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
-       obmc-phosphor-example-pydbus \
+       skeleton \
        "
 
 PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-bt"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "skeleton"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "skeleton"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-fan-mgmt = "skeleton"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-flash-mgmt = "skeleton"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-policy-mgmt = "skeleton"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-sensor-mgmt = "skeleton"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-system-mgmt = "skeleton"
-- 
2.6.0
