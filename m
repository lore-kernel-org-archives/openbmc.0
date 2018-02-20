Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TdF5eXza"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UTXaAO9L"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnSd2BFNzF0bC
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2FAAF20D52;
 Mon, 19 Feb 2018 23:19:27 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+qstixgkQF2txsEl0
 5slYD13AIB45eMXMs7oRN98Ffc=; b=TdF5eXzaxbvwscProQtW+1c9B5FjYDpo0
 Z14yOBARVeSX8MMDA9t8N5N0dhtR4qcxzaxpuu/7Hu/3wNEGvC+zoUFWBeqpNxM7
 hvQvOkPYki/tZxe9zOo6hfbfjHOlQauC2jVbS8A5zG7S/dFXkJU8QwhvDpS6hyww
 axvR0KeZ31DUADVu/U1s2bJy4LgNdo3ylV/89mPtxNm2uHNmbGcA36h8WmR5GVyr
 cjZMbWbrFmnHyGYTyQUi2AZAoYirBGDcaBaU3Whd+hWk/B5H+XX02D1MUeIlEsZE
 bsOgAakFXQSksKB4bPWJIQG3P/cTp3f91x8STJNPQPzD4yXRScf8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+qstixgkQF2txsEl05slYD13AIB45eMXMs7oRN98Ffc=; b=UTXaAO9L
 q4knIk73NdfoWH1Q1uH7kQ5Cotcj4Gwo5kzjo2tB6rpu1OUF0Ouq+GJNE282L6lu
 j3wZvdVG1PMUmjds9jIwksY/Z6Hh8Rb16E1BrReRAwvHDS9o2tITRVQR0XBs9cNx
 olNqtPqBFZgRKbnc5GAnORIc+zcZZYAs5fYhtLZQWZSUa5+jzbUdTG01t4XVG4yM
 gDQJ2fTP+Jbq8B617LHEjfKsXJwbNFufcYcSWaNMDRWAQg1EZNMZYiO/EFYIS8FH
 Tq2RQs5RxYD0TmDpY8v7t9AbMBa4333FYkvoLEXF93hwMuSobV9eXkzvDMkJpI6s
 QmopfUqBACPPvw==
X-ME-Sender: <xms:z6GLWnA3m9lI4ueyKPaulfZwZ_cb91tE1-tiiYH01JWdre3Uh2lFlw>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 363627E1A4;
 Mon, 19 Feb 2018 23:19:23 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 03/16] fsi: sbefifo: Rename
 sbefifo_release_client() for consistency
Date: Tue, 20 Feb 2018 14:48:31 +1030
Message-Id: <20180220041844.13228-4-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:29 -0000

We have sbefifo_new_client(), which feels unmatched by the currently named
sbefifo_client_release().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 92947b0fa279..699de6b9a4eb 100644
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
