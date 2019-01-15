Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="R+s9h54c"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fR4d4WgGzDqQC
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 10:14:41 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id o125so2665991qkf.3
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 15:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TE0RgnW3gqU0OlkU8MUNLqvrL9uNfl6XW2noSA9azQs=;
 b=R+s9h54coXHYdJx8cPfptzIQ6EHyxabE/zalyJeZFNbB8K5zBlEFDNDpvc57P1g3Lo
 nSWBMv9VnM2XyVTCY+DjQgY7+e0H1JmVbIFVKleKd2vQdqmrgoWg7igdhL84hSjg51vF
 CQztl+nbg4qT1IgbHeUtT+OvtFlxTadZWzC98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TE0RgnW3gqU0OlkU8MUNLqvrL9uNfl6XW2noSA9azQs=;
 b=dA/17ZyREeRLReWcdjxm3Pkeu47fn/K5sxWi+T5ZTjv2aCIttiO0LkHKp73T6e++7Q
 1rs6HcWBBJtfPaKRc7AU34r/ZFz9lC5w6/oZo0qZ4Sge6imcD7oajtmQX+txP/H/Bdbk
 pEwrxb5Fh7+LeiaeT5S6vuWj/WciPdLs+s9lsrc+FgWt/0GXC94h7MbneffEGRSxt3do
 4DzhsRXIeLfylanls3H3ccr7aQfQkL2v9lOWuf0S+cPAxhfkXrp46OpderZcNjGvRMPW
 RY8fP4evBgWw6baz6BL886h7aSVODa2JnCocWRBzgw3DZooEcNML9SmlZ+AJBx05woIK
 Tkdw==
X-Gm-Message-State: AJcUukfHknaNq/PqKLjMqFXZDRXiPRjT0becnxaiCIzNmjIVcY6py+d+
 PG8CllMJmeQkA3pCoLk5+CW0BaAZl1CO/0vKueI=
X-Google-Smtp-Source: ALg8bN6Vll7tVbYX6uRv7+fXX12sqYZkOX1xxR7J+sk1OoYRJ4Se2zeybqPn+/dVpT2TSkIIsgAs4YVlPrXLqBuNkYs=
X-Received: by 2002:a37:61cd:: with SMTP id v196mr4656877qkb.25.1547594078546; 
 Tue, 15 Jan 2019 15:14:38 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-7-jae.hyun.yoo@linux.intel.com>
 <CACPK8XfMyXfomepZEPJCr=A-cCPw-CVAZ0B2CuKn7oXCNz6LbQ@mail.gmail.com>
 <abaef001-a769-ec5d-45f0-02a994fdbee6@linux.intel.com>
In-Reply-To: <abaef001-a769-ec5d-45f0-02a994fdbee6@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Jan 2019 10:14:26 +1100
Message-ID: <CACPK8XdBSYHB+S8Sp8Y=J0cK9D=coa+coQj3S7TEFs9DJ8Ljxg@mail.gmail.com>
Subject: Re: [PATCH v10 06/12] peci: Add a PECI adapter driver for Aspeed
 AST24xx/AST25xx
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
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
X-List-Received-Date: Tue, 15 Jan 2019 23:14:42 -0000

On Tue, 15 Jan 2019 at 09:49, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >> +       /**
> >> +        * We check that the regmap works on this very first access,
> >> +        * but as this is an MMIO-backed regmap, subsequent regmap
> >> +        * access is not going to fail and we skip error checks from
> >> +        * this point.
> >
> > Why do you use a regmap for this driver? AFAICT it has exclusive
> > ownership over the register range it uses, which is sometimes a reason
> > to use a regmap over a mmio region.
> >
> > I'm not sure if you've ever disassembled drivers/base/regmap/regmap.o,
> > but if you do you will find that a single mmio read turns into
> > hundreds of instructions.
> >
>
> No specific reason. regmap makes some overhead as you mentioned but it
> also provides some advantages on access simplification, endianness
> handling and register dump at run time. I would not insist using of
> regmap if you prefer using of raw readl and writel. Do you want replace
> regmap with readl and writel in this driver?

I think that would be best.

You raise some good points about the regmap API, and you're not alone
in using it for these reasons. We should look in to providing a
suitable API without the overhead, or making regmap more efficient for
the mmio case.
