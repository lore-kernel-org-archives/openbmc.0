Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF45FC02185
	for <openbmc@archiver.kernel.org>; Mon, 20 Jan 2025 05:59:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05D3ThBz3fv7
	for <openbmc@archiver.kernel.org>; Mon, 20 Jan 2025 16:58:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107082;
	cv=none; b=PN1k98GJnr0f+jWpymZJnR40euCunaZPU3XVRW/EA2L30Ms/6uEi+NTRv4ow7Iec8VNtoRLyDOuRMt1Knv/znJKt82+NfptvRiv9yE8ieHdWfL0AHsuOu7NRrIeT7wKPRhr0Bpw3AZfkaCZU9pM60xnPZ7debc6pUMnS1ZiswJb0g15NfnaB9o+jiJFH4+3CZMUCN+XEdYCLh0cNN4ezvwsLwCfSpT7ScvCWf0VHP5JqQ1844JyOTitBk3MpgRt+/Xvg+0/GOHmo0FCtWvAObfeDtlebOYBkHoATtmEUjS3IWT+fuJFx0ye/h/FLjP4J30llPKYG54HMKvd+NoCtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107082; c=relaxed/relaxed;
	bh=gHo/IbWnynus4In3kc6FGoihf7iQCTC8QdlXOlsVZDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OScHubJmRQvrtI0XVJjqtdpk7pwyyohF5gpI3w3JsvG0EEtdiBxDwSHWDijP6o6g+7FoPNr6dzYYlSjVy/FgACkG8/v0YGp2Cx8P9gcLeG2vHRpg2lifOV+ZyS4BCSC8oUsz/St17VV7AgUy/YkKVl1lUYXs7Q/o3ABhjBUOmntI9/+T7DX4+BRXT8ICuRy+h8QJzt9j5Aksd0w53fZHcIAg0+SmvDnDaKKDdQwkr+QyeNaL7lE7Vggw+KH4xwwZC1dGKplHY/i9nuXd05A/7qqKTvvP5xUkxVYLajWGwSpcCUDoz4hFxWyWJ+9ia+di9XeMQ2x2pfrRzD3er+idWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=rF6UUeEG; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=rF6UUeEG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFL3tgzz3cgf
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=gHo/IbWnynus4In3kc6FGoihf7iQCTC8QdlXOlsVZDc=; b=rF6UUe
	EGG7XnC+PUpTKbfadlns5M7IJ55LmZ8YVyYXysvHoI81sUvJV0kucB1Aqg+39u3o/W5g4CAAXiKns
	0cCLhgRkxAbMNT0EpVh2aqz9kx1ELOir4nflCiEDkRg9yZlv4Y+DVFXiNw4onODDmKAIWJXwc10Tp
	HgJB/QHsEN+cMvlMZzJJLYsn4YMC1QlSqPxrxe+jba70qjujz2+ozE4VHxxi7SMYrhMP6yAMKEbXc
	x8JbflZB4q7bwxXrtv6t0HzHYH/LaChX13SIBpaT3FADkY073JL+/LWV2yS9wYXLjtxuOMUjqUqtS
	nwT8UrtLmRy5+LMtWJFY/quvaLzA==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu3-000A1S-87; Fri, 17 Jan 2025 10:44:35 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 04/12] misc: i2c_eeprom: verify that the chip is functional at probe()
Date: Fri, 17 Jan 2025 10:44:23 +0100
Message-ID: <20250117094434.16641-5-tan.siewert@hetzner.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250117094434.16641-1-tan.siewert@hetzner.com>
References: <20250117094434.16641-1-tan.siewert@hetzner.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: tom.siewert@hetzner.com
X-Mailman-Approved-At: Mon, 20 Jan 2025 16:58:31 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Baruch Siach <baruch@tkos.co.il>, Tan Siewert <tan.siewert@hetzner.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Baruch Siach <baruch@tkos.co.il>

Read a single byte from EEPROM to verify that it is actually there.

This is equivalent to Linux kernel commit 00f0ea70d2b8 ("eeprom: at24:
check if the chip is functional in probe()").

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>

hs: fixed style check prefer kernel type 'u8' over 'uint8_t'
(cherry picked from commit 5ae84860b0428b37063a6d7b03cae26a4e772da7)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/misc/i2c_eeprom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index f25d0540075..8f2349ad5a7 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -84,6 +84,14 @@ static int i2c_eeprom_std_ofdata_to_platdata(struct udevice *dev)
 
 static int i2c_eeprom_std_probe(struct udevice *dev)
 {
+	u8 test_byte;
+	int ret;
+
+	/* Verify that the chip is functional */
+	ret = i2c_eeprom_read(dev, 0, &test_byte, 1);
+	if (ret)
+		return -ENODEV;
+
 	return 0;
 }
 
-- 
2.47.0

