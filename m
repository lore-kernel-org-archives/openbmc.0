Return-Path: <openbmc+bounces-2139-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF05CDB47F
	for <openbmc@archiver.kernel.org>; Thu, 25 Jun 2026 08:19:44 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gmBXj6XPVz2yfS;
	Thu, 25 Jun 2026 18:19:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782375541;
	cv=none; b=fNh8HLb1Dq8UFEqqFix/WWmWWFuuPLpASuidC5cJUnqCqdDqRhxmU4Qa60zXmzWti3QwX0tAtMr6PIIQJTA6FEZW2qxGVhzlj/MvwANb+O3/cVvuUVdKcq2+DUrB8p6aj0cJDMHLCyGL5i9Ml8lvuuw+xdvUOPe9yoONOcouUtIujwr4pTr1oTB+XVUm2d8oBX8H+i2rHrLI9XYspVCv5Le68Vc85M6/L7UCzuv/Ie/U0qASerjdGfP+4ysqj6dJSUKb8zXeWWFBApLbOAvDjAxDYnMI9IqezI1bC81JJxkwtnv4zWUavTdiqVYOHQqwN8MAQzFt+Ut3tPlNH8oC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782375541; c=relaxed/relaxed;
	bh=MUnP1Oz3XzckKiQ7vQG8Fxw7K0/dkI61u1evKR8BQAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=FiLwEi+pvnhJ9RgnnN4NldI9dDfyFdMvsfZZAio3hwFL/5zPs3JiaJzpX1zd+vLLQjEWV3g6P9TeTmNubcGpSkAaP6+C3dwC4/6bSrkwmQL6I/UPP3FmqMiW1hnsSF5iGDdTzHT6xxiBHCzyVVmCsoXPXglLyO1dfWqyE2c/B0h7yqOjv1RIoPZa1TGBFM/Erx/URWwIzGCdBEbpE78rthC3LtKn3/Ti/iBiJJp6w5fxMxo+ZVrVpfiadQv5Eg+KE3q1MIlEwnieQHK48pKNoML7LuGzsFGbSBd7zu5zGDvddYOEOnPCFFzJRCcTbzehIlxjUy5Em07TmbLRqDqi9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=grTJ6Ma9; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=grTJ6Ma9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gmBXd09x0z2xPL
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 18:18:56 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-461edb387ddso2135579f8f.3
        for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 01:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782375532; x=1782980332; darn=lists.ozlabs.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUnP1Oz3XzckKiQ7vQG8Fxw7K0/dkI61u1evKR8BQAs=;
        b=grTJ6Ma9IeNSCTfoyXS3wFy5kOR7rVK8nVYwKEuWUBIflJcScyekoqnq+zZmKt4qEe
         +1wnLbzgCTnGPiB3F7XnWoXFNr4ObHS9tGOxo5Prqvbal2f9U0tpYIMUMgU8yWg6vk1h
         9ZiJmTUGgqX7SmH3yEWDWf3p2ns0rchiz4xvrpC2wT3mn73W4bVA5Wf4Aw6v7yoa2aU5
         R1l0JuwVYY3ZAxSB7pP79lUPUpevopDHheF7tMBVfNQghP6v9hSjcc7Vt+A9fokWFTz8
         X0foR/Y1qedB1sONfXlimM7ACqZlw/5niuJK9jUKfR/f7r1iozwhjADzbO+f4ERXY2OI
         mayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375532; x=1782980332;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUnP1Oz3XzckKiQ7vQG8Fxw7K0/dkI61u1evKR8BQAs=;
        b=HyfEQVj4vx1tb30uDUk148U8DTaCDEZJcFJ7imElgdkvou081BrKF9VzFnz2OXV9rr
         cw7tVeOgxDpKaC6vfxaO35qfPjmPSlHIuXXZpW/qsQ7qIiGnXDyBsZ+GWuX0Prge4bA+
         5yWJcA2qMzCUhk3E7Dgg9c6e1DhnZ3c1qp7pccnOlA0pj5q7TfZQYfJ09jzbb9axQ8LH
         Drym5DVLYEJcevKjmHbbQ+yZIOGzyJHfwgnu6m5OT1QymRdwIoAXNAkd2d8/MYBVUbzF
         4VSgX362uEOI03Fwil3OpdKOsDZbEMO2Ohr50sXceN3fWEQ0a8ei24bvAOuVgZvR3S7l
         Xupw==
X-Gm-Message-State: AOJu0YxorG2QUmCA4ynhuYtdVtIcmTzrfburrmooWFX6vQkYb0LomNYs
	Cyc+0BNYLwo1JRG3u+atSnSgv5dwUzE599z0PQeERv/aIrNv3PgfFn7cvg5qJHGOeOG/LIZ1WEh
	+SnST
X-Gm-Gg: AfdE7clasUwxE2p9SPVWDOxrtxwSJt5xuTY8GCSUedeEJDjVm3nG1dOEaL336fX79h9
	3emOjUS/6YCQbxQq+IdA7zH3RlMNtJ2VBcrOFAijVEMQpJt4/HGwzC27X/j6F9j73a6HA1NzrJR
	Bp3ftMj2qA8ZjAsgD4IQH7uJ3DryKT2yBB8sc+Pa02t+wo0KyUNKzggRDoPyu7Qct9GZhS8ruFi
	XXDeQFXkNqImTzFRcqeDvfBXBAt79EiLvqP0c8JQ0hxqiaAOBJp3ZhdiXk73G5zQpVLYSI284lL
	EUrYnO5fiSds/qJms06M/qdUoZJ+XfitPQWRHoO5KT3dXqtfmkgl9n6d7+LzOORXkw4vCZnL3WC
	C/cXI+ZgtIptCkvh7JxJHIFB86nnF0H3EOsAcq/O/o3cPBLw1vQLwRa4wi0buShKXahdd77qz9o
	ZOXp3m3e3qwjd+yod6JYJjGNdk1hWg
X-Received: by 2002:a05:6000:4815:b0:46d:d5da:f0a5 with SMTP id ffacd0b85a97d-46dd5daf1e7mr1584728f8f.44.1782375532566;
        Thu, 25 Jun 2026 01:18:52 -0700 (PDT)
Received: from [10.212.124.172] ([2a01:599:844:5d7d:4f6b:517f:39b1:33ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d9csm15229314f8f.12.2026.06.25.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:52 -0700 (PDT)
From: tan.siewert@9elements.com
Date: Thu, 25 Jun 2026 10:18:09 +0200
Subject: [PATCH linux dev-6.18 3/3] hwmon: (peci/cputemp) add Intel Emerald
 Rapids support
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
Message-Id: <20260625-peci-er-backport-v1-3-5b2e8740f2ba@9elements.com>
References: <20260625-peci-er-backport-v1-0-5b2e8740f2ba@9elements.com>
In-Reply-To: <20260625-peci-er-backport-v1-0-5b2e8740f2ba@9elements.com>
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782375530; l=2149;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=9oeFvSvpRNqofYXuJC8pas1qAaLxJdjRh0gU7l1jHDo=;
 b=1TrerYjPOrKTH0IaKGY6dCmLy+e6GDY+3/atef1YAqmDMtT8Z0hy+H9ZjnZvaMttxobXq4bjg
 QbjmxCNSHM7AR1jaxQmYKNfH/dA2c8mWAvbnbiHqtPUQD7krgdKx/ON
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

From: Ivan Mikhaylov <fr0st61te@gmail.com>

Add support to read DTS for reading Intel Emerald Rapids platform.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Link: https://lore.kernel.org/r/20251006215321.5036-4-fr0st61te@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit a45b3ae40451542e3d6b37b8fba04e280cc8efa7)
Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 drivers/hwmon/peci/cputemp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index 007fa621e10f..f4277a1f01be 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -364,6 +364,7 @@ static int init_core_mask(struct peci_cputemp *priv)
 	case INTEL_ICELAKE_X:
 	case INTEL_ICELAKE_D:
 	case INTEL_SAPPHIRERAPIDS_X:
+	case INTEL_EMERALDRAPIDS_X:
 		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
 					     reg->func, reg->offset + 4, &data);
 		if (ret)
@@ -539,6 +540,13 @@ static struct resolved_cores_reg resolved_cores_reg_spr = {
 	.offset = 0x80,
 };
 
+static struct resolved_cores_reg resolved_cores_reg_emr = {
+	.bus = 31,
+	.dev = 30,
+	.func = 6,
+	.offset = 0x80,
+};
+
 static const struct cpu_info cpu_hsx = {
 	.reg		= &resolved_cores_reg_hsx,
 	.min_peci_revision = 0x33,
@@ -563,6 +571,12 @@ static const struct cpu_info cpu_spr = {
 	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
 };
 
+static const struct cpu_info cpu_emr = {
+	.reg    = &resolved_cores_reg_emr,
+	.min_peci_revision = 0x40,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	{
 		.name = "peci_cpu.cputemp.hsx",
@@ -592,6 +606,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
 		.name = "peci_cpu.cputemp.spr",
 		.driver_data = (kernel_ulong_t)&cpu_spr,
 	},
+	{
+		.name = "peci_cpu.cputemp.emr",
+		.driver_data = (kernel_ulong_t)&cpu_emr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);

-- 
2.53.0


