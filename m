Return-Path: <peterh@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=peterh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rBRWE3OO"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42QS7n0DqrzF37y
 for <openbmc@lists.ozlabs.org>; Thu,  4 Oct 2018 06:20:29 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id d9-v6so2935388ybr.12
 for <openbmc@lists.ozlabs.org>; Wed, 03 Oct 2018 13:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eqxqXebxw78ZqyngVtBy33nsMqFwVE2wbNDWQ5DW/ng=;
 b=rBRWE3OOaST7LHgXk5shOvpiiuqq18rg/X55+ryfzr4sPxcTjAJqr8co/BpLlWvpnu
 hwdVVxg8WCluyTshOSYTghwew+iYHNsZosRXBiFBBcV6dp7w8kOPsl4yuRpQwLvGpA8G
 iZXqYGWlTtQN0ehQZMKsBVf/zgaT2Qc17TlUDxWjR1CKnWfzqKGqGacSfRfhMHKRw5Or
 Qx1xu+JwOq+CXRFn1N/cLmCTWwSJ8SjwHqIGSYdqDuOWZDMf0AhYR2zp1sdq024ftAIt
 onEzju4nusia0SZtQtfoAs4W+175BVgbCohNsP43xksQcGfuFxTxlC8Eu7MvaAr8T/wX
 tg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqxqXebxw78ZqyngVtBy33nsMqFwVE2wbNDWQ5DW/ng=;
 b=lTzEeZGNo7nkse187GnrnAf4k+oC4rAFIlRxvqKrxH9535GEUidCRgooSs73hkNXh3
 oh8NXxLLh+1Ws9J4WWWmrhogjijQSgTD3gLSNilVdOseU2SfeJnpfs3CweMRkXFLuJS3
 Ow1vi/fewzDWmwJuyOhVWjKF7oh4iaHr/zgzYBmWh1IuFJMUXls+Y+LaYMEyak1gcAJH
 mLR/t2OQrTK9hoggH/x3WopPxGK7xUz2rsOuY2XYnGXcU1A6gsENxAnixpjit4nfj50x
 viDDYTgMesUq47TUgRoOY+DYq+2vV9beobtoTIFqTz7hP4bk1PMwIFG4FgSo/YL3Iv/H
 Yr6g==
X-Gm-Message-State: ABuFfoinLdQNS0S6SbHRKoCtgaR0KZ3Ily1wUMQWMoNJmNdxT18TEkaa
 cjjPhFRTDJAoMaxAZjPpmuw7L0sgQDtQrA4g7vDXew==
X-Google-Smtp-Source: ACcGV62HcBUOEUbJ/M1Z4xb68EX8Lc+uyJn8BD1GlGnVLr3vkq/6Z7Ock43nBZnvIc30KvryOkNaVfagpha1OkNmUDo=
X-Received: by 2002:a25:740b:: with SMTP id
 p11-v6mr1937678ybc.474.1538598025665; 
 Wed, 03 Oct 2018 13:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz0ibE=yZOtg4DE-onDDOWKHvPx_pRTp6OAH7JqRfH3dw@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993458541EA@ORSMSX114.amr.corp.intel.com>
 <CAO=notzzNBENF=Jk=dCA0xrX+oqGt886k6ir7d_EZhTBb6MwPg@mail.gmail.com>
In-Reply-To: <CAO=notzzNBENF=Jk=dCA0xrX+oqGt886k6ir7d_EZhTBb6MwPg@mail.gmail.com>
From: Peter Hanson <peterh@google.com>
Date: Wed, 3 Oct 2018 13:20:14 -0700
Message-ID: <CAPozSNrMyNG83ZggX7-UK4hmL0Xyx6JsiCUeJfrMTw-wMkcbsg@mail.gmail.com>
Subject: Re: OEM i2c over IPMI
To: Patrick Venture <venture@google.com>
Cc: ed.tanous@intel.com, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c6190a057758c4c7"
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
X-List-Received-Date: Wed, 03 Oct 2018 20:20:38 -0000

--000000000000c6190a057758c4c7
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 2, 2018 at 8:31 PM Patrick Venture <venture@google.com> wrote:

> +peterh@
>
> I believe it was a more flexible approach.
>
> Patrick
> On Tue, Oct 2, 2018 at 3:39 PM Tanous, Ed <ed.tanous@intel.com> wrote:
> >
> > > -----Original Message-----
> > > From: openbmc [mailto:openbmc-
> > > bounces+ed.tanous=intel.com@lists.ozlabs.org] On Behalf Of Patrick
> > > Venture
> > > Sent: Tuesday, October 2, 2018 1:00 PM
> > > To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > > Subject: OEM i2c over IPMI
> > >
> > > We have a linux kernel driver for i2c-via-ipmi that ties into
> > > https://gerrit.openbmc-project.xyz/12604 - I'm putting this upstream
> but
> > > since it's an IPMI OEM handler, it can nicely go into its own
> repository - I was
> > > curious if there was any OpenBMC interest?  If so, we can aim for the
> > > phosphor namespace, otherwise I'll just ask that it be pushed into a
> google
> > > repo.
> > >
> >
> > What does this command do that the existing master write-read command
> (section 22.11 of the IPMI spec) doesn't?
>

Kernel driver provides host side proxy for BMC bus. As such, it supports
*general* multi-step smbus/i2c transfers. E.g., pmbus devices with variable
read length.


> > I know on past systems we've offered the OEM I2C command to get around
> the 8 channel limit for the stock command.  I can't tell if that's the case
> with this one, but we should probably have a statement on exactly what
> we're trying to solve compared to the IPMI master write read.
>

Example use case: detect a card type, then instantiate implied Linux I2C
devices on the associated proxy bus for smbus to that slot.

Yes, also smashes 8 bus limit.


> > It should also be noted that master write-read opens up some pretty
> scary security scenarios, especially when done over IPMI.  We should
> probably make sure it's isolated to its own library so the high security
> systems can opt out of it if need be.
>

Oh, indeed! Should be restricted. (Root on local host, perhaps?) Suggest to
make it opt-in. With red hazard label if that can be done ;^)

Another down-side: i2c/smbus is already flakey and error prone in
interesting scenarios. (Something going wrong, trying to figure out what.)
Adding another protocol layer in the middle can hurt stability.

Arguably most useful as a bridging/prototyping tactic; then moving
interesting accesses into BMC for better stability at volume.


> > -Ed
>

--000000000000c6190a057758c4c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 2,=
 2018 at 8:31 PM Patrick Venture &lt;<a href=3D"mailto:venture@google.com">=
venture@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+=
peterh@<br>
<br>
I believe it was a more flexible approach.<br>
<br>
Patrick<br>
On Tue, Oct 2, 2018 at 3:39 PM Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@i=
ntel.com" target=3D"_blank">ed.tanous@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: openbmc [mailto:<a href=3D"mailto:openbmc-" target=3D"_blan=
k">openbmc-</a><br>
&gt; &gt; bounces+ed.tanous=3D<a href=3D"mailto:intel.com@lists.ozlabs.org"=
 target=3D"_blank">intel.com@lists.ozlabs.org</a>] On Behalf Of Patrick<br>
&gt; &gt; Venture<br>
&gt; &gt; Sent: Tuesday, October 2, 2018 1:00 PM<br>
&gt; &gt; To: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.o=
rg" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt; &gt; Subject: OEM i2c over IPMI<br>
&gt; &gt;<br>
&gt; &gt; We have a linux kernel driver for i2c-via-ipmi that ties into<br>
&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/12604" rel=3D"noref=
errer" target=3D"_blank">https://gerrit.openbmc-project.xyz/12604</a> - I&#=
39;m putting this upstream but<br>
&gt; &gt; since it&#39;s an IPMI OEM handler, it can nicely go into its own=
 repository - I was<br>
&gt; &gt; curious if there was any OpenBMC interest?=C2=A0 If so, we can ai=
m for the<br>
&gt; &gt; phosphor namespace, otherwise I&#39;ll just ask that it be pushed=
 into a google<br>
&gt; &gt; repo.<br>
&gt; &gt;<br>
&gt;<br>
&gt; What does this command do that the existing master write-read command =
(section 22.11 of the IPMI spec) doesn&#39;t?<br>
</blockquote><div><br></div><div><div>Kernel driver provides host side prox=
y for BMC bus. As such, it supports *general* multi-step smbus/i2c transfer=
s. E.g., pmbus devices with variable read length.</div></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
&gt; I know on past systems we&#39;ve offered the OEM I2C command to get ar=
ound the 8 channel limit for the stock command.=C2=A0 I can&#39;t tell if t=
hat&#39;s the case with this one, but we should probably have a statement o=
n exactly what we&#39;re trying to solve compared to the IPMI master write =
read.<br>
</blockquote><div><br></div><div>Example use case: detect a card type, then=
 instantiate implied Linux I2C devices on the associated proxy bus for smbu=
s to that slot.</div><div><br></div><div>Yes, also smashes 8 bus limit.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; It should also be noted that master write-read opens up some pretty sc=
ary security scenarios, especially when done over IPMI.=C2=A0 We should pro=
bably make sure it&#39;s isolated to its own library so the high security s=
ystems can opt out of it if need be.<br>
</blockquote><div><br></div><div>Oh, indeed! Should be restricted. (Root on=
 local host, perhaps?) Suggest to make it opt-in. With red hazard label if =
that can be done ;^)</div><div><br></div><div>Another down-side: i2c/smbus =
is already flakey and error prone in interesting scenarios. (Something goin=
g wrong, trying to figure out what.) Adding another protocol layer in the m=
iddle can hurt stability.</div><div><br></div><div>Arguably most useful as =
a bridging/prototyping tactic; then moving interesting accesses into BMC fo=
r better stability at volume.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
&gt; -Ed<br>
</blockquote></div></div>

--000000000000c6190a057758c4c7--
