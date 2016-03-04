Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0809E1A00BC
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 06:30:40 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457119835153144.09663145602315;
 Fri, 4 Mar 2016 11:30:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add inarp to base image
Date: Fri,  4 Mar 2016 13:30:32 -0600
Message-Id: <1457119832-21035-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457119832-21035-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457119832-21035-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Fri, 04 Mar 2016 19:30:41 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add the inarp package to the base image. If users later want
to turn it off and not have it be part of the base image,
it can be changed to a distro spec then.
---
 meta-phosphor/classes/obmc-phosphor-image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index 0d4a0d0..164da33 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -41,6 +41,7 @@ IMAGE_INSTALL += " \
         packagegroup-obmc-phosphor-apps-extras \
         i2c-tools \
         screen \
+        inarp \
         "
 
 def build_overlay(d):
-- 
2.7.1
