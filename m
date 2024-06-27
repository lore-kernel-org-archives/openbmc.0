Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37CFC2BD09
	for <openbmc@archiver.kernel.org>; Thu, 27 Jun 2024 23:13:15 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FyeJce3j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9DrT26Kpz3cnt
	for <openbmc@archiver.kernel.org>; Fri, 28 Jun 2024 09:13:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FyeJce3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdX27xWz3cV9
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:16 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f480624d0fso59746215ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469935; x=1720074735; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqsSYdsGNy1ml2i2nb2KczLx9uSIN7hDvVpf7dyFvwY=;
        b=FyeJce3jlHiDth6k6cI5g4p9B3KBtBIOXlmoAwZGcpdrV9Y/ERVOOv5usPrgfbunfe
         S8o7SiRZMHd2rGh/2T5RvKIHYGRLnE05oiw94Xt8YqNL3UPHHGmbEuscZe248KEL5RJW
         ou1MBOcRroIuqKjVGXWcm4nFGU+NWKUUNeWax0Oecm5RNXjmU2Jx8b+NzLCsoJTAU7eX
         69pM9wCqIR8tm//Xlv6IdQFkAELFjTmBGLm1GaEWkqX64zIcHu8PvTU+oKbyfcxksMfl
         ywo0HM0ij+LcWUFOjGdjYFUQGNhGNWujIevmBwCSv8DCI9blEpgWdbK2b7JuBGBQYl5K
         ZyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469935; x=1720074735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqsSYdsGNy1ml2i2nb2KczLx9uSIN7hDvVpf7dyFvwY=;
        b=p4BB/oV0TIpmSIzOJkRCQahKf/TIZcbGC8guZYuhjyPMQwzysrzKnnzgH7RSIBLvEH
         TTEik1Qe3ilUMCyXndhIxdzKy9syT+l+HxaGJO1r5KQdcr9XrQBY2VyqlvkG01IeK0IO
         vgbdv0OWF+rKhS7a4X9dChMA46orWmCD3cKGiXcnZI9UAhHx/NMWz5+R4+Yad7DpgxvH
         nlbvthK4Rte5Z66OcaU0MFl8xMiWHqoCS5rOkt5knT54l5PbD+PTTLLT6fY9uktl8n3T
         6Bjf5HFqSRYhtQsuAWHYuc88jC/tu+rb8UBFQzoIGhBVzzcITXIF/RiqLDS1q3o3TI2d
         yW6A==
X-Gm-Message-State: AOJu0YzdTyPCEdCrhWJNdIaPGU/I+SugsOpkkv81JqbkhA2Wt48ijV/L
	zGYiIcDU69Ye+W79Kbi3RjhdCAG4eBR3nzof2NJlg0WVfitOUqGNHjl3e94R
X-Google-Smtp-Source: AGHT+IE2u/8T/V7mBr93WIqn6m/9wRGX+jRCujsdpy2lfVGRiR0B0M5c1AI1i9BkCfGq2CvliAyqPg==
X-Received: by 2002:a17:903:32c5:b0:1f9:d035:689a with SMTP id d9443c01a7336-1fa23f228a8mr126203505ad.3.1719469935567;
        Wed, 26 Jun 2024 23:32:15 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:15 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 10/17] ARM: dts: aspeed: minerva: enable ehci0 for USB
Date: Thu, 27 Jun 2024 14:29:44 +0800
Message-Id: <20240627062951.936256-11-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Enable ehci0 for USB.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index f41dcb36243a..fd769578f826 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -531,6 +531,10 @@ &adc1 {
 	pinctrl-0 = <&pinctrl_adc10_default>;
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
-- 
2.34.1

