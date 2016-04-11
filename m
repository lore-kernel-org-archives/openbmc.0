Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qjr7P47BhzDqWs
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 10:10:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460333439521629.4642445526947;
 Sun, 10 Apr 2016 17:10:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 5/7] palmetto: Configure macb driver into kernel
Date: Sun, 10 Apr 2016 19:10:29 -0500
Message-Id: <1460333431-28399-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460333431-28399-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460333431-28399-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Apr 2016 00:10:42 -0000

From: Andrew Jeffery <andrew@aj.id.au>

macb drives the Cadence GEM device, now integrated into the QEMU model
for the AST2400.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
index 2594dec..e134903 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
@@ -2,3 +2,5 @@ CONFIG_HWMON=y
 CONFIG_SENSORS_NCT7904=y
 CONFIG_EEPROM_AT24=y
 CONFIG_SENSORS_TMP421=y
+CONFIG_NET_CADENCE=y
+CONFIG_MACB=y
-- 
2.7.1
