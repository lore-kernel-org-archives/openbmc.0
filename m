Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oFCBpVgN"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k73h5tBXzDqK9
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 00:26:54 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id 85so10440557pgc.3
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dFR9ji25zhIk2wNtwxwNP25KixTkt6yaltYBnRmxX/s=;
 b=oFCBpVgNc409joiv5jyrd7NqilAEPdYrb33QZcxZkB/vgRwjG9WzSXkLFW35JScNav
 ZsC68fhq59Mx6MXkIt+SNpuFR5pNH3UX2ndiIIEjRUCXbGDfcoSYlj3GlHs7yGlxRLRx
 81oOUskGHYaSApLonzbhYCAyF62KzcHvdVhSU+/qIW9tVfg5PzD0aZuLFSENJZ/vgQCC
 IzpTQWyw8KMiG4VCGa8Z4PvQYcqcsxtVVKO5dFS1aeGkTK0IiX+P6qr3nEnM9trnZ8SP
 EmIZvVQk17oem9l/pbCyezYPtDBH5Nww3rv2btTmImppaZGXPBvTGaKY+sH7DrlGMV++
 3FuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dFR9ji25zhIk2wNtwxwNP25KixTkt6yaltYBnRmxX/s=;
 b=jIRT4OPurY+V/kuIEEKRNbS3dObssO5h3BPJ/Deixa0IBnX9wWGYdK8ZbNNb4MxW5B
 FfwSN/MGFwPGlE84pXW2JnDVKEw+PcbTp5c+/l+f+yW+8olcP/h57J9jr1XR9+YFaRsC
 C5QB7HBKYNza9njDiyoBVvR1o68uxK79EkiPl/QSK5mAjyo88XVuh69UHxiBXNczAw6g
 /0UxI1k2MIoESugNn8Yi7ZcN8AK9lDoHZP9WiPwnnud/HabnRo5fkl2c+w9xL2oOC9HE
 aPAIYnKDIzbyW9866GXoiWeugnVin+I6u3pwOruCiRA7VUb8REfMjaOtfWCjEskpAcdP
 AKcQ==
X-Gm-Message-State: APjAAAUU1gnHGiy9JhnFSwPYz0qxVYEJgs96i1xBAGIEaDQi7OGvExWJ
 Noyz0x2ULbe2i2tnSu1cWPpbVWQ270OSrYKQAhMzwc9xVaw=
X-Google-Smtp-Source: APXvYqwCil3mmF9ynjqhVx+bj0b4Yv/9XtVyIxSMixzwhTSBP18dgnh2b6diPI8c9auvHJTXXSQ5s6tApyE72k82RYY=
X-Received: by 2002:a63:744b:: with SMTP id e11mr76227061pgn.327.1555424810584; 
 Tue, 16 Apr 2019 07:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
 <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
 <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
 <e44834c9-2755-1d05-1df1-d0fa930d48bd@kaod.org>
 <CAO=notxCM7hR7bXXOi3Z86PikHxAj7CXSDWda-KV9wWxKSwBdg@mail.gmail.com>
 <CAO=notx6cuUuARoDLrcrMX0fVQdVYahfvUbDNOwj588_0q-Bbg@mail.gmail.com>
 <d5906e53-9e7a-44f3-b8af-c09e7c4db62a@www.fastmail.com>
In-Reply-To: <d5906e53-9e7a-44f3-b8af-c09e7c4db62a@www.fastmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 16 Apr 2019 07:26:39 -0700
Message-ID: <CAO=notwm0eqmk1G+B-YziEf0Y=6PjAPM-Pu=d1Kc6Q_3QD0B7g@mail.gmail.com>
Subject: Re: transitioning from 4.17.18 to 5.0.6
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 16 Apr 2019 14:26:57 -0000

On Mon, Apr 15, 2019 at 8:05 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On Tue, 16 Apr 2019, at 01:06, Patrick Venture wrote:
> > On Wed, Apr 10, 2019 at 10:13 AM Patrick Venture <venture@google.com> w=
rote:
> > >
> > > On Wed, Apr 10, 2019 at 9:02 AM C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
> > > >
> > > > On 4/10/19 4:39 PM, Patrick Venture wrote:
> > > > > On Tue, Apr 9, 2019 at 7:17 PM Joel Stanley <joel@jms.id.au> wrot=
e:
> > > > >>
> > > > >> On Tue, 9 Apr 2019 at 16:35, Patrick Venture <venture@google.com=
> wrote:
> > > > >>>
> > > > >>> HI, I ran into some weirdness when transitioning from 4.17.18 t=
o 5.0.6
> > > > >>> with the quanta-q71l board.  More specifically now my host can'=
t talk
> > > > >>> to the BMC via ipmi-bt.  All it returns is 0xd5.  on the BMC it=
self, I
> > > > >>> can talk to ipmid file via dbus, and btbridge is running.
> > > > >>>
> > > > >>> Has anyone else run into weirdness?
> > > > >>
> > > > >> I've not seen that.
> > > > >>
> > > > >> My only guess is there is an issue with clocking. Can you try bo=
oting
> > > > >> the machine with clk_ignore_unused in your kernel command line?
> > > > >
> > > > > I'll give it a shot, although IPMI not working is odd since the
> > > > > LPC_CLK is enabled.  But yeah, I'll try that today and reply back=
,
> > > > > thanks.
> > >
> > > root@localhost:~# cat /proc/cmdline
> > > console=3DttyS4,115200n8 root=3D/dev/ram rw clk_ignore_unused
> > >
> > > ./gbmctool -command firmware -action get -field version
> > > Get Device ID command failed: 0xd5 Command not supported in present s=
tate
> > > E0410 10:12:01.640883  456408 real_main.cc:53] Unable to send code:
> > > Command not supported in present state
> > >
> > > So that didn't fix it unless I need to reboot the host as well.
> > >
> > > >
> > > > I don't see this issue on a palmetto, BMC running with 5.0.5.
> >
> > Looks like the issue is 5.0.6 doesn't have the lpc parameter optional p=
atchset.
>
> The only place I've found the patch applied is in one of Joel's personal =
trees.

That would explain why I couldn't find it in the usual places.

>
> Seems bizarre.

Sorry, I stopped following that patchset a while back, I just assumed
it landed.  Was there some push back?

>
> Andrew
