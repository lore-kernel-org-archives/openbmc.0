Return-Path: <SRS0=dbb7=KV=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C2BC2B9F7
	for <openbmc@archiver.kernel.org>; Wed, 26 May 2021 11:41:07 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC22461260
	for <openbmc@archiver.kernel.org>; Wed, 26 May 2021 11:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC22461260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqptT0vjRz301j
	for <openbmc@archiver.kernel.org>; Wed, 26 May 2021 21:41:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=omDGLV90;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=omDGLV90; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqpsw4jy5z2xv6
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 21:40:35 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so183871pjb.2
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUP6jtUTkznQOmMaIgPy/DSyICtIXcle8TPO0t3Fdj8=;
 b=omDGLV90g5WamhhIu/XFOGWJnPEyxBUqHnXqIKwnfrjrJPmBKtVyoHyzOTnMVe/rUu
 5SN8UI7AV2VAQFwM6s6KWVb6nMz1ks4pbtgcwFf30E5DlUq2Udfmp9NjC459tvqlEEIp
 ecV6MhcpM5vfy9bMnWRZ/PApKt0kUBhGd3pYl20XVBqVVMmBOdwjJcy5/sCdHJ7tTyqA
 TOopp1apCKWFh3nz7bm2TpxNiqqhgnHSb384wWrwW6VqnbDwhhcqAPXNcdrLVrTuer9W
 ySwyXeHhbnWqNqVPfgfpjwuyJUrNRQqHda24LaO4B2Iv7et6qVOqVD+R/qC8TQKkX0sp
 ENPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUP6jtUTkznQOmMaIgPy/DSyICtIXcle8TPO0t3Fdj8=;
 b=jHJ4PEgJ5XcLR9yLSA08Sp8E/KhktgJtxK/Fg+XZDNOx1M7CTdU5JeVcatI4aEhSru
 9Fw3lhOm9qzsw1oBKCwwzI1k9swEvaVNi4aXsaZjEsnGh2ZsABhoU8Y0o4T0e0wN+49P
 2pR/iTTlZXTy9MG5upqia8cuWkZwEr+KF8v5oRf4jQaJ24IqkUhXMmTgdOxXReqRpdz/
 pA4/tQy9I9LdTyAI7MFv9lp8ebXB4O6ZcJaBoLpy74Qdo/WKSW0MQewqzb2t1rn88u7O
 p2RNvAb7P7pmNJLfRoG/kR1pnnsXBRtoO18kKfel9DgyYzuZTDsnLEi/tJG8HuTkE10M
 Fx5w==
X-Gm-Message-State: AOAM533JKB57tljYp/UMw9x55mjvdXSh+u8cBrIgPMSRVYXB451vRl13
 dTZa3B2peqbEmxhZgDMHaA4=
X-Google-Smtp-Source: ABdhPJx/CaNhigBceEGQ3FuuxamUFFPKbMhH7HY/Ti2oFX4LFdG0Bz17YL6NYHeMEfyeGtnVXQ6ijg==
X-Received: by 2002:a17:902:6a84:b029:f3:f285:7d8 with SMTP id
 n4-20020a1709026a84b02900f3f28507d8mr34736360plk.57.1622029232291; 
 Wed, 26 May 2021 04:40:32 -0700 (PDT)
Received: from george-Quanta.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id s14sm17124805pfs.108.2021.05.26.04.40.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 May 2021 04:40:31 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.10 v1 0/3] ARM: dts: nuvoton: gbs: minior fix and update
Date: Wed, 26 May 2021 19:30:58 +0800
Message-Id: <20210526113101.7457-1-george.hung@quantatw.com>
X-Mailer: git-send-email 2.21.0
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, Fran.Hsu@quantatw.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, brandonkim@google.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Minior fix and update for NPCM730 GBS kernel dts

George Hung (3):
  ARM: dts: nuvoton: gbs: fix pca9535 and GPIO node naming
  ARM: dts: nuvoton: gbs: add fans-efuse GPIO to gpio-keys
  ARM: dts: nuvoton: gbs: add page size to all eeprom configs

 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 191 ++++++++++++----------
 1 file changed, 103 insertions(+), 88 deletions(-)

-- 
2.21.0

