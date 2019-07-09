Return-Path: <robh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="KON4ngr4"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jn661hmCzDqV7
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 01:58:06 +1000 (AEST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6D15217D8
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 15:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562687306;
 bh=8uRt2LckP8V6eOMg2L1MMuumGINZ1eU0bTBj8g3A81c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KON4ngr4Z1oJj/l8kSJhRwNeUk2R1NwwJID4TkmcPIl+MyUHNX7S9wJWmLi5kcXKR
 9yQxDgx12Pr9RsOFxewTO1k23CslxM8Urly5NjQV84pjT6TLgiu+KpOv98L6F8TVW0
 OXrssDvfqBv5JToN0eDMoLBPFu4Trx+79enV2b4E=
Received: by mail-qt1-f182.google.com with SMTP id n11so22082898qtl.5
 for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2019 08:48:26 -0700 (PDT)
X-Gm-Message-State: APjAAAX9+0iAoy6WjIrUmk09/uIjQGVMlKfixX43nCz95pmrhrHE9IqA
 BoOafUkAeBFBvA1uGeL9h15J0OD+JA9SGXHTSQ==
X-Google-Smtp-Source: APXvYqwUwZzNp9+krU8sgcmMHMgX3VqOxwtH/223QreLrdzSam3oenUJ5tLIk/dBBxOlEo8N5HAE7gFB0xXhMGeAItk=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr19233318qtb.224.1562687305930; 
 Tue, 09 Jul 2019 08:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
 <20190605141253.38554-2-ghung.quanta@gmail.com> <20190709014058.GA30269@bogus>
 <0c90f9376c0e425c9a226379f7e5bfad@quantatw.com>
In-Reply-To: <0c90f9376c0e425c9a226379f7e5bfad@quantatw.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Jul 2019 09:48:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKf+Z9XJJvqcOw-0L-BLCt_Yv-qv-eu+zhoNFnk8rH8Og@mail.gmail.com>
Message-ID: <CAL_JsqKf+Z9XJJvqcOw-0L-BLCt_Yv-qv-eu+zhoNFnk8rH8Og@mail.gmail.com>
Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Cc: George Hung <ghung.quanta@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Tali Perry <tali.perry1@gmail.com>, 
 "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>,
 "wak@google.com" <wak@google.com>, 
 "benjaminfair@google.com" <benjaminfair@google.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, 
 "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-edac <linux-edac@vger.kernel.org>, 
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "davem@davemloft.net" <davem@davemloft.net>
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
X-List-Received-Date: Tue, 09 Jul 2019 15:58:07 -0000

On Tue, Jul 9, 2019 at 3:50 AM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> Hi Rob,
>
>
> > -----Original Message-----
> > From: openbmc
> > [mailto:openbmc-bounces+george.hung=3Dquantatw.com@lists.ozlabs.org] On
> > Behalf Of Rob Herring
> > Sent: Tuesday, July 09, 2019 9:41 AM
> > To: George Hung
> > Cc: Mark Rutland; Linus Walleij; Tali Perry; paulmck@linux.ibm.com;
> > wak@google.com; benjaminfair@google.com; openbmc@lists.ozlabs.org;
> > tomer.maimon@nuvoton.com; devicetree@vger.kernel.org; Borislav Petkov;
> > Avi.Fishman@nuvoton.com; Jonathan Cameron; Mauro Carvalho Chehab;
> > linux-edac; Patrick Venture; Nicolas Ferre; linux-kernel; James Morse; =
Greg
> > Kroah-Hartman; davem@davemloft.net
> > Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC
> > documentation
> >
> > On Wed, Jun 05, 2019 at 10:12:53PM +0800, George Hung wrote:
> > > Add device tree documentation for Nuvoton BMC ECC
> > >
> > > Signed-off-by: George Hung <ghung.quanta@gmail.com>
> > > ---
> > >  .../bindings/edac/npcm7xx-sdram-edac.txt        | 17
> > +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> > > b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> > > new file mode 100644
> > > index 000000000000..dd4dac59a5bd
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> > > @@ -0,0 +1,17 @@
> > > +Nuvoton NPCM7xx SoC EDAC device driver
> > > +
> > > +The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and
> > the
> > > +driver uses the EDAC framework to implement the ECC detection and
> > corrtection.
> > > +
> > > +Required properties:
> > > +- compatible:      should be "nuvoton,npcm7xx-sdram-edac"
> >
> > Is this for the whole SDRAM controller or just ECC related registers?
> > In the former case, the naming should just reflect the block name and n=
ot a
> > Linux term.
>
> Sorry for confused naming, the address space is for the whole memory cont=
roller registers indeed,
> but the driver only uses the ECC related registers.
> Should I change the name to "nuvoton,npcm7xx-edac" ?

No, you should drop the 'edac' part. The DT describes the h/w, not
what one driver (currently) uses.

Rob
