Return-Path: <SRS0=03jC=HU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE6BC433E0
	for <openbmc@archiver.kernel.org>; Thu, 18 Feb 2021 05:24:35 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D5964E3E
	for <openbmc@archiver.kernel.org>; Thu, 18 Feb 2021 05:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2D5964E3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh36n0Typz30Lj
	for <openbmc@archiver.kernel.org>; Thu, 18 Feb 2021 16:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Vrw++keg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Vrw++keg; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh36N1ZzJz30JB
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 16:24:11 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id dr7so439840qvb.1
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 21:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jWKF0h2KqOPNfFDJgvLkGAn6La91C6mZ5ZYHp1jeRXM=;
 b=Vrw++kegEGndwTYRuVAuXCemEcen1zX5PSsS64LOvSKyQX/O2E5+by0BjqFzTAuC/j
 +EEHFdV/FSvr9l7GXCl7oOGeBd2kc51AdqW4fOYzt2MTfrFmovI1aLWCr483joTLk3c1
 LperSzRWxGnzyI+HnwWfiCVj+Pe2vTu8+Hk9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jWKF0h2KqOPNfFDJgvLkGAn6La91C6mZ5ZYHp1jeRXM=;
 b=ox8JLfjW5f6yXbjijbkhtXhvHpaF5km/CPfuD6LE03z4D0gfyFbYEy/iOcb28b52ua
 Z3HmPILKklhqvgEgW+TfEW4FDCIKpUP4DgpbQz0R3WX/TS30H6oeUTWHlJFYkd76UvtF
 wX9GR0pzGWvvHZh+bUhNpJPMimYT3Me1WeN5DCztIth2FolkxUJVtQ+23paROezNjQ8m
 XCR3yFRGAd7IVKnM//h+LPi5I1Qn4hYZMrIQTGD5Qv1EUtVzC/c4y6nxWGwklCW83eCq
 62wrXLQpYs4ntJSEwUhwUFYq5uF6wFB2PZnW74FrETtwcE4CEncMZH05UAeOj62InF0/
 YI6g==
X-Gm-Message-State: AOAM531qFpTW/aDPw4eireB4I5zfQYofLcNQyx23mNegoW7IAf2+7XNE
 4ohE8jsrK8XYyvqp6ILDUXUrpxj0DZmgYBaPD77bDxDp
X-Google-Smtp-Source: ABdhPJyhEhzMIFY5VIQunZ6CqiDW+r6Qw5JyrQcnEkDUWbELVfluj8H3V0yWamlsZfC2VO4nuzDOgOds5HN1m3vJQWg=
X-Received: by 2002:a05:6214:10e7:: with SMTP id
 q7mr2612739qvt.16.1613625847783; 
 Wed, 17 Feb 2021 21:24:07 -0800 (PST)
MIME-Version: 1.0
References: <71820e5a-1231-1937-1344-dee9f4a03600@os.amperecomputing.com>
 <CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com>
 <42403202-49c9-2b85-1207-4c84ec491332@os.amperecomputing.com>
In-Reply-To: <42403202-49c9-2b85-1207-4c84ec491332@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 18 Feb 2021 05:23:56 +0000
Message-ID: <CACPK8XdFxB4JQR09tNvV-DN4V4fiUmbY2_7+MArh_jdAs1YVkQ@mail.gmail.com>
Subject: Re: Any convention on putting source codes into openbmc/openbmc
 repository
To: Thang Nguyen <thang@os.amperecomputing.com>
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

On Thu, 18 Feb 2021 at 01:31, Thang Nguyen <thang@os.amperecomputing.com> wrote:
>
>
> On 18/02/2021 06:46, Nancy Yuen wrote:
>
> Code should be put into an appropriate repo, and repos created where necessary.  Then referenced in recipes from openbmc/openbmc metalayers.
>
> Thanks Nancy for the feedback. Do we have requirement for this or just a recommendation?

It's a requirement.

OpenBMC uses a project called yocto, which is itself based on
openembedded (OE). OE is a set of build scripts and configuration
files for building a filesystem. The filesystem will contain
applications, such as ipmi daemons, web servers, sensor monitoring
code, etc. The source code for those applications comes from the
application's repository. For example, our ssh server (dropbear) comes
from dropbear's website.

For applications that are developed exclusively for openbmc, we host
their source code as part of the openbmc organisation on github. But
the source code lives outside of the main yocto-derived repository,
and is checked out at build time.

If you have application code that you wish to be part of your system,
you should first see if it makes sense to contribute that code to an
existing repository. If it is unique, or deserves it's own repository,
then you can mail the list to request the creation of a new repository
for your code.

Apologies if I've covered something you already understood. Once
you've been around the project for a while it becomes second nature,
but it was hard to describe the concepts from scratch!

Cheers,

Joel
