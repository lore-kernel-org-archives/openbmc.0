Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FTlO+BCf"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46B7t90rmszDr4C
 for <openbmc@lists.ozlabs.org>; Sun, 18 Aug 2019 17:27:12 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id j4so14495299iop.11
 for <openbmc@lists.ozlabs.org>; Sun, 18 Aug 2019 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hyti0k3I4PddbIsJ2d/2Akjf5/MoSL1kv1XKngBQJOo=;
 b=FTlO+BCfHT5CiogCPtviZJdjXIvZgNtQMnFI7Mo/qCwDB8hRTByMsHXaS9ahXiwLr9
 +JqFS+i9QbweMvitF1EAfFLAXB5uYMlXDFW4GBB0nuvEbcVAWpy7/yfhE6a/qEeHCKGg
 NFk8+aAS3S4lSBiXxcQXJXGKWG6LQNiMTwL4OVTEjOfuFcIgMpjmHU4SlQCOGMnXSHGe
 eDVfmWXf+AfEdLJ7k7sg4r9gsWu3mVMouVWx9SOMSuoqmg+kaSG4ygMMz4/mcN9SrYxP
 YQYgr4ge/WoDgnKNGNSt7Mml3wHwU3OLaFElcqpyq1URLXiy43A/k5alDdf2feaxkuIw
 zxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hyti0k3I4PddbIsJ2d/2Akjf5/MoSL1kv1XKngBQJOo=;
 b=L/eWmonf3iMTryzHZjhtM6C8ylkr9gSD8XaMUud23RZeVenag5D/FcnSIR7IOnXFel
 CxhnkLnycU4mbJDLs+KcbpssOxBuTe00pfWLLaOQF++ApKXzLTSYtzwb2v4d3hCqmLwI
 kFEGoXL4Yd2ova8kLPBOSfcz/vxesUawW4IzCCINrbBKCzg+4ZK9CGjhyxfq1aU+UFGm
 +sKsbox+mrbq+/fO3rZ58iVHlV5o3PbQbJgZJ2lfcYU9pZC18w7NzODeRC9Er7YGsv8t
 sG5qKQKnQR0fT8tPmf46eCld8nb3smm9LJ9/MOfY4Hv/pMIf3uJQfHU3yIWZup2Dg0bN
 O4cA==
X-Gm-Message-State: APjAAAW/VcoKTcNrm6XaXBo4WRXlyaXYH7TYTeEx26sLPkIdEmCt8sPn
 VxwvRtYzB1uzG1qEKkt/A9AcfqgwR5wjDsStBg==
X-Google-Smtp-Source: APXvYqxE4N+ukRZoeLACGYSa52461Et2fY/bhWQMNyj5zf+NUxDZpmJdVQSUvr/srmpOXiKfiPFnVZnL7do/dItbTCg=
X-Received: by 2002:a5e:c601:: with SMTP id f1mr19110129iok.57.1566113229392; 
 Sun, 18 Aug 2019 00:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150241.345609-1-tmaimon77@gmail.com>
 <20190722150241.345609-2-tmaimon77@gmail.com>
 <20190812233623.GA24924@bogus>
In-Reply-To: <20190812233623.GA24924@bogus>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 18 Aug 2019 10:26:17 +0300
Message-ID: <CAKKbWA607qZ+LODfYi7yUWOQ3DV4Wxi4VUGkW=waSzzRbHp+OA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: hwrng: add NPCM RNG documentation
To: Rob Herring <robh@kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, mpm@selenic.com,
 herbert@gondor.apana.org.au, 
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, sumit.garg@linaro.org,
 jens.wiklander@linaro.org, 
 vkoul@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 18 Aug 2019 07:27:13 -0000

On Tue, Aug 13, 2019 at 2:36 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jul 22, 2019 at 06:02:40PM +0300, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM Random Number Generator (RNG).
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/rng/nuvoton,npcm-rng.txt           | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> >
> > diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > new file mode 100644
> > index 000000000000..a697b4425fb3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > @@ -0,0 +1,17 @@
> > +NPCM SoC Random Number Generator
> > +
> > +Required properties:
> > +- compatible  : "nuvoton,npcm750-rng" for the NPCM7XX BMC.
> > +- reg         : Specifies physical base address and size of the registers.
> > +
> > +Optional property:
> > +- quality : estimated number of bits of true entropy per 1024 bits
> > +                     read from the rng.
> > +                     If this property is not defined, it defaults to 1000.
>
> This would need a vendor prefix, however, I think it should be implied
> by the compatible string. It is fixed per SoC, right?

Tomer is on vacation, so I answer instead:
This value is the same for all our SoC flavor that contains this RNG HW.


-- 
Regards,
Avi
