Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbCyw4rc9zDqmq
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 06:40:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466714435875341.8577100972848;
 Thu, 23 Jun 2016 13:40:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v5 01/11] meta-phosphor: Use obmc-phosphor-event for
 qemu systems
Date: Thu, 23 Jun 2016 15:40:23 -0500
Message-Id: <20160623204033.13165-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2016 20:40:41 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-phosphor/conf/machine/include/sample.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
index e66dc77..b499940 100644
--- a/meta-phosphor/conf/machine/include/sample.inc
+++ b/meta-phosphor/conf/machine/include/sample.inc
@@ -24,7 +24,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers = " \
        "
 PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-hw-example"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "obmc-phosphor-chassisd"
-PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "obmc-phosphor-eventd"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "obmc-phosphor-event"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-fan-mgmt = "obmc-phosphor-fand"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-flash-mgmt = "obmc-phosphor-flashd"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-policy-mgmt = "obmc-phosphor-policyd"
-- 
2.9.0
