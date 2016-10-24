Return-Path: <kunyi@google.com>
Received: from mail-ua0-x22f.google.com (mail-ua0-x22f.google.com
 [IPv6:2607:f8b0:400c:c08::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t2q5G34qCzDvWr
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 08:23:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=MFFnYrvE; 
 dkim-atps=neutral
Received: by mail-ua0-x22f.google.com with SMTP id u14so5989793uau.7
 for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2016 14:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kOLY+gHMdqRdy76IYr/xrTE1Y6UtayOaf2dn7GRhpcM=;
 b=MFFnYrvEA7p4J3YKL2S1mZSI55gHv81HD3m62BRpgs8eXETiGtMIj8Nsbkm/hgyzYD
 52NIdvk/Jpnb4mSAQLrABHZgQtKhGGZZbMhb8feLlXq6BEeet0ytqRQ2PuteKo1t9kxo
 6/Z9CsRmnhsaPuORZcL+bDGpQ0ysWWyaLCmMQFu1jrVBNRTtFwYoyiu7ek+QljRvAAkQ
 FIYYWATMONfcLOuSixXdkPS9mFiKyE7MJO2gWBwoqZ1AsspOjVmRoewDN3xu3INW6OZA
 2WCViAysdp14ANNun8RdCWBEk+A5AFgKgLF4G8f3keL8n3FHon9+wzuaHOJz6dD26kRO
 oZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kOLY+gHMdqRdy76IYr/xrTE1Y6UtayOaf2dn7GRhpcM=;
 b=DxAvtbAQr0ZVSrfBQyu/IIq21DhJhiJKrTHd/t69/TgCgTrmsbF01Hb9vFDvPgRwJE
 YdfiQ3QzLTvVw2KI7336CuWyg/fPguMOjGTmz9BdTaqv/N+iKpoZKjRp8KH8LxJ55rE6
 eWPTfEONBB/z7XX3seDw8Yi02blfQqKfPROSSCmrdTYy9dgCTtsT1onvDL0njvqwFDc1
 NblDuzLwQbyEQlcbTo3dGh9w5PSSIRRfjod005/Eh466rx33qHhLtf9sioPIZqY3c3tE
 9P4dOr5GXr01PkwJq0RL0owj2LAEoYD+TkHyX84H1VGe6FoNE3Hc5YTD42YQFzSjp+6+
 TOCA==
X-Gm-Message-State: ABUngvdcV6gblonbwIkMc+jlLtouowf5a6XjXbAhADQX/frKxc8cHEABYkgGlpHEPMG7X/3d6XYPxLLHgMZaalO3
X-Received: by 10.176.65.167 with SMTP id 36mr4164511uap.75.1477344191191;
 Mon, 24 Oct 2016 14:23:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.85.222 with HTTP; Mon, 24 Oct 2016 14:22:50 -0700 (PDT)
In-Reply-To: <1477278307.6373.52.camel@aj.id.au>
References: <1477097158-139095-1-git-send-email-kunyi@google.com>
 <1477278307.6373.52.camel@aj.id.au>
From: Kun Yi <kunyi@google.com>
Date: Mon, 24 Oct 2016 14:22:50 -0700
Message-ID: <CAGMNF6XdMYX3ZTxtna7ueJcBfpvi=aEF8kaStJgz_pwY0jP2XQ@mail.gmail.com>
Subject: Re: [RFC 0/2] spi: aspeed: SPI1 mode control driver enabling sysfs
 control
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary=94eb2c05543aba6f23053fa2ff6d
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
X-List-Received-Date: Mon, 24 Oct 2016 21:23:15 -0000

--94eb2c05543aba6f23053fa2ff6d
Content-Type: text/plain; charset=UTF-8

Hi Andrew,

One question I have though: I think pinmux/pinctrl driver is supposed to be
a boot time static pin configure module and parses DT and configures
accordingly. Is it possible to use pinmux to dynamically modify the pin
states? This is essentially the problem I'm trying to deal with.

Thanks,
Kun

On Sun, Oct 23, 2016 at 8:05 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Hi Kun,
>
> On Fri, 2016-10-21 at 17:45 -0700, Kun Yi wrote:
> > Hello,
> >
> > I'm looking for feedback on a simple Aspeed SPI1 mode control driver
> that does two things mainly:
> > 1. Expose a sysfs interface for userland control of SPI1 interface.
> > 2. Optionally override the SPI1 mode at probe if "start_mode" is
> configured in
> >    device tree.
> >
> > Aspeed 24XX/25XX support three interface modes for their SPI1 interface,
> > which can be configured via HW strap register. In the typical case of
> connecting
> > a host flash chip SPI1 interface:
> > - SPI master mode makes BMC the master to the host SPI flash
> > - SPI pass-through mode make whichever external SPI interface connected
> to SYSSPI
> >   be the master
> > - There are also "disable" and "debug" modes. Aspeed 25XX specified the
> debug
> >   mode is reserved though.
> >
> > In particular, SPI pass-through mode would enable an external SPI master
> to
> > directly program host SPI chip and possibly serve as an alternative way
> to LPC
> > for host CPU accessing SPI flash. I think by providing a sysfs handle,
> userspace
> > applications can have a flexible way to mux host SPI flash ownership
> between
> > BMC/external on the fly.
> >
> > Overriding the SPI mode at probe time can be useful to make sure
> 2500-smc flash
> > controller always identifies the flash chip and create /dev/mtd files
> correctly.
> >
> > I wrote the driver as a standalone misc driver for the ease of initial
> implementation.
> > There are other options such as merging the functionality into the SMC
> driver
> > itself, possibly enabled by optional device tree arguments/nodes, but I
> just want to
> > send the patches out first to gather comments on perceived usefulness of
> > the feature and how you think the driver should be constructed.
>
> At least one issue I have with the implementation is that the strap
> register is currently "owned" by the pinctrl driver, but the patch as
> it stands has no interaction with this subsystem. Arguably the pinctrl
> driver is where this should be implemented, as it encapsulates pinmux
> whose aim is to manage the functionality made available on the SoC's
> pins.
>
> Currently the pinctrl driver treats the strapping register as read-
> only. That should probably change in light of what you're trying to do
> here, though only to the extent of allowing the SPI mode switch.
>
> Cheers,
>
> Andrew




-- 
Regards,
Kun

--94eb2c05543aba6f23053fa2ff6d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew,<div><br></div><div>One question I have though: =
I think pinmux/pinctrl driver is supposed to be a boot time static pin conf=
igure module and parses DT and configures accordingly. Is it possible to us=
e pinmux to dynamically modify the pin states? This is essentially the prob=
lem I&#39;m trying to deal with.</div><div><br></div><div>Thanks,</div><div=
>Kun=C2=A0</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Sun, Oct 23, 2016 at 8:05 PM, Andrew Jeffery <span dir=3D"ltr">&lt;=
<a href=3D"mailto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Kun,<br>
<div><div class=3D"h5"><br>
On Fri, 2016-10-21 at 17:45 -0700, Kun Yi wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; I&#39;m looking for feedback on a simple Aspeed SPI1 mode control driv=
er that does two things mainly:<br>
&gt; 1. Expose a sysfs interface for userland control of SPI1 interface.<br=
>
&gt; 2. Optionally override the SPI1 mode at probe if &quot;start_mode&quot=
; is configured in=C2=A0<br>
&gt; =C2=A0=C2=A0=C2=A0device tree.<br>
&gt;<br>
&gt; Aspeed 24XX/25XX support three interface modes for their SPI1 interfac=
e,<br>
&gt; which can be configured via HW strap register. In the typical case of =
connecting<br>
&gt; a host flash chip SPI1 interface:<br>
&gt; - SPI master mode makes BMC the master to the host SPI flash<br>
&gt; - SPI pass-through mode make whichever external SPI interface connecte=
d to SYSSPI=C2=A0<br>
&gt; =C2=A0 be the master<br>
&gt; - There are also &quot;disable&quot; and &quot;debug&quot; modes. Aspe=
ed 25XX specified the debug<br>
&gt; =C2=A0 mode is reserved though.<br>
&gt;<br>
&gt; In particular, SPI pass-through mode would enable an external SPI mast=
er to<br>
&gt; directly program host SPI chip and possibly serve as an alternative wa=
y to LPC<br>
&gt; for host CPU accessing SPI flash. I think by providing a sysfs handle,=
 userspace<br>
&gt; applications can have a flexible way to mux host SPI flash ownership b=
etween=C2=A0<br>
&gt; BMC/external on the fly.<br>
&gt;<br>
&gt; Overriding the SPI mode at probe time can be useful to make sure 2500-=
smc flash<br>
&gt; controller always identifies the flash chip and create /dev/mtd files =
correctly.<br>
&gt;<br>
&gt; I wrote the driver as a standalone misc driver for the ease of initial=
 implementation.<br>
&gt; There are other options such as merging the functionality into the SMC=
 driver<br>
&gt; itself, possibly enabled by optional device tree arguments/nodes, but =
I just want to<br>
&gt; send the patches out first to gather comments on perceived usefulness =
of<br>
&gt; the feature and how you think the driver should be constructed.<br>
<br>
</div></div>At least one issue I have with the implementation is that the s=
trap<br>
register is currently &quot;owned&quot; by the pinctrl driver, but the patc=
h as<br>
it stands has no interaction with this subsystem. Arguably the pinctrl<br>
driver is where this should be implemented, as it encapsulates pinmux<br>
whose aim is to manage the functionality made available on the SoC&#39;s<br=
>
pins.<br>
<br>
Currently the pinctrl driver treats the strapping register as read-<br>
only. That should probably change in light of what you&#39;re trying to do<=
br>
here, though only to the extent of allowing the SPI mode switch.<br>
<br>
Cheers,<br>
<br>
Andrew</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
">Regards,<div>Kun</div></div></div>
</div>

--94eb2c05543aba6f23053fa2ff6d--
