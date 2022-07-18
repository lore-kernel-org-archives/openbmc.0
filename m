Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE2AC43334
	for <openbmc@archiver.kernel.org>; Mon, 18 Jul 2022 08:50:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbJP1zG8z3c2V
	for <openbmc@archiver.kernel.org>; Mon, 18 Jul 2022 18:50:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O0gyfJw4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O0gyfJw4;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmbFf4zzdz3c36
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:47:49 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id b10so200361pjq.5
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yifBd2n4QDMYqazu6CfgI4lc8zpl2b/rWdFJCdaCing=;
        b=O0gyfJw4UxNUkRw86oTixGMug3BUIIKqri++gw4qfQh3tRLnouxQ9a0K5tLgU7vmDE
         1H5+YwCosxeeOH0gxlsMjI1Yhn7F8mtgvDPfW0VoFa5RZVIx98Fiu52Rebc4+e7mmrlH
         K4KpbfXva+mYl7huuz9q0BuqIpk86tYKdABP9LGYkmitpzLgkfidn+ExB0+xdkAOi0Ws
         TQlPCpBnuxPIilHLWoLhA/b26gjLub2K79mpzT5eGR8W4odxSpfTTmHIQoSxOSPL9R3R
         xQWASVQO5jztZm6uyCD+RM5P/4pGlKLgtOOY7CTfKLWs1BkkJOD/8l7NwVqKT0GTH/1K
         3KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=yifBd2n4QDMYqazu6CfgI4lc8zpl2b/rWdFJCdaCing=;
        b=Epkf5xZ0afc9ieAznVtMgxbUQR/vg9+5/uVq6iul2MYyWt7JNuVib0WF8l4XRtjdjC
         HHliGZEDACMn/kSLWSYYJtm/OjtsAkDmu3+C+XTgfK/4TxI2nldgYac+9H79RLL4Ex7m
         JqGml0puYU/IT1C9kOjrtK7vdr29eBZkN47wPYkwT7gTj7PeeunlyVHwHQFNjYd5D4RY
         9cbmmZryJQtBcOQMbLvho0lMrSbZMA8BXtES8AEuCU9BLUGWu1y2fLxmiYlDHauCTOYX
         c56QkUTKPekfWdRH5A3LXE4vMVXETrpardfuca3l1HhRW3SkqWxq+XnMvIQ/ZUOMcaUc
         0WAw==
X-Gm-Message-State: AJIora8Oi4Ok71CcorOOXRR2QNoKJ8HuUMA+an/q1SIjQ/Uvw/s98Nnq
	l1ug/kaqDwDLmn9BWpvJbQTUyHZSeeo=
X-Google-Smtp-Source: AGRyM1t3UwTtNN+S0ERhXW7uDH2KXe7maLgbRMG4ITY8qYaCT/40XrGNAisTL0+rMRl63p8VCApxiQ==
X-Received: by 2002:a17:90b:1206:b0:1ef:7bcd:e8d1 with SMTP id gl6-20020a17090b120600b001ef7bcde8d1mr31594946pjb.156.1658134066871;
        Mon, 18 Jul 2022 01:47:46 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i28-20020a056a00225c00b005289521b656sm8806095pfu.92.2022.07.18.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:47:46 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 3/5] cmd/otp: Depend on SHA variants
Date: Mon, 18 Jul 2022 18:17:26 +0930
Message-Id: <20220718084728.1140108-4-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220718084728.1140108-1-joel@jms.id.au>
References: <20220718084728.1140108-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Indicate which SHA algorithms are required by depending on them. Don't
select them, as this force enables the options.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 cmd/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index ff90a5d99acc..8b90f0f23406 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -616,11 +616,9 @@ menu "Device access commands"
 
 config CMD_OTP
 	depends on ASPEED_AST2600
+	depends on SHA256 && SHA384 && SHA512
         bool "ASPEED otp program"
-	select SHA512_ALGO
-	select SHA512
-	select SHA384
-	select SHA256
+	select HASH
 	select RSA
         default y
 
-- 
2.35.1

