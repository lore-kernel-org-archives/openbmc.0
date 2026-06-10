Return-Path: <openbmc+bounces-2077-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A32CD8CB2
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 16:08:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb9gK2D8Wz3bpM;
	Thu, 11 Jun 2026 02:08:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781107708;
	cv=none; b=JZ7u8dJBWbUt+87/FUn4w7dKBCb4LZPMQNM9HBM1KaMOyDK69Tohozj+jJfBuTqh4jplYb0J5DxiyOH5+pe9qUKjJAI3mxWIro2RudPw/RnLf8quHtf6ov2gCqIxdFXIWJqQrLG5pMFqp3mHUrBC303XQ5LMLey1XfIjUlqunJVMqhAtKsZ5sbefj7kC/KqjViZyaQrQc8ajdbn52pD0IP2PBOh9sasGqpMNa+PTisy93Y6JMRSK8ZMFGa9AiEkQAV3kcWaFBN9IeVRB5QCNmlQ4Fi9AXiGE3j7FM9XKssdNhh34H0tH0ExLwZHwXn3VkYX+NqrwcvRKWXLpbYcOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781107708; c=relaxed/relaxed;
	bh=qoK0+VOLEx0qCIrFRKNSEUqTEcnKybrGgvrByJSNTM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KZM1kkpdW3274p2kWD5LoU0YZKJqZg0AgdZhB9qVGF3AcD/q/J2LERozLCcRXd14tsrIcfXzRny6v4nS93FsHbdZWzTJBLXh4I3uMgu5LIMReOygRfChOOZHHGz35UnfKa9sLuc7CJtDwmVcB2bKPms4+KPoBUNzGRQAyhDU8yaML6mssf48Mo0HGin0cxsnDPMU4a8tkIGGqfr5eQZSX1DBdLPeG3uhlYZCvpe2mAnBpMfpFkPPcSPPmBUUQtza8RjEEEa7Fpg3V9CkYWL1y0LsckvTc5axm3/0uoFHnsy9EplqRNHAHQeZpzxHaPsEqiEA9NZ/fl7ArgkecnPkEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ad6xW0Fy; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ad6xW0Fy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb9gJ0jgkz2yR5
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2026 02:08:27 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-bed2b9bfa02so944636566b.1
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781107705; x=1781712505; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoK0+VOLEx0qCIrFRKNSEUqTEcnKybrGgvrByJSNTM8=;
        b=ad6xW0FywTGGpSa7AC4hMEFDIAzJyIcAqXSK+PwR64+bF6T6IfleWgaLkQ3AMFW5z4
         cjaxqZOR4DfB/LxdWsnLrsCZM70EzZ28x+xK6yW794GOBktbstPCmI9FAPNlMXmsmN41
         OUGH7FX16R6JOFyvor9+0lL//uzHKJ7CCFd5WMDgPE6vCGy5ms6Bw75wbNGDRWG63eSH
         98pWwNTmjNvNNyc0Noaf+n7FWKclEyviWNZto6qOhNj560NpDT3h9y6/2V05VAX7fp1R
         MYh5bFpDPQAaDE468ARYkWDOQ4QNjZfN3oCea/8VDWsFUWTiG2SNTizBaFv+ZUXer0n2
         fIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781107705; x=1781712505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qoK0+VOLEx0qCIrFRKNSEUqTEcnKybrGgvrByJSNTM8=;
        b=HTGzcGFV0HC3exSlzrHrOLs6fLnS+RQQC6tz+yK3eqM44vq2jl8bAeMY3/AD295sRe
         QNeE5u7eFdAhTC6N7+hziwW1X5ZZkocsPP/JWXO/+s5KVAUx2nK8Kct/UZYzBX25HWFR
         ifMO/DVvOZnKdo1Txn4VyE/4nI4a3lkh/ZvSJei7P47Az9q3h9oa8FLXHz3+LZkaJK9g
         NuMurd21HabEbwwu4fzopvPpyoG6S2KUrZgTSi3PWKGDC0BWZxke6O/fBZdDWntzA13d
         c2upU/0F7tF4cJTC9Sm6RgKm+tlbY6aR0girN7/9YKsxSj4UrqQ658ojB9RhnoSTS62U
         WDKg==
X-Gm-Message-State: AOJu0YwVP/3r0HWTA+tWOZ41uBfzR2Xo7pnxPmB5n3NcYXO3uMuNUvSZ
	rqreic1vanFk/OXEEJZ3Agdyd2Ek46rh2xkTfaZ1pqn2YRQ+/GOZPDE6
X-Gm-Gg: Acq92OFU49EI7giQ8YuutzkRJ+uxLvrlbjAF14CRJvfnMtuqnbM4e8Kiv5KDdvIpSlQ
	0G2O07UMq9d/GKPsaGz6dDJAKDj6Cd/yv+CRN7Ctk9nXWcmMlA+7mvCo9mjWr1PEpi63utZ4DX5
	7XOiYd+tTAXz+mRMdvwIO/K7uVEAdmv1FTPtagRdETawe1J816Wdw2TSzGzyNGT8whDxiltpxbk
	l+CqKU+YwRmuTxhLxMkx1UsS6w/cOhnxKOkUkqpjWozVIhNn06IG9FKWcS5c8Bt5Zp4ktKO9U5q
	7cZPiPyo5Fq9Yd+NNGOvjxxbmlXZjDu3phui+5cgmglmmugnrsQPc6BxRzqQcX8OVci1HuIry70
	uEehShpcfIAO/ZKzbjz5StjCJaFWpjjn4GjKfkNoPCF7Hirdh9GKFBK0WWt3Szbx/fKzhyOykv3
	wj3Onwp45qri37r7rXeO5VEKB1TZVrS3jBVGi590n77HJ3
X-Received: by 2002:a17:907:7617:b0:bed:7ce4:20c3 with SMTP id a640c23a62f3a-bf3749d9bf3mr978318866b.42.1781107704467;
        Wed, 10 Jun 2026 09:08:24 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm1188524466b.45.2026.06.10.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:08:23 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v4 1/3] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed, 10 Jun 2026 19:08:14 +0300
Message-Id: <20260610160816.2828713-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610160816.2828713-1-tmaimon77@gmail.com>
References: <20260610160816.2828713-1-tmaimon77@gmail.com>
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

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address. Keep the existing timer0 clock-names property
unchanged.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index c781190b42c5..7976baafb994 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -59,15 +59,6 @@ apb {
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
 				<0xfff00000 0x0 0xfff00000 0x00016000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
@@ -139,6 +130,14 @@ serial6: serial@6000 {
 				status = "disabled";
 			};
 
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&refclk>;
+				clock-names = "refclk";
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -162,6 +161,15 @@ watchdog2: watchdog@a01c {
 				status = "disabled";
 				clocks = <&refclk>;
 			};
+
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.34.1

