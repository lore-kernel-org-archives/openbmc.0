Return-Path: <SRS0=1Y7q=QE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05114C433F5
	for <openbmc@archiver.kernel.org>; Wed, 17 Nov 2021 22:03:10 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7ED619EA
	for <openbmc@archiver.kernel.org>; Wed, 17 Nov 2021 22:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B7ED619EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvcPR5j1wz3bWX
	for <openbmc@archiver.kernel.org>; Thu, 18 Nov 2021 09:03:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BS8aze6u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=BS8aze6u; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvcMt36cqz301j
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 09:01:45 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id f18so15507808lfv.6
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 14:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Mk8G6L5KkOTeuWrUbd5ZhHWpUEM7pdrrxGJivDOr0xI=;
 b=BS8aze6uO03BYmxNZ8ua2J4uZvDVLU8pCcMoEccXiq4MqYiVmjxZ9FZ7nMP8mbcKm3
 OyFAuIkPdMKuv9iU5mxH673PhQPy99ldNBlvhZyGIB3KyvsfNJDdR8j+P5UGalA8AmBo
 wzgCv6vT666Jr14uhENPLrWmmrWfr2a1AMTgjwlxUHkGITVc/M+g1nI7RJhHiXPJTEui
 5lGsPgORzySOk3MkwFW6ZfNj1wW3y2cbZxiT5FFk9oN//+gs1mtxEXAkMODWXwVvOlgU
 wgUxjK4EGjtRnGGVbsJ+loMKu6ET4h+mAmUpLsA14MmT577tk+zp+oAUjGBTAj4fLrcJ
 28Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Mk8G6L5KkOTeuWrUbd5ZhHWpUEM7pdrrxGJivDOr0xI=;
 b=HrsVa2Vx60WtWRZgItZu1cPDbZVylkxK95L4w/8bwRea3wMQO3q8aJsFt50HarN566
 9afNx5ApVOt1ynq7PnOBRl6FWG9Zwq4GIehxS/XX0LPJYuSihtwvkv1B7tqB0CBNRVLZ
 1t26C+D3nZIsZjr7botVhY+HDIy4Kob7CifCv2HPxN5f96ink7O+nKoVYp/uqeJ/aWXX
 OqKMYXzOpHnOLRNeewrMbFVg8UOkeLRXBx2824UoLtLsthxj5jSb+SQc2G9/NRL3obIN
 HC3N91OGlrqBcpV6HTQA6VCaliGTfYrl5WXAoKJUFmBSBQujv9ijT0db7hnDdkoqZDgT
 72Fg==
X-Gm-Message-State: AOAM532wdzF6TL/H78gGCF1PZ8wl2NH/4ZyNQoYRgVuWHV3s9ZEMeSDP
 SZuWDDp4pfQJgeConWVvnDKUo+3i+jSy00G/yZUtpouWYPWpAA==
X-Google-Smtp-Source: ABdhPJzVY1OUWlQrb+bo7VhVK1XhnYkrk5J6KrMYsZr4eR5JY7MPLlONP7XUHffjIKHumeiHZMD1ARhu/rbBnlT51aU=
X-Received: by 2002:a2e:7801:: with SMTP id t1mr11773508ljc.253.1637186501358; 
 Wed, 17 Nov 2021 14:01:41 -0800 (PST)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Wed, 17 Nov 2021 17:01:25 -0500
Message-ID: <CABoTLcRtPYy_Yim20FCcX6qS--t7KD81GOZyT9pKV8OwuhLPrg@mail.gmail.com>
Subject: Making obmc-console_git.bb more generic (again)?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Geissler <geissonator@gmail.com>, Andrew Jeffery <andrew@aj.id.au>
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
Cc: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi everyone

I noticed that as of
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/30369 (aka
https://github.com/openbmc/openbmc/commit/abf95efe7c3a34cc2e5d7424abb59710fb4a1d4d),
obmc-console_git.bb assumes that we always want to use ttyVUART0.

We used to have support for OBMC_CONSOLE_HOST_TTY and then create the
symlink /etc/obmc-console/server.${OBMC_CONSOLE_HOST_TTY}.conf as
needed.

From what I can tell, OBMC_CONSOLE_HOST_TTY is still used in quite a
few machine layers. Some of them (e.g. meta-amd and meta-facebook)
even went so far to replicate the previous behavior by deleting
/etc/obmc-console/server.VUART0.conf and then re-creating the correct
one.

Is this actually the expected behavior? Or was that just an oversight
in the commit?

I'd be happy to send a review request to make this generic again if
people agree. A bunch of follow-up commits could then remove the
duplicate code in individual machine layer overrides.

Thanks
Oskar.
