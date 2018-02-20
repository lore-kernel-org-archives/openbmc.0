Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PS2iXovF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Mcd3k9Fj"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnTL6QCPzF0cG
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:20:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DA21620C0F;
 Mon, 19 Feb 2018 23:20:04 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6mKIoAgoP6Zqo9V3j
 uY1DJ5v+jd9tZGMasAnS7S9pHc=; b=PS2iXovFFTCJCOIC4ioBkKrr89jRM5LlW
 UQHwQmPdHXylIPF+VV/H0JTfM2oJ4j6nlZxl2v7ANy5VJMw+QJpAoySMREM43rDf
 tSF8cHHSKz9+i9uzDf4WVarFx/k0mAkQNYJCghrqWKKc89Wbqb8FCH3xWFII6MwG
 EZC++cR7dVAh0nMMoENfkUcd2vQAezrJ8FNC8D40C5tmalUgHQuVmZGrVD/Man4T
 1jHnpO/anFXgkNMJSR9PBwwwUhe9SAQn3vgE6aR62sTK6vDqIymovzpuG776aDYz
 vwhPrzXh/PAWvIW3t8CKXNV9p8A2AOOvZpH+My1lTTRVzjM5py1AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=6mKIoAgoP6Zqo9V3juY1DJ5v+jd9tZGMasAnS7S9pHc=; b=Mcd3k9Fj
 5CMfnJ8DIc4wC6HnkCJu8FWR9dk5oltulVPEiDEwVvdmBFo1osKVAQtBe8M+V0MK
 Nw2mYdu5ZlMmCiiMqQ8bz9Tdswk7z9p4qH6t852qUPonqtJWUhrMetmFLzm+phBm
 N4rNHrXeuojHDFNSGXe4/NEZCkC52uSXIY35gMV/tPybmXx34INDNqFNBf77ivi3
 gmGPCfc6tbPm4mXrVfxTGpPZM6PBZ1iFWraGSRtBKAWcvlTq53v/BPdR3eblES0w
 NWKeXbX0cqwxwqPp+AtHvhRz+Anzerj2bGDt0vWLkXqPc9XK007dbcHPeP5sEf/W
 VBP9DvPiHAB8SQ==
X-ME-Sender: <xms:9KGLWq1VNvePpgVt-Ai9__xMGNJmZok5QPjXqG6QGr9uyPenFAsd5w>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 174A77E0DA;
 Mon, 19 Feb 2018 23:20:01 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 15/16] fsi: gpio: Remove unused 'id' variable
Date: Tue, 20 Feb 2018 14:48:43 +1030
Message-Id: <20180220041844.13228-16-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180220041844.13228-1-andrew@aj.id.au>
References: <20180220041844.13228-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:20:07 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 2a49b167effe..20b334f1827d 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -270,7 +270,7 @@ static int read_one_response(struct fsi_master_gpio *master,
 		uint8_t data_size, struct fsi_gpio_msg *msgp, uint8_t *tagp)
 {
 	struct fsi_gpio_msg msg;
-	uint8_t id, tag;
+	uint8_t tag;
 	uint32_t crc;
 	int i;
 
@@ -295,7 +295,6 @@ static int read_one_response(struct fsi_master_gpio *master,
 	/* Read slave ID & response tag */
 	serial_in(master, &msg, 4);
 
-	id = (msg.msg >> FSI_GPIO_MSG_RESPID_SIZE) & 0x3;
 	tag = msg.msg & 0x3;
 
 	/* If we have an ACK and we're expecting data, clock the data in too */
-- 
2.14.1
