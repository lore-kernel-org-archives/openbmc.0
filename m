Return-Path: <openbmc+bounces-1974-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484BCCD4F54
	for <openbmc@archiver.kernel.org>; Tue, 19 May 2026 20:27:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKmRx6C9xz3bqV;
	Wed, 20 May 2026 06:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779176776;
	cv=none; b=f5GNwCqXrb8hDWtXm7Nj8LqxBkdoIDFq8JUdBI7GwtBQgBbjzPVOvtfAV9N/MzAMFcSWUPim272FvYmFU70H2tbuGDlGDqJUjNdmi2ajkWVAti9j26+l70+wyj3gK5rCUhQcl1apITIX8G589GoErtDztfWuTjg3O6UCtxasOA3Vd9p+ZffqHjb7qsoQmvtiaAkNnux8/I1NjX+WyJLx5KhkFjQGBJZKRANHyhVafoOrzuAwMq5XOLTW+Bsichp0113usfyqeCdtaZyC2aDYgwZ0d7Fvx7ypCKJ+zVpJJrQlnfa0p6ipsK0IK8a2lDxZvE5fjJKhsWvJtWyoiUbt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779176776; c=relaxed/relaxed;
	bh=AYsN0a9UB8wMpL5XIYG8UtJPQyDDCtZBi8gUpQllUR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rwr1QZYYuvC7kflAMY67skMqCBPaUGtpgGvMQaniBxIFj/qAW7Fyff3nqt1PpzLijSfMaADN6StB4gzWyfu12wX2mFDIx66KqcJoiqZOLS+dWgJIymmHg5wnx+zs3q2kHRwI9o1vRD+SwU3N/qPEQ4eII7FUEf9YyGzh4QekkGrjVF1j0c9PrG1lAni5epMQIw0s1VoIAefuZy7nBgEwvS0K658xaVgU9kv4h5RIJCdZQMWaltxbvqIwW57sLiZplYjBWl0UZQfPIEXKrqMCgdTtuKPiNDBUsyYay0sU6OcyjF+z0WOn7M8dWYvTeW43dMunJrxPjME8V3TKK79xZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZKbpiE4I; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZKbpiE4I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKRYy4rxCz2yCM
	for <openbmc@lists.ozlabs.org>; Tue, 19 May 2026 17:46:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB92643EBD;
	Tue, 19 May 2026 07:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE13CC2BCC6;
	Tue, 19 May 2026 07:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176771;
	bh=SylnjVXtpQDH9y/BC3wtX5XeEOMg3trtFejWWsPMqxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZKbpiE4IAWq5sa6We73d1Ii6dfb2gBgMbMn9TInkWcnQWfeUkPLkKcHjkJMmr+Dja
	 E8On9ZYc4pg53Xn/g4Qz9kZHKVLuzHqxt+gVEBUeDR9gxREH/KjX6xob+1QmWiHMiP
	 FUxS7CCXY/GBG0CYT2FavcnyzpLbxO3XLoFF96uF0an2cY4uufR8eik/e4OS1zraSc
	 dlNC7+t/88lTP/Hqch28MciZZiQej4kRUn/IvkbMsk1nooaZDNELcHPnfwhw41xnK9
	 up8Dse+mvDe+dnOCSx1piXXG6brDW4Br+NVjRRdNYV9VAf8swOK6+5Ipjvayt9DJU4
	 wKBxKRgj/AXMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D13CD4F5B;
	Tue, 19 May 2026 07:46:11 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 19 May 2026 15:45:58 +0800
Subject: [PATCH linux dev-6.18 2/2] hwmon: (pmbus) Add Delta Q54SN120A1
 Q54SW120A7 chip
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
Message-Id: <20260519-dev-6-18-add-delta-q54sn120a1-q54sw120a7-v1-2-9b5eb2c0752e@gmail.com>
References: <20260519-dev-6-18-add-delta-q54sn120a1-q54sw120a7-v1-0-9b5eb2c0752e@gmail.com>
In-Reply-To: <20260519-dev-6-18-add-delta-q54sn120a1-q54sw120a7-v1-0-9b5eb2c0752e@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779176769; l=2436;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=PebGsfq1DuqlFezv5ighrmMT+0lm6uGfBIr+dq7+zSI=;
 b=f1z+o6sSALXICrqbHd4eszFRFWKyJ/JBo0XfuI2PXC6nJTk5LjLTW/o8HMTzfgj+QyX0yZhg8
 rr1f55mf+vACzVIEWNQG+HhNhwLDYF/ukBEEvxzNor6I+K/1y3luoGK
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add the DELTA chips Q54SN120A1, Q54SW120A7 in q54sj108a2,
1/4 Brick DC/DC Regulated Power Module with PMBus support

Signed-off-by: Colin Huang <u8813345@gmail.com>
Link: https://lore.kernel.org/r/20260316-add-q54sn120a1-q54q54sw120a7-v2-2-60e6182cc4a7@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index 7b0d292a425a..3068983ceacf 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -270,6 +270,8 @@ static const struct file_operations q54sj108a2_fops = {
 
 static const struct i2c_device_id q54sj108a2_id[] = {
 	{ "q54sj108a2", q54sj108a2 },
+	{ "q54sn120a1", q54sj108a2 },
+	{ "q54sw120a7", q54sj108a2 },
 	{ },
 };
 
@@ -279,6 +281,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
 	enum chips chip_id;
 	int ret, i;
 	struct dentry *debugfs;
@@ -315,8 +318,12 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
 	}
-	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
-		buf[ret] = '\0';
+	buf[ret] = '\0';
+	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0]) {
 		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
 		return -ENODEV;
 	}
@@ -326,7 +333,10 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		dev_err(dev, "Failed to read Manufacturer Revision\n");
 		return ret;
 	}
-	if (ret != 4 || buf[0] != 'S') {
+	/*
+	 * accept manufacturer revision with optional NUL byte
+	 */
+	if (!(ret == 4 || ret == 5) || buf[0] != 'S') {
 		buf[ret] = '\0';
 		dev_err(dev, "Unsupported Manufacturer Revision '%s'\n", buf);
 		return -ENODEV;
@@ -403,6 +413,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 
 static const struct of_device_id q54sj108a2_of_match[] = {
 	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q54sn120a1", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q54sw120a7", .data = (void *)q54sj108a2 },
 	{ },
 };
 

-- 
2.34.1



