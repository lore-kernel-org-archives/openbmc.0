Return-Path: <SRS0=DP8Q=EW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72346C5519F
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2020 16:06:48 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9971206F9
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2020 16:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.b="Zcp1QqPb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9971206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZYq91WzCzDqMM
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2020 03:06:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Zcp1QqPb; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZYfY13QHzDqNH
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 02:59:16 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id s8so16053855yba.13
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lditRaMDClLDDG+S2EyAuZBueoNLkgFlqy3vPBpmjAA=;
 b=Zcp1QqPb7nCzwpsWe4tMTccNjF0WBal7VRYutCetOFXUWLlhdgG5lec9vDBPKPDUtX
 P6tAVQ9A4zJMYRTk7pxQvX8fbpYCGD75p8mlwBLO0YCSFZrTb49YdWmHakXuvEVtX36B
 Lhs2Eje3wnFwgxu/pNuy5tjbCzZ0vM5hXo1ddcJ1Rjtq0IRXkSz9FsaAt+0sKVtvP/bj
 cLgLixqpgYfRT9NlBRNjAHVH2UADa6dD8i/lZNCEU4BgJ22wyl0AbnWObqGiAQXYnseG
 CyMzY+VMz3hVyqq6LAOf+OEekXdwAxRPmZFzA/TvQ+MhgR4gMWdcMFMkXMmspNLHEZ2U
 X2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lditRaMDClLDDG+S2EyAuZBueoNLkgFlqy3vPBpmjAA=;
 b=ZkcuP4sjmgsOe1huSkD9PUqWAWQ1MN/mJLFJ7Pw9F266axCznttpql2BUbQBNNbUMg
 wlITF+zy/Z2VJ8S20SjhjIR3PXvjnlOw7nnSOozMkXexD7OADKKba4u6DGvlMz2JiJMs
 zvgPxw46jHuh/zxVUUd3BVVCwvYf5QO04h+X19Je47/WAQ9J+BXgmKE154bRPur2AVe1
 Itjm5wt/zudW6N96oo9yCXGgyeYEmbHMHQkglw5UgCahGZD+DBpjXddUOm0IX6rmS6Yz
 yOjGV0BWMJ5hY8ssHz1PH8nq/yJWivlK80nG5wGhZFDbzeZyMb5QN9wlNMzyJnHgwHv/
 EuoA==
X-Gm-Message-State: AOAM530ZNnT/9QvFgb2GdDHsCTU4FrqwwkOWQVw+yY+3BBrP1p5cfGPK
 90dPB+gc2Qc3rUmrrWJAe9Wp2T0DD8dQN3kw4djYdg==
X-Google-Smtp-Source: ABdhPJxqlXv5U3DqBYgDb3g1mUUs+tjEEZ3ItpCk+b5NZm0GW9vg4wtW3PXZun+GeW71pKI2XKLiKBrSpUF+cItyXjE=
X-Received: by 2002:a25:df87:: with SMTP id w129mr6476817ybg.480.1605542351117; 
 Mon, 16 Nov 2020 07:59:11 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR04MB2964AA77874471609F0B25BEFDE60@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX81k6M6acw0VL3aYA_uqpNsEUjZ3DhiAQp_mXLbGJU87=g@mail.gmail.com>
 <HK0PR04MB2964EA39F0F9AD7ED1A03535FDE30@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2964EA39F0F9AD7ED1A03535FDE30@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 16 Nov 2020 07:59:02 -0800
Message-ID: <CACWQX82oZiC0e6DJd=M10COJOqORy-ZJyB5biXyecFw26zpaLg@mail.gmail.com>
Subject: Re: Fault handling(Threshold exceeds/low) in Fan and NIC sensors
To: Kumar Thangavel <thangavel.k@hcl.com>
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 5:05 AM Kumar Thangavel <thangavel.k@hcl.com> wrote:
>
> Classification: Internal
>
> Hi Ed,
>
>         In short, Our requirement is to take the actions when the fan fails. That action is platform specific.
>
>         Fan failure :  This is based on Fan sensors. If fan sensor's tach values is less than 33%, will consider as a fan failure. So will take the actions to reduce the heat production in the system.

dbus-sensors and phosphor-pid-control already have mechanisms for
handling fan failure in these ways.  Take a look at the existing
config files, and they'll guide you on what you need to do next.

>                                 So that,  hosts, NIC and other power consuming modules.
>
>         Dbus-sensor's already handles the threshold masking. We just use that threshold masking to take the platform specific actions.
>
>         Please let us know if any clarifications needed.
>
> Thanks,
> Kumar.

Ps, Please don't toppost.
