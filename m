Return-Path: <SRS0=mnE+=DB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499C8C4363D
	for <openbmc@archiver.kernel.org>; Thu, 24 Sep 2020 16:05:40 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C462311E
	for <openbmc@archiver.kernel.org>; Thu, 24 Sep 2020 16:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.b="0Lg2nxQG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C462311E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4By0JF0T6wzDqRG
	for <openbmc@archiver.kernel.org>; Fri, 25 Sep 2020 02:05:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0Lg2nxQG; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4By04H084CzDqCW
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:55:09 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 67so2631518ybt.6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 08:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rwMxArTf3aLK1BKgrobyew9c/kxCtEmXPQVzdezECJQ=;
 b=0Lg2nxQGFvrUMV1E15I45D9hYk7vqu1jM6EdYJpogEh7DM54YId3c4ZrVhindIFF+H
 f/hbKCf9w7PHU2QA0S8Y/g87EgHh/RdJasLGXYIluiExPDPfgfAZE9wnHs+ZSWCprZCV
 ofkyQDnPZUMsHUffvAXML1Kge9nVTdH74o2CPaNrfuGhfEEfgtTEeBQwnqrSd5Hxj3m6
 vkGodYa/0mW/BBA2sHi8U07tzIgbSOPTD9QZ3I5DGvE3f95DvyDvAnTXSAax9n8XlcjJ
 CWekkva9lO1cze5WydRkxm+TIGL4bRkJTQbluyXhop9IApbhaRpiExJAel0/I6BBZEeN
 kPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rwMxArTf3aLK1BKgrobyew9c/kxCtEmXPQVzdezECJQ=;
 b=UR5Yv8QkAQ/YOoz1R2wCc/NVIu8g0BrAAQIlLu6TZhd6zdyPtQoh2XaaY5Yow5tEER
 Y8YyUmM8ylT6BnVwu9oBobhLsE/VNyK0z6mxFRnELZhjBZjwFPYaH9McI6afGNe93uOV
 nFYq4nwtLfDcH/JloV0oycc+zT3Bh9okMLpZ8XbeKfTJLlxZFBmKhAVdd8tTMi8597sL
 rq+TuaFoTPsWPNsK/oXLlWMpu48rCV7iO569bHAgU8cjtvWpkhz5gwwpa4UN/QqEAngY
 xeFNCYCiR1yFo9+D54f0hPYsnDzxZXtsaxPKhUtT3e1p2WUU6Ll2RPrm0Egrik5wAEV7
 /sKQ==
X-Gm-Message-State: AOAM530dYdMVYrHeZIPZ1P3NdO21UjmjVxL/hCtyb78iG07SMl7EupZ6
 /HgoUOgtklwXp4FoWiW9A4LSzEDwf5qsEK/hYdpfK3nRjBH6JANS
X-Google-Smtp-Source: ABdhPJwxa4A+GXM8HXmBPAD1RiVGShZwH60WxYRiCIklZc96f/Si0YnuXSZ/d19V4JGDYWG4mB4oL6m18Nx0JBkQZN4=
X-Received: by 2002:a5b:601:: with SMTP id d1mr233163ybq.417.1600962906227;
 Thu, 24 Sep 2020 08:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200924143036.inmugtvxkj3f6zny@thinkpad.fuzziesquirrel.com>
 <d4761f08a2beca775827171d4d1934cd76641cb5.camel@yadro.com>
In-Reply-To: <d4761f08a2beca775827171d4d1934cd76641cb5.camel@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 24 Sep 2020 08:54:55 -0700
Message-ID: <CACWQX83msYLyZxcNfoMKWd5LmoQ+OZpK302=irPedea46ziZrw@mail.gmail.com>
Subject: Re: entity manager configurations and dbus interfaces
To: Andrei Kartashev <a.kartashev@yadro.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Sep 24, 2020 at 8:43 AM Andrei Kartashev <a.kartashev@yadro.com> wrote:
>
> Hi Brad,
>
> Thank for bring up this question.
> Same as you we have slightly bad view on EM architecture since before
> we had only Power-based platforms and now we are working on our first
> x86-based one.

Can you go into more specifics about what you don't like about it?  I
know a lot of the complaints I've heard revolves around documentation.
I'm trying to hammer away at that as I get time.  Is there any other
low hanging fruit that we can fix that's entity-manager specific?

>
> Following up the discussion in the review and also mailing discussion
> we had early, I now preparing some Implementation Proposal document for
> EM-based inventory. I gonna to submit it to docs repo for discussing
> and finding our common understanding of how it supposed to be.
>
>
> On Thu, 2020-09-24 at 10:30 -0400, Brad Bishop wrote:
> > Hi Ed
> >
> > Will quote a comment from this EM review:
> >
> > https://gerrit.openbmc-project.xyz/36702
> >
> > > entity-manager was designed with the tenant that it config files
> > > have
> > > no knowledge of dbus.
> >
> > FWIW I had no idea this was the case.
> >
> > > We've broken that a little with the inventory interfaces on the
> > > entity
> > > as a short term patch to gain some compatibility, but its easy
> > > enough
> > > to roll back in the future.
> >
> > Interesting - so there is a vision here, but I have no idea what it
> > is.
> > Can you elaborate on how you envision inventory working if EM is not
> > implementing the inventory dbus interfaces?
> >
> > thx - brad
> --
> Best regards,
> Andrei Kartashev
>
>
