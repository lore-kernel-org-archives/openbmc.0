Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZaMk7ayA"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZXx5112zzDq9C
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 17:24:56 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id c20so941691qkc.10
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 23:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z/XrD90NqnekN2ZGxPjsSdimg5k4EF4X2gt7GkTRQIQ=;
 b=ZaMk7ayAG7Uw0bVVzV3hczOI0Qlfn3t3fmPcsgDQMpucoQE+ZtFtKVdvV2EGYnvhyO
 mQNS40rRCDWjOxaAOZL3xmLD7MNibFoTqr8c97UrtLjkUDNwbvTOFLxGFPUStFpK6/I/
 csetPfb3iPJPBqgoBwEPDBvIAKDwtFLaQ97Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z/XrD90NqnekN2ZGxPjsSdimg5k4EF4X2gt7GkTRQIQ=;
 b=OuI3Q6DWyd8TQ5/WU/xdC3FFQ2ruosMXlYazVmIDrFnSxofyja+p9XlTyyf9WWvrMG
 GY6aWaeQ4HjSZ6JyIO0EInEA7w+/CyJkvM3ESN9iO8HjpRzfRV06QGvXTC3SEZsdeaVE
 o+hae6tHwwXqfUsO3ZUEF3WxWIr4ysbi7AvXJorNQrButIBBBu6d6mf7MP6pQSL7qhqm
 TAPnJb7cRMoE8OdKlnM3xFhbKcGl4nZyI0NjMI3XFOhKnpm7Xz+C4dMo6m8V2ZY7ihuQ
 jREqR6v58lv8pFcunYGsne0xqlKQLVHRDZzyVP8QgABSlls8Ymnc5v4QSSxtNwoE2hxi
 oLDA==
X-Gm-Message-State: APjAAAV6YuJ4e0a6Wx49uVpYCm5lz2V7fhdIwQxyHpKFn4BkPub6PeNZ
 +NtDIEL+HCF8ZFVYZlAtQMtkOUtNLzx/DiS8ExE=
X-Google-Smtp-Source: APXvYqzuZHixrGcBKqYvlMB3x3X7J40a3V5y+B1ANzXx5rDTeCLFywrGhHO8ekSvWbYO/z4D+PyPtgxotWnhpHCHtkw=
X-Received: by 2002:ae9:e313:: with SMTP id v19mr3415986qkf.153.1554359092914; 
 Wed, 03 Apr 2019 23:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <1549646915-5300-1-git-send-email-anoo@linux.ibm.com>
 <20190403123614.4lxtjomfxinky6rc@thinkpad>
In-Reply-To: <20190403123614.4lxtjomfxinky6rc@thinkpad>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Apr 2019 06:24:39 +0000
Message-ID: <CACPK8XcSErc0seX5fOwjPCCaRDOXZcPDB+PGiruBYVR5aug4VQ@mail.gmail.com>
Subject: Re: [PATCH u-boot] aspeed: flash: Add MT25QL01GB chip
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.linux.com>
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
X-List-Received-Date: Thu, 04 Apr 2019 06:24:58 -0000

On Wed, 3 Apr 2019 at 12:35, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Fri, Feb 08, 2019 at 11:28:35AM -0600, Adriana Kobylak wrote:
> >From: Adriana Kobylak <anoo@us.linux.com>
> >
> >The MT25QL01GB is a 128MB NOR flash chip planned to be used on
> >a Witherspoon system (AST2500).
> >

>
> Would you be willing to carry this u-boot patch and if so, what all
> would you like to see from our end to enable that?

Where does Adriana want it applied? The subject doesn't indicate a branch.

I didn't look at it becuase I assumed it was an upstream patch.
Looking at it now it is obviously meant for the ancient openbmc tree.
I have applied it to v2016.07-aspeed-openbmc.

In the future, adding the correct tags to the subject, and sending
reviewed and tested tags will help me apply your patch.

Cheers,

Joel
