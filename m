Return-Path: <SRS0=1Y7q=QE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E948EC433EF
	for <openbmc@archiver.kernel.org>; Wed, 17 Nov 2021 03:47:59 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 700AE61A58
	for <openbmc@archiver.kernel.org>; Wed, 17 Nov 2021 03:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 700AE61A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv85n548dz2yYx
	for <openbmc@archiver.kernel.org>; Wed, 17 Nov 2021 14:47:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=goKyoxME;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=goKyoxME; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv4fw4xy7z2xDv
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 12:12:54 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id m15so686151pgu.11
 for <openbmc@lists.ozlabs.org>; Tue, 16 Nov 2021 17:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z4U7aJ2c/OrCLSfs8lkK46XkDeObTTDEOGrWW7eHdek=;
 b=goKyoxMEGNfje+sDoFepIVvHWkw60Hq+MT2aTlDVFofvc4fCU44rE0reuoUwvlQCEg
 pYGjkdc4gUVxeq3pAfZnkjhabM1gq82yrhsgpfz6ushIxjJfqS+WXrt2c69oKpArY4JG
 K13aS3IJ8fgt9fdRf5NdItIOdr1eMVmuR779t4Gxr1B/rSmGcxF0s8XMUAAcbM76CRD9
 uQAIfAGDUbEmZKVhclcZy1sxsWUpdI29liS9mGmVOddNfs/Yu1oKL8nvga3adBkM9EoZ
 0Ke5GcyASdVIH3FQJU5BTeUESN4lMQmRfYuKtvAMOoPdst4X+COlhPUUJ8N7GcseJzGS
 tM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z4U7aJ2c/OrCLSfs8lkK46XkDeObTTDEOGrWW7eHdek=;
 b=Cbkdwpca+avdy7Q4Z51ph5Bzu1HqSX14r2IPIiC1qRkqQzEOdkv1YfErZ9FQfvhrlM
 1un+8z73rfyVTLy06JrElwqmhLLLCvZ6fE2wR//wwr9LJF5oNyZkzZMZtc8B+yT+KkLq
 YwbTn76t0Yc3j4EehSxsGKjne6xp89nT2LDE2hPWsAd9cLWbOhai2eDBS1vK35wLaG3X
 OcwvPIn7OKbgQvxOZ2QiHf4O8Bw7fOx+lsU/ljOzJbiE4cWE0xAmaaY/rHtNqUydJjRC
 jgbmjNyT0mF7KntqN2hG4jdyPSS00m+rxCnj26efKaARU3ZMX6w67c92wg/ISBM9kD4b
 54Sw==
X-Gm-Message-State: AOAM532/k59iyDh/SxlXxH5NDXPdnrhPK2fBASLRy2WQOIEhI81OT6BA
 juFMY+eXDWygB3qZHNEBwMA=
X-Google-Smtp-Source: ABdhPJyg8sBCkf80mS6/Covkq7nAOE6icJJF7Db8nXwyn6wC2NWjBk2bzme5BycUOcdR4d+EmZ7b2g==
X-Received: by 2002:a63:85c6:: with SMTP id u189mr2421925pgd.377.1637111571502; 
 Tue, 16 Nov 2021 17:12:51 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id h36sm16019469pgb.9.2021.11.16.17.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 17:12:51 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: avifishman70@gmail.com
Subject: [PATCH] clk: Use div64_ul instead of do_div
Date: Wed, 17 Nov 2021 01:12:44 +0000
Message-Id: <20211117011244.158541-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Nov 2021 14:47:20 +1100
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
Cc: benjaminfair@google.com, sboyd@kernel.org, venture@google.com,
 mturquette@baylibre.com, Zeal Robot <zealci@zte.com.cn>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 Changcheng Deng <deng.changcheng@zte.com.cn>, openbmc@lists.ozlabs.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

do_div() does a 64-by-32 division. If the divisor is unsigned long, using
div64_ul can avoid truncation to 32-bit.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/clk/clk-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index e677bb5a784b..c75880af2b74 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -56,7 +56,7 @@ static unsigned long npcm7xx_clk_pll_recalc_rate(struct clk_hw *hw,
 	otdv2 = FIELD_GET(PLLCON_OTDV2, val);
 
 	ret = (u64)parent_rate * fbdv;
-	do_div(ret, indv * otdv1 * otdv2);
+	div64_ul(ret, indv * otdv1 * otdv2);
 
 	return ret;
 }
-- 
2.25.1

