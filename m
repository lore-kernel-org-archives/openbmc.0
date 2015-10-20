Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 72A0F1A0ABE
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:22 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368820542899.0819248586134;
 Tue, 20 Oct 2015 12:20:20 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 09/20] Make host-ipmid pull in host IPMI to hw package
Date: Tue, 20 Oct 2015 14:19:47 -0500
Message-Id: <1445368798-31274-10-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
References: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:23 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Set preferred providers for palmetto and qemuarm targets.
---
 .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf    | 2 ++
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          | 2 ++
 meta-phosphor/conf/machine/include/sample.inc                           | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index 0efdda0..0ef430e 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -29,3 +29,5 @@ UBOOT_ENTRYPOINT = "0x40008000"
 UBOOT_LOADADDRESS = "0x40008000"
 
 FLASH_SIZE = "32768"
+
+PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-bt"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 5f38eb3..ab3a1cb 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -3,6 +3,8 @@ DESCRIPTION = "Phosphor OpenBMC IPMI router and plugin libraries"
 HOMEPAGE = "http://github.com/openbmc/phosphor-host-ipmid"
 PR = "r1"
 
+RRECOMMENDS_${PN} = "virtual/obmc-phosphor-host-ipmi-hw"
+
 inherit obmc-phosphor-license
 inherit obmc-phosphor-sdbus-service
 inherit obmc-phosphor-c-daemon
diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
index 89ad0ec..801706f 100644
--- a/meta-phosphor/conf/machine/include/sample.inc
+++ b/meta-phosphor/conf/machine/include/sample.inc
@@ -17,3 +17,5 @@ VIRTUAL-RUNTIME_obmc-phosphor-chassis-ctl = " \
 VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
        obmc-phosphor-example-pydbus \
        "
+
+PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw ?= "host-ipmi-hw-example"
-- 
2.6.0
