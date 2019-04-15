Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SyNskrFf"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jXfP1Z9MzDq96
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 01:36:26 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id b3so8793085pfd.1
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EPY1+sDWNS1Tdl9yjHIlkH2BkQLRoavvuMM/E/9Po0I=;
 b=SyNskrFfwPpIGEM3S2G97SEWUn6AAfuQ/CgQPG7MlI7OpCMhzlrLRKvUSoM5+ZBrp6
 7Dtq66XKsly7O6Bm54R3caqEMGigL2I/B5dQ2+NNWciRhhxQV+CQ2iZcTLYwvqQA1cHS
 FQSC+f9rWdzNFoJWT+Tusg3nAqKkPKTBfwO+yqgDj8dVn4eqdkPXOghPTA59kt95j7CN
 SLlyXYPiUpuVFjNeh9o89DYL/MufiuKscMEWFnSOwQi6R9/0L1cFbnA5nupk2QV/+oul
 aod0cJiGFA1eY0yyrFmdMehi1glMk/4XxUwADoERaPQebZB2sRcRLt572wf208yRDvcR
 DoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EPY1+sDWNS1Tdl9yjHIlkH2BkQLRoavvuMM/E/9Po0I=;
 b=RfGfVk5SuO8RKor9O9D7wxRoNuLC8YkBWrxH8tD5x2GNEde6PrFJ/3lL6cZgpoZLlI
 Ou/lJadHPGl00u/Fqrl3GpIx6FwMyc8NtDr+aYMIWBgWzN6TdJmeClr5rCBuzLolp3R2
 PbuUqynM+f0XD9xGm1yweeq9WYdOLwQ3XloFTPul+WOH7tLNYQ02zWEemchFPNxPpLoS
 jLEOfgGqTLKT1chqfwSThb4TO6sdWbHRxC7gq685ivhKRKR1tmzjpPuvYbpzR8UZy09U
 Vs++iM+MAkM7U0gosy8OeOtmeCsv/fNnxRLWYOOZsEQHbCl17jzDb6kAVGu9zY111gkp
 dmlA==
X-Gm-Message-State: APjAAAUPEVoWNiNA7T4iy02m1EByBf+Kf6ydvoXvvGIhiClmPkaCzJWL
 PdUxqE0O/LgEd4+KBiTKoHdK2PzycCDW6zk2Ei6PNw==
X-Google-Smtp-Source: APXvYqyxnmnw2+rFE1QI2B0indeqpx3Q/y4tj73U3cs8kN0Oo1U2Ta8vwEumjcIVFsbvVyLtUN8HTQLMNxC+EAdKJ4I=
X-Received: by 2002:a62:61c2:: with SMTP id
 v185mr76752105pfb.117.1555342583380; 
 Mon, 15 Apr 2019 08:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
 <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
 <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
 <e44834c9-2755-1d05-1df1-d0fa930d48bd@kaod.org>
 <CAO=notxCM7hR7bXXOi3Z86PikHxAj7CXSDWda-KV9wWxKSwBdg@mail.gmail.com>
In-Reply-To: <CAO=notxCM7hR7bXXOi3Z86PikHxAj7CXSDWda-KV9wWxKSwBdg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 15 Apr 2019 08:36:11 -0700
Message-ID: <CAO=notx6cuUuARoDLrcrMX0fVQdVYahfvUbDNOwj588_0q-Bbg@mail.gmail.com>
Subject: Re: transitioning from 4.17.18 to 5.0.6
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 15 Apr 2019 15:36:30 -0000

On Wed, Apr 10, 2019 at 10:13 AM Patrick Venture <venture@google.com> wrote=
:
>
> On Wed, Apr 10, 2019 at 9:02 AM C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> >
> > On 4/10/19 4:39 PM, Patrick Venture wrote:
> > > On Tue, Apr 9, 2019 at 7:17 PM Joel Stanley <joel@jms.id.au> wrote:
> > >>
> > >> On Tue, 9 Apr 2019 at 16:35, Patrick Venture <venture@google.com> wr=
ote:
> > >>>
> > >>> HI, I ran into some weirdness when transitioning from 4.17.18 to 5.=
0.6
> > >>> with the quanta-q71l board.  More specifically now my host can't ta=
lk
> > >>> to the BMC via ipmi-bt.  All it returns is 0xd5.  on the BMC itself=
, I
> > >>> can talk to ipmid file via dbus, and btbridge is running.
> > >>>
> > >>> Has anyone else run into weirdness?
> > >>
> > >> I've not seen that.
> > >>
> > >> My only guess is there is an issue with clocking. Can you try bootin=
g
> > >> the machine with clk_ignore_unused in your kernel command line?
> > >
> > > I'll give it a shot, although IPMI not working is odd since the
> > > LPC_CLK is enabled.  But yeah, I'll try that today and reply back,
> > > thanks.
>
> root@localhost:~# cat /proc/cmdline
> console=3DttyS4,115200n8 root=3D/dev/ram rw clk_ignore_unused
>
> ./gbmctool -command firmware -action get -field version
> Get Device ID command failed: 0xd5 Command not supported in present state
> E0410 10:12:01.640883  456408 real_main.cc:53] Unable to send code:
> Command not supported in present state
>
> So that didn't fix it unless I need to reboot the host as well.
>
> >
> > I don't see this issue on a palmetto, BMC running with 5.0.5.

Looks like the issue is 5.0.6 doesn't have the lpc parameter optional patch=
set.

> >
> > C.
> >
> >
> > >
> > >>
> > >>>
> > >>> I am seeing:
> > >>>
> > >>> [    4.645814] ipmi-bt-host 1e789140.ibt: Found bt bmc device
> > >>> [    4.650341] ipmi-bt-host 1e789140.ibt: Using IRQ 32
> > >>>
> > >>> The dts file I'm using is basically identical to the upstream one, =
and
> > >>> my defconfig is also nearly identical to what's in meta-aspeed for =
the
> > >>> ast2400.
> > >>>
> > >>> Patrick
> >
