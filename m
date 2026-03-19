Return-Path: <openbmc+bounces-1636-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D8D107760A
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 06:14:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbwPH55PRz2xZK;
	Thu, 19 Mar 2026 17:13:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773900819;
	cv=none; b=LHmB8Bzi4cfr/ZAUuxgd6dz29eKEPpfDRFMaAVStBk2ED+qLGgCpkDa/NQvkrlod0lDOZTFhr3PpcWNm81jMNl1cgEaP+MtI/awjhs55rF1ySpzjMoGTwGGHyKK6qmEFScKBPssDiTL1cQsOIJKhhxtIcWXtBir/KjgrGWG+T/cX7buIHUobXuoTMpagMWk/fOJrJm1zXGXbFH2ZWmlTEkSh6gq+q1neCwmvmiXyPkeGzkjFicUSDheRsZLiAapOwFGmJBsStiCmN9JbjjU03YH5M6jlHMIefjS51BETNHuhA+xDpL1mz9C4YrABvNVVKkmUVdUfjFXgTpHRbQe7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773900819; c=relaxed/relaxed;
	bh=T9PIh7gHHU0wM3aOPveS1JckjxOaJTzKerXNPlqAILs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gyWKk4P0tgjsGZFiZ7R9x4+sWQr5TP1d01JSEultaC5MGdLVf3iafikfHonu8M1heLfSbucMdN3dNMXtBiDGYUUPqqBY2he7BoofUPeMB9h7CyD1DwcC+pTqfEcBbi7bG8W9Ik4ZXez8vGVHlezNpMq0t0zALP1FTMJMbEeY4f9Tv+IIWMS76Iq7SWWNnZ+N++gtK7QCjRagogry6V1UibltaMX469UMx6kFhTGGdsyBMDuelALTw8YLR6jFQk11xw6MUNGYdmrfln9sRxG6+LXws+itl7QbBkkNHx9CXAhY9qi47saVOCtd3kKJAx9LAOZjS00ew2aZU8j/RCEcBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lrgu9Ch+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lrgu9Ch+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbwPG4c5wz2yZ5
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 17:13:38 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82735a41920so285469b3a.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 23:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773900811; x=1774505611; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9PIh7gHHU0wM3aOPveS1JckjxOaJTzKerXNPlqAILs=;
        b=Lrgu9Ch+4/z3XXl+wjwUJKKkX2Tt8QfBmHDpzDyHmLPJFrEPE8bbN2lE2DpuoCCI9n
         Yne91oT/i7OCBOdB2dixkQSZ3YS4ir/+h6H/ABQmn5c04wDBj/BNJsPzEqd4T61Lk0AY
         6Dx7qOoezpE0ebKObwEEcu2ozNXWsLsuLFWjN+FPJyeZbMlWRE8RLGQ8R88DycLK8aMB
         6cRRIy+DtZrBUEQn97ThGVdxzkHUggCeus8UL5sV9GVsdRVMfrg9xFs5p6Z71wzDqGwV
         zdwQMSAu4uA+2Cfm1aqlzRCS3emssxGVLfGCrUUSOw9mEQyfy6Gl1ep/oK6d/kkowLhp
         o3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900811; x=1774505611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9PIh7gHHU0wM3aOPveS1JckjxOaJTzKerXNPlqAILs=;
        b=M2dYD6B0xbuWzTjxph/+WE3l0B1VtTv5OcibWgbYQwWZn/nlo5nP6dxHdOS1ETUG8P
         oFxTYzacnNto8keQPdc+67IVAPastqHlvlO/B7PgN54RhAcHKzU/HIemQvJ8AjFJbLrM
         bIGd4P40feNpeFbdC0/563V9AKtCF8WmErhyF0Jp9o4hwfgvkWRtEuwQJHmAbkcLodkZ
         relcMuIvu+gK773S6WlkX1VxHMOpVKujZ8+HSqvgtQn+hHtz3q6pW2nH+63Z8icncnTk
         C43e0pDHwv4Ka6B2sdRKda/9Q6EGlRZSd0oVg50IzfjuX3HcbdJWQe05k2Uc+ZLFSEx0
         ry1A==
X-Forwarded-Encrypted: i=1; AJvYcCXLhYoGZYpsrZ51DnXiuyOgL4F8dogMIeJlAFVOPh82JEu6hTN79N44Ci4j0poq2BAjkBVXFs2g@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwvC1RrxeKlnSLV4ExXsp8iVkBOGdwv2FQg7rvY3CAIpoAqSI/Z
	bct8Jg7y2jq5mVWnm5vxcrxm0bNNYge2EU2LjgBumP1+lRYrY1U/XFsa
X-Gm-Gg: ATEYQzyGAe0AHxfJQsrsEnwJ97R+nplJvO4YhlJSfJUHOZlNnTQW4lF7QdSYF/PtLBo
	e0tHyuK96Igk8/2j8hnjDGKseZz91ySBf/11N6hLZth1cKFK+NMg4PfVz3xGt6urvRLecXmLpiK
	9FhzfXNS1/gquW2unwqDLFF/xpqd5SiMjriDL6mVqWa3Oc8Sx8I4FChlvh/R7qujPE6ENGVfR7A
	P2GL4drPW22X76BVA2sYwAXMBQoOaaDwG0Q3UBBX+2+zJRNBKThtIQSto35RS+YryGpBuxBrLnZ
	ysj/EYIw6jYZgpgn7f36d6czfxnC29nMW6qaYwXni3z0DoLs6U814e5MnhGOg/GuDaVrm1Su5P3
	z3E6ewywyx4oI5sxzTcPbdebbUrVfSiy2zDNlAUj6/vN75P1lLffBX9McHDAKJoDJFY2BwVxUFL
	qsb5ZvJVXT40WClgsDdQcy+OugsggkTNSYr3daFx5XlbQI8YNpt5fHZvOSerMtzfilbWYEpw==
X-Received: by 2002:a05:6a20:6a28:b0:398:7ed3:a005 with SMTP id adf61e73a8af0-39b99de9c20mr5828844637.29.1773900811173;
        Wed, 18 Mar 2026 23:13:31 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e583626sm4090578a12.30.2026.03.18.23.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:13:30 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH linux dev-6.18 1/2] dt-bindings: trivial-devices: add mps,mp9945
Date: Thu, 19 Mar 2026 14:13:18 +0800
Message-ID: <20260319061319.43920-1-chou.cosmo@gmail.com>
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

Add dt-bindings for MPS mp9945 controller.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
Link: https://lore.kernel.org/r/20251009205458.396368-1-chou.cosmo@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 4aaec3a6d461..e7d28a97c7ed 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -323,6 +323,8 @@ properties:
           - mps,mp5998
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
+            # Monolithic Power Systems Inc. digital step-down converter mp9945
+          - mps,mp9945
             # Monolithic Power Systems Inc. multi-phase controller mp29502
           - mps,mp29502
             # Monolithic Power Systems Inc. multi-phase controller mp29608
-- 
2.43.0


