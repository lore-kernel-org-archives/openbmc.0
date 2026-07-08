Return-Path: <openbmc+bounces-2237-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A57C43458
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 12:54:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwJ243sX3z307v;
	Wed, 08 Jul 2026 22:54:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783515244;
	cv=none; b=MpCqOqASU/k6zx0oqtvvXfXLhMmjBh9Xv9FHJU0jWsBhVSJg7m0OK2ogLiGwq11kcnt64Xt91/jZVIJZSVjRzj5ELwN6cVO2/lpx/cqiv9IZA5oDs0E0K0j172SRDUJQ7q/2xjD4CNBcHykCiLuyYPehREkcmLuX7opZ3PaPbjIR0B51VRmUNqKrPu+CWamEJqbfe4lbUjoIHuHHS0auAZr6z/PHfNTu2LKfB+Hk5rjg3z/e8eNVp91LG4FCMGCtncRcoIr5S/3NUsXEL8f96gPTeAkmlujeh+0jpkQfxHxJq2qoY0DWK8rbKwzVbeR63f5deXlj4IrbFDHYyHXlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783515244; c=relaxed/relaxed;
	bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KDiRmhINyyfyqNqu5SW+7t9CmyJtbd9n5NshsLnE4raaGcFZ+YwtnDHJUcTIUFxP0mjcdTa2/8OJraSBnB1q6XLew8ZeSjY803ie3MvA7P9cjgF5Ua1F+P0OUsxvM0Uy7xT5MCzdIvWRud1wWoHeVUK3l3/0JMzxvAbuHTq5DMg1l0OWHuj+SJ8K2zCmexUXjxGehlNp83aDCoDaeDX1d4z85EbqwZJuFZRkmlIeWT+2UlIiFKwGrGE0lVL4vaWQGhwVYR5cjvoZ+D/hw3jgDkUBmi//+awaBOBZb+9BUJ4Qd7LuLOpR6t/QBlgt4Unxoqno3Wq9Mi8uHjGAnpobXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHz/3V4R; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHz/3V4R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwJ23280Fz3054
	for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 22:54:02 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso448452f8f.3
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 05:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515240; x=1784120040; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=BHz/3V4RN/lzbn2xE+I/lwwz4KoC/qwfSGFUOAdrNH5yFmQMo7zoEI1RKq5RlqeG27
         rcgVwbYxURpdmlYa3KZLINLiF2HD0iSHBdz8Y165cNJhh89Hz+xvJYQiAfrrFYkc81oU
         Ts/dCPOWzfBiZ64PhUl0wEBwpP94WBmNoBT+H/vxzTipPoTvFzurR3jIWFn6OECPNIUZ
         EEVdnmSAky53dFErAuvxnToCrEjneHEYpdR7DUSRR9lY2VNseaiEvvRNkqitdK56d6tX
         jvSKs7Yadd9Zuzvt/uj9nJFUXn1WN4uTEdm54mI9yPq2Vuuqqi9YEDW+cVHftuVdRA4R
         +ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515240; x=1784120040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=fXJZI3ZvYvplWmjG1BMxxzFUBjFHpxD+bTNyD4r2qmn7M+EM0MurPb8RpXWtnr9cgT
         ABeeNgEcYnFvWw4XowZi0QboOb+O8EmML6AZxH1XS5S9JpDYxrapjZDFkt+1obMJcfvA
         v/LVCI8iJowIoYjDw9XriU5xbvDvAC6rFW9NmGubjZldTdYZnZyC9k+tr93aGvK6aJyN
         +LIcKK1sO2GGi+s2uDNtJzLomEOcvGuFAP1WEjYuXMbfKOMHg7n77iUbEFLDBzhfNtbM
         4GufgSee0EDAFxaC4vNBfoYDbpymB7/VJfcXQdneYJ5nU7foWxlpLok0/ZvNeWdkXhCm
         t9tw==
X-Gm-Message-State: AOJu0YynxBIcXjJrwIl8lmaCYP6GzwgAmSW9m81De0iVMY+sDJ4NgkWY
	qYwyVrS/rvpzUb9RG5A8bM3r5LeoXR/tSGmvXFg1jVC9BvjJfzPsONHg
X-Gm-Gg: AfdE7ck/mnhooduGAqgLzYgUjymrpzJJqB/nUnETz2JFkOLB0wAQHt/X/7sJ1pTR/TN
	p3uT/5Ak6d3sFDVZcm1SdObh+1oVjDHqxXGZeyAxlMJ/9sRfDxbYkIyauRfHKKaZrS/kZglUuKI
	AB8I39l5+6hc+jUKTx48d2RKTxuEQS4ukRUd7nycMlElcziAaCgmdmv5mJ1dplMaYveHveOXayx
	2EHUuB6TaGF0PmBqryNdO+mo0CNiY1ilmjW9/5d54Q+D8cvs3ZCWycmELGz059GXUciHunJ5xwn
	T3+Mp7yDfERQDXcQrkUnDZfwYQ9CYl9fbdOjgGDcuKosLGtkWnhFR0lvTYsnywoKLd+o271MKvU
	i44GEhhIvmygq6H9Zx6yjgjpNXJkLlfd9rbM4iW8DErRouQ+cGMUY9QsVaNaz/OgycywRxmWP6W
	Ox8HQ/BoK45/lblOk/rpC4nyWWtb9sUQ9Sxw==
X-Received: by 2002:a05:600c:4fd4:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-493e6878b65mr23443055e9.32.1783515239873;
        Wed, 08 Jul 2026 05:53:59 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3676dsm143824625e9.5.2026.07.08.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:59 -0700 (PDT)
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
Subject: [PATCH v7 1/4] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Wed,  8 Jul 2026 15:53:49 +0300
Message-Id: <20260708125352.1915040-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708125352.1915040-1-tmaimon77@gmail.com>
References: <20260708125352.1915040-1-tmaimon77@gmail.com>
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

The NPCM845 timer0 node references a single clock, but its
clock-names property is not described by the timer binding. Drop the
undocumented name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index c781190b4..9e4fa2669 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@ timer0: timer@8000 {
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1


