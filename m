Return-Path: <SRS0=cbAk=GR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DAAC433E0
	for <openbmc@archiver.kernel.org>; Thu, 14 Jan 2021 21:24:50 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA382310F
	for <openbmc@archiver.kernel.org>; Thu, 14 Jan 2021 21:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FA382310F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGy4v2DB6zDqB5
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 08:24:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QhbdF2sc; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGy3D6PN5zDq6B
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 08:23:16 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id c14so4659797qtn.0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 13:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Sm5nVHpId4zGT1Cfu3PGNFaKMbkjuKPPhtuGdqwnNIo=;
 b=QhbdF2scVqetIgMutppswfwDa2/YqmcFn2x30EY6+c/rrUi9XS0VUG4j5gknIB60PG
 8ui/Q9X5Hr0E2gwpuoeWT6qpgPu43KNu10qEkiwBOgPoRQgfSrpI50bre80Id0+qwz9w
 9glo+oldahExeDu2MDJODLznk/u18gVkbJRWow7gXdf86QilQ5L1dWxP5oHRwbsQLKgT
 PiSZ8hxqoLkszil7f8uanCvkoxGDwnHolkG8PXuZOr9nrWa20RJljDfdDkOnFJim/MVd
 AC8dizoKXQqd99qyrX+w15c3AqrcL6KZ+UET6GbSPcDiqRZiVaymt/ZQjDPPaMSSo4LN
 kQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Sm5nVHpId4zGT1Cfu3PGNFaKMbkjuKPPhtuGdqwnNIo=;
 b=E2Ko6Qffz+nWNRkVTWVs79ogELUHNExPFq4RSjeLOf0Uh3BLzBNA6wGEr4/0nPJc3u
 +d8ncC9fI2xAZvacrehu2t7ibmMDC1PcBkvZFHsDoEF/Zcp6Tismyz6GDLlJ07UVIISe
 qtB8KfiPGBejYySk1Lwd4iV+afG015pzYSuyKH7++ylgG1wvCM5zyKqi+phisGuAq+8/
 anKvEeohvnqFLfBAqTLbIreRXKEKmcpT7enWf+CDvJwPunAuOzRqkmI+edbXVkLmKL0y
 ONJMnUoK8WSwUv0bTpMJxPHqPtStqa7o9xPBm0dWld3Y0MdoqhQEpdwanu3jvh1KK7V4
 0Dhw==
X-Gm-Message-State: AOAM533pnVPkMxk8z5P6glgMKAYLDGnFaSXhF5+iPibjMFjLvAGaq3xm
 Lm59iXs9frp14kquA6d36DZV22sWbJ7kg6yZbhstCAw3u54=
X-Google-Smtp-Source: ABdhPJy3gm2Dbu86PI60dVVMP+TEGoYg9hjLxDSgC0xWAl5Mjql9DGLbrG2oftG+PhJ0pHa0oVGO12H1MfDSG16fDjk=
X-Received: by 2002:ae9:d801:: with SMTP id u1mr9207590qkf.79.1610658994044;
 Thu, 14 Jan 2021 13:16:34 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 14 Jan 2021 13:16:23 -0800
Message-ID: <CAO=notzUzQkrQSC0JXkYbucp3L3h3DP2aAn2=jKBTBPNVi09+g@mail.gmail.com>
Subject: meta-fii not in openbmc/openbmc
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Brad;

I noticed today that, https://gerrit.openbmc-project.xyz/36537 and
related aren't merged into openbmc/openbmc yet - can we enable this
subtree in openbmc?

Patrick
