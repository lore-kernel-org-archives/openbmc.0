Return-Path: <clg@kaod.org>
X-Greylist: delayed 695 seconds by postgrey-1.36 at bilbo;
 Mon, 31 Jul 2017 17:53:49 AEST
Received: from 1.mo68.mail-out.ovh.net (1.mo68.mail-out.ovh.net
 [46.105.41.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLWt53tb6zDr14
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 17:53:49 +1000 (AEST)
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 7513E71EBD
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 09:53:46 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: clg@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 4D4AB260082;
 Mon, 31 Jul 2017 09:53:44 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10] leds: pca955x: fix typo
Date: Mon, 31 Jul 2017 09:53:39 +0200
Message-Id: <1501487619-26582-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16287831006608984834
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrieeigddufeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Jul 2017 07:53:49 -0000

Spotted by the 01 bot when compiling without OF support :

   drivers/leds/leds-pca955x.c:319:1: note: expected 'struct pca963x_chipdef *' but argument is of type 'struct pca955x_chipdef *'
    pca955x_pdata_of_init(struct i2c_client *client, struct pca963x_chipdef *chip)
    ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/leds/leds-pca955x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-openbmc-4.10.git/drivers/leds/leds-pca955x.c
===================================================================
--- linux-openbmc-4.10.git.orig/drivers/leds/leds-pca955x.c
+++ linux-openbmc-4.10.git/drivers/leds/leds-pca955x.c
@@ -383,7 +383,7 @@ static const struct of_device_id of_pca9
 MODULE_DEVICE_TABLE(of, of_pca955x_match);
 #else
 static struct pca955x_platform_data *
-pca955x_pdata_of_init(struct i2c_client *client, struct pca963x_chipdef *chip)
+pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
 {
 	return ERR_PTR(-ENODEV);
 }
