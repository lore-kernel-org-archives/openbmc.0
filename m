Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="B+ls1lyG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TordsxMB"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnSY6nXlzDrdq
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EB05220D52;
 Mon, 19 Feb 2018 23:19:23 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HSHEhwX557uXkp6ot
 nqz/LTl6f0kAFst78NSfz26piY=; b=B+ls1lyG5yWf6/3QWf9VlRIRnFDyJok3q
 MnZSXByZ+bSeLDe/Qk72sLkbTLUTuFnU2p/k/3wbCTeJqbJf7CwRKTdmcnvtF2J7
 D70cKs+agAzhCvLK8YUBKqxngeXP8DUdPa53u8ztijtJB4+MEaem0ynjcqdHOkTC
 f/4ArXx1TjhmsbuRnt/e3oDiwIEq0lrXeNCOGv9bwEBFr+2GPm7NC3PSj5snG8lq
 l1hoppp7lLlRPlhDqK1r6ektU1BfoAPveVQJi+jmUw6lg3IrgLWkujTzJGH8NrSg
 gDwZKNh7TA5vqLuRjmrMSOrkfNdOmIimyUjWfO1BRGH9PmzQJ1Y2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=HSHEhwX557uXkp6otnqz/LTl6f0kAFst78NSfz26piY=; b=TordsxMB
 6qWVvo/z1YMyTiUXjfP5RD0KPY08m/rFU/sLYcP5LKnFiiPvTMteqlED/EfXL+kg
 DO+NIaQf6XIpwOVgPHnebubhy1shEZ+0R+1JTY7nk0Zt913m1G5g7s59xDZRHYEx
 YtsG25ElNdPZc+Jrro3DeabYUWYrCE85DvFMUAAdfyuqtM2osSi53JhV4pmfMRxj
 jFQCij6IQGKAe1o389kRExo8aYUDxd7sqSyIjDEYkqSE2q15XeKMmOJWTiPEX7pC
 f8cEYHyVxjcZKDM0jZibVIEbp8zR6RKXL9vo5CvrXKDP0WhC30+ZG07KDU0VAVTg
 nPte4g1l5e5whw==
X-ME-Sender: <xms:y6GLWvWGG4L0YMeLZh6GbkOPKgB0S4rO8fdxWg0k4szve1izl1muAA>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0845F7E0DF;
 Mon, 19 Feb 2018 23:19:20 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 02/16] hwmon (p9_sbe): Initialise device spin
 lock
Date: Tue, 20 Feb 2018 14:48:30 +1030
Message-Id: <20180220041844.13228-3-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:26 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/p9_sbe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 7dbe4d5bcd61..cda29f47f8ff 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -116,6 +116,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	if (!p9_sbe_occ)
 		return -ENOMEM;
 
+	spin_lock_init(&p9_sbe_occ->lock);
 	p9_sbe_occ->sbe = pdev->dev.parent;
 	occ = &p9_sbe_occ->occ;
 	occ->bus_dev = &pdev->dev;
-- 
2.14.1
