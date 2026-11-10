Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30B8606A321
	for <openbmc@archiver.kernel.org>; Tue, 10 Nov 2026 23:01:24 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPMZZ5rqyz2yr0;
	Wed, 11 Nov 2026 10:00:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794329800;
	cv=none; b=SEwHNz5XRnIpK36esUGhFtLxpunR/BQXUR8TuwpMZtNU7nnTSL8rvWkGxQussxai4WJdDnEOnkeOtSH3xQ9LAsMBx9Ntt895Gmj5z+OdlE+K8QiyWen1K3RvG2nEF+Ef7fUyxSyAqMveCiA6PMnhpW0iHYit0ML3+j31eKCR7T8fZ5WlKlhzxT8bELTh7gmvtccFxOWMJbBA6tpL7lXTSk0BY7xHNUb7V/+NtkUgB/qF6T5aPTT8kTuH+8w2VKWNktxPJVTAYuY2pWQEQH9tBKEo8YyTE3P038UYbxtDPvZt+OuTU/o8Du3aIPiMgTyP8vWXfiUDB+z/TLCmiv9eFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794329800; c=relaxed/relaxed;
	bh=OMUVvNok96eLG6z3uWZdjjBaPhh9NjlLMIaPd6V/DRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WlTpnMuWuD6cNnu9VddFBskQMX13Zjw693H8oCksIdHvOQCUVeWnKnTTdMjQNOjA3kZSuyEyowjUvbh2LP2xEt51/Xzu9CCB+pv4xmpKbwQvbcDBt0QpaAscLGovv4UXFGr42LoIESnvVFQ2eeC8cAcq3e3gKMQn3YLmXKeS02hGk7AlcScdv0rX6PXCTo32GAY6IJXi2sGUG95YURWq+3IXGUgwmfd0JpvdnjtEr8y2+e/xg7ib9cPTRXHNHR05Hlmcthh0d0iH4Y21AYC+984OysTXKh567t13faY+fHEjPoUl5Jw90Of1u9qaIbtNq3153oZmc4AGcyvJVI2nyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass (client-ip=46.101.248.176; helo=zg8tndyumtaxlji0oc4xnzya.icoremail.net; envelope-from=stevewong@hust.edu.cn; receiver=lists.ozlabs.org) smtp.mailfrom=hust.edu.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hust.edu.cn (client-ip=46.101.248.176; helo=zg8tndyumtaxlji0oc4xnzya.icoremail.net; envelope-from=stevewong@hust.edu.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 88 seconds by postgrey-1.37 at boromir; Wed, 11 Nov 2026 03:56:38 AEDT
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPCVG5sM8z2xfK
	for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2026 03:56:38 +1100 (AEDT)
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC2fmpnTPNqWa8vAA--.40713S2;
	Wed, 11 Nov 2026 00:55:03 +0800 (CST)
Received: from 51f0e866aafc.ntu.edu.sg (unknown [155.69.197.24])
	by gateway (Coremail) with SMTP id _____wBHQDdZTPNqhKI0AA--.54723S4;
	Wed, 11 Nov 2026 00:55:02 +0800 (CST)
From: Suyuan Wang <stevewong@hust.edu.cn>
To: iwona.winiarska@intel.com
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	gregkh@linuxfoundation.org,
	Suyuan Wang <stevewong@hust.edu.cn>,
	stable@vger.kernel.org,
	Kaixuan Li <kaixuan.li@ntu.edu.sg>
Subject: [PATCH 2/2] peci: Fix use-after-free in remove_store()
Date: Tue, 10 Nov 2026 16:54:49 +0000
Message-Id: <20261110165449.1996921-3-stevewong@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMC2fmpnTPNqWa8vAA--.40713S2
Authentication-Results: app1; spf=neutral smtp.mail=stevewong@hust.edu
	.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxJry3CFy5GF17Gw1xZFW3trb_yoW8trWrpr
	ZxXa45Kr1DWr17GrsxZF4UWFy5ua1fA34rurW7Wr1Ig3W3Ar909a40vFWa9a4rArZ5KF4U
	Jry5JryrWayUCF7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1ln4kS14
	v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l
	5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxVW8Jr0_Cr1UMcIj6x8Erc
	xFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE-syl42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0CD73UUUUU==
X-CM-SenderInfo: jxsqimirwzmmo6kx23oohg3hdfq/
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

remove_store() doesn't hold a reference to the device across

    if (res && device_remove_file_self(dev, attr))
            peci_device_destroy(device);

Once device_remove_file_self() has dropped the sysfs active protection,
nothing keeps the device alive. peci_device_destroy() then does

    device_unregister(&device->dev);
    device->deleted = true;

and if device_unregister() dropped the last reference, the second line
writes to freed memory. So writing 1 to the "remove" attribute usually
ends in a use-after-free. A controller removal running at the same time
can also destroy and free the device first, and then
peci_device_destroy() reads device->deleted from freed memory.

Take a reference before device_remove_file_self() and drop it at the
end, the same way sdev_store_delete() does in SCSI. The deleted flag
still makes sure that only one of the two paths unregisters the device.

Found with a static analysis tool and checked by hand.

Fixes: 42bed52b2e9c ("peci: Add sysfs interface for PECI bus")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested only. The race with controller removal comes from
reading the code, I haven't reproduced it.

 drivers/peci/sysfs.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/peci/sysfs.c b/drivers/peci/sysfs.c
index c04244075794..4b1c8b91a3cc 100644
--- a/drivers/peci/sysfs.c
+++ b/drivers/peci/sysfs.c
@@ -60,8 +60,19 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	if (res && device_remove_file_self(dev, attr))
+	if (!res)
+		return count;
+
+	/*
+	 * device_remove_file_self() drops the sysfs active protection, after
+	 * which the device can be unregistered and freed, either by
+	 * peci_device_destroy() below or by a concurrent controller removal.
+	 * Hold a reference until we are done with it.
+	 */
+	get_device(dev);
+	if (device_remove_file_self(dev, attr))
 		peci_device_destroy(device);
+	put_device(dev);
 
 	return count;
 }
-- 
2.34.1


