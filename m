Return-Path: <openbmc+bounces-1956-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E254CD343F
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 23:52:41 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2Q1GFDz2y8d;
	Tue, 19 May 2026 09:51:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779091832;
	cv=none; b=dCIjUuU06XCjTlhCatu9DVvEU/8EwQ1jereT+2oJtN+W4uGOOJJ9p7w63aBZAyQi5t7uwdrg/fFTz19mtm3MZUYLv4eQdcZtGuV4Y1posEtfFgkfJuCtU69gsHfKEYtYb56y1VVMM9wrtTe+kvgZ1rc7pDiTDdpaGAfAMucQ2xwFMpMv2APrbzsaoTSgi6M3Jbn6kQ4qI3cJFaWiIt/WygD3nbrS4NWzRt05qOkLoeREabgHYt0rxeoq565ON3NQxjsbyIDmiROts0yN+Nq2e4iPF4tTx1PyxnmtcVbJdM1E1+3zcUw7Ijk+xEG6E/OqPJdy7OcA+ApI2OtxlhW8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779091832; c=relaxed/relaxed;
	bh=stuJ/2UMNkoGGdoVzo0ThO5i8MRO0lfwI+A5vn95bhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bI3B9NhtQSwz4Uq30UcZeg5glVVv/c2RK2NXm/ydg29jmN2mrPUg2DEL+x2Fk34ltY3PQK+5/hfnp8UvCWIf+NYdVm47GEDSDon5eUrrjbzarBn4OxOMSjLp7Q5WT53uyyylatnJ9ulAqrCnujpsGt28ZAJPHBXUjn7rxHNXC+7yBIPG7hCyVKilvSdxHzm4H+/knGBok8HDGT6ZVzpPnXnKJS2150mi9L0t1Rpt+Ql4SVVC3bl5XJuf/7orT7XgnjX/PgnKGJU/YWYFCi8EeV5yQjYwD6twVYiIhsy8F4KjZ3UpWvYIX1x45brvilWWHAJRy6nIB8DkbRTSS2k5yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gR/SgE9c; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gR/SgE9c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJr8S08fRz3bqs
	for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 18:10:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 699B5406A2;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C34FC2BCC9;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091830;
	bh=4m6mUST+WFNScEeSgkHJz8fBHkgwpivwsm2zZx1h4Eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gR/SgE9cn4xdpSTQ6zxi8L3n1TQrPaWxyMLGLOfcbS/fRs/uPwekj7KR3Drs5hHLp
	 8HugSK6rlUpL64wxcC6VooEL+51+cUyUobdPnoI9HX+nyg2W9ctjY3r7Pp4UmzlX1z
	 SNJLcWAkYFPMhRrGhEn8rLmOtaWMe4iaGcI6/T9ma/qGdP1d8BcqZ46bWHhpl8Go8E
	 TguKegykTZdtbvgVDzib2NQhsJ9oGWkaKYBYjoB9/XC7gh1n33Lwn/XzEJdX6PNl3m
	 b5I2FLfsVROqu+ojYLq6YN45K4U7DW1fvzX4YRWRjrVWZOIADP9kOKm+ALv+86XWMm
	 s/tW3wPdhc11w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDE7CD4F49;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Mon, 18 May 2026 16:10:17 +0800
Subject: [PATCH linux dev-6.6 1/3] dt-bindings: trivial-devices: Add Delta
 E50SN12051
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
Message-Id: <20260518-dev-6-6-e50sn12051-driver-v1-1-8025fb61706e@gmail.com>
References: <20260518-dev-6-6-e50sn12051-driver-v1-0-8025fb61706e@gmail.com>
In-Reply-To: <20260518-dev-6-6-e50sn12051-driver-v1-0-8025fb61706e@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779091827; l=1160;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=dL4vhMXFrasZpErKAdl5LN0MNubz6LqrPWme1lMtYIU=;
 b=jXFsGX1dQxjMUg/0kNFL7PvNHnVuxqIHLiymT/swrl7FJh7NyrMgFgcwWMTxJHN4V5iPnGgMl
 k8SWsUIzTnRCcE0aDllQtCANugkBvVnl9QCKy5P7t0BvdhQ4V6c9oAr
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add 600W Non-isolated 1/8th Brick DC/DC Power Modules, E50SN12051.

Signed-off-by: Colin Huang <u8813345@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com
[groeck: Swapped comment and definition]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 4f291690420f..266e3c316c9c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -91,6 +91,8 @@ properties:
           - delta,dps650ab
             # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
+            # 600W Non-isolated 1/8th Brick DC/DC Power Modules
+          - delta,e50sn12051
             # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
             # Devantech SRF02 ultrasonic ranger in I2C mode

-- 
2.34.1



