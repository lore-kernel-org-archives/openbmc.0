Return-Path: <SRS0=sKPC=D6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4ADC388F9
	for <openbmc@archiver.kernel.org>; Fri, 23 Oct 2020 23:24:38 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D291E2137B
	for <openbmc@archiver.kernel.org>; Fri, 23 Oct 2020 23:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jAZy+U8F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D291E2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJ0gQ6nynzDr3F
	for <openbmc@archiver.kernel.org>; Sat, 24 Oct 2020 10:24:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=jAZy+U8F; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJ0dx3cqHzDr22
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 10:23:13 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id t9so2551518qtp.9
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 16:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=piaOHz6LhgYkRkGUsUQOxo2N1X2IQoWxBlUgySTyIfU=;
 b=jAZy+U8FVC7AbFV14mWxhdwUAVuXsGyvc9lCooDvUQ2XKanDHAzeL1Dbrxq5pOLUYW
 QiQSxh5V1VB1yn0Fv6wqdzCaFRtNU5QCFC3RqWUeG3jvaVtYR4ZyY+4CzSM8bioFFjku
 qd0HUVvLtTSn92yl3NB4PLWNjeVliD/BcKyz3NIhZXPoV6tYEmlXhBpEIG8JTvD9UCxG
 m8cVs+cWaa2CY0mYoxcbHEBty/fAuXdsL5wCT0erFNwlGKQFJ3pZULGCbaV7b2vEI7vT
 Y0sGNvgzWNLdxcIZD4r8f2rERMEcmB2A9SRHRaj+R8yrQ7m/Gbegb7if/7urjA1auqdH
 gJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=piaOHz6LhgYkRkGUsUQOxo2N1X2IQoWxBlUgySTyIfU=;
 b=PeYzDnLRR8m8JndD2/3+zeqnK4XN/cxsmVSudvyhRH0LpG/+rHRBeycrjt5++EqPUl
 6HivIgqryyJm9rEcDLd5Oj4elt/Wy1o3219aZ9V0MGaBCB4UiyVEN4mjSjztLJdhS1ym
 q7TUExMuWb0ZjX91TUszPb5Sec0rw+4dKWO/4f8Eb8jV1ank9Fo85YoJvdrnbzHmW8CF
 FJG5+zpr6L1N1nuBg77+gy1vZtEZyUDB7/Vyb7wKMvctPrA8keKbcMIscvJShWKg0Mu2
 OgzqDSdQ9/x/zM4Upk0JJVDjv9XqDczBZX9y8mgyUFwebg9KvHUH4vk2lr9XKXSapIno
 twPg==
X-Gm-Message-State: AOAM533P8wLjsr0vZ1NJQbPO3O5wxubR2P+X3oQkqMwVSgiUmD8mY/j5
 eDA5jAbCZRuRG9EiZUjhlwr/eJS8gFJiqs43PEK82X9/aMXqoA==
X-Google-Smtp-Source: ABdhPJw3jKRSyeu/6eIjxMrTkzatcer2JGhZajl2ptxI2yST4djDoJCbagPQqaO/SBjlRVme+SfTeR6npLYLsR40Now=
X-Received: by 2002:aed:2d62:: with SMTP id h89mr4890853qtd.108.1603495389108; 
 Fri, 23 Oct 2020 16:23:09 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 23 Oct 2020 16:22:58 -0700
Message-ID: <CAO=notx2=coTNs25BX1GjL-LV0fZyS8-+5D0FLpi8td2=G1jsw@mail.gmail.com>
Subject: failures in docker CI with libipmi
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jason Ling <jasonling@google.com>
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Is anyone digging into the CI failures associated with:

mv: cannot stat 'libipmi20.so.0.0.0U': No such file or directory

My instinct is that it's related to building on pcc:
"Building remotely on builder4 (docker-ci docker-ppc64le
docker-builder docker-ci-ppc64le) in workspace
/home/jenkins-op/workspace/ci-repository"

Since I don't see these errors building the CI on my desktop (x86_64).

Patrick
