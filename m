Return-Path: <SRS0=GYqG=IH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65F0C433DB
	for <openbmc@archiver.kernel.org>; Tue,  9 Mar 2021 18:33:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3078465062
	for <openbmc@archiver.kernel.org>; Tue,  9 Mar 2021 18:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3078465062
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw3kQ4kS0z3cRJ
	for <openbmc@archiver.kernel.org>; Wed, 10 Mar 2021 05:33:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Vsss8OOq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Vsss8OOq; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw3k13vJVz3cGv
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 05:33:11 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id m9so14998198ybk.8
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 10:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DhGrG/HMfqghE2r3jnzLQcwMxdKzqxr+eXl1yXdVY84=;
 b=Vsss8OOqYMKKsqNho3JjLTU0SlELVUaMxzz8DYQ86pcsym7CReKg4gp6BDQskT1Cr2
 YRfKD2llNQ2Kx5/1xBOduMuc/ZN5xBuxb7TKpfFB2go2lokcQEa1NmJftm34B/T3D+Gy
 l6gWoefO5pttdYfjblzdAWLJCMuu6gZeUaB7CgnthKUTSEUoLdbeEftjeKXO6jhYt2Eq
 jRIWUOWX3efVrft3jMijWymd0p/10B/1PFHekE8LgSaV4Sp3CTnK/rZF8AuBQYLyOOsx
 867y/XMivjfsjBIMJlAaaPwMqCkssuuC2axFWFa3J2Sd3UbMWCkabnMHHtcEa1KS31QL
 TXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DhGrG/HMfqghE2r3jnzLQcwMxdKzqxr+eXl1yXdVY84=;
 b=Oo7jzG3mmzi70NxqL7TlihH3b65Z9EJa1xSD0KdlKPph0PfWalJpq/oBgZS9BjsXvv
 arZTHUG5fDgP/Ek8wTsMBLc2eMiUtKbZOJn6V5eZFjm4CzIVcej3SwPVKs0GDF1rD+8L
 iEmJbdFLv4VtVSOo+YQTyICDXj2ZeFC3p/ISwl+OVbtcIXuclD1G9jJLbiLr/wrgY2ls
 PJqfrHfdbOcBUls8piXjawcnBvP6BK51KFLVG+r/Hs7cNRECpp3mJqH/+H/ojPjO5F5H
 0mENG7676ZNerVUgy15pCOevXFBiQfD3fTyH56i9wVg2OUmLgPlrs2g4CxgGEjB1tx4d
 7ZmQ==
X-Gm-Message-State: AOAM530xRpGU+ABakxcVD7yVGGDqDYzz/rxZkIqyI+0hXG7qnGYs91c4
 ISOscjjfkh0NbC9KBYqehzRrqRtgO2AVXBQeEVipJw==
X-Google-Smtp-Source: ABdhPJyXiF4ZZAqPHiT8aR9cPVlie70So94EUcUvcBwR1wAGDGVGTxWkzbS7q5e2kRYa1NQZyyIgSzYPdOBp0TKLA8w=
X-Received: by 2002:a5b:7cd:: with SMTP id t13mr41480165ybq.417.1615314786316; 
 Tue, 09 Mar 2021 10:33:06 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR02MB2796E924068DCCEE90ACD28585929@SG2PR02MB2796.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB2796E924068DCCEE90ACD28585929@SG2PR02MB2796.apcprd02.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 9 Mar 2021 10:32:54 -0800
Message-ID: <CACWQX81zg3LQFH=58FB6zVNHmqqW=uObZHnyfg0jA8Hg=AAO4Q@mail.gmail.com>
Subject: Re: Redfish Event Service not working
To: "Udupa.Ashwini ISV" <udupa.ashwini@inventec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, Mar 9, 2021 at 9:45 AM Udupa.Ashwini ISV
<udupa.ashwini@inventec.com> wrote:
>
> Hi,
>
> I am trying to test redfish event service in OpenBmc.
>
> I am running the Redfish Event Listener with config.ini as attached. I am=
 trying with http connection.
>
>
>
> I have =E2=80=9C-Dinsecure-push-style-notification=3Denabled" in my bmcwe=
b_%.bbappend to have http push style notification enabled.

As a side note, it's on my list to make this a runtime option instead
of a compile time one, or at least enabled by default.  Having http
available is no less secure than not, and requires the user to opt
into the protocol, and has no defaults, so whether they make that
decision at compile time or runtime doesn't really change much IMO.

>
> But, I don=E2=80=99t see event logs in the console of my Redfish event li=
stener. I also don=E2=80=99t see Events_.txt.
>
> If I send test event through redfish, I see the event in my listener.

There's a lot of work going on around Redfish Event service.  I'd
probably start by going to gerrit and checking out the current patch
series for EventService, and see if that works for you, if it does,
great, please comment that on the code reviews, if not, maybe point
that out there.

>
>
>
> Can you please let me know what=E2=80=99s wrong in my config.ini?

Just looking at it, with very little experience on this kind of thing,
your Destination is almost certainly incorrect.  You've mixed an HTTP
path with a filesystem path.

As part of EventService, it would've been really great if we
documented a test setup for this.  If anyone is interested in writing
up a "how to event service" doc, it would be greatly appreciated.

>
> What kind of logs are captured in event listener? Do all redfish systems =
event log entries ( /redfish/v1/Systems/system/LogServices/EventLog/Entries=
) are seen?
>
>
>
> Regards,
>
> Ashwini
>
>
