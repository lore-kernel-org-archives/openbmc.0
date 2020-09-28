Return-Path: <SRS0=f1Ef=DF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D12EC2D0A8
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 06:46:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F69523119
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 06:46:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="Kf42cz72"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F69523119
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0CjL757WzDqGc
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 16:46:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Kf42cz72; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0Cdb62ZSzDqFH
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 16:43:15 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id w7so44101pfi.4
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 23:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zjnRPZpJ0wNVsTzMbGkNL4j7lA8+Q5VjQ8H8cjJmPdQ=;
 b=Kf42cz72cdEA0+iumaA7x0WDM6/sCS60ghUrm2AiYhiiLf2CBH7Mp+Hw14KxamPChe
 ptCnJidU/GvS/OmHqaGiqnYxOPa2Iqlmin7g/u1SPmGvWY6VeZL+pHJjYJVhJav1AVXQ
 m6ho3Jd7/AAe/htYxvZXeqw5Pkj7TxwfV4kR7/eS6mZLVwquex77YIdKEtM3qJ3wflkW
 rhB1LwImk+y9LXo5JlwheQNfRe21QfaQy4WmQTDLM3kZXMcoD0Hc3jVReBr6Q+sJFm74
 OHWVje+aLK5DrCEV0pAW0S1iO7XurTr1S+eFRq6FGAO9vZXjuJm7hbFnjJAS6b9THo+l
 76QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zjnRPZpJ0wNVsTzMbGkNL4j7lA8+Q5VjQ8H8cjJmPdQ=;
 b=oA+gTmKDhgUTR9/f6Nn7IuTQ0gWw5CC/jlFfImE4Ha2Cq4BIiqYkn+ZIKV83xCRdeR
 oS/ckNS6Jrxspo1jdVMHVmJYSsAf8G8ZsLkvxijeRymOQwpx/Jd/KmxOxHlpQVD8HpRC
 PnMz/EsbsriVSm1OHhuw9ygLZMN2qIB0OudAtLlrwd5YREHcmcDSAvLvJh1pmYmrKQ5d
 FN8/dYauXcUMiNcRLafSACB8JpSk15KT81RsYlcxu+y9dCVWKKu0N2NTdAuzr7dibEX3
 Z2hXf1++pwGNCGVk64gfO2A/jpTc0q5d0b+OK3Lukfz2WFv43fGW8+ohl9W1glptTgVD
 aIyA==
X-Gm-Message-State: AOAM530oHTUnYr7bX2Ipt7GDJV/p8LnN3Zof2fqQ5Alf5OQVi+Ld4FXg
 tSWgWGHcAHCbH9999+oJCdj2/eSg/lWOyA==
X-Google-Smtp-Source: ABdhPJxTsBiU6J9XWSe77xLufn4OMe6gv+X+Lik8lg01+iTRBFfGSxBRIbJU5D+xi3OFxSFSlb6I+A==
X-Received: by 2002:a63:338e:: with SMTP id z136mr142244pgz.122.1601275390826; 
 Sun, 27 Sep 2020 23:43:10 -0700 (PDT)
Received: from localhost ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id z28sm216203pfq.81.2020.09.27.23.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 23:43:10 -0700 (PDT)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, yulei.sh@bytedance.com,
 xuxiaohan@bytedance.com
Subject: [PATCH linux dev-5.8 1/2] ARM: dts: Add 64MiB OpenBMC flash layout
Date: Mon, 28 Sep 2020 14:43:02 +0800
Message-Id: <20200928064303.1961-2-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928064303.1961-1-wangzhiqiang.bj@bytedance.com>
References: <20200928064303.1961-1-wangzhiqiang.bj@bytedance.com>
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
 .../arm/boot/dts/openbmc-flash-layout-64.dtsi | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi

diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
new file mode 100644
index 000000000000..18c8047c1d0c
--- /dev/null
+++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
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

