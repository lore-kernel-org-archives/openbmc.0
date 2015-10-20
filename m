Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CED261A0A15
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 13:02:20 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445306537066879.8402158018484;
 Mon, 19 Oct 2015 19:02:17 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/2] Move host-ipmi-bt from palmetto to common include
Date: Mon, 19 Oct 2015 21:02:11 -0500
Message-Id: <1445306532-30574-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445306532-30574-1-git-send-email-patches@stwcx.xyz>
References: <1445306532-30574-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 02:02:21 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This is the default host-ipmi-hw for all openpower systems.
---
 meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc | 2 ++
 .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf    | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
index 89ad0ec..10fa40c 100644
--- a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
+++ b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
@@ -17,3 +17,5 @@ VIRTUAL-RUNTIME_obmc-phosphor-chassis-ctl = " \
 VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
        obmc-phosphor-example-pydbus \
        "
+
+PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-bt"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index f1e4250..f6256a7 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -10,5 +10,3 @@ UBOOT_ENTRYPOINT = "0x40008000"
 UBOOT_LOADADDRESS = "0x40008000"
 
 FLASH_SIZE = "32768"
-
-PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-bt"
-- 
2.6.0
