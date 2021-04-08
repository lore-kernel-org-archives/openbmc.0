Return-Path: <SRS0=kPZh=JF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A77C433B4
	for <openbmc@archiver.kernel.org>; Thu,  8 Apr 2021 19:37:18 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC64610E6
	for <openbmc@archiver.kernel.org>; Thu,  8 Apr 2021 19:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC64610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGWk35Lzhz3bVN
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 05:37:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=rrIeyjKC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rrIeyjKC; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGWjc6pKHz2xfw
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 05:36:49 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 185so4000203ybf.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Apr 2021 12:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6voL0zlK1U7tDOtNACBrLU1EoJ4v6A1hU8ybiHVzgjM=;
 b=rrIeyjKCDtLFvv189L5OjpUo61HMDSKIzrOckOjjtru+R3AOpCKBpBRAo+5oi2ZDuJ
 toysmdyfUVAnOslgsen9r2kATiaIVUaGzl2oFdWsFvo1tTgbkTVf5dRVroaXfESkgsMp
 pocQ8/lwyiZ1z53OibMW/gpbHGJbFvf7gDW1BhWcn3kaOC7SoaTr4doDrbh3sUJAijeB
 5/wrFa92rXP4G9LNthA0wKZpFdD4q6oLVqIYV+O+sZk85CK7K/h4AmjjDcROSm3Q53um
 3iSQacjOBvvSq7bNotHNpBmO8La0gClmW69sO4J54doGYEfDCMRi4p3jC6k5ANm0k5Ij
 9JPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6voL0zlK1U7tDOtNACBrLU1EoJ4v6A1hU8ybiHVzgjM=;
 b=aaGh86+aY3RdakN1HzgmWTbFN0Qyrd2AKkddXNVu/gCRjrqCFC4Qqp6assfy04IQ/G
 0Famgw8fiVAtF9Et794BTRPp/MU+UTWRDpahxRTTlDrDSRl4SxYMITOcT3i5JxI102WS
 5J7vN9QD5XjMnRIC8ATsIk0h3gNCrE89U+V51WhuT49ptojB6wLhlVfuwkLtz5Hni67k
 mQdiguwi4HCw8hTtzOzktjBieqe5etYZeXpWeUdsqWDGXyb7mRx7zv7T+1XwKM4ELFpr
 FwljiRqz5xyS+VCOv8fYG7rYEJknb8GUeasbvgJCavdtnwe8JKJUzlKZhh1k3fPmx9Mt
 m+fA==
X-Gm-Message-State: AOAM531qSG1CsPRNu7dZ/o9p+I8244tJNOSQg+lK4UBBZW5NQuzshFvJ
 +bve2YqxPSlW1jtP1rwLUpBpNJoOVWzGW1yPD1qEQPyTdZ0r6A==
X-Google-Smtp-Source: ABdhPJxZ0PA2UwJTXf7oUsRRgnH7yt2dFzLFTTPzQ7j2KiTUk7KGRncXfY/TBweFLBtV2AXYGt9czx/WMxdnCAm1kEE=
X-Received: by 2002:a25:c750:: with SMTP id w77mr13123837ybe.340.1617910607954; 
 Thu, 08 Apr 2021 12:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <20201007013446.GE6152@heinlein>
 <80ea13b3-1779-b2b3-c295-3d09dfd41987@yadro.com>
In-Reply-To: <80ea13b3-1779-b2b3-c295-3d09dfd41987@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 8 Apr 2021 12:36:36 -0700
Message-ID: <CACWQX83XqiU78bvQGV5Naea5yGZ44Q1YsO5j7ZkyJAkZgDmAmg@mail.gmail.com>
Subject: Re: adding sync method in phosphor-time-manager
To: Alexander Amelkin <a.amelkin@yadro.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Apr 8, 2021 at 11:17 AM Alexander Amelkin <a.amelkin@yadro.com> wro=
te:
>
> Hi Patrick, everybody!
>
> As far as I can see, this discussion has had no development, to our regre=
t.
> We would really like to read some clarification on what is the proposed
> method
> of timekeeping for x86 systems nowadays, because with TimeOwner interface
> removed, it's not clear to me anymore.
>
> Do you allow the users to set time/date on the BMC side?

Yes.

> If so, how do you
> propagate those changes on to the host, which in x86 is the owner of RTC?

Check your PCH specification, there are generally commands for doing
this over i2c.  I don't believe anyone has implemented them in OpenBMC
mainline yet, although the not-finished-mainlining tyan s7106 patches
had a python script to do this that you might use as a model.

> What if the BMC is rebooted before the time settings are propagated?

Presumably you would block the return of the set time calls until
they've been persisted into the RTC in the PCH to avoid this race
condition, but that will depend on what you implement for this case.

>
> If you don't allow setting the time in BMC, then what are the options
> for the user?
> Do you allow a choice between NTP and Host time only?

Don't set an NTP server, which is the default.  If an NTP server is
set, the BMC will use it.  Whether or not that goes to your PCH would
be a detail you'd need to implement.

>
> How and when is the time synced from the host? Is there a method to
> force a sync?

IMO, no, there shouldn't be a way to force it, it should be
periodically polled (once a minute maybe?).  Make sure to watch out
for skid, and only update the BMC time if the difference is > 2
seconds apart, because the PCH only gives 1 second resolution.

>
> Is there maybe some document that covers this topic?
>
> WBR, Alexander Amelkin
> YADRO
>
> 07.10.2020 04:34, Patrick Williams =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Oct 06, 2020 at 05:38:13PM +0000, Velumani T-ERS,HCLTech wrote:
> >> Classification:
> >> Hi Team,
> >>
> >> We wanted to add another time sync method in phosphor-time-manager to =
get the time from the host and set it to BMC. To have this option configura=
ble I propose a dbus property in the time interface(given below). Please pr=
ovide your feedback/comments.
> >>
> >> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/op=
enbmc_project/Time/Synchronization.interface.yaml
> >> enumerations:
> >>      - name: Method
> >>        description: >
> >>          Possible methods of time synchronization.
> >>        values:
> >>          - name: NTP
> >>            description: >
> >>              Sync by using the Network Time Protocol.
> >>          - name: Manual
> >>            description: >
> >>              Sync time manually.
> >>           - name: HostSync
> >>            description: >
> >>              Sync the time from host.
> >>
> > Hopefully Vishwa can weigh in here.
> >
> > It is my understanding that the default implementation allows the host
> > to synchronize the time down already.  There use to be an interface tha=
t
> > determined the "TimeOwner" to specify if the BMC or the Host were in
> > charge of the time.  That was removed not too long ago.
> >
> > https://github.com/openbmc/phosphor-dbus-interfaces/commit/70c76a29b898=
f05e28c803808bd57a2b6c3f7a6f
> >
> > I think you should look through the history on this commit (it
> > references a discussion related to the mailing list) and check with the
> > people in that chain as to why it was removed before we add back in
> > something very similar.
> >
