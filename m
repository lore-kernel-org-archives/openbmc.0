Return-Path: <linus.walleij@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ao6WB3A2"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yjrzZ5tKmzDrqM
 for <openbmc@lists.ozlabs.org>; Fri, 24 Nov 2017 20:50:50 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id n134so12838608itg.1
 for <openbmc@lists.ozlabs.org>; Fri, 24 Nov 2017 01:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FY23HfCL6GZ+JM7Onxe72rqvtLUIb1ItPMsC/Bal0Tc=;
 b=ao6WB3A2z/AkOsC6uAnMv6Mgrjx++0Loqw7XmH2AcME9C+5oAEId7qiHfuNHtjpEZX
 hkV2/Mx89iDwXbx6/UqihIUr9MDEcuhhlWOfojdb0m+DtMwIXmYyEuB5jRLBbFxAc9aP
 q4KEv9HKyiJCQJrPCPeB4+kqUSDdl393PYQv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FY23HfCL6GZ+JM7Onxe72rqvtLUIb1ItPMsC/Bal0Tc=;
 b=R3lr80uDTMNTFjRovKuWETnVwTwpF3TjkQpvNZw4FQ8rBRDqRbSwTBni7XPnNvv9FW
 L99gEEcXV3OcZd/IE+edDBhGLSRb5OcbPE4/ih+DISiEOvQ8Igyy9Aw6fwng+jnrSX+s
 vCImEEpGOcr+OtTeE26ZFMqLIV7YFjVQY+GmiNhBLWq8wdX6kD7YB6MKPCzrZO/XyYD+
 KurGF15OERdlARU3SuB4eefSMo93UdW/V/08XPxsHtI4k31KhevkE3VLKy3oTGcW9e/b
 m39ybKDjL4dN77iSvh7rk8QKmABG3Xf96uQa6STWlG6N785RpoRI3XQlGAcOaf9YyK8z
 GehA==
X-Gm-Message-State: AJaThX7VFoTaqXrWYHdAVVCCkP2p+H0Bn6s2WUW/AHoo98449lAPzCKX
 izGdcB7hJRY684+hS3jchWTNsgUIaecTxyD7TN3j0g==
X-Google-Smtp-Source: AGs4zMZivbhLKx17SL6V55acS5a3lWWgtx59B+KHLxEjNndsGfG+okBmaa7m6VeY9EN8LE+SKtfBK/+mrMaqeZDdnkU=
X-Received: by 10.36.57.13 with SMTP id l13mr11044863ita.101.1511517048465;
 Fri, 24 Nov 2017 01:50:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.29.76 with HTTP; Fri, 24 Nov 2017 01:50:47 -0800 (PST)
In-Reply-To: <20171101040457.1200-2-andrew@aj.id.au>
References: <20171101040457.1200-1-andrew@aj.id.au>
 <20171101040457.1200-2-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2017 10:50:47 +0100
Message-ID: <CACRpkdaar7b_RJ9GneJB84TGRGasSy8PwzJRr81BAooYmF_VAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: gpiolib: Generalise state persistence beyond
 sleep
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, 
 Joel Stanley <joel@jms.id.au>,
 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Nov 2017 09:50:51 -0000

On Wed, Nov 1, 2017 at 5:04 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> General support for state persistence is added to gpiolib with the
> introduction of a new pinconf parameter to propagate the request to
> hardware. The existing persistence support for sleep is adapted to
> include hardware support if the GPIO driver provides it. Persistence
> continues to be enabled by default; in-kernel consumers can opt out, but
> userspace (currently) does not have a choice.
>
> The *_SLEEP_MAY_LOSE_VALUE and *_SLEEP_MAINTAIN_VALUE symbols are
> renamed, dropping the SLEEP prefix to reflect that the concept is no
> longer sleep-specific.  I feel that renaming to just *_MAY_LOSE_VALUE
> could initially be misinterpreted, so I've further changed the symbols
> to *_TRANSITORY and *_PERSISTENT to address this.
>
> The sysfs interface is modified only to keep consistency with the
> chardev interface in enforcing persistence for userspace exports.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

This does not apply to the Torvalds master HEAD anymore
so please:

- Collect ACKs
- Rebase on Torvalds tree or v4.15-rc1 when it's out
- Resend

The functionality per se looks very nice :) so I want to apply this
ASAP.

Yours,
Linus Walleij
