Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="I3nmcdla"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YtLTHV6E"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40XLwc3HqLzF263
 for <openbmc@lists.ozlabs.org>; Fri, 27 Apr 2018 14:45:51 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1206B21CA8;
 Fri, 27 Apr 2018 00:45:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 27 Apr 2018 00:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=6VJ8m9UHP82ttb827duBZDeodFQuJ3VdzUPUVVudj
 2Y=; b=I3nmcdlawNjaqbOfO6/kibwUYiuYbIMdrQ/vSttUAfqjp+YR3nUD0oirf
 RLs86HGXvRV+h95HNi0FmLdtBplv9nC2oa0S5ldv94sVW4j7M62dv8wXOd08bfIY
 HjjNDsvygfLQhbWeTaDrdYhlHv+Vd1PtF2QipS+LO9aLzreGd68YwFCdNigykEAX
 P5OiYcVu8WMA75gAcL3K88H0k+Z2kvpfVbfpDeGHTjmgQWS1ukD6vmuZBUxu5bhz
 Hui5Q+AJaCBsDI29Sjk5otRSePVgHu19m+P0Swnbyf1QY7fUsHmlcGU+pjqQgdFG
 S3MPPqDMHknzm1UUIzuRlHEZK3gyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6VJ8m9UHP82ttb827
 duBZDeodFQuJ3VdzUPUVVudj2Y=; b=YtLTHV6E48Rde0/aY2wlPAZsVAPqxbgdn
 cP5EIKxSkBt9ZQhZ+MA5E398iyP45dZvyA3TjbmJLY9vtB3JSXOJIs+mZeXl6nek
 zxWo1GgmP3cWpBOORCZOCwR41UPJBBPaWQ/Q9DkZAkrU+6z1aEaJuiZO78b0PNBk
 uiBG4s1U1c7WkIRC/lLnG9hfSAB0fNX0O0G/hEMTKLeqc2ZpVH6MR/0S+Lz2fypD
 rqhZhgZCu9hDc8YKkuSdPw0lLMX7KPUxAJHR7hsov43WkhbE6X5mYoaiH7Kbr5uB
 6PBuFdll6Cvo0WgRpeoPb4RPUjhkh4MfBVd1tEjpfPpyHG8TvzF5g==
X-ME-Sender: <xms:_KriWlc6lB498NnM6SCztr6Y4ILZj1hahfs1_VD6WXLrdnsv1N8uwA>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58A62E47D1;
 Fri, 27 Apr 2018 00:45:46 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, "Edward A . James" <eajames@us.ibm.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] fsi: occ: Use PutOCCSRAM in circular mode for
 OCC attention
Date: Fri, 27 Apr 2018 14:15:12 +0930
Message-Id: <20180427044512.521-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2018 04:45:55 -0000

We can't do SCOMs from the BMC when the host is booted in secure mode,
and without triggering the attention of the OCC our commands won't be
processed. Further, the SCOM operation fails, which causes the OCC
driver's probe to fail, which leads the BMC to think that the OCC has
failed.

We have an alternative to the SCOM though: We can trigger the OCC by
using PutOCCSRAM's cicular buffer mode to write to the attention address.

The PutOCCSRAM operation returns the written data length in the response
payload before the 0xCODE word, so the condition testing the success of
the operation is rearranged.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-occ.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 45ae13cd7a3d..0f7f0c57102b 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -575,19 +575,16 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 static int occ_trigger_attn(struct device *sbefifo)
 {
 	int rc;
-	__be32 buf[6];
+	__be32 buf[7];
 	struct sbefifo_client *client;
 
-	/*
-	 * Magic sequence to do SBE putscom command. SBE will write 8 bytes to
-	 * specified SCOM address.
-	 */
-	buf[0] = cpu_to_be32(0x6);
-	buf[1] = cpu_to_be32(0xa202);
-	buf[2] = 0;
-	buf[3] = cpu_to_be32(0x6D035);
-	buf[4] = cpu_to_be32(0x20010000);	/* trigger occ attention */
-	buf[5] = 0;
+	buf[0] = cpu_to_be32(0x5 + 0x2);        /* Chip-op length in words */
+	buf[1] = cpu_to_be32(0xa404);           /* PutOCCSRAM */
+	buf[2] = cpu_to_be32(0x3);              /* Mode: Circular */
+	buf[3] = cpu_to_be32(0x6D035);          /* SCOM Address */
+	buf[4] = cpu_to_be32(0x8);              /* Data length in bytes */
+	buf[5] = cpu_to_be32(0x20010000);       /* Trigger OCC attention */
+	buf[6] = 0;
 
 	client = sbefifo_drv_open(sbefifo, 0);
 	if (!client)
@@ -602,8 +599,7 @@ static int occ_trigger_attn(struct device *sbefifo)
 		goto done;
 
 	/* check for good response */
-	if ((be32_to_cpu(buf[0]) != 0xC0DEA202) ||
-	    (be32_to_cpu(buf[1]) & 0x0FFFFFFF))
+	if ((be32_to_cpu(buf[0]) != 8) || (be32_to_cpu(buf[1]) != 0xC0DEA404))
 		rc = -EBADMSG;
 
 done:
-- 
2.14.1
