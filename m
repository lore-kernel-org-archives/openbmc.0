Return-Path: <raltherr@google.com>
Received: from mail-wr0-x232.google.com (mail-wr0-x232.google.com
 [IPv6:2a00:1450:400c:c0c::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkxTf2G85zDqL9
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2017 08:16:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sRZBAVLa"; 
 dkim-atps=neutral
Received: by mail-wr0-x232.google.com with SMTP id g76so45588109wrd.1
 for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2017 15:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VRKzfACB7Xn/a+4knJ8WbCc6pAlI95Ww8Bl6woJNIT0=;
 b=sRZBAVLaxf8jLWbyFPifjTvZbO0oi5yjUwWMAS4zx8kAV7sGyfw8HM1H3xb/UJ1jGG
 CpfYXcbLTHYLjhFoqjDKknNcMrKO91e+cbfLZJQSkN+OGIIlwEmFT4PnB4iMzF0U0pdZ
 MtKbtlMIcgc61bHD44fSijq80GbX09IGp5utY4PvV0Ik196L66I0dFd+tsG60mv/+bjh
 BePDZJtukCILshllSVJVzQyCNbB/kiWCsjHREWN8Z0gQ3SnIJH5e3/fvkxdtCX1m6h0x
 YET6ZVjbsC1clr+FkaZZsvQCHI4zt+m0AtuUtNR2p8yRbDFgRRTC04qBUVCjg1atVFM5
 iz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VRKzfACB7Xn/a+4knJ8WbCc6pAlI95Ww8Bl6woJNIT0=;
 b=l+1gPIuZw4xBSS+z249mQc2a8un3aVX1OFXmJB9TOhqyd/yg0nZ4PoF2XfPi8QPNFO
 2NOdD+a8CxML+TRGoWG7SS3xJeTmm+rEQDcGqUhC38mRDUy+Lk57wNWfbz5kGzYCXE4s
 ngdZPyhR/r7HD/Jf3pI/n6eWn72AFv541MgAwQ4LJ1i2mvpzThAiFNCdyoGqQnfSVO4Y
 mfs706jETkY9umq3kCR4z9nhSEqGARGgyj1Jaz4WwV0v5wzVJ+G72K9tQ3bKmD07+/sb
 DBq/j1lfsXY7Qc18VRLWsGiUxtdqnah6nNzLryjoEcgdwzKIZaxC9sxse8R1rqu20Q6o
 LJKQ==
X-Gm-Message-State: AODbwcBbG6JeVW/Avl+MeWyRyMkDKywGF7PS8rhXLdm2les1lHLNnP0r
 Wnu3cgkPtK0gzysKkkMMrIDJ6eGrJu4l
X-Received: by 10.223.143.35 with SMTP id p32mr402036wrb.120.1497046594534;
 Fri, 09 Jun 2017 15:16:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.111.138 with HTTP; Fri, 9 Jun 2017 15:16:33 -0700 (PDT)
In-Reply-To: <CAK8P3a0ditvpCzsCA+5uwZ8wVTvbsob0OywNZu_VK1eKD=K4BQ@mail.gmail.com>
References: <20170602215322.24376-1-rlippert@google.com>
 <CACPK8XfWySi5kDEASVpmDKAmBSByB6w0ocQxinazqTHbv+omcQ@mail.gmail.com>
 <CAFRv3wxh-+KiaLfD7zc4+FeiUOn4AyvJtcRLshiPQfpNb8uk4g@mail.gmail.com>
 <CACPK8XfKmm9ZUesgNJsL=MeruOfLzi-j6Dfjb2Be1zfdYn7XcQ@mail.gmail.com>
 <CAK8P3a0BLCL8s+-iWut=himPsVUL==+jqzhDP92+NOPXEMsoNg@mail.gmail.com>
 <CAPLgG=mYiODs6KAjdJV3dZBXrdR=OWsFwdEJ9jT+5-_CC9_pYA@mail.gmail.com>
 <CAK8P3a0ditvpCzsCA+5uwZ8wVTvbsob0OywNZu_VK1eKD=K4BQ@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 9 Jun 2017 15:16:33 -0700
Message-ID: <CAPLgG==_Vh8ucTY+r1NFD3+QuURYWOCBwbftvTzZD5Q=hsQJeQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/misc: add Aspeed LPC snoop driver
To: Arnd Bergmann <arnd@arndb.de>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Robert Lippert <roblip@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 09 Jun 2017 22:16:39 -0000

On Fri, Jun 9, 2017 at 12:00 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jun 6, 2017 at 6:51 PM, Rick Altherr <raltherr@google.com> wrote:
> > I expect Nuvoton to be sending upstream support for their BMC SoCs later
> > this year.
>
> Ah, good to hear!
>
> > LPC is slowly being replaced by eSPI so, even though I expect a
> > few more companies to introduce BMC SoCs in the next few years, I don't
> > expect a huge increase in the number of LPC slave drivers.
>
> Do you know how eSPI slave drivers work? Are they regular SPI slaves
> that implement the eSPI bits in software, or is there hardware level
> support for eSPI slaves that makes them look like LPC at the high
> level?
>

I've only seen the Aspeed eSPI hardware.  It implements demux of the
eSPI channels in the hardware and provides separate DMA descriptors
for each.  It looks nothing like LPC at any level.

>         Arnd
