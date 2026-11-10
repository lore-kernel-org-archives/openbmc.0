Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E2606A321
	for <openbmc@archiver.kernel.org>; Tue, 10 Nov 2026 23:01:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPMZS66Ypz2yR1;
	Wed, 11 Nov 2026 10:00:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794329995;
	cv=none; b=Jedp1gmmaKvTCEhzUI9zml4PPpcVP3TIJ088465rKFdzcQUwnsY84pEpoieLDAEJT9xXtohvd4kQoy3pUbCfLa1ebli8k3CFS9jHhiva9Um8F72k/w9mrm0c2GFMA5TV9Tbo1Pt3WnoxTWScf4Zao81lcwnw3s9fe4qUTkJRunZvdOpANMPBmzCXXkoAjtooUsmK7q5/phMmeVlazXf5tzN9wXznP5sAvRqdhD1I8lhAp4NhajNIRNtLsyU6ZDgbItJ7CVmX9MsO/1GMo37KJ9SlRKyHl2dnHFCGmJytfg9BzyF+6NraG3Umgs/ArxJpYxVM9mcjbVjORRHuY/b/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794329995; c=relaxed/relaxed;
	bh=Uc4O8pK5nK8LeAYmaSGivWLqbt10i/bY+fluzSA22pM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QUSWU0f6b+0CFNNxQoFukZ7160DZaiQewvwlxHUv9u8n29vJ0bI6Ks9zR3BQpU3HJr85eCP6EAngL/rI5ZQDaGVFFLHe5gTpHZfk5bRNbmkKyu5yUGBtRLRgU/+cAc7gdSjMqod9r8SL7xIx9F4//2LmFOiRP8MAyPKYKayc7TngHOEW2TegSBwUMu6//6I1J0v/QcVa+wY/zMWqFcMHDCeLUbuxyo10roGTQr23yYFd95E0WtAp3SBUJVXGEaaNMIHTRnOsu8JfIGXpUHM2zqpnFlPCL5DX8Qtavu24A/c/JOqA9bdXDl18lGq/BsYxo94zvFaGcvEBjUPdOEvL2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass (client-ip=132.226.202.154; helo=fraori-sdnproxy-3.icoremail.net; envelope-from=stevewong@hust.edu.cn; receiver=lists.ozlabs.org) smtp.mailfrom=hust.edu.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hust.edu.cn (client-ip=132.226.202.154; helo=fraori-sdnproxy-3.icoremail.net; envelope-from=stevewong@hust.edu.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 284 seconds by postgrey-1.37 at boromir; Wed, 11 Nov 2026 03:59:54 AEDT
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPCZ20h6Sz2xfK
	for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2026 03:59:53 +1100 (AEDT)
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDG7cVlTPNqfv8NAA--.17876S2;
	Wed, 11 Nov 2026 00:55:01 +0800 (CST)
Received: from 51f0e866aafc.ntu.edu.sg (unknown [155.69.197.24])
	by gateway (Coremail) with SMTP id _____wBHQDdZTPNqhKI0AA--.54723S3;
	Wed, 11 Nov 2026 00:54:59 +0800 (CST)
From: Suyuan Wang <stevewong@hust.edu.cn>
To: iwona.winiarska@intel.com
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	gregkh@linuxfoundation.org,
	Suyuan Wang <stevewong@hust.edu.cn>,
	stable@vger.kernel.org,
	Kaixuan Li <kaixuan.li@ntu.edu.sg>
Subject: [PATCH 1/2] peci: Fix use-after-free in unregister_controller()
Date: Tue, 10 Nov 2026 16:54:48 +0000
Message-Id: <20261110165449.1996921-2-stevewong@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110165449.1996921-1-stevewong@hust.edu.cn>
References: <20261110165449.1996921-1-stevewong@hust.edu.cn>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMDG7cVlTPNqfv8NAA--.17876S2
Authentication-Results: app2; spf=neutral smtp.mail=stevewong@hust.edu
	.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar18JrykWr13XrWxXrWUurg_yoW8uw1Upa
	yrGa1aqF4FgF4agF4jkF4xuFy3WanrGFWDua9rJ34UCFnxW3s2g345AFySqFy5JrZ2gF1U
	Ar45tayxXFWDAFJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1ln4kS14
	v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l
	5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxVW8Jr0_Cr1UMcIj6x8Erc
	xFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE-syl42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0LL05UUUUU==
X-CM-SenderInfo: jxsqimirwzmmo6kx23oohg3hdfq/
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

unregister_controller() keeps using the controller after
device_unregister():

    device_unregister(&controller->dev);

    fwnode_handle_put(controller->dev.fwnode);

    pm_runtime_disable(&controller->dev);

The child devices are already gone at this point, so device_unregister()
normally drops the last reference and peci_controller_dev_release()
frees the controller. The fwnode read and pm_runtime_disable() that
follow then touch freed memory. This runs every time a PECI controller
driver is unbound or its module is removed.

Fix it by saving the fwnode pointer first, disabling runtime PM before
unregistering, and putting the fwnode only after device_unregister().

Found with a static analysis tool and checked by hand.

Fixes: 6523d3b2ffa2 ("peci: Add core infrastructure")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested only, I don't have PECI hardware.

 drivers/peci/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/peci/core.c b/drivers/peci/core.c
index e14995b1bf7f..247a287f87ca 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -88,6 +88,7 @@ static int unregister_child(struct device *dev, void *dummy)
 static void unregister_controller(void *_controller)
 {
 	struct peci_controller *controller = _controller;
+	struct fwnode_handle *fwnode = controller->dev.fwnode;
 
 	/*
 	 * Detach any active PECI devices. This can't fail, thus we do not
@@ -95,11 +96,12 @@ static void unregister_controller(void *_controller)
 	 */
 	device_for_each_child_reverse(&controller->dev, NULL, unregister_child);
 
-	device_unregister(&controller->dev);
+	pm_runtime_disable(&controller->dev);
 
-	fwnode_handle_put(controller->dev.fwnode);
+	/* May drop the last reference and free the controller. */
+	device_unregister(&controller->dev);
 
-	pm_runtime_disable(&controller->dev);
+	fwnode_handle_put(fwnode);
 }
 
 /**
-- 
2.34.1


