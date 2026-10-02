Return-Path: <openbmc+bounces-2696-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA58ACA5FE3
	for <openbmc@archiver.kernel.org>; Sat,  3 Oct 2026 00:07:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hxQtV0dv6z30VM;
	Sat, 03 Oct 2026 10:06:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:38::f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790922590;
	cv=none; b=X0BybnUk1sdnsOaAHWRVBTOg5QCI9/yTs11ZXILNz2UvjIX+1jhrxZ1H7IaMZfOjEiVBYM05Mcdvqrr94m363cxQYKQ8yCq99FxeB2mHqH6iDn6oHesRLpW4gkAu4b7qIHN72LnzhOd1hFHBwfjMMyjl3r30Kf228JDLbLEukgUcKyWySB263kkezJ06A2x4dP5PQ2yXoF+pJJFx0GokS2DPQ5nZcHRU6hYbAZ0DJZsggkbDa0liRuuVIKDHaWAH8MUiYHOzGvQ2181PCgP3z4HGDa7PtturpjiBprvkivRNvN8KcsFZj/7PKv5NGnxA+Z5DojuIl9tUUwTuh9VuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790922590; c=relaxed/relaxed;
	bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvWlPIxdkr6lVAIaNGLHYteGLtMwpgNcUPq5jQPN4KSWEJYpHmEAu9f3/gdaNJLmSbQKpRd8qHCMDiHRDdJmgrI/+uzuCyDh87gq98VxDCnUl+OKXTsJJupcfpA7uNMFj/B/JpIHablc5huOCOV2Y7yKON5wjbHuOBGFDpOXF/z+Q9+uAFyqmrtv98vDeiOz3nCDJXQfw24YG7Ael1Q2X3U74KX6znKlUnvo1jBhLpsb+7mgldOOzUyESF3xRRUYDe7Ojyy/zNHpLSILEXid26b3HclRW+Z4uRcFfOCnQUcFG4xzheMIseeRLm1pAUZAvDuX2XUAhvlp8Zc5HfhnyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PJ1sR1wG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:38::f; helo=mail-dl2-x0f.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PJ1sR1wG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:38::f; helo=mail-dl2-x0f.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl2-x0f.google.com (mail-dl2-x0f.google.com [IPv6:2607:f8b0:4864:38::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hwzR212Snz30NF
	for <openbmc@lists.ozlabs.org>; Fri, 02 Oct 2026 16:29:50 +1000 (AEST)
Received: by mail-dl2-x0f.google.com with SMTP id a92af1059eb24-1450541ab18so8093977c88.0
        for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2026 23:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922587; x=1791527387; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=PJ1sR1wGqegC2XItzXAlbDKkXsQJdvswe5L+Q6Uurabx0cP1GFE9bWd/9cW6v7opHe
         Oka1hQd9OYhBTK5dEGZHiRVLsltwibYPKWG6fsbOkUdVWsTFysarkwOEbFb5qg9T2WYf
         ROZlEa8LpiTfR5e1eOGhAaYPzT25RSj5MW0CHUUWfxx3HsggLSbVoYYyFZ16lBWfVclo
         zrCPXWUjLhlP7oe6lojYPUXpfwt45C1edYOZhLfLTJ3tCV0wsjFrKwxdBKFqyXb3Mw5+
         7FtbyVhKsZIalt7M4y5I76D64YCIiKwIui18chaZaQOKiqkfq7Tmk/5B5kR8QHEzhD92
         wzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922587; x=1791527387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=RSM+PPmq3HSdYiUoFa6OhtZKbmTYTrR9h5OGqXoZMu8YCbGTv+nHJjuMQVZdbOUGht
         rzYFMjap/N1w2fSBd3lW7DlWQkfiYHlGiavKUEjO0C9tgQdfYDFCbXhhH9EEzwWt2T2P
         wiXM7ysxUWwBdw38oULEPMcj8stK+5HfMXFbSeodE9YJC1enXPJfq2H4ESBAPblnBcLj
         0BMeJR5wZv449GYQpHIaKecmX/EhI8oY1AOKg6W1X+hRR1nmeUOqSrzZqP80XvG2M1oD
         PxvDJvm3h+55n66rJnt4aZJTttTgWl1JnHLm/0AbopE5kiyDAixIgiGyLBmYgbUDnZra
         hzSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI6T5oSBpio2GLTItAWahmO5LCcHJdnsoXw2/M3sqXSCmveQD/an/R4+qoYGLKmZAc/4IaI/Hx@lists.ozlabs.org
X-Gm-Message-State: AFuF++mfkqq5x6HQdXkf+GxVDMnREieqi/FogdiL/PZdntlrFtMq2+fw
	1+amTj9Gad2qAGu+IHbJNxoFMGaYV7G91QnytlC/IB0o1Nf67gp9vsFB
X-Gm-Gg: AYBFou3OzpELk6qiVIPwGzBiqqAPi9FmjxlZxnm8N0igMCHtxXfIkGuY8XOTXzB+sSd
	4SlssdbxZlZFsuVTgBXbRz57+OqgiQj5hNyMMMYAlMWNtgjhOYakzUWAyDgjUVIA5BqmMz1TWB4
	TDv3VvFMexEQkU/ryaq/fD/8cm+QoIRAxNuO38UEeyjFb2FwP8lK/t79zTk3pjOXCn7TV2iSTEb
	jGdEY6AXbKXVzAL8S/Sjmy4SdoS0FDBI8gEDsLGbqn0mPx4WbKWbEkzubQ/Wqf36GsRe6NL4Tft
	WjBcMu0Um6BQx/LfazkjXLNltcNMhbTAvhHluHquzIfD9N0fSYFbXOjhNB8MExK62cGKbP0G/B1
	r7rftx0sBRBIlgTWBr9YM6l14Aqo/+bsv2RqGWxzJDRFL4r7pJN66mTWz/aoRQYUNOcdhajn3l0
	xIRr5rUl5z5gJ7R1/hVSIKcUvKrxArWXCaXsqKSQItkm7ic43pNc0w3l39Z+LOkn8vxS7gFWbu5
	14pWlJcCZI9Bw8lgBC2ZA6ntmE=
X-Received: by 2002:a05:7022:f509:b0:14c:be8e:69fc with SMTP id a92af1059eb24-14f5b9faf32mr1694735c88.15.1790922587359;
        Thu, 01 Oct 2026 23:29:47 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6236636c88.4.2026.10.01.23.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:29:47 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Fri,  2 Oct 2026 11:59:32 +0530
Message-ID: <20261002062933.26497-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
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

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..4c9e96801c1a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3


