Return-Path: <xow@google.com>
Received: from mail-qt0-x22f.google.com (mail-qt0-x22f.google.com
 [IPv6:2607:f8b0:400d:c0d::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVNrV6K84zDqH5
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 08:04:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oDwlo0Yp"; 
 dkim-atps=neutral
Received: by mail-qt0-x22f.google.com with SMTP id n21so26774319qta.1
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 13:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ncfLvEqO8nzBwMY6/kOBdmJ3RlsSFGBIcaafI0mUgbI=;
 b=oDwlo0YppZLGViusixx/htB6G5ID83zaDQdQthCBl9kqR8qv758VEmUh6xbAnlbIZr
 J+zN2NLkSVGz0eSE6mFvgdr4itCpe1jhixpcoQXh68Yl+yQ269uDEEeo05ReDRbA4gvZ
 xRWMLZGeOvztx+2swP+e/GDw301iq9PR7rzkYDmv770lA99zd1qxeJja64dEeF+89E4V
 JFaLVhGySSP3ZOzVBZfDPzVmgfkiJeuuA+E3EtpQ/vHsz5ch7M9ZXiQZ9zmcTNnGXCO6
 PTW1IlmgHGn70pR3o/L47+i+6xqvMPTEAx4a7PG9hnK7LfDsQqj8tpcdwccsL5dCYMIs
 jJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ncfLvEqO8nzBwMY6/kOBdmJ3RlsSFGBIcaafI0mUgbI=;
 b=rXZhyFFgFTTbq77JHh7g2tOs2K1hLCsnKqxhORRxpHKlJj3lH/GqZ/2ZOGzCb6jzuk
 EwuUPJMNnsalAjHpFbnnB3qyh2nzvOKCIwc49CiywvUTC7bPpuYFLEgnhSemy4QAdlU/
 FvTUGohGSEetQ7J/8yAePG5KIq4pd5TiL/nlf030kXodQp3+73soBHw5H70n2os3GD4D
 F7Do5c5UcTSSsRutlp61832KN9OzPpWKGPVYoa+5d81N6ZvhnuxxfzM4qGUlTiWh6EPt
 SDvGqS/6rOD2b8edcCVL0Oh8ceWzjvsSwOP32d8rPke8bkk5ZilenVyYD0DE6GdfttyF
 rA4A==
X-Gm-Message-State: AMke39m7gpu4gdD7CPe7w0Fj3+4VkfTd5/kqpm2pYck4XaMvd98PhI8l0DPL7Jj1nFqG26GbCd0CtstPM4UNKKpw
X-Received: by 10.200.48.116 with SMTP id g49mr4653712qte.131.1487970247424;
 Fri, 24 Feb 2017 13:04:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Fri, 24 Feb 2017 13:04:06 -0800 (PST)
In-Reply-To: <1487915370.23895.40.camel@gmail.com>
References: <20170224053357.18391-1-joel@jms.id.au>
 <1487915370.23895.40.camel@gmail.com>
From: Xo Wang <xow@google.com>
Date: Fri, 24 Feb 2017 13:04:06 -0800
Message-ID: <CAPH-5w5ZydTpESK4OouPntkUtA8F0gfu_=L=DEZumZwk6CVWfQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] ARM: dts: aspeed: Reserve RAM on P9
 machines
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Cyril Bur <cyrilbur@gmail.com>, Lei YU <mine260309@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 24 Feb 2017 21:04:11 -0000

On Thu, Feb 23, 2017 at 9:49 PM, Suraj Jitindar Singh
<sjitindarsingh@gmail.com> wrote:
>
> On Fri, 2017-02-24 at 16:03 +1030, Joel Stanley wrote:
> > This flash_memory region reserved memory region is used by the host<-
> > >bmc
> > mailbox daemon.
> >
> > This patch initially had a vga_memory region for the host processor's
> > framebuffer when using the Aspeed as a PCI graphics device. However
> > this
> > is not required as u-boot modifies the /memory node of the device
> > tree
> > to report the total RAM size minus the strapped VGA framebuffer. This
> > is
> > 16MB of the current system.
> >
> > These numbers were generated as follows:
> >
> >  $ genmem.py --ram-base 0x80000000 --ram 1G --flash 64M
> >
> > And for Romulus and Witherspoon:
> >
> >  $ genmem.py --ram-base 0x80000000 --ram 512M --flash 64M
> >
> > With this script:
> >
> > def convert_one(s):
> >     suffixes = [
> >                 ('K', 1024),
> >                 ('M', (1024*1024)),
> >                 ('G', (1024*1024*1024)),
> >                 ('T', (1024*1024*1024*1024)),
> >                 ('th', 1000),
> >                 ('mi', (1000*1000)),
> >                 ('bi', (1000*1000*1000)),
> >                 ('tri', (1000*1000*1000*1000))
> >                ]
> >
> >     s = s.strip()
> >
> >     factor = 1
> >     for suffix, mul in suffixes:
> >         if s.endswith(suffix) or s.endswith(suffix.lower()):
> >             factor = mul
> >             s = s[:-len(suffix)]
> >             break
> >
> >     val = None
> >
> >     if s.startswith('0b'):
> >         val = convert_binary(s)
> >     elif s.startswith('0x'):
> >         val = int(s, 16)
> >     else:
> >         for c in 'abcdefABCDEF':
> >             if c in s:
> >                 val = int(s, 16)
> >                 break
> >
> >     if val is None:
> >         val = int(s)
> >
> >     val *= factor
> >
> >     return val
> >
> > import argparse
> > parser = argparse.ArgumentParser()
> > parser.add_argument('--ram-base')
> > parser.add_argument('--ram')
> > parser.add_argument('--flash')
> > parser.add_argument('--vga')
> >
> > args = parser.parse_args()
> > base = convert_one(args.ram_base)
> > size = convert_one(args.ram)
> > flash_size = convert_one(args.flash)
> > vga_size = 0
> > if args.vga:
> >     vga_size = convert_one(args.vga)
> >
> > vga_base = base + size - vga_size
> > flash_base = base + size - vga_size - flash_size
> >
> > if flash_base % flash_size != 0:
> >     print("Error: flash base address not a multiple of window.
> > Rounding down")
> >     flash_base -= flash_base % flash_size
> >
> > print("memory {\r\n\treg = <0x%08x 0x%08x>;\r\n}" % (base, size))
> > if vga_size > 0:
> >     print("vga_memory {\r\n\tno-map;\r\n\treg = <0x%08x
> > 0x%08x>;\r\n}" % (vga_base, vga_base))
> > print("flash_memory {\r\n\tno-map;\r\n\treg = <0x%08x 0x%08x>;\r\n}"
> > % (flash_base, flash_size))
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> > ---
> > v2 drops the the reserved region for VGA as we don't need it
> >
> >  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 11 +++++++++++
> >  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  4 ++--
> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  4 ++--
> >  3 files changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> > index 5ba7b62aee83..93fbd7b8c490 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> > @@ -20,6 +20,17 @@
> >               reg = <0x80000000 0x20000000>;
> >       };
> >
> > +     reserved-memory {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             ranges;
> > +
> > +             flash_memory: region@98000000 {
> > +                     no-map;
> > +                     reg = <0x98000000 0x04000000>; /* 64M */
> > +             };
> > +     };
> > +
> >       fsi-master {
> >               compatible = "ibm,fsi-master", "ibm,fsi-master-
> > gpio";
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > index e15bd256c0fd..0769507f1126 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > @@ -25,9 +25,9 @@
> >               #size-cells = <1>;
> >               ranges;
> >
> > -             flash_memory: region@94000000 {
> > +             flash_memory: region@98000000 {
> >                       no-map;
> > -                     reg = <0x94000000 0x04000000>; /* 64M */
> > +                     reg = <0x98000000 0x04000000>; /* 64M */
> >               };
> >       };
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > index d9f63d7752dd..c2af9ffa89bf 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > @@ -25,9 +25,9 @@
> >               #size-cells = <1>;
> >               ranges;
> >
> > -             flash_memory: region@94000000 {
> > +             flash_memory: region@bc000000 {
> >                       no-map;
> > -                     reg = <0x94000000 0x04000000>; /* 64M */
> > +                     reg = <0xbc000000 0x04000000>; /* 64M */
> >               };
> >       };
> >

Reviewed-by: Xo Wang <xow@google.com>
