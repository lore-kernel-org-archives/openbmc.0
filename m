Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="LzjpDaBj"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YBk617PMzDqKW
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 12:40:45 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id h39so13435762qte.2
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 18:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uEXOxvG0g0ZS9cdYahBbMuCAvG5rNrgTpiCdZpspgvY=;
 b=LzjpDaBjnSsJ5anH0kRMivSrU/K62g3w6D4DHt5WNvEtmcAB3TBzSdpaVOQJ0mJBGP
 9HfQkAxnBRuKltIo5J3CS1BsRjxhxOPFF7EPZQ7OZpY0xs+PoD5rRNdvH+5MZIknPD6A
 CwOdHHd09dJ3lT21muSPs8rKWH4lKk/uq7YYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uEXOxvG0g0ZS9cdYahBbMuCAvG5rNrgTpiCdZpspgvY=;
 b=jQ2y7Q/f9yhHWWr+zB7reEiDllwDC+7P42LdRopNiWg+bvLk2QfBcO+LkaXX3hvalU
 nZEfYKUKkyHyAmqy4431xRR73xO3RG1lPNoEHZmH9YTeER99aVhDvmSRGu3e5lCIya/4
 gMx+3RsV+B8GkbO2headNVmBorNCzxYeWj2q6t+lgF3449MJYZY7GnXqV2RYy/51S9Fm
 W3ZsQEGDCT8or6C9uBV8GYIQ2GaHTTkYZ089k4s8RkdtAStDHvBcegTo0XK/O9Ge4/nY
 4SngiWHiyulDc8iy+eGTkNNHepzrWwA371d5U/O86x7ihVFWuAfd1+kuF4lj/4oQVmAf
 ygew==
X-Gm-Message-State: APjAAAUbW0/Oz0iFJyLeRf+KSk4tI8QoouaLp3s0DUE1RRMTD1WgeNQP
 a0v9IXhM36QfwqCtMW3wQvzZ0apjCMoIJ2+X84w=
X-Google-Smtp-Source: APXvYqzKWqGmRD3HBEN3kb/XmEm0Q0Tyaz6JgL5Hxel5q1EZwu0XCWyDMeCXzbGeXXSGRbUBs1UskWBJDEfchsuq79g=
X-Received: by 2002:aed:3889:: with SMTP id k9mr5452289qte.7.1554169243123;
 Mon, 01 Apr 2019 18:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-6-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xf_yDn4Ss=tBHCWZQEw3C8K_wcBpKBh+AjP0wq0g7pOqQ@mail.gmail.com>
 <8b989f67-f15c-49b8-8bb2-e1b694d6a859@linux.vnet.ibm.com>
In-Reply-To: <8b989f67-f15c-49b8-8bb2-e1b694d6a859@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Apr 2019 01:40:31 +0000
Message-ID: <CACPK8XcBmnoJtFnNgnSKRzjh74UrDCZMjekRwrJ6GjO_S5qqKQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v2 5/5] ARM: dts: romulus: Enable video engine
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, 
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
X-List-Received-Date: Tue, 02 Apr 2019 01:40:46 -0000

On Mon, 1 Apr 2019 at 15:13, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 4/1/19 1:27 AM, Joel Stanley wrote:
> > On Fri, 29 Mar 2019 at 21:15, Eddie James <eajames@linux.ibm.com> wrote:
> >> Enable the video engine and add it's required reserved memory region.
> > The upstream bindings don't mention the reserved memory region at all.
> Whoops... I'll have to send a patch for that upstream.

Cool.

> >
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >> ---
> >>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 12 ++++++++++++
> >>   1 file changed, 12 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> >> index ee1a460..54427f4 100644
> >> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> >> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> >> @@ -42,6 +42,13 @@
> >>                          compatible = "shared-dma-pool";
> >>                          reusable;
> >>                  };
> >> +
> >> +               ve_memory: jpegbuffer {
> > video_memory or video_engine_memory
> >
> >> +                       size = <0x04000000>;    /* 64M */
> > How do we get to 64MB?
> OK it looks like we can get away with 32MB. I hadn't run the
> calculations since the beginning of working on this driver where I was
> using a lot more memory for fixed buffers. But we do need 32MB since we
> need two source buffers of up to 1920x1200x32bpp.

Again, you need to add this information in the commit message.

I recommend putting the calculation in the commit message too.
