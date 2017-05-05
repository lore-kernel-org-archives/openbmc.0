Return-Path: <raltherr@google.com>
Received: from mail-wr0-x235.google.com (mail-wr0-x235.google.com
 [IPv6:2a00:1450:400c:c0c::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKKYd2th4zDq5W
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 04:05:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XdPGqxMe"; 
 dkim-atps=neutral
Received: by mail-wr0-x235.google.com with SMTP id l50so7986876wrc.3
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 11:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=rDRLbtXP7zSdQaP0j90ugDSvZkNhTI5QQKUGG1wQBfc=;
 b=XdPGqxMej3pry2KaBS07KKlPSU0P40o09iFlbnfDiXJLn760s5w0TM50QxXpv7eNUx
 O2OChpqgtReW9e/HksttRXmoTN93ej/jOGQqWYWkgaO4ZG+KTcqZLJYynY69ggdGHqFy
 YPPSeiS1l1tcqoca7J0v9F3FSJkt5jM5gjWXUwFem0toPc+15pDoIQXX0sIng4E8pqSx
 tcuiB6jEIEGFjaceFV996v/cnNKmAm7CupE51LBqCfwpoWts1TXBFrFjU2GgD6CGuvt1
 ev4Utq3O10Zi9M/twD/eBC+bcY0i/HlGaKvPaj5JLh6vu0Rmeom+5D9VGKxNQsXBs6KR
 f7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=rDRLbtXP7zSdQaP0j90ugDSvZkNhTI5QQKUGG1wQBfc=;
 b=tKC891A8y2tIhv06u81sUOdYdmo0ppeVP2S1LbfCygX5tOy+YGjO3tqTBK7tjF59Vs
 FTLC/9Bzh1a7V8TUzGhThRNyAEVqPyCreSLTO1XLHIrH+Ky5es1k9IL61CZGBP9i3O03
 8b7FcTEfgAP/dJPPoP3RGLKCkWJAWZUC22KeCt94AfBigH/mtwzYkE0Ga+hUi9JNGnBn
 7X0/k5yK9GCVoTor3j2j/kb44zXK8wu/i8BJs1KNiQ6pVnjnVesneUpuIjf1MmySizIM
 tHipmcwJEFE0RKV8RYZ55r43gEwINc8aiIivuWAWLWTPKf1LilrBEsOYjtkieiSJXDOc
 oq9Q==
X-Gm-Message-State: AN3rC/7XcPuNjGBJ4M5ty5h6yRHsip5FceQZZI6kezn4Pa6Ct4FgQriM
 C2aGYDE2GT94xitRkqlwTDacSp5PHDye
X-Received: by 10.223.161.194 with SMTP id v2mr31928807wrv.132.1494007506322; 
 Fri, 05 May 2017 11:05:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.46.130 with HTTP; Fri, 5 May 2017 11:05:05 -0700 (PDT)
In-Reply-To: <20170505180239.GF25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
 <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
 <20170505174341.GE25937@heinlein.lan>
 <CAPLgG=m9S_4X=-Wvc8Uomhh7KBL5tBZn8A0Be9JTLZ=B-u+h5g@mail.gmail.com>
 <20170505180239.GF25937@heinlein.lan>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 5 May 2017 11:05:05 -0700
Message-ID: <CAPLgG=mXE4qz5PVRFupp3=ogcS4oe0bQfYKaEwesttUhdvb4Xw@mail.gmail.com>
Subject: Re: phosphor-hwmon bottleneck potential
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=f403045f2ed6b50dc7054ecaba1e
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
X-List-Received-Date: Fri, 05 May 2017 18:05:10 -0000

--f403045f2ed6b50dc7054ecaba1e
Content-Type: text/plain; charset=UTF-8

Jagha is currently on leave.

On Fri, May 5, 2017 at 11:02 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> Jaghu,
>
> Can you comment?  I'm looking at the version that was merged into Linus'
> master for 4.12:
>
> commit 2d7a548a3eff382da5cd743670693b7657327714
> Author: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> Date:   Tue Apr 4 17:52:41 2017 -0700
>
>     drivers: hwmon: Support for ASPEED PWM/Fan tach
>
>
> On Fri, May 05, 2017 at 10:48:39AM -0700, Rick Altherr wrote:
> > I can't comment on the driver implementation choices.  They have been
> > reviewed and accepted by upstream.  I'm not sure what version of the
> driver
> > you are looking at.
> >
> > On Fri, May 5, 2017 at 10:43 AM, Patrick Williams <patrick@stwcx.xyz>
> wrote:
> >
> > > Rick,
> > >
> > > On Fri, May 05, 2017 at 09:48:01AM -0700, Rick Altherr wrote:
> > > > I've chatted with Patrick V. separately about the driver.
> AST2400/2500
> > > fan
> > > > tach hardware measures only one fan at a time.  I think we can
> adjust the
> > > > driver settings to reduce the measurement time but it will scale
> with #
> > > of
> > > > tachs being read.
> > >
> > > I never looked at this driver before but it looks like it is doing an
> > > 'msleep' in the hwmon read path after resetting a counter register and
> > > then counting rotations?  Two comments:
> > >
> > > 1. As it stands, it doesn't appear that this driver is actually
> > > multi-reader safe (either thread or process).  There is no locking or
> > > queueing to prevent one reader from resetting the result register while
> > > another is performing the msleep loop.  Multi-threading might "go
> > > faster" but it will give entirely wrong results by my reading.
> > >
> > > 2. It seems bad to do a long-running msleep in the hwmon read path to
> > > begin with.  Should this driver be restructured to have a kthread read
> > > the channels in the background on a polling interval instead of
> > > initiating by userspace action?
> > >
> > > --
> > > Patrick Williams
> > >
>
> --
> Patrick Williams
>

--f403045f2ed6b50dc7054ecaba1e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Jagha is currently on leave.</div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Fri, May 5, 2017 at 11:02 AM, Patrick =
Williams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" target=
=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Jaghu,<br>
<br>
Can you comment?=C2=A0 I&#39;m looking at the version that was merged into =
Linus&#39;<br>
master for 4.12:<br>
<br>
commit 2d7a548a3eff382da5cd743670693b<wbr>7657327714<br>
Author: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"mailto:jaghu=
@google.com">jaghu@google.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Apr 4 17:52:41 2017 -0700<br>
<br>
=C2=A0 =C2=A0 drivers: hwmon: Support for ASPEED PWM/Fan tach<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Fri, May 05, 2017 at 10:48:39AM -0700, Rick Altherr wrote:<br>
&gt; I can&#39;t comment on the driver implementation choices.=C2=A0 They h=
ave been<br>
&gt; reviewed and accepted by upstream.=C2=A0 I&#39;m not sure what version=
 of the driver<br>
&gt; you are looking at.<br>
&gt;<br>
&gt; On Fri, May 5, 2017 at 10:43 AM, Patrick Williams &lt;<a href=3D"mailt=
o:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Rick,<br>
&gt; &gt;<br>
&gt; &gt; On Fri, May 05, 2017 at 09:48:01AM -0700, Rick Altherr wrote:<br>
&gt; &gt; &gt; I&#39;ve chatted with Patrick V. separately about the driver=
.=C2=A0 AST2400/2500<br>
&gt; &gt; fan<br>
&gt; &gt; &gt; tach hardware measures only one fan at a time.=C2=A0 I think=
 we can adjust the<br>
&gt; &gt; &gt; driver settings to reduce the measurement time but it will s=
cale with #<br>
&gt; &gt; of<br>
&gt; &gt; &gt; tachs being read.<br>
&gt; &gt;<br>
&gt; &gt; I never looked at this driver before but it looks like it is doin=
g an<br>
&gt; &gt; &#39;msleep&#39; in the hwmon read path after resetting a counter=
 register and<br>
&gt; &gt; then counting rotations?=C2=A0 Two comments:<br>
&gt; &gt;<br>
&gt; &gt; 1. As it stands, it doesn&#39;t appear that this driver is actual=
ly<br>
&gt; &gt; multi-reader safe (either thread or process).=C2=A0 There is no l=
ocking or<br>
&gt; &gt; queueing to prevent one reader from resetting the result register=
 while<br>
&gt; &gt; another is performing the msleep loop.=C2=A0 Multi-threading migh=
t &quot;go<br>
&gt; &gt; faster&quot; but it will give entirely wrong results by my readin=
g.<br>
&gt; &gt;<br>
&gt; &gt; 2. It seems bad to do a long-running msleep in the hwmon read pat=
h to<br>
&gt; &gt; begin with.=C2=A0 Should this driver be restructured to have a kt=
hread read<br>
&gt; &gt; the channels in the background on a polling interval instead of<b=
r>
&gt; &gt; initiating by userspace action?<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Patrick Williams<br>
&gt; &gt;<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--f403045f2ed6b50dc7054ecaba1e--
