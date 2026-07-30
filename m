Return-Path: <openbmc+bounces-2337-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBFEC5516D
	for <openbmc@archiver.kernel.org>; Fri, 31 Jul 2026 00:01:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hB5p515rrz2yjR;
	Fri, 31 Jul 2026 10:01:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785402509;
	cv=none; b=j/X/wzV94FENXVHQ3D4RRTl9CFaLf7LWLJ6wBMipUALfZdC7piblFN+E4EVqLfTd03pZSXPoLLIjjcRPGbK6WD4bijcfcOJNebdWfbYQsXL9qE2Q23Ku0pCDGahct36nMTOvdCkWMT7JhpvNrcfhgInvcm8bPt4x4H6Ly/zL+2nytkK/eKCa1kPJFAi/PhDqzkDHt3ov1jKDCGRXpUFyVcyLcg5TdczVAp+luIRWndjNU1tJbtUxGX/Lj6J8Dj/XifNzl/cxF85h+5/WQPSA8zpGUwpsAWRW+DOZiEpc+bfaD4q4pI4msWeENA7g8klPyvSHcnNwyBNjv5oPH1I0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785402509; c=relaxed/relaxed;
	bh=l9q0G/dy8xOj93Z4Uz1N2cqmBpBPDUFnL0RYm5N/nME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nA1oYnLYwQ+1ILUXOTettKAN9GERG8vIIP7d+OKltYb6RvNx9TuDrIqGexLAdl9R03oZ5snYKQSKfQaX3ZYgyaNle6rmzFZ8+FKB6unfzvk+ZtQn0vkVz/LOlQJuuJ7bzBhaz4g/ZbcVcwyN0MyfpKSijaUXqVmdltuqMdg/2irXPWP3NS1T1skn+YsVqhb9yx2C5O6UZ4NIewyWBd7lecz4olHDs10MYZJUaTIWYoo18lpXMOfXDcTbTF3RCFtqjUpvBh+q8oQkYaTOK9JnsxdIfOQya8bBPubQtBOvhCzK/Kubbm4AGKFLmdBnHWFZUZkhKUb8oxmAGFTYO1bU6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FpjXtv7v; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FpjXtv7v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h9jzd1xVqz2yYd
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2026 19:08:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB7A8409AE;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC6B4C2BCB9;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785402506;
	bh=vwPdoaWK1RrFZcHZAIokx2PUFyo1W+8g1HBXlFms/E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FpjXtv7vby4WQhLvQvKz0Qb4z8VHjT6Kf6k7m7mmJ8gfFkTEyO46lsKzNopOyD5PX
	 hSnW/n3zrMCl7MZMVACnXHEztH45c63sr4h9VmOaS0HbLtIA0ymYzAVylsePYEzz+S
	 qpZccjKolWcIGwST7bShJQhLRMh2LaB9rpM8/oWNGijC3rfhKHlw951GIfNX2MSOLe
	 KnuYjumDug5rQrW2hQLqmTeoGwHI1Z4PZMn2yKCpP9/ycxFPbaP8Y/k6JAYZpc935o
	 zfeax9stWt5XupdpIdkLT/7iu9zLeIGJo5ioeOAxZ44wt4HsI9CgpANSXa/hCarSvl
	 x5zbQRbdlbg1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC33C55162;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Thu, 30 Jul 2026 17:07:57 +0800
Subject: [PATCH linux dev-6.18 2/4] dt-bindings: trivial-devices: Add
 Kandou KB9002
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-kb9002-backport-v1-2-41f472e52215@amd.com>
References: <20260730-kb9002-backport-v1-0-41f472e52215@amd.com>
In-Reply-To: <20260730-kb9002-backport-v1-0-41f472e52215@amd.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785402478; l=1261;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=Ex6bkGPWNE1aR7VWIU8rbqLRd+CR1DA8kncq0v7nRrw=;
 b=A1K0WaveVTpNZBUNAV2pzrA164YbHISxbVgnjmxdeUozhUfSRJNXDxyRzHfWLCblLyCFFhzfP
 WvsVfIoYVC8BUHKKEEySFpWf+dCWKdxg6u0TADL84GDmnoBF4sjYsAL
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

The Kandou KB9002 is an 8-lane PCIe 5.0 retimer exposing an SMBus target
that reports an aggregated die temperature. It needs no device-specific
device tree properties beyond its address, so add it to trivial-devices.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index dd5077ab3a20..677c0088ddad 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -177,6 +177,8 @@ properties:
           - isil,isl69260
             # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
           - jedec,spd5118
+            # Kandou KB9002 PCIe 5.0 retimer
+          - kandou,kb9002
             # Linear Technology LTC2488
           - lineartechnology,ltc2488
             # 5 Bit Programmable, Pulse-Width Modulator

-- 
2.34.1



