Return-Path: <openbmc+bounces-1640-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A162109192B
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 22:37:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcLDR2Mwqz2xnZ;
	Fri, 20 Mar 2026 09:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773905842;
	cv=none; b=bS5ojsjUtojRyASgWrFJSkyEzZV89Ce0LziceImRj42JWYs/v8pUbTKA/gJsDwkKnPuZnRZBv9tvfaPA4BC6aCr6gmGroTIpQ3LPiW+IWk8J5+EHeHcXtBdzfVaj0XD5IdbvsoeSRSroAvGKo3E1nprUfCyxAN7vvCfXuV1l3chs7iXwtcPi3R1Z/+gRBMycMQ3fJjdXRUHKFpJ0yBjr5TiuPWkmW4VPCXrz8V9kdR8cx9cQHbYOLziHHRjK8HB59MU5QxdS4M8iPFLhan13EW4DRYp1tD3CFMe2Y+hQHgqGvER1TTIDie23LMzSZ7uTUvGlY2x/CRXeGG1pnJpZug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773905842; c=relaxed/relaxed;
	bh=N2Q8NwGtIJfqjo+euXAarbD8qxKA4wBKt7mq8Qbggl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UQmQE5IjzMhDwVESweVp7PuVMZHJtyTAEFE1YKZpvj/nbX/Sgy5AksSyBiBnHKa9GucAVsP/AjgrjXm+AX+7fNpPlM6d7Gi4SVw12zGre+k7rRiHfeDS9wU1Aq5apzry4qpLqI79LO2C4q0cO4ReTJeiB50cus4UWj2t9N1500kIwDc8Hu3b7Guq73cDlhSvph6hpy4+LVu2YBO5f+W5i9SHbIditWnopCiRhylKcAJ0c/FLlJK0Eb+bzj8Bmk0sWMU6lJEChzY7omZX997cLmLUG/qksUN6kGB4O3o6krxvZVlC2lcizPUPzkYG76da01ccA1BKt/KS9NblOGV+Og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M150/7gp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=jackson870728@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M150/7gp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=jackson870728@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbyFs3WXYz2yZ5
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 18:37:20 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c73a12af63cso389536a12.0
        for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773905838; x=1774510638; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2Q8NwGtIJfqjo+euXAarbD8qxKA4wBKt7mq8Qbggl0=;
        b=M150/7gpa3q2qDQuJmADiggegNkLhyB5ZKqgLD/pnsx2HivbhdT4u5CrcJ8dKvWncY
         vefpE7wQx499B3D9frFk8MIs49qB6uGagYMOOu73aHptv+Vx0HuuBujyWgerkONIWaSk
         vo5xQCHhF1AyMZCzBnnPiOSmctpi8VQKkXz7j+2my+I91hvb0DWvXYaot5Lfb/aABJ9e
         zM8TAyK7By+OhiVT47m9n4NwsK9iaeBN8HWPuZ4SIK7f7lHf99sIWj8GTaaGYXsvS5nh
         Ce8jKGkZtWWNglzGgoYFhTaLKprsAKP1TwheFJq2jvBbkmN/nbRgs++R/XMRbkMGu0i4
         NOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773905838; x=1774510638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2Q8NwGtIJfqjo+euXAarbD8qxKA4wBKt7mq8Qbggl0=;
        b=pjHwbhTBBk7TkVZSOBxcNw96BMXD9Cd81CU/j7aNBKhQ1ogJg0hgKXWdmlrqFkpR0Z
         Gbzo32i3LygH86aub0nEVHdnfQxP+SPP66Bmb9pjMN9TFmyQM3ldPgZnA1QmjSOpDWuV
         FkT3Obg6AA33q62d6WD6OjMPCaQwbij0hUGeoS/NUE+Do/nfndF9iGzTekJl4+l8GCyE
         Awo6uvS08Q24EOmJ12WZsg1SxR6kEFGUVoXZDilk+7sTLjjCUXRkZeTutP81aWNz7xB+
         ZQAYEMpCQUv+76U+MWmxydLkPNnLMmr0Yf+F+kdENLgGHYGdMHne0dpoD4sojafo01cX
         VPTw==
X-Forwarded-Encrypted: i=1; AJvYcCUk8Tgd0ozqUbvwekuA5eF+YBb+GS1lG6iz2QLbdCX065NcmSL7N+zOHSXtfY/eER4zq+GX0g4j@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwA7jyX4VdhbDOPsRquOkpGgbJ1uPOoN3KQ5UCqK6QdRxTZGZoz
	h3r3pxmwKBXo6+zHAsCPG6VzYBKFfud9w53fDfsyORuQcloUsLBNEzMT
X-Gm-Gg: ATEYQzxofHplETrJc07YKhqsKcnoO9Xf9e9NHZFwd4YnRrM/fx/VC4ZQ90LoAAgFUwu
	tbXaLl6xaUrXuigj3b9/FwiH5IMIZf98jg7yurbaWrtrvLl/riaMrfYHtrVtLfrbrtWbCSYIT/1
	6LOkewIZtkweO3BSKCPARXxJHhLzSSoZ1O+o1VL+HRqh7kJuN4jkQPkVeovh4wzbF5sszATKqZD
	v0VcuQCiOGh+HVPZw5QUHM8LiCiEz7RQDRP36Y+GkC/BQLIZuX5D+ghcae2ODCyY/RQ9FKZ9Pij
	USE/rWHips0GUrM5DhdqG/ETZyzZ1XmHrPPFg7pjMmY9z+PJxqw0L0iRUO4oKMFagVdhHXq7uSR
	/IyIx8I4RmCefNuBUPk3W6pop6NgsqNhXBHB+UlLqIBgiAaU2ZvSBuwirK3x2uUmoRlAlZsppxR
	u+DKBwp/RhBPS7ln7urPpuJspaBqIv2Ut887BpDB/p0i8JcgOId3wEGtqer28XlIZO/FzZ9lIuN
	0haxGOCwybbMU/ymSQMY9CzTmG0ypkXE2Y0ioVlmBk=
X-Received: by 2002:a05:6a21:3401:b0:398:f1ed:7fa3 with SMTP id adf61e73a8af0-39b9a0256c0mr6156982637.57.1773905838401;
        Thu, 19 Mar 2026 00:37:18 -0700 (PDT)
Received: from jackson-ubuntu24.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e568e36sm4633192a12.23.2026.03.19.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 00:37:18 -0700 (PDT)
From: Jackson Liu <jackson870728@gmail.com>
X-Google-Original-From: Jackson Liu <Jackson.Liu@quantatw.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: jackson.liu@quantatw.com
Subject: [PATCH linux dev-6.18 1/3] dt-bindings: hwmon: Add MPS mp2925 and mp2929
Date: Thu, 19 Mar 2026 15:35:10 +0800
Message-ID: <20260319073515.1577998-1-Jackson.Liu@quantatw.com>
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

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp2925 and mp2929 controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wensheng Wang <wenswang@yeah.net>
Link: https://lore.kernel.org/r/20250928092845.1394718-1-wenswang@yeah.net
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 933b9bc8bb2b9c348fbb2105e461780b8f89953e)
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 4aaec3a6d461..21432573185b 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -301,6 +301,10 @@ properties:
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2891
           - mps,mp2891
+            # Monolithic Power Systems Inc. multi-phase controller mp2925
+          - mps,mp2925
+            # Monolithic Power Systems Inc. multi-phase controller mp2929
+          - mps,mp2929
             # Monolithic Power Systems Inc. multi-phase controller mp29502
           - mps,mp29502
             # Monolithic Power Systems Inc. multi-phase controller mp29608
-- 
2.43.0


