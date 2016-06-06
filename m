Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNmKP755czDqG1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 06:20:25 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465244419087926.6069801278295;
 Mon, 6 Jun 2016 13:20:19 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH inarp 3/3] Avoid signed and unsigned comparison
Date: Mon,  6 Jun 2016 15:20:13 -0500
Message-Id: <20160606202013.20287-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606202013.20287-1-openbmc-patches@stwcx.xyz>
References: <20160606202013.20287-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 20:20:27 -0000

From: Patrick Williams <patrick@stwcx.xyz>

The 'NLMSG_OK' macro use a _u32 struct entry for comparison but
the length from recv is signed.  Passing the signed type directly
into the macro causes a signed and unsigned comparison warning.

Fixes openbmc/inarp#3.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 inarp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/inarp.c b/inarp.c
index 08a0c30..4b4f03e 100644
--- a/inarp.c
+++ b/inarp.c
@@ -360,7 +360,9 @@ static void netlink_recv(struct inarp_ctx *inarp)
 		return;
 	}
 
-	for_each_nlmsg(buf, nlmsg, len)
+	size_t len_unsigned = (size_t)len;
+
+	for_each_nlmsg(buf, nlmsg, len_unsigned)
 		netlink_nlmsg(inarp, nlmsg);
 }
 
-- 
2.8.3
