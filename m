Return-Path: <raltherr@google.com>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com
 [IPv6:2a00:1450:400c:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKLc34ZKqzDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 04:52:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eBMep6WN"; 
 dkim-atps=neutral
Received: by mail-wm0-x235.google.com with SMTP id b84so1287585wmh.0
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=m8JHUGU6RVRz+UbDx/R93CIpNWjnjN03pmDG/gs0tm4=;
 b=eBMep6WNBfCwgnlQbUJF5X6YSXONTTSjB3EI+6FhjtfyH9dZa5dQbFryOYCZcO24Kf
 yHZlu0KcJT1Lpa2LyOfb500L2rLYIaESBQDCVqtK/YZ7RQ+DRUZUt+HLOFiAEFHy2gIj
 H/23cZ7i4HTJSscXhul2jwYXtoExnPF9vFI4BX8wCnln1hrfanA4R++tOl67ZmyijlZO
 s7ABJzgc3TwsGA6N/rdaQtSG+u4ZqU3kwsAFD03xNL+zWIdlyxV7bSnMp9uGRAs7SjsC
 BWIL/TJNuKB9tdC8cYrqnWMDBMsPvj/BNSPb3mCdyIZfsV4xuFivo0Vz2QYspPd3F6Eh
 KgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=m8JHUGU6RVRz+UbDx/R93CIpNWjnjN03pmDG/gs0tm4=;
 b=CR+B0FqwLO1FK0CYR+ErVKjTA0d/Ll3aFia2GTKcYuYIZOESYTHU7EOlCCgpIyMrsy
 BOgPcFuFBQbJOs2l8ythfB7LYOjlmr3d+VFlnOdRGsw5RU55Jh2129COxLRaaml++89M
 lVEoRu0DUZej0RFEzj7VFsQZwltNFZfw8G13+bjdgJg02h9s2vAEr72OGgxsUbTVQ5Fb
 8Ilseu2tt0kNQT6fhjDXBeOpMqv4On6Fqh3ya18mOUBFXB5mpaQJPOepx27gcb/w9UXA
 EvJKNL6iggWFt2PdR03lHLBMRHmkwMGZJioAKQrvIcLu4shgVrigMfvoi+0hKYDByZLR
 hVZQ==
X-Gm-Message-State: AN3rC/7A9OGbg4RBHES5YEpRcq3+cVFsDdB/jOIH8qBheawCgJU4rTLy
 sa5AQJy46s5CHggJ7YApgthpZTtDxTly
X-Received: by 10.28.206.70 with SMTP id e67mr5827642wmg.37.1494010336438;
 Fri, 05 May 2017 11:52:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.46.130 with HTTP; Fri, 5 May 2017 11:52:15 -0700 (PDT)
In-Reply-To: <CADfYTpGfqgKP-HWg54mXnw7qc0wtPqfE=ZicZrCo_WsOJiQc7g@mail.gmail.com>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
 <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
 <20170505174341.GE25937@heinlein.lan>
 <CAPLgG=m9S_4X=-Wvc8Uomhh7KBL5tBZn8A0Be9JTLZ=B-u+h5g@mail.gmail.com>
 <20170505180239.GF25937@heinlein.lan>
 <CAPLgG=mXE4qz5PVRFupp3=ogcS4oe0bQfYKaEwesttUhdvb4Xw@mail.gmail.com>
 <CADfYTpGfqgKP-HWg54mXnw7qc0wtPqfE=ZicZrCo_WsOJiQc7g@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 5 May 2017 11:52:15 -0700
Message-ID: <CAPLgG=mTXTh-Pa_T2y2SxpOis4Y9aWz0shkzz7pH+iyB7BWBFA@mail.gmail.com>
Subject: Re: phosphor-hwmon bottleneck potential
To: Nancy Yuen <yuenn@google.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, 
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary=94eb2c1930b465712b054ecb6307
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
X-List-Received-Date: Fri, 05 May 2017 18:52:20 -0000

--94eb2c1930b465712b054ecb6307
Content-Type: text/plain; charset=UTF-8

Re #2: timestamps lose value as they shift away from the time of the actual
measurement.  Ideally, the hardware would timestamp the sample, hwmon would
preserve and provide that timestamp to the userspace.

On Fri, May 5, 2017 at 11:37 AM, Nancy Yuen <yuenn@google.com> wrote:

> 1. General design issue if time between reads of a sensor is dependent on
> the number of sensors in the system.  And drivers can fail, due to miss
> behaving code or hardware.  In this design, sensor report could be
> significantly delayed if one sensor/driver were bad or misbehaving.
>
> 2. So putting the onus on each application to implement timestamps is
> better design than having timestamps recorded by a central source, the
> source that actually is reading from the driver?
>
> ----------
> Nancy
>
> On Fri, May 5, 2017 at 11:05 AM, Rick Altherr <raltherr@google.com> wrote:
>
>> Jagha is currently on leave.
>>
>> On Fri, May 5, 2017 at 11:02 AM, Patrick Williams <patrick@stwcx.xyz>
>> wrote:
>>
>>> Jaghu,
>>>
>>> Can you comment?  I'm looking at the version that was merged into Linus'
>>> master for 4.12:
>>>
>>> commit 2d7a548a3eff382da5cd743670693b7657327714 <(765)%20732-7714>
>>> Author: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
>>> Date:   Tue Apr 4 17:52:41 2017 -0700
>>>
>>>     drivers: hwmon: Support for ASPEED PWM/Fan tach
>>>
>>>
>>> On Fri, May 05, 2017 at 10:48:39AM -0700, Rick Altherr wrote:
>>> > I can't comment on the driver implementation choices.  They have been
>>> > reviewed and accepted by upstream.  I'm not sure what version of the
>>> driver
>>> > you are looking at.
>>> >
>>> > On Fri, May 5, 2017 at 10:43 AM, Patrick Williams <patrick@stwcx.xyz>
>>> wrote:
>>> >
>>> > > Rick,
>>> > >
>>> > > On Fri, May 05, 2017 at 09:48:01AM -0700, Rick Altherr wrote:
>>> > > > I've chatted with Patrick V. separately about the driver.
>>> AST2400/2500
>>> > > fan
>>> > > > tach hardware measures only one fan at a time.  I think we can
>>> adjust the
>>> > > > driver settings to reduce the measurement time but it will scale
>>> with #
>>> > > of
>>> > > > tachs being read.
>>> > >
>>> > > I never looked at this driver before but it looks like it is doing an
>>> > > 'msleep' in the hwmon read path after resetting a counter register
>>> and
>>> > > then counting rotations?  Two comments:
>>> > >
>>> > > 1. As it stands, it doesn't appear that this driver is actually
>>> > > multi-reader safe (either thread or process).  There is no locking or
>>> > > queueing to prevent one reader from resetting the result register
>>> while
>>> > > another is performing the msleep loop.  Multi-threading might "go
>>> > > faster" but it will give entirely wrong results by my reading.
>>> > >
>>> > > 2. It seems bad to do a long-running msleep in the hwmon read path to
>>> > > begin with.  Should this driver be restructured to have a kthread
>>> read
>>> > > the channels in the background on a polling interval instead of
>>> > > initiating by userspace action?
>>> > >
>>> > > --
>>> > > Patrick Williams
>>> > >
>>>
>>> --
>>> Patrick Williams
>>>
>>
>>
>

--94eb2c1930b465712b054ecb6307
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Re #2: timestamps lose value as they shift away from the t=
ime of the actual measurement.=C2=A0 Ideally, the hardware would timestamp =
the sample, hwmon would preserve and provide that timestamp to the userspac=
e.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, M=
ay 5, 2017 at 11:37 AM, Nancy Yuen <span dir=3D"ltr">&lt;<a href=3D"mailto:=
yuenn@google.com" target=3D"_blank">yuenn@google.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">1. General design issue =
if time between reads of a sensor is dependent on the number of sensors in =
the system.=C2=A0 And drivers can fail, due to miss behaving code or hardwa=
re.=C2=A0 In this design, sensor report could be significantly delayed if o=
ne sensor/driver were bad or misbehaving.<div><br></div><div>2. So putting =
the onus on each application to implement timestamps is better design than =
having timestamps recorded by a central source, the source that actually is=
 reading from the driver?</div></div><div class=3D"gmail_extra"><br clear=
=3D"all"><div><div class=3D"m_7723034924305096455gmail_signature" data-smar=
tmail=3D"gmail_signature">----------<br>Nancy</div></div><div><div class=3D=
"h5">
<br><div class=3D"gmail_quote">On Fri, May 5, 2017 at 11:05 AM, Rick Alther=
r <span dir=3D"ltr">&lt;<a href=3D"mailto:raltherr@google.com" target=3D"_b=
lank">raltherr@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">Jagha is currently on leave.</div><div class=3D"m_7=
723034924305096455HOEnZb"><div class=3D"m_7723034924305096455h5"><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, May 5, 2017 at 11:0=
2 AM, Patrick Williams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwc=
x.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Jaghu,<br>
<br>
Can you comment?=C2=A0 I&#39;m looking at the version that was merged into =
Linus&#39;<br>
master for 4.12:<br>
<br>
commit 2d7a548a3eff382da5cd743670693b<a href=3D"tel:(765)%20732-7714" value=
=3D"+17657327714" target=3D"_blank"><wbr>7657327714</a><br>
Author: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"mailto:jaghu=
@google.com" target=3D"_blank">jaghu@google.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Apr 4 17:52:41 2017 -0700<br>
<br>
=C2=A0 =C2=A0 drivers: hwmon: Support for ASPEED PWM/Fan tach<br>
<div class=3D"m_7723034924305096455m_-3791221182464829462HOEnZb"><div class=
=3D"m_7723034924305096455m_-3791221182464829462h5"><br>
<br>
On Fri, May 05, 2017 at 10:48:39AM -0700, Rick Altherr wrote:<br>
&gt; I can&#39;t comment on the driver implementation choices.=C2=A0 They h=
ave been<br>
&gt; reviewed and accepted by upstream.=C2=A0 I&#39;m not sure what version=
 of the driver<br>
&gt; you are looking at.<br>
&gt;<br>
&gt; On Fri, May 5, 2017 at 10:43 AM, Patrick Williams &lt;<a href=3D"mailt=
o:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt; wrote:<br>
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
</div></div><span class=3D"m_7723034924305096455m_-3791221182464829462HOEnZ=
b"><font color=3D"#888888">--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--94eb2c1930b465712b054ecb6307--
