Return-Path: <openbmc+bounces-2108-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3E2CD98E2
	for <openbmc@archiver.kernel.org>; Wed, 17 Jun 2026 04:12:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gg9S00Tjbz3c6n;
	Wed, 17 Jun 2026 14:12:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781669551;
	cv=none; b=EvYkHiw+lDcb60IlOU4dspH/QZcUQNqfYogeNYi8urm0k+FKwbMpUynl1vln6JZttbp8tsAPbURpexG9BMLQudJAufAAR9ez2wydjGQQ6SBqXwh242xd16S5ryfuqEKK9ReJQQBXqu8rSUW35skmA8P2ZQ6ly05YMc2OHWjjzhLcQZDbubdBEOHVEOH/aJppbchRWUi+WTNPiABI8KMDTkBljH0vRnqICj43huJQbqwaY6uadWmg4HgZFbaKQlUoT/Uxxh6Fj2TwQ26fiSj9Sm3WjvmTFdX6N07W7wZPsm48Lc3dCtz248NYhiKXuG26A1CT+FndgNICeej6vpdvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781669551; c=relaxed/relaxed;
	bh=eR8Fma57QOiniaeyGxJgyR5XVWPOVelOnVhw61WdhKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0/qCX3IeRPWpwkezKRtj4ZVu6TGmLtnjOb9OTMY/4BEqhUvYauvnwoGEVeRsI6l686/8HPysM/cu4ASJ19c8Ox3oUiRPlLOXRo0qyHAoIo+Aeew8p023d6TiwKwIBFRZo84SMvGqlOtyCvouKy63JOMdu34VfJ/ntn8d3pmQrKh2mjZmYzL8FlnKxTtCGqtt0zTeEvWbbwqCj4y40QJ0/vFxkixLkAlprN6y/a8uUrw/G2bMvEcggOh2VL5/GMwmYsj9wE6xEWR1P1HHPvYxZcSxq+A0y6wg1fH8iKxZS8Dq/yfCJEGIriB1joN2WJVHpcMetpK4uCD071pAI8Y6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gw7p75ZD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gw7p75ZD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gg9Ry0vrcz3bqh
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2026 14:12:29 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8423efad617so3266695b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2026 21:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781669548; x=1782274348; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eR8Fma57QOiniaeyGxJgyR5XVWPOVelOnVhw61WdhKQ=;
        b=gw7p75ZDN9uPZ6wC7Sk0OM+GUalnaPBblpOZaAueQqnop1THuZhHNqzryx0XDkSMo6
         Zp7C2XOe/9HZjFdgmJOrRBOPAfTphBjfqrf++DDx1c1veMKooPJdzKr01cdNwZzXRQgb
         OegYRXWSBCWey5x+4xeMROJagdJkNy0ELWBIOq6YR8Jrc4EkwRRXKX60R2SLrfkSMpur
         1hK9b/nsouSb96pgY1Rz/aS11OAXOYx4V43E6h2d0bXjhdrsa7AleNiaBgqmvwmAE1ng
         46UDbIZjPi3tJzwcfrWG7KzA9TvR6gNb1n8DqLEKf3XO3hZfyQk2E3LJvNaXAYxUYtpb
         CJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781669548; x=1782274348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eR8Fma57QOiniaeyGxJgyR5XVWPOVelOnVhw61WdhKQ=;
        b=jH37FOSZLXxzq7SrRlCJcWPGciFdO//WAseMjJt0gmwL2+MjyUPi5pdrS2zRTAenwv
         jGMvqRU2Q/nEejYbrO8zrNwjfKUq6SUGiDFNkzVU/rhw89VaO22+b/NSquZ2r6ghbXG3
         GtFNpj1+IW0QCTt/V/t31KjZsAYAfMgk0Cu6WGtNlgh5Ejj4Bz11u+3FiGxI2akhwOkH
         z1l5/7Ed5AHbOuUmAstE2/7Q+rCgJ8fW/ok86sHXFeQ8r5Rje2p5gFI7qcE/M+1mgkQc
         ADkG9lOJcN4KRWSIOYq24VTEyRTxBDntXz23heHurgXUhMw/nPPk3kyGbuxPQ0u33Nb8
         Gr1w==
X-Gm-Message-State: AOJu0YzNmVNi4gVOAPFyNt6m/AQnxf/0KRixtCEdNUyHewcu5Ok+b2yo
	enYakCIEH3YeesDCGUeXqn3ZgGrytrqgBlktI4yfaf3t+k/KOaiorDiWhMoxGQ==
X-Gm-Gg: Acq92OG7Il5Vx87ihFhLTkBUUiJD8x84dnuWjcAMOYMbX6wiM+Lg3FKi3nHPYEDqMrD
	VDuvW+LhvUYO//dYFtFt40o2R5fwZ0cCjJNlTynpt31FEhVAq0nQ/s6slrL+wxj+1JZFzLYYizF
	syJv0A+VE16pQ+01kQiNprg6zmziSdaoznv/gY2ZFQPq+aqvqXDpgqFb5F/9KRgHtipMfchmltA
	Q8HkRtoomfdGFdhoP+Dq9XUsrwGR8tJQP6BpISVN2ChShsJNYUYQAbIyFgZ+eN0ixhgVoXmpVTv
	FwAwaabXFGaYCt0Kv1iuwun6se2LAxZipwXOfiKzXx1Fk3nAC7VS5gwJB9DdfHBsLLKAxBcBJns
	FL5+XnZcTUY7/VWdpHMAHatgmSGP3pAtKFVqk10wWqLYHslZ9T6w44zyilgadnBcTzmXQ99whuu
	EMBiYD/BFauL8w63K/ndVBdiUDBndqH12vkUemN+ngXxSgOTIxWjjkCMu4r/KBEMtwKQO7rla4s
	U18Q8Eh7HWU
X-Received: by 2002:a05:6a21:6315:b0:398:9662:10ff with SMTP id adf61e73a8af0-3b8b582e254mr2185664637.4.1781669547998;
        Tue, 16 Jun 2026 21:12:27 -0700 (PDT)
Received: from java-bs-ipv4.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651a0090sm12804302a12.26.2026.06.16.21.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:12:27 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Potin Lai <potin.lai.pt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH linux 6.18 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current limit properties
Date: Wed, 17 Jun 2026 12:10:09 +0800
Message-ID: <20260617041015.3684032-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260617041015.3684032-1-potin.lai.pt@gmail.com>
References: <20260617041015.3684032-1-potin.lai.pt@gmail.com>
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

Add a 'ti,current-range' string property to configure the device's Current
Limit (CL) behavior to "high" or "low" via the register, overriding the
physical CL pin setting.

This configuration is supported on LM25066, LM5064, LM5066, and LM5066i.
LM25056 is excluded because it does not support configuring the current
limit via the DEVICE_SETUP register (bit 2 of DEVICE_SETUP is reserved).

The values "low" and "high" map to the respective low/high threshold
voltages of the chips:
- LM25066: low = 25 mV, high = 46 mV
- LM5064, LM5066, LM5066i: low = 26 mV, high = 50 mV

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../bindings/hwmon/pmbus/ti,lm25066.yaml      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
index a20f140dc79a..fe42daabaaa8 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
@@ -46,12 +46,32 @@ properties:
 
     additionalProperties: false
 
+  ti,current-range:
+    description: |
+      Configure the current limit setting. When present, this property
+      overrides the hardware setting of the physical CL pin by configuring
+      the DEVICE_SETUP register.
+      - "low": maps to 25 mV (LM25066) or 26 mV (LM5064, LM5066, LM5066i)
+      - "high": maps to 46 mV (LM25066) or 50 mV (LM5064, LM5066, LM5066i)
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - low
+      - high
+
 required:
   - compatible
   - reg
 
 allOf:
   - $ref: /schemas/hwmon/hwmon-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm25056
+    then:
+      properties:
+        ti,current-range: false
 
 unevaluatedProperties: false
 
-- 
2.52.0


