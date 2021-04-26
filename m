Return-Path: <SRS0=vQbL=JX=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6D8C433ED
	for <openbmc@archiver.kernel.org>; Mon, 26 Apr 2021 19:52:51 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 171B66135B
	for <openbmc@archiver.kernel.org>; Mon, 26 Apr 2021 19:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 171B66135B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTbCj4GKrz309g
	for <openbmc@archiver.kernel.org>; Tue, 27 Apr 2021 05:52:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Cxpw4gM3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Cxpw4gM3; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTbCJ2K0Gz2yxN
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 05:52:27 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id o5so57801343qkb.0
 for <openbmc@lists.ozlabs.org>; Mon, 26 Apr 2021 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=uNHdMlHNNJ2XCE7lL5DH7dkeuuAhzrMpPV7OOFH5HQo=;
 b=Cxpw4gM39NH7QZpJQfom2KU0B9VEMT9VIMWi6Kc1LO8nljf114po5HQ4lE0wpYoSWw
 hWDVS7oRepnTRy9FIBPl3PrZvYEV2WXx/4m4WtAq3xAsFM0oWIsprlS6ve5YXvzRHQUh
 KbLmSzKDxRUAHxVcUwIBg00T77VvTx6A17HTrZWvYWQxgEj9TjEM7CH0FD6aT2JcL1+8
 OddJxsag+Ma6fzz3yZLCKd9cWB7AkfCuc2NDThBojtzbHCVMxEMRHiavxm+OiWU55Suu
 Y0ohA5UgHvN7+EAbAYCWYtLN1GYY+TsYZCS58qskULOD1pwadaABR0bz9J1XtRhYEFs1
 EYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=uNHdMlHNNJ2XCE7lL5DH7dkeuuAhzrMpPV7OOFH5HQo=;
 b=FUErEAC+Pxnln0gEANxYbGi3dW98JF3tw9h48Oc2FktaJ6m9mgAmgVJA/lHFsE3kpl
 uDTwyin0EJwebj+3o2yGXBcirNthYtiVsig3hSAxeeixqWgHixRKmQeC8fOc/2k8Eza2
 Y4/RLNHlciR/pUnuNaLX6aSWuq43Gd+VyIG9FMXGA0nNUnqNfH11O3FGndlVLwpUnMVA
 cGOeLrysdSV/P6USoYHTHuFy748Yj0NkMuMDWvpE1JPZqXBEU2E2IdwcG/NiQtzp/Nkd
 WK1H3EhL2BiiTybrvTWwS/B89a/w1i66Kmbigi47TgfHpfvks52Zumc4UeKRo20K71PS
 bWkQ==
X-Gm-Message-State: AOAM532wXyGXFzlx81uTf+rEl0wwBsSjSZUu/65rx+5Jd7wJpqs2C0XV
 5BUrUWrN14ZuejHsDjfU0Nwy3QMeO4eeeIOwNLejXA==
X-Google-Smtp-Source: ABdhPJxzRGX9quGbHl66TgpjTRW+p7S8sgEpDPdnFhzMFEnqmnkMQ2J3fRAeKIfavhy4jm2fhA6lE5OXfpEeKxjYaMM=
X-Received: by 2002:a37:b801:: with SMTP id i1mr19159319qkf.133.1619466741983; 
 Mon, 26 Apr 2021 12:52:21 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 26 Apr 2021 12:52:09 -0700
Message-ID: <CAO=notybt0NeU6N2QFmPFv8bOs3fxHrT_+KVGZyuRJeyCGqxcg@mail.gmail.com>
Subject: phosphor-hwmon-maintainers group
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Brandon Kim <brandonkim@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Brad;

Matt Spinler and I are in the group phosphor-hwmon-maintainers, but
neither of us in the group are maintainers of the group, so I cannot
add "brandonkimbk" who is taking over my responsibilities on this
repo.  Can you set Matt and myself as Maintainers in the group, and
then I'll add Brandon and remove myself.  Or you can.

Thanks,
Patrick
