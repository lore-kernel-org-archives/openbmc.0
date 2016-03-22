Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qV5G90nzLzDq71
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 08:20:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458681643631765.0485234988317;
 Tue, 22 Mar 2016 14:20:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Limit size of event log db
Date: Tue, 22 Mar 2016 16:20:41 -0500
Message-Id: <1458681641-19859-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458681641-19859-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458681641-19859-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 22 Mar 2016 21:20:49 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The event log process now supports an argument to specify the max
size of the event log db. Set this size to a default of 200kB.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 .../obmc-phosphor-event/files/obmc-phosphor-event.service               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
index 8e0266b..828cb6a 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
@@ -2,7 +2,7 @@
 Description=Phosphor OpenBMC event management daemon
 
 [Service]
-ExecStart=/usr/sbin/obmc-phosphor-eventd
+ExecStart=/usr/sbin/obmc-phosphor-eventd -s 200000
 
 [Install]
 WantedBy=multi-user.target
-- 
2.7.1
