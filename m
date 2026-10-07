Return-Path: <openbmc+bounces-2733-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF66CA5FFF
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2026 07:27:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j04Sj1BHcz30TP;
	Wed, 07 Oct 2026 18:27:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791358020;
	cv=none; b=QlS6+91t+rgAR6So8XJJzkeroErqtUnzaSbftWsUlu2G1eQi7+ftU8X0+xNjrNY6JFt4TuCPim6k4+eGbR9Zus6ewXNs4EENSKVcbkq1BgUbGhQdGpQnRVmCYXIngc7/uW6HaQ+xfQTpZGMgiX4IBDue4RUqpdBA0CeKHbJXl2bKczdvpGo8J5WfTM1NAW50rwHhUo7lbwDXaBuQlGDAzgfTi/HjknmfTs7W2sRbsWRMhbAapo4PUKky/+e0VoXqSS46IIPkWt227GbT6C0sOejw5K8oN2wOjGQq7VsejPEOaYLoI10ylLCY530+lz+DMmtk4htSj+tWGfWzcb1kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791358020; c=relaxed/relaxed;
	bh=9wOw3fCxE0SXZHLWAQtQQ3cRE40r3r/0aGFaPTR+0DY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KDOcNoz1EHnMG8Ol+m9hwVoHK2oFG4M8xiRLML5QBlMZ4GOjcFu5xwZZn3TcKqRE9mJRQs9MUBPQOZAuxeCc8+X1xWPYhfOiJq8MZ7zZ5eSXFKZ5Hu8xj9uHjJAwVLfoJ0UHSw6XGDmZIugWn2+e4YqOKIYqoJUxOOpJJ1sgN0ODjLAhdTskRomuotE50v1vv1O573HRw+XSfwjZSrPZjJ7ImwIfG/IoJV8ag/h94/GufixZFjA/iH7Ie2UspmbxhIbaH6PjmR2vCyTROU4VmwD5VNEE1AZlXz01wfDNjNiFES7AqYQFzAQiWM6+mFfxDczjD5Cy1kvj8U5HQbl9ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DDCrlG//; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DDCrlG//;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j04Sf3Gjmz2yqf
	for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 18:26:57 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso19335495e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 00:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358014; x=1791962814; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wOw3fCxE0SXZHLWAQtQQ3cRE40r3r/0aGFaPTR+0DY=;
        b=DDCrlG//rmGf7hjC3HZJ7MxOfq/Rvf9XutYB85ype84gQBJebyVLERhdGMT6RBj4xB
         CvUuj185w/k2MysNN7VAZxmXuSRjJIFOPAQQ4NhCaVYhxBbx/htHLZMgrZqvUl19VHfk
         R9gmHTBxJJa5yS7aEjX3w92S5f6U8yFFq/x/dWBiCyiSXwmV81nykpJmwSj2F8S6w5cy
         cSOGBkr0nh9PaNIeH7mPZi7RZ6nqBpZNeNTWMdGiFYijK5lVdwTYge1SjwNmdi3oUCk4
         3ffNl3cgD+qCiTjC0J0F0z59p8Qf6n9gGAcuEmvZzE+jJWh0KYOMxWhSFyl2Ry7+89at
         rH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358014; x=1791962814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wOw3fCxE0SXZHLWAQtQQ3cRE40r3r/0aGFaPTR+0DY=;
        b=jlBcg7zlIdnNilxoEABa/mCdFcW/0fATqq3jpNDlp7W79Hg3UpgFeL2rIz2kKAiRZi
         lBAwH5kqcegO+9rnL2uK1Jq6X1GSwobYFx6Pro0UIC12gdcpZEWRNbywngmNgF9s8ZUS
         DZ67lNkxTVGWmevOomQr8tRNbrQRGcd3cecTBgCDDF8MRg9IMUSphy8WFI+NDFHwk8lC
         emFV25xB3BSVSKmv9ahpWdRRyfIVv0hkrHqnLUw7UQ3REMuUc8fSZ9UOxyskCcrUCQEI
         NcXsnNKJlqQiNE7zaHfNvKipFSriiQBOcbi2V3HqVaA/e5TY1YG/yzd1RXmBu/0oyY/9
         nq8Q==
X-Gm-Message-State: AFuF++nY7xJPJNY+nClvay78uKg52iwvJSmCdY8ek0Pl9jxkCOzoGdRJ
	jeEN7BPd+ayBOZGF0uEbkkiTWPNNjMBvlyBFYvOILtgx6iZakTnXczl3
X-Gm-Gg: AYBFou3FsZeGdEX1YDNAUO2w0L2kWsOknWLUYaWJ0RHBkFD59Ti6dICIywr842igHLr
	5xMUipEZmabvjko/fMBp3hehMdfOkqsveIL5euU+KACGxqTes+C/uNR8jdVkPz9Vbg/XPfwKop3
	whSoqjOn9Mw2Cmo3bhFC1deysc3TCPBRVyheR/U+3rq0Mtyf+vOWGXVxbFoAKRHrwZ2Lhsti6tp
	7Pnvqi9No7zSMYrGVDLDEhSSg0XQTNMkcuzSGLBnP4nI7yNIIsM9dduko5HCLyLSXPQ0hwkYQyl
	q3iLaPJJZfhq6gMmwmD23JmvU+P9S/enIcVXWnF4vjwFEraZH8xLNa6IUy1KLelvw/VPiU3M0Ps
	WFcPQmsMsKox/4POd9KdizzBHsVnyg9UvSBLYoz+VvB7Z/Hnb3AAU05v+kMlze9OYayZukBz58r
	S6ObxcHMHDcKi4WL/WbpzA+wk+9eeaWMAOa0rkuS0pcrIiZpbTCXo/oPHR0ZmoilXPMwTQOign2
	mufuhb6
X-Received: by 2002:a05:600c:8b51:b0:4a1:7d56:663b with SMTP id 5b1f17b1804b1-4a18066ca69mr16269955e9.24.1791358014554;
        Wed, 07 Oct 2026 00:26:54 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:53 -0700 (PDT)
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
Subject: [PATCH RESEND v10 1/6] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Wed,  7 Oct 2026 10:26:40 +0300
Message-Id: <20261007072645.1618147-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
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

The NPCM845 timer0 node references a single clock, but its clock-names
property is not described by the timer binding. Drop the undocumented
name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 35fa206..ab8a01c 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1


