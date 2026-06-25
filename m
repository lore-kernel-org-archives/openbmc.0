Return-Path: <openbmc+bounces-2136-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1087CDB47F
	for <openbmc@archiver.kernel.org>; Thu, 25 Jun 2026 08:19:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gmBXh337Sz2ybR;
	Thu, 25 Jun 2026 18:19:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782375539;
	cv=none; b=h9oMmUzP1767iBJsoxZL6/IiZFzY8HfW4Atw+3KCt/7Gz3GQYIN4QxMAUXK1aHXp8ZxPRr/XKNch6MzjxkamOwdf02be/aWFYLP95bAi5lq2sQBx5fAmlKx2uWRcZIGB5HNjxsUftVkfbFk38AC9KqQH5YBiNr25TB2vqwdcqjR75i2jo3SsgOML3iwqcYEXeWOebY48LG2/mmOqQOtIkD3MfdT1zLcmP1m0ZLyW/4lJAL+uwSCF+YTUTgPtQe9gJgZTUGGfuciIBv1h/b9PBtteKVr1l2H7tA7R4CRB49yor28V8wRzgXNjC0cA67iWRdnqasTOocma13HGS5nE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782375539; c=relaxed/relaxed;
	bh=KpwsKOVSLEjwFn9JOzpVbAa8YRCgWhIbKQ3XgmA2Xcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=FfnWAdhZoHJt6HpU/gKC+p4quitQSc/2b/OjKQbShfYRQmAIidD4iTqEd9DKxrvLOwcQuPULdjjkcJQYPQI7R8/pmxtp+p0Q9PpXyVJToVeoxKgsaSdd+d6wrfFkEpdKLvO8+3XWiERvlRYpiihOEOGVVgbaf9BoYH8/O90GPRoBE6iPz3pGTpqGwk9sIgQHKHx7BeQ5EsZwtKe8aU8+3sSR5uQsJhHCG7rqAIco7EO8R3Do7lRTeu2VELpO5D959+5cgAqV6rq6/UwDJjN9b8itD4cmuxYsDCtwdxhzczS2OSn4+WIRfT7VgIUNh27pMsdNukKTJZ183SRKa9cGmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=XS2AXOH8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=XS2AXOH8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gmBXd0vMWz2ySW
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 18:18:56 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-46255b269c2so1261544f8f.3
        for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 01:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782375532; x=1782980332; darn=lists.ozlabs.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpwsKOVSLEjwFn9JOzpVbAa8YRCgWhIbKQ3XgmA2Xcc=;
        b=XS2AXOH8/zYPe9V1FaiSR+Kc5SVMVpXr9WybXxMb5UPQm4vC+MbPSIE8Z8QUu4D35G
         UaVwNQ5fCKCN5wAKESrgPvsqulmIIJarCvl+SARVuNtnA3RAOPf3Xc5Auv0618S2j7Pm
         0/oZtc3TogYGqyJPepQO+opj6nmWgMbxDCLocKEF2SvaUnJKMJak+znhgeqy+tYP/6xi
         6jGdcfQYOIqpvJwiFgP3bbutx4Ia+3QmupOl5GEoFY7OoynfgiO/QlU5BvyYrlGvBvVA
         eM0HAHim0QCH8V877Mf59nNx9YU0tW6y2oobRnRCLD6C+TJDaq3bIw0dihVHigMrbPR8
         Pd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375532; x=1782980332;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KpwsKOVSLEjwFn9JOzpVbAa8YRCgWhIbKQ3XgmA2Xcc=;
        b=VOajuxJ4sdH1LVlFmOuLVO2JJpNcI/mmgf5vn/qJx6DuXAdJHyaMK6e4WiA7nzzBuD
         U56bLh6V3NEHR8xdnQi/DKctpDdV+y90ab4Fxm7sIWpSqro78+tkhxSs8UiLiF3YiYwA
         579fp6ci+340HQ2oW4maeMF/3kKH0D9NbspVbMlMJw+q9+nWTDyTrDqPa1h40zJmfYet
         WKDAzILxE4ZZxDDoVPntuRtf6ZXTbrzvCXX1EOlgMieZiVe6x85OovlD+PO0stLRHehO
         QLCr2e4w1+2iCGA7Lj9Bh4AhJXw985VaVpfuGJ6kjxkWdQkxIedxFV/RHr939B5aizeC
         yC1A==
X-Gm-Message-State: AOJu0YxsBZtB/CeWehLS4WfswNlBqWQvjye3pa0Qw7F/Kn7ivkj5JXI+
	LgC5D/BpJynLmk9QXQY+tcSxC+L2DvyahpFVWPaUsCdjoRV9k3tgPmGWf+6vEmH71eeFhcVTSE/
	BQm9M
X-Gm-Gg: AfdE7cmzEnCXsHBbQ20MgzA+sd05v2aiMOporVnk7eSidseMiuk7KYlWCgbpwqN2IP3
	0tTQuPoWBCdSycuV+mWHFrHqiM1AWDVi5HoI1ZC5ESp1Xz4syXOwBFNhq6xYyVfNXcxQdF7hUX2
	vVg/LeKvjMNJqjLb+rFkj1Ey4lZHFpZUJQ/OZVL8Rj5vqaE9Y6zlwNGRBnI+UTE4TnhuQ0Y+ZcY
	FgTjjNghZbipqIMGD4U8UeMEKEQo/0vAXWMKIPWIZ/sYCN+IxrT6+SGxQHuKZkY1j3Umo4jGCSw
	/iX65NiCELMghYvZSzwy9Q73D9vNvlz+ZgRjHcpb9Lhsj/PJ56XAeGA3vQ68BBQY7ITiDrv1VYF
	t3ImMlw70hqga52YHeDyhfn64spyR0F5LP24XJzdAlL+bLalCUKY2QjOZFnnaG/h7wHUYSnEU2b
	vPap+iLaGQGC+sYvvUEuzcijAwFj5y
X-Received: by 2002:a05:6000:2687:b0:46d:95db:3302 with SMTP id ffacd0b85a97d-46dc1aa5b59mr2205410f8f.39.1782375532031;
        Thu, 25 Jun 2026 01:18:52 -0700 (PDT)
Received: from [10.212.124.172] ([2a01:599:844:5d7d:4f6b:517f:39b1:33ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d9csm15229314f8f.12.2026.06.25.01.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:51 -0700 (PDT)
From: tan.siewert@9elements.com
Date: Thu, 25 Jun 2026 10:18:08 +0200
Subject: [PATCH linux dev-6.18 2/3] hwmon: (peci/dimmtemp) add Intel
 Emerald Rapids platform support
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
Message-Id: <20260625-peci-er-backport-v1-2-5b2e8740f2ba@9elements.com>
References: <20260625-peci-er-backport-v1-0-5b2e8740f2ba@9elements.com>
In-Reply-To: <20260625-peci-er-backport-v1-0-5b2e8740f2ba@9elements.com>
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782375530; l=2451;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=egulY0CDYELNvnvttru03deFpoxsiNP4YoD8i7bL3UI=;
 b=zOVemrnaCTtLo4F49DAosbZszz1eUDas3cb/eC5TtS1yEDc948n5W8lKIJfUJrN7hWX5y2+w3
 TUQZocdX4q/BVHwSTK0ByigBz9WRSEEHuNixI2Q5blfkzT+AnyfV1HO
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

From: Ivan Mikhaylov <fr0st61te@gmail.com>

Extend the functionality of hwmon (peci/dimmtemp) for Emerald Rapids
platform.

The patch has been tested on a 5S system with 16 DIMMs installed.
Verified read of DIMM temperature thresholds & temperature.

Using Sapphire's callbacks about getting thresholds because it's same
platform/socket.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Link: https://lore.kernel.org/r/20251006215321.5036-3-fr0st61te@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 03c5ecc276fdc696ec469ee3a784726b809ecf26)
Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 drivers/hwmon/peci/dimmtemp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index fbe82d9852e0..a281476c7a31 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -32,6 +32,8 @@
 #define DIMM_IDX_MAX_ON_ICXD	2
 #define CHAN_RANK_MAX_ON_SPR	8
 #define DIMM_IDX_MAX_ON_SPR	2
+#define CHAN_RANK_MAX_ON_EMR	8
+#define DIMM_IDX_MAX_ON_EMR	2
 
 #define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
 #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
@@ -571,6 +573,12 @@ read_thresholds_spr(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u
 	return 0;
 }
 
+static int read_thresholds_emr(struct peci_dimmtemp *priv, int dimm_order,
+			       int chan_rank, u32 *data)
+{
+	return read_thresholds_spr(priv, dimm_order, chan_rank, data);
+}
+
 static const struct dimm_info dimm_hsx = {
 	.chan_rank_max	= CHAN_RANK_MAX_ON_HSX,
 	.dimm_idx_max	= DIMM_IDX_MAX_ON_HSX,
@@ -620,6 +628,13 @@ static const struct dimm_info dimm_spr = {
 	.read_thresholds = &read_thresholds_spr,
 };
 
+static const struct dimm_info dimm_emr = {
+	.chan_rank_max  = CHAN_RANK_MAX_ON_EMR,
+	.dimm_idx_max  = DIMM_IDX_MAX_ON_EMR,
+	.min_peci_revision = 0x40,
+	.read_thresholds = &read_thresholds_emr,
+};
+
 static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 	{
 		.name = "peci_cpu.dimmtemp.hsx",
@@ -649,6 +664,10 @@ static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 		.name = "peci_cpu.dimmtemp.spr",
 		.driver_data = (kernel_ulong_t)&dimm_spr,
 	},
+	{
+		.name = "peci_cpu.dimmtemp.emr",
+		.driver_data = (kernel_ulong_t)&dimm_emr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);

-- 
2.53.0


