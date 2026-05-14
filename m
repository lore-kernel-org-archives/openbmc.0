Return-Path: <openbmc+bounces-1929-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203CDCD4F39
	for <openbmc@archiver.kernel.org>; Thu, 14 May 2026 23:44:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGn3h3W7lz2yFd;
	Fri, 15 May 2026 09:44:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778755792;
	cv=none; b=fXnIpcAKqnMETqkNGlDlxfK7u2MU8R6xzfVj0KHBnRePtIIgqsAsODh9BsE1tiP7JqB4FQYkZuNyz3R0YdpHBTtKoFSx6UlW2Dq/wlL2t/qpLIctMtm2VUqoRY8PJQuAfrDk7ljB+JG2IODjcNvADVvYxCQcYRlAZgA7qXM+zmRtWVDtk451gbKQ/finT2LZs6ihQVryPYsSjsqJ690iDxGbX2vFsQLjz9Ux5ebe8Ze97OcoPPqUJk+aeSG/8z+GyRcsARSOMDLkScBqSsgpDXgj13O8F2XiK6OBpPDLll3Nz6boU6i2js0aEfY9hBC01ZQalbrDRQlZeHAR+C7pUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778755792; c=relaxed/relaxed;
	bh=stuJ/2UMNkoGGdoVzo0ThO5i8MRO0lfwI+A5vn95bhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9YWoy0ELGHEadVZdGX5aOVQ/fZRGqHMbpDwen2ov3dx5718b/n0pEuaxF9Ir8UU8UwUfy06vqgw1xve8bo5kYn4qaVqoC9BrPUPbBCHAxypiVQkJWVBhicOPrk8WTdNrSyeUO4b5/aJQQHeQFmssXJZWvvviCYoZlxw/+f8Ev9fEoptcW32m+tnQno6f3d/o/VIFHHkzh/8QY9c0pdduNgc4IIn+PvcWGOGoRVVDawlzCL9zOj10XCe65lTT6rTDfjVxXBDdv2HfhDIUwPBDuirT7r/opGxN1KAX9JbkcOJOUQa+38s1TKnzGjkTt/r+7Mprlj4YPz46LQJ+xCHkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ARDFB5ll; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ARDFB5ll;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGRt80RYrz2yFl
	for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 20:49:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E1C660008;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5240EC2BCB8;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755788;
	bh=4m6mUST+WFNScEeSgkHJz8fBHkgwpivwsm2zZx1h4Eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ARDFB5ll73l2m/x3vHgGah4urmsFexlt0ZaW8264GFq/yTaW5f97weL9Mwmfta6/J
	 XON4LVcRf28YShySZg6ApPNsFDUX3IfLvqELFxyt8o4ZzXeSUPsodQvAQBVXHnSuZU
	 w7LP7GKf2tNSFTwZhoBipk+oizNPEujc0e23oOs5kyyekJyf6bX+Pl/QYC9MxAIuZr
	 mRt5crtNmOZ8ykTHPpBULK918TFWw/TfmpoaZQgeUnR7Lg/AvUUvhc6YQVx5iljIeE
	 GXGdX5u9fLVXY7L9ip8V9Lro8ZbWIykpa75nTnJplFDWQlYi7AEWnfkCHsQP0P3mdY
	 CmStilZkBSFEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41348CD4851;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 14 May 2026 18:49:41 +0800
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
Message-Id: <20260514-backport-dev-6-6-e50sn12051-driver-v1-1-44d2ef6c18dd@gmail.com>
References: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
In-Reply-To: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778755785; l=1160;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=dL4vhMXFrasZpErKAdl5LN0MNubz6LqrPWme1lMtYIU=;
 b=SrbUXv02qXbIJKx99eaZJEEYtmM3SfxW//o4R2YD+QK3+eJHManmIzKWvAJh28ldnzLXLOKpj
 J6HNlrEcekMD+cidOlYTglHWHatgJOCzsC+6x0m9bVjpZA5BsykhJJp
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



