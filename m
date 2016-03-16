Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQ8NV1nvHzDqGh
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 22:27:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=UpabWHsA; 
 dkim-atps=neutral
Received: by mail-vk0-x22d.google.com with SMTP id e6so57420545vkh.2
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6sAhxS+34o5UZ5hp3jNGs3aJ5Wbe4TMv1DRLXP6wBs8=;
 b=UpabWHsAQo2e28kBgWSogqVe0fzZ06w9oOtyJ+sSL02l0oEZ04UwGUcIdM11VX803o
 XpFKlR8rfCtuFEiPKiJQ6So3pc2FkvtguwSZqVpKLVCd1/oFRkzh1Do0ijon7WfZbsUz
 1xmY5r9Bz8czRGm8tylGlqm7soMKQg2Nujn4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6sAhxS+34o5UZ5hp3jNGs3aJ5Wbe4TMv1DRLXP6wBs8=;
 b=KjnI8hLCAQCldlbrd6EM39TyQLiKWWjwhO96wk20he9zofiZlqLdZvK3kTk+BMkCBS
 C4al7pU5U0sr0CQXe2GvI3QY69r8bwtQkakhFbNrhLte+RYeClRd01MQk7wZIMhckYve
 hHEvek+gIEf4ybf25lPDdy0Ek5Y/apEGP8meyCroOKHhTQ7UW+728Pyv6tHua+gYhrp+
 4NyqD7fem1WYlmEFeevqHW02guRsuj5XqIaPxi9/cnAe4zCzQyLZvqVholW4pX3I2qB5
 8TrOU7aTMTnbJWpz2n+LCfNbPLD3cVJ402EDs8//xo85CQZIf5w4CvuiFvj84T8cG3Pm
 ZzTQ==
X-Gm-Message-State: AD7BkJJZ+XUqxa0GMPQXUJcLuq5ARCbTm5MgJWENUb0wsNUt5p7mkARney7e1tFIrIvj+p+bsWUwPEDH2+pNtcY4
X-Received: by 10.31.141.2 with SMTP id p2mr3667959vkd.37.1458127655178; Wed,
 16 Mar 2016 04:27:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:27:15 -0700 (PDT)
In-Reply-To: <1458096317-25223-1-git-send-email-andrew@aj.id.au>
References: <1458096317-25223-1-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:27:15 +0000
Message-ID: <CAFEAcA-Vo1o5Kse0iHLu3YKF3avnd0A-swiy30m1XGu5v-0WgA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Add ASPEED AST2400 SoC and Palmetto BMC machine
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Alexey Kardashevskiy <aik@ozlabs.ru>, Jeremy Kerr <jk@ozlabs.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2016 11:27:39 -0000

On 16 March 2016 at 02:45, Andrew Jeffery <andrew@aj.id.au> wrote:
> This patch series models enough of the ASPEED AST2400 ARM9 SoC[0] to boot an
> aspeed_defconfig Linux kernel[1][2]. Specifically, the series implements the
> ASPEED timer and VIC devices, integrates them into an AST2400 SoC and exposes
> it all through a new palmetto-bmc machine. The device model patches only
> partially implement the hardware features of the timer and VIC, again mostly
> just enough to boot Linux.
>
> Unfortunately the datasheet describing the devices is not generally available,
> but I'll try to add comments to any unclear areas.
>
> The addition of the AST2400 to QEMU is motivated by use of the SoC as a BMC in
> OpenPOWER[2][3] machines and the ongoing development of OpenBMC[4]. The
> presence of a machine model utilising the AST2400 will help with development
> and testing of the OpenBMC stack.

Thanks, applied to target-arm.next.

-- PMM
