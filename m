Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="SJ5fUAeD"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZY3K38fTzDqKT
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 17:30:21 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id c1so970494qkk.4
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 23:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g6nARFuTFiXQZRkMVt4tKmwvCWnD09jxAhN9nR2fJJk=;
 b=SJ5fUAeDaw7NEECs+o3KRfv3MfruYosMPQl2BvS2sY0i+aSmSCvMMY6SskoVHpEk2m
 6mdDC6Bttw8wF5VrCvYJm7th7H2PVUaSusA+gqiSb3FUZBEfED/I7wbbBG3cIUTXfCzF
 o2+Huutk7oEJTKj/2bsIsHET+F8ymf3JUt/Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g6nARFuTFiXQZRkMVt4tKmwvCWnD09jxAhN9nR2fJJk=;
 b=EzyV+WDJCnPC+hH+DIyE++PQrnpAEGCbIKAPYY3h+Sd6hrYNj6u5fDMKh4h1NjwkQc
 trF6KRRiHyE+fndvclj1V27CSHYbUUfJdqkwuGjQUYWVBSbI9Lmb5i4WWEe40/j6EOVx
 yi3RG9m/5+X33/9mBeiIBs/LDPsCfTvk59C65a4BhH9PFLftyW4tzsYHudj8Y6Z2KxtY
 XzX0429XncwW3geDNPGDLlSWaZbpQITCFDBHj7j0441i5lICimeR40321IQJ+XL9n2GN
 FSXeXzhg0fVn1auVUHLgMMGaX6+Q3a0g+fnbgm7fd5b7BNca1YWmIIaYIaAy7Zafba5H
 LXcw==
X-Gm-Message-State: APjAAAV3HgsVtQLzHuGPd/EA9i8JiSobO6RqG0q5X49TWcRDBaDvLks2
 KGcQVkK4qqKHoNtJeSmEoBtT02DQsnbDJhNUSlmbT07P
X-Google-Smtp-Source: APXvYqyPmfugo3q+vOQnhg9i/xf+Y8EQsrtTCXZZyasZYZbd5Yw0pUiXurqiXtCkwu9KLCbDfe3SzQpzk6GF8VptCi0=
X-Received: by 2002:a05:620a:126e:: with SMTP id
 b14mr3647852qkl.49.1554359417648; 
 Wed, 03 Apr 2019 23:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <1549646915-5300-1-git-send-email-anoo@linux.ibm.com>
 <20190403123614.4lxtjomfxinky6rc@thinkpad>
 <CACPK8XcSErc0seX5fOwjPCCaRDOXZcPDB+PGiruBYVR5aug4VQ@mail.gmail.com>
In-Reply-To: <CACPK8XcSErc0seX5fOwjPCCaRDOXZcPDB+PGiruBYVR5aug4VQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Apr 2019 06:30:06 +0000
Message-ID: <CACPK8Xcq7w=h3azUzaPK3F-JUm1oZUOyfnjQ98k2W6_HcKg3rQ@mail.gmail.com>
Subject: Re: [PATCH u-boot] aspeed: flash: Add MT25QL01GB chip
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@linux.ibm.com>
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
X-List-Received-Date: Thu, 04 Apr 2019 06:30:21 -0000

On Thu, 4 Apr 2019 at 06:24, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 3 Apr 2019 at 12:35, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> >
> > On Fri, Feb 08, 2019 at 11:28:35AM -0600, Adriana Kobylak wrote:
> > >From: Adriana Kobylak <anoo@us.linux.com>

Adriana, you need to fix up your email address. Once you've done that
regenerate the patch with --reset-author and make sure the
signed-off-by is correct.

Cheers,

Joel

> > >
> > >The MT25QL01GB is a 128MB NOR flash chip planned to be used on
> > >a Witherspoon system (AST2500).
> > >
>
> >
> > Would you be willing to carry this u-boot patch and if so, what all
> > would you like to see from our end to enable that?
>
> Where does Adriana want it applied? The subject doesn't indicate a branch.
>
> I didn't look at it becuase I assumed it was an upstream patch.
> Looking at it now it is obviously meant for the ancient openbmc tree.
> I have applied it to v2016.07-aspeed-openbmc.
>
> In the future, adding the correct tags to the subject, and sending
> reviewed and tested tags will help me apply your patch.
>
> Cheers,
>
> Joel
