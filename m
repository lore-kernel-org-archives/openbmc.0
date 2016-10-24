Return-Path: <kunyi@google.com>
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t2lN80YQ7zDvK4
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 05:35:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=gQ3U3gXx; 
 dkim-atps=neutral
Received: by mail-ua0-x235.google.com with SMTP id 90so18975806uan.2
 for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2016 11:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=by9s4JZ50O381v0AQ+asl4wGrYw1iq3RPLZrVG+xV88=;
 b=gQ3U3gXx8AHuTuhjDl44nJ/R/iB6BbTamM3xYKXDk36yvWPPNxszfcqJn1NwwFA1S5
 LUPEmU5k7AV/bSYnmucHNp5PHmoiz2oKaLnc9BW9MT2FQC2KTEuROqrYpxctGwGPftre
 LQK2wryJ/7CP0QOHek1J0dK9PjOvmoL1hq351YcG54bdhGfNLjiyli3L/JmgK1ftkQKl
 yJAFl25K8Wkf5TRg65DskuaT6BDSfQNhMVsqWS+ORYdKhhhfLG1vk7SuaYubRFrikqsq
 VPXxUJZ9eloBQi5pj/IOVJJXakzkI8pZecjOGxLNCBT7zi7SYfXDCWKV6CPf0ulKCuDP
 8uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=by9s4JZ50O381v0AQ+asl4wGrYw1iq3RPLZrVG+xV88=;
 b=hPrV7fa4mqbIWwxwtpL1gvFKxtn0Mlrr5viDER5AWBpi/ZJHrc4HEBgpedDlWutHEM
 7tmwiXVJREAmSkZRKSXTszU6y8bN+AziAM8cyYx6xCW0JC77G6/QFMU9oWnJlu7uSQcV
 IafBVV75DPrURYK3x8XXHxch0P7zwQpdbBZJQ9Ig1KP0nk1LN9q8LTPV+5hA6cpZZz2h
 hPHIJ7BdTAW1joa4/Earv3MBW4wcczxfVycY5demeQcU/yaodcSYNnIE+xR6hBE7iWQF
 R6vy0tizZB5ARuamJH3W3M2u5Mzk5femJ0C4BFGoRly1E4svmwuUzJuBtr2xpoyGLqpt
 sidQ==
X-Gm-Message-State: ABUngvdciO6n7BXaTjZovFlxsOi4/S3WobM52OYz9M7KXxCy2cq/Zgm+HkmXTv8EYh7EJpmRpepZtSx0HQ9+eYFA
X-Received: by 10.176.0.232 with SMTP id 95mr6188664uaj.32.1477334149289; Mon,
 24 Oct 2016 11:35:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.85.222 with HTTP; Mon, 24 Oct 2016 11:35:28 -0700 (PDT)
In-Reply-To: <CACPK8XfvnDMEpjZspR7mH-xusANYsvmhC4Y8PD0jOagXRMz=+w@mail.gmail.com>
References: <1477097158-139095-1-git-send-email-kunyi@google.com>
 <CACPK8XfvnDMEpjZspR7mH-xusANYsvmhC4Y8PD0jOagXRMz=+w@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 24 Oct 2016 11:35:28 -0700
Message-ID: <CAGMNF6UeeS=dg5UUywiGLod1X4Q9AEuJ5pUdx=bRNuat1bU=ig@mail.gmail.com>
Subject: Re: [RFC 0/2] spi: aspeed: SPI1 mode control driver enabling sysfs
 control
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
Content-Type: multipart/alternative; boundary=001a113e01f22f2496053fa0a976
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
X-List-Received-Date: Mon, 24 Oct 2016 18:35:54 -0000

--001a113e01f22f2496053fa0a976
Content-Type: text/plain; charset=UTF-8

Hi Joel, thanks for commenting!


On Sun, Oct 23, 2016 at 6:59 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hell Kun,
>
> On Sat, Oct 22, 2016 at 11:15 AM, Kun Yi <kunyi@google.com> wrote:
> > Hello,
> >
> > I'm looking for feedback on a simple Aspeed SPI1 mode control driver
> that does two things mainly:
> > 1. Expose a sysfs interface for userland control of SPI1 interface.
> > 2. Optionally override the SPI1 mode at probe if "start_mode" is
> configured in
> >    device tree.
>
> Why do you plan to override the mode at boot time? Is this for firmware
> updates?
>

More important here is the ability to change the SPI mode at *run time*.
One use case is for platforms without eSPI/LPC support. When host CPU is
booting and BIOS needs to read SPI chip, the most straightforward way for
BMC to allow host access to the SPI chip is to toggle to SPI pass-through
mode. Thus the core purpose of the driver is for enabling SPI pass-through
mode on demand.

Overriding the SPI mode at boot time is only to make sure the host SPI chip
can be recognized correctly by the SMC driver. Because currently pinctrl
treats HW strap as read-only, mis-configured HW strap pins will cause SMC
driver to fail reading SPI flash ID and not register it in MTD subsystem,
and there is no easy way to probe again later. Though enabling pinctrl to
set HW strap register might be a better approach as Andrew mentioned.


> We plan to move away from having the NOR flash accessible from both
> the host and the BMC for all platforms. There's no good way to
> indicate ownership, and the Linux mtd subsystem does not have a good
> way of relinquishing nor reestablishing control. For instance, there's
> no way to "unmount" the MTD device, and there's no way to force a
> re-scan of partitions if you modify the layout.
>

I saw some discussions related on IRC but wasn't clear about the details.
Could you elaborate a little? Do you plan to only allow BMC daemons to
access both host/BMC NOR flashes?

I got the impression that mtd will stick around for now. Do we have a time
frame for deprecating that?


> I think there are some issues with your approach that break
> pinctrl/pinmux that Andrew will highlight.
>

Sure I will reply to those in Andrew's email.


>
> Cheers,
>
> Joel
>
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
> >
> > Feedback greatly appreciated!
> >
> > Regards,
> > Kun
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>



-- 
Regards,
Kun

--001a113e01f22f2496053fa0a976
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel, thanks for commenting!<div><br><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Sun, Oct 23, 2016 at 6:59 PM, Jo=
el Stanley <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=
=3D"_blank">joel@jms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hell Kun,<br>
<span class=3D"m_-5664281760833887805m_-1177382596902210427gmail-"><br>
On Sat, Oct 22, 2016 at 11:15 AM, Kun Yi &lt;<a href=3D"mailto:kunyi@google=
.com" target=3D"_blank">kunyi@google.com</a>&gt; wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; I&#39;m looking for feedback on a simple Aspeed SPI1 mode control driv=
er that does two things mainly:<br>
&gt; 1. Expose a sysfs interface for userland control of SPI1 interface.<br=
>
&gt; 2. Optionally override the SPI1 mode at probe if &quot;start_mode&quot=
; is configured in<br>
&gt;=C2=A0 =C2=A0 device tree.<br>
<br>
</span>Why do you plan to override the mode at boot time? Is this for firmw=
are updates?<br></blockquote><div><br></div><div>More important here is the=
 ability to change the SPI mode at *run time*. One use case is for platform=
s without eSPI/LPC support. When host CPU is booting and BIOS needs to read=
 SPI chip, the most straightforward way for BMC to allow host access to the=
 SPI chip is to toggle to SPI pass-through mode. Thus the core purpose of t=
he driver is for enabling SPI pass-through mode on demand.<br></div><div><b=
r></div><div>Overriding the SPI mode at boot time is only to make sure the =
host SPI chip can be recognized correctly by the SMC driver. Because curren=
tly pinctrl treats HW strap as read-only, mis-configured HW strap pins will=
 cause SMC driver to fail reading SPI flash ID and not register it in MTD s=
ubsystem, and there is no easy way to probe again later. Though enabling pi=
nctrl to set HW strap register might be a better approach as Andrew mention=
ed.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
We plan to move away from having the NOR flash accessible from both<br>
the host and the BMC for all platforms. There&#39;s no good way to<br>
indicate ownership, and the Linux mtd subsystem does not have a good<br>
way of relinquishing nor reestablishing control. For instance, there&#39;s<=
br>
no way to &quot;unmount&quot; the MTD device, and there&#39;s no way to for=
ce a<br>
re-scan of partitions if you modify the layout.<br></blockquote><div><br></=
div><div>I saw some discussions related on IRC but wasn&#39;t clear about t=
he details. Could you elaborate a little? Do you plan to only allow BMC dae=
mons to access both host/BMC NOR flashes?</div><div><br></div><div>I got th=
e impression that mtd will stick around for now. Do we have a time frame fo=
r deprecating that?</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
I think there are some issues with your approach that break<br>
pinctrl/pinmux that Andrew will highlight.<br></blockquote><div><br></div><=
div>Sure I will reply to those in Andrew&#39;s email.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Joel<br>
<span class=3D"m_-5664281760833887805m_-1177382596902210427gmail-"><br>
&gt;<br>
&gt; Aspeed 24XX/25XX support three interface modes for their SPI1 interfac=
e,<br>
&gt; which can be configured via HW strap register. In the typical case of =
connecting<br>
&gt; a host flash chip SPI1 interface:<br>
&gt; - SPI master mode makes BMC the master to the host SPI flash<br>
&gt; - SPI pass-through mode make whichever external SPI interface connecte=
d to SYSSPI<br>
&gt;=C2=A0 =C2=A0be the master<br>
&gt; - There are also &quot;disable&quot; and &quot;debug&quot; modes. Aspe=
ed 25XX specified the debug<br>
&gt;=C2=A0 =C2=A0mode is reserved though.<br>
&gt;<br>
&gt; In particular, SPI pass-through mode would enable an external SPI mast=
er to<br>
&gt; directly program host SPI chip and possibly serve as an alternative wa=
y to LPC<br>
&gt; for host CPU accessing SPI flash. I think by providing a sysfs handle,=
 userspace<br>
&gt; applications can have a flexible way to mux host SPI flash ownership b=
etween<br>
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
&gt;<br>
&gt; Feedback greatly appreciated!<br>
&gt;<br>
&gt; Regards,<br>
&gt; Kun<br>
&gt;<br>
</span>&gt; ______________________________<wbr>_________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@=
lists.ozlabs.org</a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/listi<wbr>nfo/openbmc</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_-5664281760833887805m_-1177382596902210427gmail_signature"><div dir=
=3D"ltr">Regards,<div>Kun</div></div></div>
</div></div></div>

--001a113e01f22f2496053fa0a976--
