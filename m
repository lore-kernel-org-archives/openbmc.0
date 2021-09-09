Return-Path: <SRS0=9+M0=N7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B2AC433EF
	for <openbmc@archiver.kernel.org>; Thu,  9 Sep 2021 12:53:14 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B87B60F45
	for <openbmc@archiver.kernel.org>; Thu,  9 Sep 2021 12:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B87B60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4zSm6FHDz2yLJ
	for <openbmc@archiver.kernel.org>; Thu,  9 Sep 2021 22:53:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fNlgYVia;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fNlgYVia; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4zS266p8z2xY0
 for <openbmc@lists.ozlabs.org>; Thu,  9 Sep 2021 22:52:32 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id l18so2793440lji.12
 for <openbmc@lists.ozlabs.org>; Thu, 09 Sep 2021 05:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4OdCQuiDr8rG04zGFkziJxIUycLNKdp9nV1Cu6ZIYKk=;
 b=fNlgYViaaGY8Qr39gs+UjD0N1zf8Nz5+FJGk+7WGL8tH6lT4QIIcOt1FMk3Ef4mIm9
 APMiFm3XwyeAkJaz+LcIBxu8Dv1/w1VS2LOZcWvV+TYuAdDCqybxfNUgWEfXupFWTd+G
 3zAob+c4dbtpzJosN6NTyEPPKIdteDzVeCEy1YcZuAaY5VfNhafAeUFwnLyw9uMrPjdc
 XPZnddJuirtwEtsdxi9YKYHI952VLmP6DkWoNIaAvulhg/q3N+dDa5/W1WBFEKUTDO3a
 jjmnge816repl130O4WnzPkNBGiqfJ4/ZTcppvz0dp6WCYtWYZYtAqhgq6/jrneXFskz
 wYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4OdCQuiDr8rG04zGFkziJxIUycLNKdp9nV1Cu6ZIYKk=;
 b=1LpyeKS43up5W0EcVCntmXmBRBRMaEtN7goznbRWQ1Ku+MmEuK81eW+wluDT/M8hda
 JZ/ez9k/aigttCNWEOc4aiqFKPQzll1+rmwUkONWr3etkxr2OiTEM8LiTRW8tks1rYXq
 WPHX/X88egYqHvGUODB7e+f/VZONfX4c1LOF8EkoJ0uuiYsqUZ4Fo7oaImwwDcIaI6AK
 6DSws3PysiNXn+2RbyMkoTMmm2OfAT6IMtdGaG5U7TDhGCxBCpisrjpx8p0shuCLoQ7w
 BQIB8xbduB8vABRSA67usBPG3tC+5cW4tzPZym+4vFD/7BNDRZfy4ZX2SauY3SUb9dLH
 wx/g==
X-Gm-Message-State: AOAM531IBBfubP/S6sgCaMBonjAaqxgvFuiBLEbDA0i79ToUueq+t9Ua
 Mpxhmn0PNNj1vh5YeW7hzUY=
X-Google-Smtp-Source: ABdhPJzqvSY2z11LyV1nPLc7WAdzFaZxmJGXhKhZ2Q2ktEeOtXg1uEsHgGFq/4F+HKFRFTI00kXQVw==
X-Received: by 2002:a05:651c:113b:: with SMTP id
 e27mr2131110ljo.6.1631191947985; 
 Thu, 09 Sep 2021 05:52:27 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
 by smtp.googlemail.com with ESMTPSA id x13sm204520lfa.260.2021.09.09.05.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:52:27 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10] ARM: dts: aspeed: amd-ethanolx: Enable
 secondary LPC snooping address
Date: Thu,  9 Sep 2021 15:57:02 +0300
Message-Id: <20210909125702.3811-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Konstantin Aladyshev <aladyshev22@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

AMD EthanolX CRB uses 2-byte POST codes which are sent to ports 0x80/0x81.
Currently ASPEED controller snoops only 0x80 port and therefore captures
only the lower byte of each POST code.
Enable secondary LPC snooping address to capture the higher byte of POST
codes.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Link: https://lore.kernel.org/r/20210127182326.424-1-aladyshev22@gmail.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 96ff0aea64e5..ac2d04cfaf2f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -218,7 +218,7 @@ &kcs4 {
 
 &lpc_snoop {
 	status = "okay";
-	snoop-ports = <0x80>;
+	snoop-ports = <0x80>, <0x81>;
 };
 
 &lpc_ctrl {
-- 
2.25.1

