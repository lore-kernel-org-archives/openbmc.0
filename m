Return-Path: <openbmc+bounces-1641-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6BA1091929
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 22:37:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcLDR6Fsbz2xqD;
	Fri, 20 Mar 2026 09:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773905844;
	cv=none; b=fCZpMDwXZJNEyMyQd0IjVS2ybt//PJi6+mVVmSIwFNYrivBhbzaxKgWj3sZaUb8XxMc7yJvFrlWBd+HrfNfnqDYjhp60usoenTBRux6Zl95maWS/vF5lrv10VcFq+M+QhfsCBc3vUajpcws6QeGld1vloJM2hWpt0LAyO7gWetr/ivLJQbi3v4nQBzhtZaORWgbxD5D0X01THosdAfNE0CTd6RN9bLF3aIBz3gcnlfTY4qwuabV9HLn4El1BRe2YHmyyFQV9Oy3Cxrj16eOu/vJqa732BBrDdgzphkQVNcIRnshXWoJGB319jO0fvSjwqs2DSmHPEDkHrHheHekTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773905844; c=relaxed/relaxed;
	bh=HFoz3X7YpoqehSDAYvul5g0kiEPbFYUZYjMkoKf3zTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxKBYFcpQM2i5Yln0Hq4dpb4BcvKkvgp0TlGD1R8eHa4sa1ZwQ63zZUT+7nFhC8VuO02/01jBZ9t9SwrJRIqR7U3uwmKztPTuMp7C4TTlykv7JOmMWXSm86jlW4+yKMfzjPKYYhKeT/C1NSihTtNsNjvkVVDdRuwZNrda4lC6lYU38sCn0L+gnbalTDAx/Mo+m2w/TePEOxoCPn5lqrzy6mhSf8w44zpevW2Lv9HvV+MxhHCmrrF/batwOmjhHzQHPFJthCARUtD4QBLtYLJxxzoqMPYd+VvjIZF/xfQ1FfKBTfof0roFaIgyZOAhhIiF3/NdYVwJbffdOvXN0rDsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kb2V28Zw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=jackson870728@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kb2V28Zw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=jackson870728@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbyFv2rbRz2yZ5
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 18:37:23 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82a655cfab5so745851b3a.1
        for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 00:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773905841; x=1774510641; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFoz3X7YpoqehSDAYvul5g0kiEPbFYUZYjMkoKf3zTk=;
        b=Kb2V28ZwU1p12snXEZAHyyvzyW4O7aGwnw+xhczMdMlnttVZm6FkxrRlhosTYEZeIe
         DDhbXPBw072OcJre2rXxL6YkdsEXagEEhyG0RGm+DrDQVGqytxBS2FnoNntoh5M93UPw
         UePS1lJr+Ww7mXKWJ2z7zfLLoUMI+benklBkgUrQB46nOMS2IeQDC2dWIeOxw3qCVT3i
         wQDV+19k2+EIazza/+QDnX/E59p5k+Nmbp/KCb2BLZ063ZFzyWQUH5V16QW38zLS37i2
         aYDgmo+IqWTCudfmOMx9tXYkAOjJtJFJXndJ8vYuVFwZF4j0MHL1/TOjCM82Fb7GuODB
         FM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773905841; x=1774510641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HFoz3X7YpoqehSDAYvul5g0kiEPbFYUZYjMkoKf3zTk=;
        b=UCvKdRnMYqijFV1ggQJwNvRRThDFcNFge8uJHxcq+iiQrjamyP6Jjpnes9MIA4f0ob
         7ztHgNc5ziS6ogaKSEIf1SdgWtxuUdUfyBt9qeHw4pv+dVQETUsqoRto2UiUow3TvHHu
         1olqtnXBxKM/bxXnxE2mZs6DlSBidaLRFj4PyBrIrJV7yTYvwnBuzgMxylvqReIbSTsG
         2jdpwJjam+P8FMqAborkD5jFQvEtCtqTLWCY1uiv+y5CeI9FOwaW7e+m7tUPUpKfIF0z
         anRb5y9U7imjsXBqx1fNPKdeclYMWvAOeEYXAr/n98jscb0HZ4R7aZgnKFJP8QY/rPfN
         CJkw==
X-Forwarded-Encrypted: i=1; AJvYcCUkmm6IsaAGn3DCVjAnvjGSKEpvXq1NE5kELcTCB37Rlg6UndCMX/EGbaCdjc8rS+nMKRdYg9YF@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9Jxf1Cv8HEkuxZ66Mez60pN8Yj0mxNspdn8fbgEL/8cQdTufB
	YpeCEwjJqfOUoWrDArCsESNi35TvBiVUK5HXqXwYJv2aOHY+78bvUm05
X-Gm-Gg: ATEYQzyK0RXvq89s1TSIaC8Yhswa+Q99yPPswjaPA4EzrXpcLUmRqCd5BqIrsLCq0WG
	8d3ZxavBdNk3Ij7tj/RDu+bfPym4gPwLb7kbR1mzfmNkQhSj/8PzBGS3N964YhwlcQKGgJMQgf5
	vjLLw/I7eFGSAV5OiVDdqxFJ2js1y4jF7dtEY7vaAWPRtCYwPwifeRlI9Ctsg5lw4R90DtcPI7B
	Uu8v9I8DjgqwtTW35KdZKsfULnuXJXRPMc3VZaWYU+qRLUMduGnvjgh3g7DGbSNc6bZxwBF80fw
	Tur7StP0XtwIm2o5Dqp1tvHqw2aIT8eDlueIIIbPX+7F+i3Nss9ExCSGq5hQ6RAUKT6ZEg4WneL
	H6FtVMMtYFSS9UUQNpZTQ9o7TVR669rwTqY8AnaEgPoGgmdl09Mvxgpv5w7nlCW8gKi/4xtyOiU
	79wmYWpbAVZb6NHH09qX8xOLu1VMizBWuyiUM99QM193h4aA65td0KtR5KgrhwWyDjr8p42VDlP
	stWVT9cPrCt3bsp2JvK/7WVfK+jsmJ7
X-Received: by 2002:a05:6a20:9395:b0:398:b16f:7054 with SMTP id adf61e73a8af0-39b99f72e32mr6013361637.32.1773905840873;
        Thu, 19 Mar 2026 00:37:20 -0700 (PDT)
Received: from jackson-ubuntu24.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e568e36sm4633192a12.23.2026.03.19.00.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 00:37:20 -0700 (PDT)
From: Jackson Liu <jackson870728@gmail.com>
X-Google-Original-From: Jackson Liu <Jackson.Liu@quantatw.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: jackson.liu@quantatw.com
Subject: [PATCH linux dev-6.18 3/3] hwmon: (mp2925) Add vid offset for vid mode
Date: Thu, 19 Mar 2026 15:35:12 +0800
Message-ID: <20260319073515.1577998-3-Jackson.Liu@quantatw.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319073515.1577998-1-Jackson.Liu@quantatw.com>
References: <20260319073515.1577998-1-Jackson.Liu@quantatw.com>
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

In vid mode, the mp2925 vout telemetry has 49 vid step offset, add
vid offset for this.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
Link: https://lore.kernel.org/r/20260106061348.170509-1-wenswang@yeah.net
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit a9c4ac630c8a38a0496c2b54cf27b318d38ab6e6)
---
 drivers/hwmon/pmbus/mp2925.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2925.c b/drivers/hwmon/pmbus/mp2925.c
index 6bebd6023021..ad094842cf2d 100644
--- a/drivers/hwmon/pmbus/mp2925.c
+++ b/drivers/hwmon/pmbus/mp2925.c
@@ -40,6 +40,7 @@
 struct mp2925_data {
 	struct pmbus_driver_info info;
 	int vout_scale[MP2925_PAGE_NUM];
+	int vid_offset[MP2925_PAGE_NUM];
 };
 
 #define to_mp2925_data(x) container_of(x, struct mp2925_data, info)
@@ -94,8 +95,15 @@ static int mp2925_read_word_data(struct i2c_client *client, int page, int phase,
 		if (ret < 0)
 			return ret;
 
-		ret = DIV_ROUND_CLOSEST((ret & GENMASK(11, 0)) * data->vout_scale[page],
-					MP2925_VOUT_DIV);
+		/*
+		 * In vid mode, the MP2925 vout telemetry has 49 vid step offset, but
+		 * PMBUS_VOUT_OV_FAULT_LIMIT and PMBUS_VOUT_UV_FAULT_LIMIT do not take
+		 * this into consideration, its resolution is 1.95mV/LSB, as a result,
+		 * format[PSC_VOLTAGE_OUT] can not be set to vid directly. Adding extra
+		 * vid_offset variable for vout telemetry.
+		 */
+		ret = DIV_ROUND_CLOSEST(((ret & GENMASK(11, 0)) + data->vid_offset[page]) *
+					data->vout_scale[page], MP2925_VOUT_DIV);
 		break;
 	case PMBUS_VOUT_OV_FAULT_LIMIT:
 	case PMBUS_VOUT_UV_FAULT_LIMIT:
@@ -231,10 +239,21 @@ mp2925_identify_vout_scale(struct i2c_client *client, struct pmbus_driver_info *
 			data->vout_scale[page] = 2560;
 		else
 			data->vout_scale[page] = 5120;
+
+		/*
+		 * In vid mode, the MP2925 vout telemetry has 49 vid step offset, but
+		 * PMBUS_VOUT_OV_FAULT_LIMIT and PMBUS_VOUT_UV_FAULT_LIMIT do not take
+		 * this into consideration, its resolution is 1.95mV/LSB, as a result,
+		 * format[PSC_VOLTAGE_OUT] can not be set to vid directly. Adding extra
+		 * vid_offset variable for vout telemetry.
+		 */
+		data->vid_offset[page] = 49;
 	} else if (FIELD_GET(GENMASK(4, 4), ret)) {
 		data->vout_scale[page] = 1;
+		data->vid_offset[page] = 0;
 	} else {
 		data->vout_scale[page] = 512;
+		data->vid_offset[page] = 0;
 	}
 
 	return 0;
-- 
2.43.0


