Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PKbRupJl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GMMsXA5n"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwkW6KxpzDqZ0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:36:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8609820D6E;
 Thu, 15 Feb 2018 07:36:33 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uUwDe0xhmBqEHYynD
 1MONk89K9563tgA39F1upl57k4=; b=PKbRupJlRNSjn3LVo+R9UrWNgwLL9YDCf
 YExEVk+68qmDGib2/UxEgZVx/R61yz9+DsoQfmK9lEctXc8F8b+jWKR3KWIhNVSk
 zW4o+LUQ4jIIM0tpY5wxckvaH1gQSfnZVcsHXXa9x1shatKFALnHgnQVcA4MbaoS
 HPqIvdyDKcAIWAzRVUIQ9LKloQ4Q652u5qwTO8kNZcympOFkeTtRaZzEj3Woi+Hz
 J0f8kGU75bHcdziQI4CMRN5lYyV6kQqtOcM5U0HQB5JaQ1DyRPzwYsaXTBBOy2KV
 +2ow96m7g203uFdtOmXheeSqvFhOC9AZbu9fcpWqiTWJNUuErobcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uUwDe0xhmBqEHYynD1MONk89K9563tgA39F1upl57k4=; b=GMMsXA5n
 9vaTTU+QWxzQSor8AL3O94jmiGBQ/116V1S2SmJ+RELRlbGag9Yp1RP6CvhQ2d9X
 ftWuInh7TYVpaH0zWd+Q3pfga+YAlk//QM6zIT59aF7rLfQMRDD8MYVepPj0zAN0
 lNxAs0+h/8CgUMp5D2vzx3Hvvm2/OJqopConSAZ4hfMqDxYpKTihu24/GSB8TiTe
 FYGIjhhcTLgmmbjkV9XVd2QigBiMqCz2YUusq9PAZBl6Q1ts3PhPl+NhQoeW/+LA
 VX0fG3PVLYbZzn5dbwveSxo791fYWB3P95pGAqanP1oW6IFPASA/LhUKF5ppZjP9
 TrlpbtbwIKwyDQ==
X-ME-Sender: <xms:0X6FWrX-_SP_omAo7r9RucxcCKb82I-nI_jvC-ETjLJAX_1lmbpAVA>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7F817E542;
 Thu, 15 Feb 2018 07:36:30 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 01/16] fsi: sbefifo: Rename
 sbefifo_release_client() for consistency
Date: Thu, 15 Feb 2018 23:05:51 +1030
Message-Id: <20180215123606.25777-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180215123606.25777-1-andrew@aj.id.au>
References: <20180215123606.25777-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:36:39 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:39 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:39 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:39 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:39 -0000

We have sbefifo_new_client(), which feels unmatched by the currently named
sbefifo_client_release().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 0697a10d3eb3..4ac9e188e683 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -314,7 +314,7 @@ static struct sbefifo_client *sbefifo_new_client(struct sbefifo *sbefifo)
 	return client;
 }
 
-static void sbefifo_client_release(struct kref *kref)
+static void sbefifo_release_client(struct kref *kref)
 {
 	struct sbefifo *sbefifo;
 	struct sbefifo_client *client;
@@ -353,7 +353,7 @@ static void sbefifo_get_client(struct sbefifo_client *client)
 
 static void sbefifo_put_client(struct sbefifo_client *client)
 {
-	kref_put(&client->kref, sbefifo_client_release);
+	kref_put(&client->kref, sbefifo_release_client);
 }
 
 static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
-- 
2.14.1
