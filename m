Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C063F606A31C
	for <openbmc@archiver.kernel.org>; Tue, 10 Nov 2026 23:00:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPMZR0MQ9z2yD8;
	Wed, 11 Nov 2026 10:00:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794330085;
	cv=none; b=osTbLf9Xpuk80ZMjv378H+8Smn5ZlhsQG0d5odPQLnlaMG7qQUvwcGznIUMqtzHHNr1eTSIEZFuF8bY0ErIeH11xvxRbHSL02zhTiP1qG8EqvU+AWLSTH62WN9MME+kqzdm9Edqawli0Iy0ycZOnVTNXbLS6o8BKPSR7e3NvMrphVoEJp9bnk4dI3gFyAosQG+KKcqdFIIhfPLwuY1WhiMjogmjY4crKoJNNNpstxILWeWQn63PhUHDSGpZfxlgaQMN4CIVEcQ9w1cjTIMxghO2FLW5R9LKWZYjn8ShsMUlpIXx5sApQ7wA07IPwcbmzNUeMnEI77TYjzwa6fu2npg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794330085; c=relaxed/relaxed;
	bh=+p5LsXOQnB/59+iK7tE/PH15gIGyp3rLq42QFenYeJw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HN87wFe3QnmKJav5ueXRrxZmRrzR5w9+JnfF1wEPb4RKneAPDtYzU97rzjJSjNNel6lMaYF574N7d/JsbvjdOD+8Ll4i23DsS623rRpaZPWSc01kIZi8lLzmcPhBSVVc54HsAMayfF7Kui4WFlj5yhenv2kFkpBdhjcnt3NLP0hvWFwymbR//c3lXJHnM61JKAl/DYBN5bAa4YW7iCLFiw2NTMit/c19AADFcBMckYcrtR1Ea2064ruebv8Upj2C6+o/R3w5mnmQoGsGsfJ66iqptSYfqgklTCa9XhCrWEUUoP48g6+vge45wYcypY49M6IzlL1wkY5DnGjc/djXqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass (client-ip=162.243.161.220; helo=zg8tmtyylji0my4xnjeumjiw.icoremail.net; envelope-from=stevewong@hust.edu.cn; receiver=lists.ozlabs.org) smtp.mailfrom=hust.edu.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hust.edu.cn (client-ip=162.243.161.220; helo=zg8tmtyylji0my4xnjeumjiw.icoremail.net; envelope-from=stevewong@hust.edu.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 94 seconds by postgrey-1.37 at boromir; Wed, 11 Nov 2026 04:01:24 AEDT
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPCbm1XJtz2xfK
	for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2026 04:01:23 +1100 (AEDT)
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDW_MRiTPNqeP8NAA--.2827S2;
	Wed, 11 Nov 2026 00:54:58 +0800 (CST)
Received: from 51f0e866aafc.ntu.edu.sg (unknown [155.69.197.24])
	by gateway (Coremail) with SMTP id _____wBHQDdZTPNqhKI0AA--.54723S2;
	Wed, 11 Nov 2026 00:54:55 +0800 (CST)
From: Suyuan Wang <stevewong@hust.edu.cn>
To: iwona.winiarska@intel.com
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	gregkh@linuxfoundation.org,
	Suyuan Wang <stevewong@hust.edu.cn>
Subject: [PATCH 0/2] peci: Fix two use-after-free bugs in device teardown
Date: Tue, 10 Nov 2026 16:54:47 +0000
Message-Id: <20261110165449.1996921-1-stevewong@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMDW_MRiTPNqeP8NAA--.2827S2
Authentication-Results: app2; spf=neutral smtp.mail=stevewong@hust.edu
	.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4xJr4DGw1kZr4xCr1rWFg_yoWktrb_ur
	W2krykAwn5GFnavasIkr1rZry3AF48Z3yftFZ5tF48A3yFqr98Xr4DZrWavr10v395ur1D
	Ary5ZrWfZwnrKjkaLaAFLSUrUUUUeb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPxYjsxI4VWkCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI
	0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAq
	x4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r4UJVWxJr1lYx0E74AGY7
	Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j
	6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxkIecxEwVCm-wCF04k20x
	vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jSNtsUUUUU=
X-CM-SenderInfo: jxsqimirwzmmo6kx23oohg3hdfq/
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi,

A static analysis run over the PECI core turned up two places where a
struct device is still used after the reference keeping it alive may
be gone. I went through both by hand on next-20261109.

The first one is in unregister_controller(), which reads the fwnode
and disables runtime PM after device_unregister() has normally already
freed the controller. The second one is in the sysfs "remove" handler:
it doesn't hold a reference across device_remove_file_self() and
peci_device_destroy(), so the device can be freed under it, either by
its own device_unregister() or by a controller removal running at the
same time. For that one I followed what SCSI does in
sdev_store_delete().

Both are compile tested only, since I don't have PECI hardware. If
anyone with an AST2600 or NPCM BMC could give them a quick run, that
would be great.

Thanks,
Suyuan

Suyuan Wang (2):
  peci: Fix use-after-free in unregister_controller()
  peci: Fix use-after-free in remove_store()

 drivers/peci/core.c  |  8 +++++---
 drivers/peci/sysfs.c | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 4 deletions(-)


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.34.1


