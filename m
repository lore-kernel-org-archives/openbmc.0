Return-Path: <openbmc+bounces-1993-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F21DCD5BC8
	for <openbmc@archiver.kernel.org>; Tue, 26 May 2026 01:06:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gPZLv1DhGz2ySJ;
	Tue, 26 May 2026 11:05:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::835"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779680336;
	cv=none; b=T4iXt2UBZPMxODPhgY9J3ELusthu5mHK2/oA/yMT8KX3roEo31eVFwNu+H4fQvaVj/+WinQisuLdHkbYIxFF3TBlVMG/gQO3KGCxhjK7owMzDTDVjt3QbZA7Z0/ZLbOg4dSUQkg7i7Y+Kgud4f+D+3aaOTuZkJZ3tzgJkQesGectaE1Cp7n8Oag4aQRiIEJBzKC3QRrdH4SFK/1uVuZ2Zk6DGZZnO3rJuk4KIe03X8N9scPDE+NaaUrdKSdVGInnRBwV6lfoMnDfptUUVOwI80qmIQj5oXCdeGq4JXUMV4xKS6Gu3W8X1mC9LXLhBFsebTAFY4aZu2AAWQg7JB4o5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779680336; c=relaxed/relaxed;
	bh=R9RwqYB7r6bhFVqkJhACAFbElSFPJqjemhMeBFLCqnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oky7QZeTE851s7pi37HjzsxhGqywtCv1O/4B4IfJPTXcl6L6sHF2Zqawkkqf16qiSqdJ+Izl9yfsBxkNxMVMvB1hONh8kPGXpAy3HsupMr+WmRclzA6B4gsEM+stVmJy6+6qZ7aY2hVD5IGa3QK3TyV7FOIj+taXXbusuIq4rGreqv1oOr+I30OMYzGpFFIZ7SfDNaNovWlRk24x5huQ3YNvQZ62IADLSTZlWjdNftHZZAcyFu7a4gKaod2mPIhUjcWZvdCmZ9GTp3Ct3EKsAHRubafReiaY8cmxmag52eMZY3a20flIDL0fOvpUKjkncXpWSqeuokf8+sjGepYoZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JtrbYBwU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=dbgh9129@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JtrbYBwU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=dbgh9129@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gP1np4rJsz2xPb
	for <openbmc@lists.ozlabs.org>; Mon, 25 May 2026 13:38:53 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-516da301e64so41512441cf.1
        for <openbmc@lists.ozlabs.org>; Sun, 24 May 2026 20:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779680330; x=1780285130; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R9RwqYB7r6bhFVqkJhACAFbElSFPJqjemhMeBFLCqnM=;
        b=JtrbYBwUfejI42CBLVLXkSjNm6Akr1guSGVE2Eo1K35I6IfDx7ReCRKwDzH39wDbwX
         d6YJBZ8AUgogC1ps8aZB6VUUA/ZZWwjQRV5HnQd+fJ9F1P/GLEWnJZKOelFa+HdqEpOg
         Yc6okR08JMbYWdF6+vBLer1S1JxmPFcefMpBawkQkl/sV0DRr05WtbI3Tj0HVYSgGD0A
         p+zuwyKoz4HuIioz1elt0XGvCaplR2rZi2UudmZcgxHc551W1B6PTMuzHGp4cXXzPHxO
         qxfPzc0oJnkW9oEb0O93lm+gRNslRVKstqrXf3xKrWP5ssbustSnclFrblaPbUwIX38d
         NomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779680330; x=1780285130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9RwqYB7r6bhFVqkJhACAFbElSFPJqjemhMeBFLCqnM=;
        b=pMz2pGUfig7YMTZZXPgFBBa88FJDzCzyZTyafgzuYpRj5OF4wTiiIcdG1oBM289YW4
         qTSAKbVE81b4QXPUExib7PhtgkiEWexpN1T9KuI7Mb1N3Twe2Ixx9fqZ2RYocPol5b8k
         b4TGFaUaK4AEtDOeam2FYWmSBCz3C3YksAJW5107WF22sI2u9DJrG7qcehUpQNVwTIFC
         PqM3dsEsVGzqBCKn1qDwezflVjCe/bDHBtW2t/1naaNoTWDZnvWCptqipmjm5nxOzOOj
         jrLnDFGKFNyjokCmCSm/lLHmWd4vyrZLVBmITR0TD35Zrt+QbCSgRPXMigwDmRjtJ4bV
         hrkw==
X-Forwarded-Encrypted: i=1; AFNElJ9A9ktkybUptQe3P8nhuI/RyhO1kM1lqwH/NQ/dVyzigZ5j9OFYNj7SCWjZkvJLDktwOjeP6DCA@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9TYslNAd6CN5wrQsDdthXLAThxStWJezSFWYRF2bLNg6jFTm8
	Rhw92SyQmG+HX30oKRPerykB/EvxQxUEMi8TksTyplvyG2g7NyL+Yg08
X-Gm-Gg: Acq92OFTRLfOKKNSKjy7Lq7KbqWSrBwFKIvpvzjhMlfbIRB58tJBkzI0pD0P5WpyPo1
	4noRAlPdiq0/rUulNBSLBq0u5Rdc8m1+YWDWZ49tRo4pMheFxpzli5/0BCEYMijxEMIpgzcCl+3
	xPpAOWHlRlBtJ5tBNILvg+4WTb6emArip8reovSeFGBslyLpEkZhyDm/Qqewu8nINqvhRjodHss
	QHk2jpwHy3rL9uRxiEJ4TCeTHAWF4fiPxhkOPHjoBrRs8Bq+n76r+tgMudNgumZ7Cfp0oNn1m0l
	cXXKnGTDOgPSBN+an5JIkH8zsKZ/ExcNWQhzN+MSRDNx77wH9XHitsyyHnRPhM6mHvlO+f9lx/l
	HdWk7u+2qk4ACw5tQLO7aNAzxDN4tu0255nS27cLtsZ1PhoMkOQpurtNk7l73xVQGvqaEh97UJK
	zU6AR/4AnTW9RnGpCa981pw9vEAluJdgjIXBzxtyRRxB8jxg++dhs=
X-Received: by 2002:a05:622a:110c:b0:516:d83c:edb8 with SMTP id d75a77b69052e-516d83cfc3dmr157369111cf.27.1779680329955;
        Sun, 24 May 2026 20:38:49 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516d8cb8da8sm83104691cf.20.2026.05.24.20.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 20:38:49 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>
Cc: Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Russell King <linux@armlinux.org.uk>,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: npcm: Fix OF node refcount leaks in SMP setup
Date: Sun, 24 May 2026 23:38:46 -0400
Message-ID: <20260525033846.1346744-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

npcm7xx_smp_boot_secondary() and npcm7xx_smp_prepare_cpus() look up
the GCR and SCU nodes with of_find_compatible_node(). The returned
nodes are used for of_iomap(), but the node references are never
released.

of_iomap() does not consume the device node reference, and iounmap()
only releases the MMIO mapping. Drop each node reference after the
corresponding mapping attempt.

Fixes: 7bffa14c9aed ("arm: npcm: add basic support for Nuvoton BMCs")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-npcm/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
index 41891d3aa124..4c1fc9983746 100644
--- a/arch/arm/mach-npcm/platsmp.c
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -32,6 +32,7 @@ static int npcm7xx_smp_boot_secondary(unsigned int cpu,
 		goto out;
 	}
 	gcr_base = of_iomap(gcr_np, 0);
+	of_node_put(gcr_np);
 	if (!gcr_base) {
 		pr_err("could not iomap gcr");
 		ret = -ENOMEM;
@@ -60,6 +61,7 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 		return;
 	}
 	scu_base = of_iomap(scu_np, 0);
+	of_node_put(scu_np);
 	if (!scu_base) {
 		pr_err("could not iomap scu");
 		return;
-- 
2.43.0


