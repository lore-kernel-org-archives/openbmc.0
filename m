Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0E7C433EF
	for <openbmc@archiver.kernel.org>; Mon,  6 Jun 2022 23:10:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH8NN3kZmz3bk4
	for <openbmc@archiver.kernel.org>; Tue,  7 Jun 2022 09:10:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rh7v/mPv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rh7v/mPv;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH8M03rv1z2ywl
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 09:09:14 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id w2-20020a17090ac98200b001e0519fe5a8so13843345pjt.4
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jun 2022 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vNOG1CdzmMUn8f8zFhnDD3lf12Okl1S/733YOt5I5Fg=;
        b=Rh7v/mPvvJonXajIAiMpFY92TkR/3PphYvsW9y+7/7ziUGlKG0dehexsaL/mGPq+ZG
         ni3DEugFFK33oiRc4pzf7DgrT806FPIRvkV68+4T8o7DmUC1iMhxbsIFm2PPwMRrwD7q
         W833KMZf7dDxmhlYSDuFob1VTWJ7h26iOUPNuI0V+3s0WQWraUXqrvkNZ+udPNEARfyc
         VgfZtrkRQTi8tZt6+h6neLpEbEV9+XGC+OXR6tSKLzDDwkNfL0q9t0hoUAUwgI/op2Yr
         1fWQeOMCm+qoFYi+C0UPMShatdlHr2QP+WTV3B3fERVtQZ9aTayVmNq/D4bkWg7l96Ig
         H9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=vNOG1CdzmMUn8f8zFhnDD3lf12Okl1S/733YOt5I5Fg=;
        b=XYpbGuZqC67kJWrNwdFfxG9DZPHZq9xexLv03s1lalyKKFoLj1Vy6QUHMYb8yFEdYJ
         eQRqR+d+9mBlCqnpfGglsYL3BF5gM35ODo29v8z5sGfc6Ce4I3WdE24Il4WDBqYTKfjW
         RLS6CLioxRCnfSyNSc1Oxcnw8nKe2ye9AKMTlVckNEfnMTkhb9dEo+2MKKDQfajDGC1k
         DMG9l5IMitV3BxrYKlLWr1l2uIRx8Sw8HpauoHDHQ4FnWUCASjZOymb+ZHTVmrPCoEvv
         OUU7v5w2hOex1otrcJFOcN8NSMRqAW2dkuxjE0Mz6XEl4EBm1c8QSdT9n/Fz8A6CgChp
         NlBw==
X-Gm-Message-State: AOAM531amkwVGSTly3szzd9NIbImTrjAvZzeeLh3RAAYpddfhN+8Yn32
	47xnFtIRriRDD/XZH3cVdSiHholgK3w=
X-Google-Smtp-Source: ABdhPJzjOVzu1gKvJNlTG24fmNS5wwbsM5kYetAzuoxHZr815jmCHIogHq/95iMmMnfVx9PCc2CrIA==
X-Received: by 2002:a17:902:ce83:b0:166:42de:29d5 with SMTP id f3-20020a170902ce8300b0016642de29d5mr24555300plg.123.1654556950851;
        Mon, 06 Jun 2022 16:09:10 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id jc20-20020a17090325d400b0015e8d4eb20dsm10926972plb.87.2022.06.06.16.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 16:09:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	eajames@linux.ibm.com,
	Zev Weiss <zweiss@equinix.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 0/2] Rename Rainier to P10 BMC
Date: Tue,  7 Jun 2022 08:38:59 +0930
Message-Id: <20220606230901.1641522-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

v3 fixes the whitespace issues I missed in v2

Joel Stanley (2):
  ARM: dts: Rename Rainier to P10 BMC
  ARM: dts: ast2600: Fix indentation

 arch/arm/dts/Makefile                                    | 2 +-
 arch/arm/dts/ast2400-evb.dts                             | 4 ++--
 arch/arm/dts/ast2500-evb.dts                             | 4 ++--
 arch/arm/dts/ast2600-evb.dts                             | 4 ++--
 arch/arm/dts/ast2600-fpga.dts                            | 4 ++--
 arch/arm/dts/ast2600-ncsi.dts                            | 4 ++--
 arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} | 4 ++--
 arch/arm/dts/ast2600-tacoma.dts                          | 4 ++--
 arch/arm/dts/ast2600a0-evb.dts                           | 4 ++--
 arch/arm/dts/ast2600a1-evb.dts                           | 4 ++--
 10 files changed, 19 insertions(+), 19 deletions(-)
 rename arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} (94%)

-- 
2.35.1

