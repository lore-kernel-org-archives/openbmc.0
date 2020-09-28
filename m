Return-Path: <SRS0=f1Ef=DF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF987C2D0A8
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 09:48:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 349C921D95
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 09:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="lv46w8Rl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 349C921D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Hlc4j31zDqSW
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 19:48:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lv46w8Rl; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0HhC1clGzDqQx
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 19:45:45 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id w7so488879pfi.4
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KrhHSrOowfUum2QUsNd1Vxmf1li4SXI698jpO+kwWOU=;
 b=lv46w8RlRCCgpX82Uk6JkMctDjjcc7hsE7AuYKV5eJFgm8GnkxNcrXBA2MA2uvtGGw
 QNK6WteoZRcFJ9TcaVMniGdVb0wEcM/eKcdZIRlj/b+x2EVazA0n6QIBEOtcCUAMg0OH
 dyLF6rSnA79p5v3O6ri+ZzfAeF+yOKt+7WKyae+Mh/vuxT6m20FaOiZwEogYtvdKBaNQ
 4Lh/YoeZDU+MtwF+KLWwX5734qjyhSRDgCjHq/S8eJlOzdhmLmnUNek/fOVvkmnHRvUa
 yYS+2vT759Wyp0+GTz1Yd4Vb+2lue/CvQDGA/XKMsi46wKqd6dRoeUzwfw4zutQs1jyF
 kKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KrhHSrOowfUum2QUsNd1Vxmf1li4SXI698jpO+kwWOU=;
 b=bfNq9EPfWt4B1RSDT8LshYbB+wO6IxzH6Te8IxBkY2q8kHg6nJRZ2r+94LWTvbnMyW
 y7h1TuEUpThZRBd/o9mhsZSNqNqmj9oP5CKrbHUNRPbqF4sf7Rpe89nZyIl2Epr4FdtX
 TZDekms8At//4NutUjhgBipi+yp89hnXqB3+RS3TRDH+UynUsk2gV1unX9rl0Vy5JViF
 hU68trJ4CAvkDc33ARozn63ob9Q6Em8dADR7c6wcWtUR0YoJB3DkubYZaEamGPbXF2n9
 BN1Iy6y1BcCRMbfw1xguqCSvAumxt19PfgjJ6Zwm0sdOjU1nsY4pehJG1gb2jjoDYjoq
 GPXA==
X-Gm-Message-State: AOAM5329COEV0cQX52NyXu4Mk9qgnnELNns86YOE4mYk+PRuSBK2DNdl
 FvDDqTYma65ayFm/Yc6L7FzLjb9lHgEPUA==
X-Google-Smtp-Source: ABdhPJzPg/F2kEv6Af93TpfWBmlIj8DpBTaQSuI9aC6OGdvqEzoWjqEKcgWQIUT9N4wREhB5N5KZrw==
X-Received: by 2002:a17:902:bf4a:b029:d2:8084:7e46 with SMTP id
 u10-20020a170902bf4ab02900d280847e46mr856488pls.54.1601286342691; 
 Mon, 28 Sep 2020 02:45:42 -0700 (PDT)
Received: from localhost ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id l14sm771395pfc.170.2020.09.28.02.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 02:45:42 -0700 (PDT)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.8 v2 1/2] ARM: dts: Add 64MiB OpenBMC flash layout
Date: Mon, 28 Sep 2020 17:45:34 +0800
Message-Id: <20200928094535.4100-2-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928094535.4100-1-wangzhiqiang.bj@bytedance.com>
References: <20200928094535.4100-1-wangzhiqiang.bj@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This is an alternate layout used by OpenBMC systems

The division of space is as follows:

 u-boot + env: 0.5MB
 kernel/FIT: 5MB
 rofs: 42.5MB
 rwfs: 16MB

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

---
v2:
  - Add copyright notice
---
 .../arm/boot/dts/openbmc-flash-layout-64.dtsi | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi

diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
new file mode 100644
index 000000000000..c8e0409d889e
--- /dev/null
+++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2020 Bytedance.
+ */
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	u-boot@0 {
+		reg = <0x0 0x60000>; // 384KB
+		label = "u-boot";
+	};
+
+	u-boot-env@e0000 {
+		reg = <0x60000 0x20000>; // 128KB
+		label = "u-boot-env";
+	};
+
+	kernel@100000 {
+		reg = <0x80000 0x500000>; // 5MB
+		label = "kernel";
+	};
+
+	rofs@a00000 {
+		reg = <0x580000 0x2a80000>; // 42.5MB
+		label = "rofs";
+	};
+
+	rwfs@6000000 {
+		reg = <0x3000000 0x1000000>; // 16MB
+		label = "rwfs";
+	};
+};
-- 
2.25.1

