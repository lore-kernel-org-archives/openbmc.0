Return-Path: <openbmc+bounces-2137-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2E0CDE002
	for <openbmc@archiver.kernel.org>; Thu, 25 Jun 2026 08:19:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gmBXh3Y0pz2yd7;
	Thu, 25 Jun 2026 18:19:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782375539;
	cv=none; b=Hy+JURI8ZYTFVS997OYaJ1Q+QRO85fLKmnnukkC8Y22Je7iEEaDVL+EH1pTo/ocL1TSPUfdSPAnmguibTSuF4sqXzpMq9MP9TNOwk6qkiKJkYch0p6+XTyRcEQ7OK65URpfMNJ4cZwkc9FsbxzmcUE9emWyMBcdEEQ7WZDLd9wz4dAvRLLm+WhthBOC7BIJBc988zKNL9QNzJb0tHaVe7F6/LQjcq28HxmSE9wZV9XxeBaBLuHm0Ou0u08b7KBA75edFsGN1fgTBTD92LDuWnhNMg3orf95YCY16p6e5XKYwrmCiFDNOSlJEL98RUwSg9E0//OCgOComWHv0/DmNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782375539; c=relaxed/relaxed;
	bh=7L4JT8MNt9t8f7LRe0y0UPYefMKvOtlXkWEgrnohOfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=m0oDcQMva6+GA0jE6q01xk4gEAQsYlMKInvSHWD01Ce/+EdON+xb3hd07Mch7bsRIZlWjORARTyorHgwqCeqKmk+ZvFuAbEhpZPnGq/gJqi5s9I4Tde/VZHcGeb6hfL0opVnUCs/V2ffqtWc0zk10z/vtTRCdbvrlVLdJpG/4/xC845tascCk/xAOGHim9rolJv88XSJEaoYEQ5EdN/WAf71n4i2D7UA8J7SwKnwFpvpZbVs579YTIaKnVvbpva6xUw9646ybFMi7BCN6o46naUgqZ1NpQZ6n07NArhiYxlpkUcoIt+liYFqB9BllbRe9vhB6DYZnDHFzrq3IQjUxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=D77163ZX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=D77163ZX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gmBXd0pznz2xwH
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 18:18:56 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-46dc0d0eb2aso250324f8f.1
        for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 01:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782375531; x=1782980331; darn=lists.ozlabs.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7L4JT8MNt9t8f7LRe0y0UPYefMKvOtlXkWEgrnohOfI=;
        b=D77163ZXwBNSx3wRnD1fkdiEER+K6LUyaeRVPLEZbMEkXoGf8Krn9/hHvYRNPDha1d
         LzWxG3dyEVHqF/+UIV3//AXFcz6TBuHu6u+YGxWaIYq4hv0mtkDK9ci7LCVnC0qoJZVX
         kT3qVGHqPisWvopcZ+q2jEt8JQQ4lHUeSaoUhHvjH7UE4eWT5+Ub2ETsRojazddwC0Dd
         8ylIHBfIFCRxUCH29OwWZy6CINA7w+aVEFMLFmHg/3qKNg0POMRbPcI2Pn7dhQnkVS7K
         2tl9Tng49GG5rhUKbSBbyU81N0PTVyNaws+PZayR9Ob2EpP6Yg3XmsiPe0J75BmN/aJf
         Y9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375531; x=1782980331;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7L4JT8MNt9t8f7LRe0y0UPYefMKvOtlXkWEgrnohOfI=;
        b=tBji+GOHCfMu44djrE9Zs1F+Km8aXTceG56Fo31cvFSBctzMQSnMb/O2mDAO4+tHq/
         DCAQdTG7nRsYsb+rNqHxBqhc2ANtIRWWTQuPzDdU8ZUVRSn5UrYJtXyau+BzK+Iaqd4y
         uU9fkhdH++gR95TecTqR9+CQRRzwyEwmypzPKvStAXTfggTNmjG0wLPvkCFmq1AEQlwH
         8cvH1LSCDiHQCs75X2hiBcZdSgiwDiCNgG5I3nbqmEh1darpkiBdrknUmQGwjScSD9Oz
         o7UtDCMqQ41PtUvPQjUl8XCOnzj7RmUhB3T8Lp0Je3gaz6vLo1nPOd2zVI9MzpYtp+TD
         zU3w==
X-Gm-Message-State: AOJu0Yyna/K2AmrgrPKi486KeDAklZNFnmwGowdDzdkoq/CDi0lGRILx
	OQLHBgRVynGK/NKTMs4TeImeJFXRJXEzZEW9ipgHdrWHCnMuhUNCL3X/g2eCkQsaQrAYIe5BlJp
	ULPG1
X-Gm-Gg: AfdE7clGzMneG1LrWUB3NNb6qhWosaRehSdl820tZEr18lcPD7mCrj5KKD57xj9i9e8
	9asHr04k2MMy9ZgtV21vMU/WGXlrogtUzKUUq+nWfHkFVOPXqPCOaAy6jIHZ72WgWVdfiMBRy7a
	OKLIZfvSUG1a38vNPvA7PHQI/qy55BBaK3Sp/eotyrfVke337REtE6d5cEsmIymT+9/ckI+ooGD
	S/8dlUvqBtqsQzL7kDPZkd4QMWWyjZh2clC2d4XGQhfCAjaA+kCT0SG4uLiY3R0Ky7RR2uFxr5x
	m6IUW7X7mY9oAdzaMOWzwMnNLlBVrJgRyZE8/aZbX6GN0iazqHzTeDwSrw8qdN7DdQVX65+vp1t
	kQiCa9aeldr18XPMAjwsGDI0gMtfrsX9fHsEkP0m/0E1Ij6ZKNo1Ajz9ofQttKJAWNVR2GcOAGQ
	NUxWQO7O/N1/P58q2wAJ71BLZAtTYtnNvJd7QHyFw=
X-Received: by 2002:a5d:5c10:0:b0:46a:b0ea:1ed8 with SMTP id ffacd0b85a97d-46dbc5a1eabmr2158931f8f.0.1782375531468;
        Thu, 25 Jun 2026 01:18:51 -0700 (PDT)
Received: from [10.212.124.172] ([2a01:599:844:5d7d:4f6b:517f:39b1:33ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d9csm15229314f8f.12.2026.06.25.01.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:51 -0700 (PDT)
From: tan.siewert@9elements.com
Date: Thu, 25 Jun 2026 10:18:07 +0200
Subject: [PATCH linux dev-6.18 1/3] peci: cpu: add Intel Emerald Rapids
 support
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
Message-Id: <20260625-peci-er-backport-v1-1-5b2e8740f2ba@9elements.com>
References: <20260625-peci-er-backport-v1-0-5b2e8740f2ba@9elements.com>
In-Reply-To: <20260625-peci-er-backport-v1-0-5b2e8740f2ba@9elements.com>
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782375530; l=1277;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=s76Xfs59K5IvVcAw91GXm5hPMI4CifG5G9LR82eLCOY=;
 b=z413bhHfVoegv5vwTAQ3AFtYVVQOJt1pO68/uAdi2oRmE7+dbyhj7Q9p6PLowa8GFOaOQyCE0
 A6BVWTO/xkEANJPuqymDGQUv8C8vMbg11hWTYs8Gaw+VZGVtjhrW6wH
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

From: Ivan Mikhaylov <fr0st61te@gmail.com>

Add support for detection of Intel Emerald Rapids processor based on
CPU model.

Emerald Rapids Xeon processors with the model set to
INTEL_EMERALDRAPIDS_X. The data field for this entry is "emr".

Tested the patch series with AST2600 BMC with 5S Intel Emerald Rapids
processors & verified by reading cpu & dimm temperature which matches
host sensor values from lmsensors.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Link: https://lore.kernel.org/r/20251006215321.5036-2-fr0st61te@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 906f25050add51f1a412ea37e618d8748f75e23a)
Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 drivers/peci/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index 2dac8ba82787..fbccc1d1b637 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -321,6 +321,10 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.x86_vfm = INTEL_SAPPHIRERAPIDS_X,
 		.data	= "spr",
 	},
+	{ /* Emerald Rapids Xeon */
+		.x86_vfm  = INTEL_EMERALDRAPIDS_X,
+		.data  = "emr",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);

-- 
2.53.0


