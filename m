Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XvgXq/CY"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Td9C1ybHzDqQ1
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 17:18:23 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id c1so9216831qkk.4
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 23:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dob/PjfBxJGQS+pz86tDguB6SpNGMEFNrFgyJct4x6o=;
 b=XvgXq/CY6bVM8LFW90YQyuvdMDDfb8rS8Nb05AUAtzOkGR5V8HIcixJ+ts0kgR2yEt
 cMWhy8DCVzCUwLTa6irGYOYAgutpt23npLkpWCwGrjGMkfJgtMPMBi5cTrienMBQ7CVt
 MI8lIVrTUVVKuJ/b2BbX8SVMdCPIjAkSxw9ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dob/PjfBxJGQS+pz86tDguB6SpNGMEFNrFgyJct4x6o=;
 b=amux1J9kRRXLRKL3zDB0HjUsamfswaMyc/hUolgH8w2fybuZzL0Q84elg54zQB/v2X
 MEbQCK6wqGUacJANnB+hS3URWy1X3xsfOdZDBkY15/xKTVLv2cHS9VSqzpV4eBcCju6E
 lM+Z6laZJwqL9DOMhmjfzGhaToVXNvTEE+vby0rhSZmSHVIkdJuN397WZBrAY6N21Qz9
 ltvWi1JiO9dGTldTxfaFzse3gHixDsk7E2cJXCkCdzyaeQ/nlkDpszMIn+qYPA6fwIWq
 ri2a/3NR6LNK37zHreETOIdpUvp2KRyBBYV9R8Mzu/QlF4wYzIqJ9hv3meSUMdi1Ajgn
 h5NA==
X-Gm-Message-State: APjAAAUJsUnmGbyajR2/KGbTUTgSckFWhg3ei0vDxFUFxhBvpP1oJkHP
 lV8QJzB/udF5R6a+eE4LDXlClF8jm3V5VfN2/FY=
X-Google-Smtp-Source: APXvYqxR+SFogfCmjHSDiqOkSOrNiO5FVxteWeSI8gENwlNQajK6Gq/7ORdTUuUlkCCBYNcOGrQdLxIQH27thaRtX9g=
X-Received: by 2002:a37:9d06:: with SMTP id g6mr28419485qke.25.1553667499527; 
 Tue, 26 Mar 2019 23:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <1551820067-53510-1-git-send-email-anoo@linux.ibm.com>
 <02b66794-19bf-a042-66a9-00fc712355f5@linux.ibm.com>
In-Reply-To: <02b66794-19bf-a042-66a9-00fc712355f5@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Mar 2019 06:18:08 +0000
Message-ID: <CACPK8Xez-iKZ9h7NB9YX+AfNFtoZhsP9Ap8H+1w-cvmAk1S5xQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Swift BMC machine
To: Matt Spinler <mspinler@linux.ibm.com>
Cc: Adriana Kobylak <anoo@linux.ibm.com>, msbarth@linux.ibm.com, 
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
X-List-Received-Date: Wed, 27 Mar 2019 06:18:23 -0000

Hi Adriana,

On Tue, 12 Mar 2019 at 21:47, Matt Spinler <mspinler@linux.ibm.com> wrote:
> On 3/5/2019 3:07 PM, Adriana Kobylak wrote:
> > The Swift BMC is an ASPEED ast2500 based BMC that is part of
> > a Power9 server. This adds the device tree description for
> > most upstream components.
> > There's a pending TODO to create the flash layout for its
> > 16GB NAND flash chip. Use the default 32MB NOR flash chip
> > for this initial commit.

> > +     max31785@52 {
> > +             compatible = "maxim,max31785a";
> > +             reg = <0x52>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             fan@0 {
> > +                     compatible = "pmbus-fan";
> > +                     reg = <0>;
> > +                     tach-pulses = <2>;
> > +                     maxim,fan-rotor-input = "tach";
> > +                     maxim,fan-pwm-freq = <25000>;
> > +                     maxim,fan-dual-tach;
>
>
> The 4 main fans are single rotor, so you don't need the fan-dual-tach
> line on them.
>
> I'm not sure about that booster fan though.

Are you going to send a v2 that address Matt's comment?

>
>
> > +                     maxim,fan-no-watchdog;
> > +                     maxim,fan-no-fault-ramp;
> > +                     maxim,fan-ramp = <2>;
> > +                     maxim,fan-fault-pin-mon;
> > +             };
