Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPd514kQdzDqBm
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 13:58:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mb2694c4"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id v184so3593298pgv.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=esqzFUqpPllS+lCCTCLd/fvsvBW9kKqpPwSyS4QsrSc=;
 b=Mb2694c4bPcckciiSXnZuXdkdzfxa6hmi9SzCZyjJAXIn+iP+i7NF9YMfb3xRlwHyU
 gAmnie8KZ8vJa/6Oq/AwDzPVn9aqA2gnSKKWZmALqQ2eUZFRnnH5A9V+pfvLKkUH9sin
 ayCLaUtWC1z5pWfR3aeeYqMUoOU4wSUQMLueF3ocQ43WsT82Sd4LnYZWBKWecaTJDPpj
 vLHrlvMKr2KblTnGnATPkoPAczPIblvElLSgxPLJTQlltGt7lKdUt0fRkwmvENqbbZ55
 Czc05k3H4weoBwuhrBbeC4/QqsxoAQ1x14vwObykzP4W90l3tTJDhLKtD/+a/HNmGZoi
 9gFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=esqzFUqpPllS+lCCTCLd/fvsvBW9kKqpPwSyS4QsrSc=;
 b=BuZjaeapBMiBpe3gcOS2Eakt3p9/XTliyyvacZeWLCqxXyEuoVaIwYbOtubDEBiNXK
 IfPfI8bKMFlKQsvWRluWzCVCuxwu4xsbm5EmBBejtxJG0f/9fqzq3AzR7syNoj0Xxd+5
 Agh52a70eP6hOYg/PMD2NZNnzS91VQHYRljbD/BDI5Am75jUUP8mPOQgSf3vNX/NO6tc
 i7IK6iO8LhDZ7XB/8i/13goamuPs1TUcJm6e9/YZyGf6r8PWzFSMHsQXo62XIlO9wuKP
 Jj7/7u70CaPsTS8Kq+PcFemL4sOvSiRLmHwKcbqYc48NQ0zzb/xWOxfBh194NBP3R6eb
 75RA==
X-Gm-Message-State: AMke39mTWZPcgaDSjM6f5PiQSBkeGOGJaLeUbzk/Z0BYDPYJTGEg+Q4ssP9GEOj+yflKbw==
X-Received: by 10.98.64.3 with SMTP id n3mr6605773pfa.2.1487300307630;
 Thu, 16 Feb 2017 18:58:27 -0800 (PST)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id
 n81sm15885335pfb.111.2017.02.16.18.58.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Feb 2017 18:58:27 -0800 (PST)
Message-ID: <1487300217.16373.6.camel@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Update reserved memory nodes for
 zaius and witherspoon
From: Cyril Bur <cyrilbur@gmail.com>
To: Mine <mine260309@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 17 Feb 2017 13:56:57 +1100
In-Reply-To: <1487299862.16373.4.camel@gmail.com>
References: <20170216054922.19722-1-cyrilbur@gmail.com>
 <CAARXrtm=xGhKQrngbjx2qZZhOx8tq-S3f948n+TnxGjkgb14Gg@mail.gmail.com>
 <1487299862.16373.4.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2017 02:58:30 -0000

On Fri, 2017-02-17 at 13:51 +1100, Cyril Bur wrote:
> On Thu, 2017-02-16 at 14:14 +0800, Mine wrote:
> > Hi Cyril,
> > 
> > On Thu, Feb 16, 2017 at 1:49 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 9 +++++++--
> > >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 9 +++++++--
> > >  2 files changed, 14 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > index 4b2d8aa8abb6..2d76bfee1262 100644
> > > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > @@ -25,9 +25,14 @@
> > >                 #size-cells = <1>;
> > >                 ranges;
> > > 
> > > -               flash_memory: region@94000000 {
> > > +               flash_memory: region@98000000 {
> > >                         no-map;
> > > -                       reg = <0x94000000 0x04000000>; /* 64M */
> > > +                       reg = <0x98000000 0x04000000>; /* 64M */
> > > +               };
> > > +
> > > +               vga_memory: framebuffer@9c000000 {
> > > +                       no-map;
> > > +                       reg = <0x9c000000 0x04000000>; /* 64MB */
> > 
> > This assumes that Witherspoon has 512MiB RAM, then why the memory part
> > indicates it has 1GiB?
> > ```
> >         memory {
> >                 reg = <0x80000000 0x40000000>;
> >         };
> > ```
> 
> Oops, you're correct. I'll adjust the numbers.
> 
> > 
> > >                 };
> > >         };
> > > 
> > > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > index e1c9b3f4fe44..f30288f735bc 100644
> > > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > @@ -25,9 +25,14 @@
> > >                 #size-cells = <1>;
> > >                 ranges;
> > > 
> > > -               flash_memory: region@94000000 {
> > > +               flash_memory: region@98000000 {
> > >                         no-map;
> > > -                       reg = <0x94000000 0x04000000>; /* 64M */
> > > +                       reg = <0x98000000 0x04000000>; /* 64M */
> > > +               };
> > > +
> > > +               vga_memory: framebuffer@9c000000 {
> > > +                       no-map;
> > > +                       reg = <0x9c000000 0x04000000>; /* 64MB */
> > 
> > As I know Google decides to not support VGA on Zaius, so maybe
> > vga_memory is not needed to Zaius at all.
> > 
> 
> Happy to drop that if there won't be any VGA on the platform.

Sorry for the followup, I assume it would then make sense to put the
flash_memory at the top of RAM?

> 
> Thanks,
> 
> Cyril
> 
> > >                 };
> > >         };
> > > 
> > > --
> > > 2.11.1
> > > 
