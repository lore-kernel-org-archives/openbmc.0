Return-Path: <SRS0=afCs=NQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0D1C4338F
	for <openbmc@archiver.kernel.org>; Wed, 25 Aug 2021 06:24:41 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77DCC60238
	for <openbmc@archiver.kernel.org>; Wed, 25 Aug 2021 06:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77DCC60238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvbYL6sJbz2yQ6
	for <openbmc@archiver.kernel.org>; Wed, 25 Aug 2021 16:24:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kEf3UAMt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kEf3UAMt; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvbXb0W31z2yJQ
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 16:23:58 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id b9so9331896plx.2
 for <openbmc@lists.ozlabs.org>; Tue, 24 Aug 2021 23:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=8rEpmpUB9HZ9tdCEthuallWAetQyae2U1dox3AYtuTY=;
 b=kEf3UAMtlWIon1S3APXc4Gz5STyWPxfMHxDDMQ5WHjYlCVKzJGpf8hz4tYA52y4RCd
 3BWq/W4G6Secjl3fV2cwg8YeAbReK8zAwJ41MvFedo2dY4H0/dgzBsWy3c7+a7WkGq1b
 Rfr9M6vJRKnU9ckfN+8GDkRbbyjRM037Tw0rJ/YD+SUKsW6SR9Is6MccQQ6MQWAKZkgt
 lLRyx02gUoLjKAm8B0mYsH0Nd7GKlyH4RPALTJFRN9rtZrUM+bpnCv0BpGPfKfr9839f
 JZVT4V76iaApBnw8jtoPF8spKZcaOatK6HHKSxxR41FJIshbXt28YHWUM0NnQR+Z79Qu
 Tauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=8rEpmpUB9HZ9tdCEthuallWAetQyae2U1dox3AYtuTY=;
 b=Yfzg7ZV1jz0O7KxNqvQ1hdAPRqLl7F7l71JzSN7IuOPyhx81mCT7cd+0KiEM/9zGjz
 uIJc3YNO3FzqJ95h1/VWy3yrAJsIo4ehdtVTixWBEfHG2SpzRCzv1GcOEyVOi+qMypJB
 ksjQddFaq5FDdIooMV7VHrseGAnBlPy3yxXJGVskNU9DfjWovLKSnql0OLrKCbuiAIof
 k0j85vmc9MzJHIGBQffXC0ae6krpORRz8dDPBdGpDQAK5RSAPz+RBSjMSiitTVW4Fqsq
 Epuj3VyicNA+IGCoh8nH1R4whCq7c+1cag/sH+c8UQjUM2V5L93SOQjnjRCnYHc8D5M8
 +pgw==
X-Gm-Message-State: AOAM533bpNbhkqN1eTUXIE7gsjQoUAefWuMzv71Bx6IAbn0lE6BsO/P3
 8yskD3E9olNew1FO3QkSaua87sBlk4cvog==
X-Google-Smtp-Source: ABdhPJzJaNQrW1XyybLbT1UKkN9+YmnUs6duPGTaH7UFcFw850PN8VW9lreyTdTRFaAsbwzyp7G9JQ==
X-Received: by 2002:a17:90a:2dc7:: with SMTP id
 q7mr8901922pjm.231.1629872636270; 
 Tue, 24 Aug 2021 23:23:56 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id q3sm25196473pgf.18.2021.08.24.23.23.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Aug 2021 23:23:55 -0700 (PDT)
Date: Tue, 24 Aug 2021 23:23:49 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: ASPEED EHCI error: "controller refused to start: -110"
Message-ID: <20210825062348.GA18567@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: andrew@aj.id.au, ryan_chen@aspeedtech.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi,

I started to see below EHCI probe failure on my AST2500 and AST2600 BMC
platforms since commit 280a9045bb18 ("ehci: fix EHCI host controller
initialization sequence"):

> ehci-platform 1e6a3000.usb: USB 2.0, controller refused to start: -110

The error happens because USBSTS.HCHalted stays at 1. But if I ignore the
error at probe time, the downstream USB devices can still be enumerated
without problems (even though USBSTS.HCHalted is still 1).

My questions are: why USBSTS.HCHalted stays at 1 on ASPEED platforms? Do
we need extra configuration at EHCI probe time for ASPEED SoC?

CC Ryan @ASPEED for more comments.


Cheers,

Tao
