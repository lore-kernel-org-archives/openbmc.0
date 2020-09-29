Return-Path: <SRS0=CIyz=DG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1318C4346E
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 05:51:15 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709682145D
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 05:51:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="GJpO2EdL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 709682145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0pR401fqzDqNp
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 15:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=GJpO2EdL; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0pPT3tpCzDqN3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 15:49:45 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id z23so13175688ejr.13
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 22:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RobnU5vjH8ZAh2b6A6P+pz5hibw3pTrQMmZ9/NOB4AY=;
 b=GJpO2EdLzTnqP56Q2lUsydUKljC5BZMcqXK6zoIHt2TsbNNFftVjsy+g3amXsTljHH
 n+xexxI0qz+PdQffyZEebIzl6ip2DJ5WlHXZXiK5I66KhMfPoioHDqKD4dHKw3ki8mqZ
 Qe0oFhJ4JAQwOkCrBdh5no/30Y25YYglSqlRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RobnU5vjH8ZAh2b6A6P+pz5hibw3pTrQMmZ9/NOB4AY=;
 b=TLiIPEzT2e0M/ofZhV78Xgy4+R87KC00qZFh2sgK8Zupk81NU/8tlYAq8h4yENgups
 24TKB7HjgLXJZN0h8mvXDR/DkZKvWm4zM/TwRGLMLLbSHE+GTAd9q0cQIWMF2klP+xJD
 HaU4SGFgPKh1FNXPNNA73oatCExgeBBzNpkAe08cqO3crTyHC60gRuZLOi9ZeH4/giku
 F1u+BNk2CAkqcvsWLQEb6x+y3E40oWzFVXPewYgEp1t+po8i+7j8gV090G+fWmqQROQ7
 LLxIXmE7a+wAKeVlnl2cEKrkh1WM99Qjiuaeq2O9liVqIir2ZAnD8e0XgdzodFjkr54a
 b+dA==
X-Gm-Message-State: AOAM532qZqi/FiAI/yigo3Us1jMBgz/cT9/jOXIqumBfIXE+hThWUlrc
 8/1JLA331yHBUsIa5NoivddIXjrILs7TfHLFW0s=
X-Google-Smtp-Source: ABdhPJyuQgJ9XKl6umJVsgJZVnwOxjgqSf0moc6aVBIlvDYSOq5qPMNXOaXqSy5NR0YhEgGuy8JHX9JSDcIdkxuQ/F0=
X-Received: by 2002:a17:907:432b:: with SMTP id
 ob19mr2221960ejb.400.1601358579973; 
 Mon, 28 Sep 2020 22:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
 <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
 <20200903152753.GA57949@patrickw3-mbp.lan.stwcx.xyz>
 <20200903171556.GA32795@mauery.jf.intel.com>
 <20200904163430.GA3532@heinlein>
 <DM5PR11MB188420C2AF67DA8C09C4689F90240@DM5PR11MB1884.namprd11.prod.outlook.com>
In-Reply-To: <DM5PR11MB188420C2AF67DA8C09C4689F90240@DM5PR11MB1884.namprd11.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 Sep 2020 05:49:27 +0000
Message-ID: <CACPK8XeXm4_JP-pt9OzcHQwA2sqpHMVnW1kpNUQRh+ULRmG-Cw@mail.gmail.com>
Subject: Re: PECI patchset status
To: "Mihm, James" <james.mihm@intel.com>
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
 Vernon Mauery <vernon.mauery@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 11 Sep 2020 at 01:20, Mihm, James <james.mihm@intel.com> wrote:

> Would it be acceptable for all of the 84+ Intel patches to reside in the openbmc repo while we work through the upstreaming process?
> Some of the patches require design changes and will take much longer to upstream.

This is the intent of the openbmc tree. THe patches need to be posted,
in reviewable series, to be included.

As discussed in this thread regarding the PECI patches, they have been
around for a long time without submission. They will need to be posted
upstream again before I put them in the OpenBMC tree.

Early September, when this thread was started, was a great time to
make the PECI submission in terms of the upstream kernel development
cycle. The next best time is now.

Cheers,

Joel
