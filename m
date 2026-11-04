Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2B6606A326
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2026 03:05:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jK9Kb3xBmz2yDs;
	Wed, 04 Nov 2026 14:05:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793758499;
	cv=none; b=jBAzTmDN3cGZ2x2XtqzDCa/FK/SgZcXHzgVE80n1skrwtYTTexkCK2h1unSYn7dB9zZcpfeTBRzS0L/oXOLhAeozDtqED1Zmfl2D2BKUh/DMyZMLlBfp/7bl9nwpXjJItTbAqsm7/w8u2GzI27V9HKx3lEqq9If40Honkdkvd8+9ocSe+XQFSnSDMCs9lz7g6POe1RtYWsL45mAYP+ieNwygBuhkOH5SL0KOSbJphO5ulRpP9qhB2lXYrTqJ74vkNguzluLvey3LdhHU9F6DGju70RfKS2XDS9rSgBqZZABQwlS/aFoyf6XwFYWa+xqNhV64o6g/8XI+XglL3/eXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793758499; c=relaxed/relaxed;
	bh=11jjPWiqgOMEn4N4YnRzML+1grEqbSxQFTZABNOP3Lg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HA7EWYn2R4fCFnW6gDW9SCDVX/pTauAs15unWFCnm6lylMHyEFJL2bWVmT0rcZp+FwrjZUmvOVWvkPB/NC6txTU/99Mil2fAUcnjUhWY6RG7r6qVLgtdMPmY8t18bMB3ssHPGVIt1sSBtnA+nKjPQF+IfNw99QeTBwR10VFrdbqmf2/zb0+HunqEx+qSbzW2DeMNhcH2HE9UEjXSBs/E/s0SpvOqt50TcGJiKDrlLsLk6FgZFg+xXG0x0lPFY8SlHazFawC8ZzflU/tNfQLiA20gmOEMQ6WgwRd792AH353oJGQNVDV2ncIlwoRhPOC+shmvAcBCdkbz5q5x1S+Pdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jK8Cj686sz2xBK
	for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2026 13:14:55 +1100 (AEDT)
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnEPsWlepqGHY+AA--.9357S2;
	Wed, 04 Nov 2026 10:14:47 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: openbmc@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: chipidea: npcm: keep the ci_hdrc platform device for removal
Date: Wed,  4 Nov 2026 02:14:56 +0000
Message-Id: <20261104021456.1468462-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowADnEPsWlepqGHY+AA--.9357S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Gw15Ww4fXr43CF15tFyUtrb_yoW8JrWrpF
	45JFWfGFZ8Gw17Ja1UXw45ZFyrGFZ3trWrKF93t34Uurn8CryfXF9Fqayjga1DAry0gF4q
	qa1xK34kJFWIkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5ENtDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQBA2rqY+S6DQABs7
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

npcm_udc_probe() creates the ci_hdrc platform device with
ci_hdrc_add_device() and stores it only in the local plat_ci variable.
The npcm_udc_data::ci field that npcm_udc_remove() passes to
ci_hdrc_remove_device() is never assigned, so it stays NULL.

ci_hdrc_remove_device() therefore never unregisters the device created
during probe.  Both the platform device and the reference it holds on
its parent are leaked on every unbind, and the UDC core structures are
never torn down.

Store the returned device in ci->ci.

Fixes: 70f13579c2f7 ("usb: chipidea: Add support for NPCM")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/chipidea/ci_hdrc_npcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
index e52a2b05cbe2..8ad8797742f1 100644
--- a/drivers/usb/chipidea/ci_hdrc_npcm.c
+++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
@@ -70,6 +70,8 @@ static int npcm_udc_probe(struct platform_device *pdev)
 		goto clk_err;
 	}
 
+	ci->ci = plat_ci;
+
 	pm_runtime_no_callbacks(dev);
 	pm_runtime_enable(dev);
 
-- 
2.34.1


