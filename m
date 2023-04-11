Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B798C7619A
	for <openbmc@archiver.kernel.org>; Tue, 11 Apr 2023 04:50:44 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwYLq2hzdz3cLT
	for <openbmc@archiver.kernel.org>; Tue, 11 Apr 2023 14:50:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YRYg9BcI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YRYg9BcI;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwYKn3nKTz3bqw
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 14:49:48 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id m18so6659174plx.5
        for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2023 21:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681188584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7cj4odQiw8kfqMVaUgp9nC5vUCvSbD7Emp6IMmdcZaI=;
        b=YRYg9BcIktmREfbtfhlRFpQMRkRjXBW4vwipuhPiVujNVjoipNdpJutM3W2JIY+C2o
         8C0LKS2H/eqrprvFU55NoexDPjAlUWcp6fc3EHMxTuRFM6xPanis+axg0GPIcm0hyTJu
         3q3vROFNWcOSl2oGcUDJ39T+7RPZcVYsp8E/lX0z+p9IHW2/x0hMgzpmHNycNuXir5qB
         xw7ilDXJbrQuhgZgMK7VDU4hfrIUAz1FI6A5yjMlvaZCYyeSz2VqbPy+3XrQ4vksDoT8
         IbzzvonRMoje0RGn0ka1Vkml8qHdwBW0Dbh84YeCZ+Ppkeh6Xw6t8JUjayTXyF9dTOkk
         NT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681188584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cj4odQiw8kfqMVaUgp9nC5vUCvSbD7Emp6IMmdcZaI=;
        b=yOGExXRr1TqWqfA5wX5e0TpkOUe2BCmQAnBUySNh3QmhPWLs/YczH0jsiLnIIT3+an
         BMNIFr7uszBvUiei7aLPZJ4jgKGG46wNG1/9fZlw3BoA3S1QHPuJZOlKvJZJ+IzJt8G6
         eBzJtc53gV4VrrOI+8J69U+OttDHz2GDy6CYBEpNCHPr6dcmKATzs/pkNpiPk9S5rqi2
         /981NPTE68RhHT8ih/sRxm/HBO1UUTni0RW3b0I5ZUxzImhPS2OW0P1cvC34jZSbFbrL
         lsSFgmTr2aqRW6sZYsvd5ZFOZMkWXlkGoX8Xl6LW/YZFCJbowUbzXLkJ+mDLHZ5l1Cy7
         SK1w==
X-Gm-Message-State: AAQBX9eEhfPLmKqpbq9KXlxM1aHGsd31wlyM0Cuwq231rnRqupVKY3PK
	Z1SKN0QbyfQhxdArV67hhPtfDK1+uv8=
X-Google-Smtp-Source: AKy350YGpUNDJwRCzTSO9XBEfslbwdXqMt3mrX35V+73t2on4uan2za5sg8YsELS1ftk/kh5xn9IDQ==
X-Received: by 2002:a05:6a20:49b0:b0:d8:bd6d:e122 with SMTP id fs48-20020a056a2049b000b000d8bd6de122mr1523508pzb.29.1681188584389;
        Mon, 10 Apr 2023 21:49:44 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id s21-20020aa78295000000b0062dc14ee2a7sm8663607pfm.211.2023.04.10.21.49.42
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 21:49:43 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 0/2] ARM: config: Add OpenBMC ARMv6/7 defconfig
Date: Tue, 11 Apr 2023 14:19:32 +0930
Message-Id: <20230411044935.22608-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
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

When testing the kernel, we have a in-tree defconfig that has an
approximation of all the options enabled in the openbmc yocto tree.

This was fine when the focus of development was ASPEED, but with HPE's
GXP platform getting good upstream support it would simplify testing to
have a unified config. Nuvoton is lagging somewhat but we can improve
build testing by adding npcm7xx/poleg coverage too.

This is a OpenBMC downstream only arrangement for now.

Joel Stanley (2):
  ARM: config: Add openbmc defconfig
  ARM: config: openbmc: Add HPE GPX and Nuvoton 7xx

 arch/arm/configs/openbmc_defconfig | 329 +++++++++++++++++++++++++++++
 1 file changed, 329 insertions(+)
 create mode 100644 arch/arm/configs/openbmc_defconfig

-- 
2.39.2

