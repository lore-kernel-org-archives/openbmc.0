Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmjhK1YMQzDq62
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2016 02:30:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460737837031682.6285430784112;
 Fri, 15 Apr 2016 09:30:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/4] meta-openpower: add common/recipes-* tree
Date: Fri, 15 Apr 2016 11:30:31 -0500
Message-Id: <1460737833-13353-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460737833-13353-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460737833-13353-1-git-send-email-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Fri, 15 Apr 2016 16:30:41 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-openbmc-machines/meta-openpower/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-openbmc-machines/meta-openpower/conf/layer.conf b/meta-openbmc-machines/meta-openpower/conf/layer.conf
index a902796..46c5a5d 100644
--- a/meta-openbmc-machines/meta-openpower/conf/layer.conf
+++ b/meta-openbmc-machines/meta-openpower/conf/layer.conf
@@ -1,5 +1,8 @@
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
+BBFILES += "${LAYERDIR}/common/recipes-*/*/*.bb \
+            ${LAYERDIR}/common/recipes-*/*/*.bbappend"
+
 BBFILE_COLLECTIONS += "openpower"
 BBFILE_PATTERN_openpower = ""
-- 
2.7.1
