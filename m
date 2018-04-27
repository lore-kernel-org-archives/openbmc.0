Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TaQ1ewQp"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YtKSf8Ka"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40XcFK4qbjzF24D
 for <openbmc@lists.ozlabs.org>; Sat, 28 Apr 2018 00:46:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 73E0620DBC;
 Fri, 27 Apr 2018 10:46:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 27 Apr 2018 10:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=CssMVb7BQRCy457SAXzqQwUZbdAD/thIJYmg97eLd
 z8=; b=TaQ1ewQpe9nztcqInbpeqy8/HceshOQ4aUQN/yFRq8onuMAlhS8dhQ1dm
 T7FG5bK6POeLilbGbufUFSXpGJfPbG4T0cdBxMwv1B6wnn+Vcq2aQkKmQxc7A5BP
 HdjXMY+P5Hi9W+VkDJb5Wx3c7qqXehtgmqVvGBBeKLpx2fea36D90L8FMDxPdeP4
 eK/gS+qYtTrNS5jVwE3Z/G/zhtZY337G74N2yrD7IW2SQbzOspNpcjcuQu972xqU
 y+B0oZ/BQ137f0QHEHaX+uKLX9lau4myfmVpd2VLdfEBZHHE+CPkl3yfS0u2wzKT
 0+N+DnFalQChwwATFxL35TXxK7dag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CssMVb7BQRCy457SA
 XzqQwUZbdAD/thIJYmg97eLdz8=; b=YtKSf8KaqG15m7erLXqoYaQd0w7ThxRoj
 JEdDukZ74yNy7VuucELCrLQjamrHL5gT4U0vkRUm9QskCXAP6lpbrdBaYp8DQJ3a
 rcvI24H5iejmZNvGID57H0sqk3HEm1snwpzxEP0XU0uWauCbs94H3hy4lbLh3nQj
 LlMZ30VbyOquElbWVzX3z/H2/OMaxo5q4N371qrH8XYBJl1kzQDwF6M1l7rSgEP8
 MXumTk7vzgrtWzSE5lrKt5B7EVnAym0jC8CInz64raFRSbBs+3/FPWbGmtZ6NVR5
 9M7SMFvxCw6xfAcemyQsKSHHxAEp/iMqLeTCvkm71FMwzTK37UhNA==
X-ME-Sender: <xms:sjfjWg1MrdXLV00h60O1gKUeWsIhz1-PFVuuGpiYZ9WsWj5LoRDZRg>
Received: from dave.aj.id.au (ppp118-210-239-249.bras1.adl4.internode.on.net
 [118.210.239.249])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1941D1026E;
 Fri, 27 Apr 2018 10:46:07 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, "Edward A . James" <eajames@us.ibm.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 v3] fsi: occ: Use PutOCCSRAM in circular mode
 for OCC attention
Date: Sat, 28 Apr 2018 00:15:59 +0930
Message-Id: <20180427144559.25907-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 27 Apr 2018 14:46:17 -0000

We can't do SCOMs from the BMC when the host is booted in secure mode,
and without triggering the attention of the OCC our commands won't be
processed. Further, the SCOM operation fails, which causes the OCC
driver's probe to fail, which leads the BMC to think that the OCC has
failed.

We have an alternative to the SCOM though: We can trigger the OCC by
writing the correct attention magic in circular buffer mode.

The PutOCCSRAM operation returns the written data length in the response
payload before the 0xCODE word, so the condition testing the success of
the operation is rearranged.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

v3:
* Address Matt Spinler's feedback that the address field is ignored in mode 3

Tested on two Witherspoon systems, one with secure-boot enabled and one without

v2:
* Minor typo and documentation cleanups

 drivers/fsi/fsi-occ.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 45ae13cd7a3d..938601fd7347 100644
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
+	buf[3] = cpu_to_be32(0x0);              /* Address: ignored in mode 3 */
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
