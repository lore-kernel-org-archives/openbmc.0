Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PFJpisOm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FaIJoVWG"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjH2FJkzDrKB
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:32:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 30D9E20D60;
 Tue,  7 Nov 2017 02:32:01 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=90+AjEr+iXDcQDmTC0oBiddkMGWG+
 XNWMzpNwQGuOXk=; b=PFJpisOmZFYjqSoIlmSNyOjidJnpgQlhYnOxI6hd6mAm+
 ZfQGxD/xTkZ56CWIlhNr3AZHQwRzbo7Ar8KEF8x4Qk9mtyD389gB0DbZBaLTV7ex
 BZPFxEHgcafMwRUcG8kSCwAuMaJipWAM08tI7b/3gbP0qRRQW+NXNVc6OK85uR3i
 vHzkFH+hu6GQZKFSRebkSk5Tfig+4gxFO0QZ0cJr5QdsihJAp2lGaXbetCfDKRVv
 RZ/7BTZbKNhZs5IxOnFXgqaM+jKxzjRn84JOdDLHzM5pK1EN4pjZItrv/DYWfMHj
 NCVmeY3aBuA0Rj1CnoGYdy42aoYOEZeCBCmQFAlmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=90+AjE
 r+iXDcQDmTC0oBiddkMGWG+XNWMzpNwQGuOXk=; b=FaIJoVWG/9/WkgzYV69JiC
 Rac/DCTIp6AknGwhtoe89DEpsmABO2NB9yHFHxFnZxfvaooFAvpQCLmoF72FcISX
 ncRoVMjL/0/cyBmjNRmXwoiz4idc+W+zi+R7Sy8O9XeSbVYjs6D0pV9/dsRwtKdi
 9Tawn6A2X8m3+To4i/+maVd2T+O8MawWvrgcTwEcG6+yprNucXJKNNySfLZLJWHR
 4CTZHo7PXOXFSQcLaWytJ2LI3/qOu9M1KqnCCQ28TlEnWSeGdJ8GPQwJxXRHAP/F
 sqTaA838QBugKDPmXJAlfcnG4AcOY9o/M6KJ3aq63SXfJKrxnd+QsmDvTfMoSqsw
 ==
X-ME-Sender: <xms:cWEBWuy3Bw3dyto1wy4CScKsbvydhjmgVf-P23C6lAclp1T1GVro_w>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 427C5242CF;
 Tue,  7 Nov 2017 02:31:58 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.13 16/23] leds: pca955x: use
 devm_led_classdev_register
Date: Tue,  7 Nov 2017 18:00:39 +1030
Message-Id: <20171107073046.13319-17-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 07:32:04 -0000

From: Cédric Le Goater <clg@kaod.org>

This lets us remove the loop doing the cleanup in case of failure and
also the remove handler of the i2c_driver.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
(cherry picked from commit 91940bb4ca7b7f1b5426cc14bdbd0c7f8347683f)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 2d34009d00e6..5a5d3765cfd3 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -410,10 +410,10 @@ static int pca955x_probe(struct i2c_client *client,
 		pca955x_led->led_cdev.name = pca955x_led->name;
 		pca955x_led->led_cdev.brightness_set_blocking = pca955x_led_set;
 
-		err = led_classdev_register(&client->dev,
-					&pca955x_led->led_cdev);
-		if (err < 0)
-			goto exit;
+		err = devm_led_classdev_register(&client->dev,
+						 &pca955x_led->led_cdev);
+		if (err)
+			return err;
 	}
 
 	/* Turn off LEDs */
@@ -431,23 +431,6 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x_write_psc(client, 1, 0);
 
 	return 0;
-
-exit:
-	while (i--)
-		led_classdev_unregister(&pca955x->leds[i].led_cdev);
-
-	return err;
-}
-
-static int pca955x_remove(struct i2c_client *client)
-{
-	struct pca955x *pca955x = i2c_get_clientdata(client);
-	int i;
-
-	for (i = 0; i < pca955x->chipdef->bits; i++)
-		led_classdev_unregister(&pca955x->leds[i].led_cdev);
-
-	return 0;
 }
 
 static struct i2c_driver pca955x_driver = {
@@ -457,7 +440,6 @@ static struct i2c_driver pca955x_driver = {
 		.of_match_table = of_match_ptr(of_pca955x_match),
 	},
 	.probe	= pca955x_probe,
-	.remove	= pca955x_remove,
 	.id_table = pca955x_id,
 };
 
-- 
2.11.0
