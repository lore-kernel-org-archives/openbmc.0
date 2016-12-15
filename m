Return-Path: <linus.walleij@linaro.org>
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tfpxm0lNVzDw51
 for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2016 10:07:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="CRpUJmsv"; 
 dkim-atps=neutral
Received: by mail-qk0-x234.google.com with SMTP id n204so73886791qke.2
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 15:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3gfXR53L7FYXH3K2Mgi52pRHCEkE3c31gS8XUVGTAkU=;
 b=CRpUJmsvi01o9YbtlWbXHmxRoQXc1J5E2avi/DXpQ0K1j77rcZ1l0UPSRS+vwaDoSt
 h5+t5rxm8+0QpO3rFvzZuxr71ism66MT36ZO6aJghN692ZXsWEwR08wnkw21WnYkcgyN
 4ixx5Ch6mTYJxWalufsQkFitgHplGIsB4hLi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3gfXR53L7FYXH3K2Mgi52pRHCEkE3c31gS8XUVGTAkU=;
 b=drHFr/0t6GHzm9LxU0DvVfWK4if3iYNKSX+KXMJsayCgMC+cIVckxp0SilCEuEUIA7
 j4RVpyyvsStiUf2KeTEzztukMC6KcZ35RtuGUXpEAoVHIMHxf6B/koL6hg4jAVj/+Dpj
 7rnj1ypQuW5Bc1La0Z5HwaXUV+zrVFToyaxfBO5I7M6hiQk5i9NCVK+te5pywLghIu4b
 gw+fsrA0n6quUFH2BoYTU1jBNziIe1RzJFS1pCiQ/y87d3XTPT3VinMSANnYpfRss6Pu
 MCGNTGgEeZ+mbWoP/s8q4LpYjKSiHO6fT0PP+kWJqIges+Iap1XVaS0SQH9j+TFLZa22
 NJFw==
X-Gm-Message-State: AIkVDXLFLZeI6JqaLP3fsweYmqQozWAxlsswzxtW0p11UCOPGFfBEfcfzByGvd6d/a9TEg2nTwPPwfSSdFY4tLl7
X-Received: by 10.55.113.130 with SMTP id m124mr2645578qkc.116.1481843257396; 
 Thu, 15 Dec 2016 15:07:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.163.36 with HTTP; Thu, 15 Dec 2016 15:07:36 -0800 (PST)
In-Reply-To: <20161214114051.GC14217@n2100.armlinux.org.uk>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <1481702104-8617-5-git-send-email-jaghu@google.com>
 <3917905.e4iOqADnVQ@wuerfel>
 <10697525.O7CkPN6Gfl@wuerfel> <20161214110635.GB14217@n2100.armlinux.org.uk>
 <20161214114051.GC14217@n2100.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Dec 2016 00:07:36 +0100
Message-ID: <CACRpkdaqKDJstfypP0EL9e=TA-atiJmK9zwrBHfLmEVV8SLuAQ@mail.gmail.com>
Subject: Re: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, 
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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
X-List-Received-Date: Thu, 15 Dec 2016 23:07:40 -0000

On Wed, Dec 14, 2016 at 12:40 PM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:

> Looking at this more, it's a SPI driver, presumably because the first
> case where it appeared was on a SPI bus.
>
> However, it's not a SPI device as such, it's a piece of standard,
> general purpose logic that's been around for many years, pre-dating
> the SPI bus.

Indeed.

> I think a much more sensible approach would be to turn the GPIO side
> of the 74x164 driver into a library, which can be re-used by multiple
> bus-specific drivers - one for SPI which allows it to be used in its
> current form, one for our platform bus which takes the GPIO lines for
> the data, clock and clear signals.
>
> I also don't see why they shouldn't use the same compatible - they're
> the same _device_ at the end of the day, just wired up differently.
> It makes the binding documentation a little fun wrt what are required
> and optional properties, but nothing that shouldn't be too difficult.

I agree on both accounts.

Sorry for not seeing this in the first place, I was well aware that this
is a standard component and may be connected in a myriad of ways,
so I should have known better :(

Yours,
Linus Walleij
