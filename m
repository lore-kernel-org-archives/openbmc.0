Return-Path: <linus.walleij@linaro.org>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t2D9D2VrJzDvXy
 for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2016 09:09:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=NZ+29unm; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id n189so213980794qke.0
 for <openbmc@lists.ozlabs.org>; Sun, 23 Oct 2016 15:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=evAXjsLItNa9oTSXgtwkG3ObbLT+ik6ejGIZtyCa32E=;
 b=NZ+29unm1Nxfd1BLCda5wAUJL1GZ3REHRIFebf9UpR9Hxt2SjPZWGcGI7laeHPIfcO
 Wiei37jm6IY9c8IdH7reYzH6cGzQwQvnEIsHocD13GlYFlMWiPqke2yySCAfWFW2mfTR
 L+D3Vtdp1+WIRPXOH4c0/hazwK4uKmTXPARP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=evAXjsLItNa9oTSXgtwkG3ObbLT+ik6ejGIZtyCa32E=;
 b=YLS3cvqNEkrfSL8ZuLcXpMIjL3oSnrzE11e7pkv50WPt80nJQuhcONHY8HvDi3xo3G
 F0kdvFKqZlfT6TPFJ4UmL3nv1cPGxXJmsk2hJ++Z4Izwh+HXH5SOUL7JRGULvGOeM+Dm
 ys8YzGt/u5lxE1qikk26HrxBtwiGO23J/Ne6fMRNK1vPl1hInZVMhjpymvDmayndC4os
 iGSy4HIC1+nSBVQNIRDsR5jba1/o+KN5j/5+HdPxu/9YFVOSoRRjhLEDj6zfIctJEOWS
 Z+sjLsruhvjL/VLzL3td5xH4KHcGB9JkbsVKVklHz9U1uVrOZH9K4uIhgYi5TI4TH4MK
 kmTg==
X-Gm-Message-State: ABUngvd4oK3oIP8WgUZGG9raDLXW3XBx2doKO0EWUix/U7CajtdWLc9WpvW9S7Ko0al8TlDwx05vJ86Oke2l2e51
X-Received: by 10.55.75.215 with SMTP id y206mr12226460qka.26.1477260572487;
 Sun, 23 Oct 2016 15:09:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.140.13 with HTTP; Sun, 23 Oct 2016 15:09:32 -0700 (PDT)
In-Reply-To: <1477010011.8917.20.camel@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <b5f67ba76018314d08e240f95951751896687d37.1474986045.git-series.andrew@aj.id.au>
 <CACRpkdYLDesENtq2cQBrWQeL6NH+mO_N5Z=e9=gsoZSCE85Jag@mail.gmail.com>
 <1477010011.8917.20.camel@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Oct 2016 00:09:32 +0200
Message-ID: <CACRpkdYZPcjGuRKVL6qwof1p7ZXT4EvwzAuz59oTgp9Z5Dzixw@mail.gmail.com>
Subject: Re: [PATCH 6/8] pinctrl: aspeed-g4: Capture SuperIO pinmux dependency
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 openbmc@lists.ozlabs.org
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
X-List-Received-Date: Sun, 23 Oct 2016 22:09:37 -0000

On Fri, Oct 21, 2016 at 2:33 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

>> Patch applied for v4.10.
>> (Tell me if I'm applying patches in wrong order or something, and
>> I hope this doesn't clash with the fixes.)
>
> Both this patch and 8/8 functionally depend on 5/8. I fetched the
> pinctrl tree to poke around but this patch didn't appear in any of the
> updated branches, so I'm not sure whether we have the right ordering.
> Without it we should hit build failures from missing macro definitions.
>
> Have you had a chance to look over patch 5/8? Joel wasn't keen on its
> current form, so I would appreciate your input.

Oops backed this patch out.

Will look at 5/8.

Appreciate if you repost the remaining patches in the series based on
v4.9-rc2 once it's out, and I'll rebase the pinctrl tree onto that.

Yours,
Linus Walleij
