Return-Path: <raltherr@google.com>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXDdc5nXPzDqC0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 08:01:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ByoDBV1Y"; 
 dkim-atps=neutral
Received: by mail-it0-x231.google.com with SMTP id y135so76614976itc.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Feb 2017 13:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jTjNsjOq/lrbCaTmmVZLXZV1/1QlebXVZiGZqEM/daI=;
 b=ByoDBV1YU2OmKmwPmfTk1gR2tdgUI2LyH+3OSCRtZ7zbOJzARPvc8ZN/Oxnzn6o9YE
 seSxq7iOYOvOj3D9Z/TcARMlyeXCtav6g+hPqTiM/hDvpVPg+5mAPBYT9H9Yh9H0aD//
 ndooJpGG/uK/OQIf7F2GQgzBDrDQpFqQJGsN4GHVjWzRAbCST8cqzc8hKxAdAaB9g+fU
 qI18CQInGL++xC0vsQc8dXrP2jnJK3vSK+xhptv3HO+c2rV1oSMHK043kPStMPGMNECd
 pbbQMXuPKfuDjBX2cGBx1zPbjXY+X3mHzCMGL4BLF5IXKctT7nv2KYA0L4GhrtFXH8f2
 KgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jTjNsjOq/lrbCaTmmVZLXZV1/1QlebXVZiGZqEM/daI=;
 b=jHh3zNMlwCVLNoRcyPS1GiSoXXl6hrXOPtPYFs5/hpEhgp5hILxH93658L1OqKNZlO
 qY1F21HWmRo/0EeRa3Y6oxQxTsYfd+mIk1AtgQLvOAInNbqmGLYRHBkbAlk+WSgdtOzy
 U5xIp7E/59QRq0zhJqL5nWoGp78UxDpZgVCYRItb9eOgpwAh9ZYAHt2OgABAUvkOPqH3
 yH7gLRdKxHpXS8dfuMdXb4c91rLBMLUNmavcXdu0wVvGTObvc41+Q8I55M5c8IVoAqg2
 FNjeECz37OPz2PoONkRpS6dNqgKUtJmsF278+5ZEqp+VOsDvgtbzBGYZdtCSxV8+/V+f
 kowg==
X-Gm-Message-State: AMke39lB8nwW267Dmeur12i9JEwmylSiTKGcA4lEWQEfK3ewv/FOtvEiBWjCsf3cAyv/9dTBIGlbfjKe1BmYdWSe
X-Received: by 10.36.47.78 with SMTP id j75mr16038822itj.105.1488229266548;
 Mon, 27 Feb 2017 13:01:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Mon, 27 Feb 2017 13:01:06 -0800 (PST)
In-Reply-To: <1488134962.2850.11.camel@users.sourceforge.net>
References: <1488134962.2850.11.camel@users.sourceforge.net>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 27 Feb 2017 13:01:06 -0800
Message-ID: <CAPLgG=k8neY9VbJW624zvQO1SzXWPjza+xbUHnhWo4V94QuQmg@mail.gmail.com>
Subject: Re: OT: Crowdfunding to port OpenBMC to Asus KGPE-D16
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Martin Roth <gaumless@gmail.com>, 
 Timothy Pearson <tpearson@raptorengineeringinc.com>
Content-Type: multipart/alternative; boundary=001a1144db7cc773ad0549896055
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
X-List-Received-Date: Mon, 27 Feb 2017 21:01:09 -0000

--001a1144db7cc773ad0549896055
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I replied to Raptor's tweet asking why they preferred Facebook's OpenBMC
over the IBM one. I find it odd that you are asking developers on the
latter to fund development for the former.

Rick

On Sun, Feb 26, 2017 at 10:49 AM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> [Please CC me, as I am not subscribed.]
>
> Dear OpenBMC people,
>
>
> If you haven=E2=80=99t heard yet, there is a crowdfunding campaign going =
on to
> fund a port of OpenBMC to the Asus KGPE-D16 [1].
>
> The free firmware coreboot [2] runs on that board, and no BLOBs have to
> be used with it. Having OpenBMC run on that board, would be the last
> step, to have a fully free, owner-controlled server mainboard. I am
> citing a message from Timothy to the coreboot mailing list below from
> February 6th, 2017 [3].
>
> > As of today, we have $10,250 pledged out of $20,000 required to start
> > work on the OpenBMC support for KGPE-D16 systems using coreboot.  Rapto=
r
> > is, as before, contributing an additional $25,000+ toward development
> > should the $20,000 community goal be reached.
> >
> > If you would like to help get this port started, please contact Martin
> > Roth (gaumless@gmail.com) with information on what you would like to
> > pledge.  This offer is time limited; we are looking to end the offer in
> > the next month or so, so if this is something you would like to see
> > please step up and contribute something to this goal!
> >
> > As a general reminder, the KGPE-D16 is the last, most powerful
> > owner-controllable X86 workstation / server class machine available.  I=
t
> > is still in production along with its Opteron CPUs, so it occupies a
> > unique position in coreboot's tree.  Providing a libre BMC for this
> > system could help adoption of coreboot in server environments,
> > strengthening its position some in the market.
>
> As of today there are still $6,000 USD missing. As the coreboot
> community does not seem big enough to fund such a project, I am kindly
> asking you for support. If you can=E2=80=99t or don=E2=80=99t want to spe=
nd money, it=E2=80=99d
> be great if you could spread the word (Twitter message [4]).
>
>
> Thanks,
>
> Paul
>
>
> [1] https://www.raptorengineering.com/coreboot/kgpe-d16-bmc-port-offer.ph=
p
> [2] https://www.coreboot.org/
> [3] https://www.coreboot.org/pipermail/coreboot/2017-February/083176.html
> [4] https://twitter.com/RaptorEng/status/833738989840584704

--001a1144db7cc773ad0549896055
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I replied to Raptor&#39;s tweet asking why they preferred =
Facebook&#39;s OpenBMC over the IBM one. I find it odd that you are asking =
developers on the latter to fund development for the former.<div><br></div>=
<div>Rick</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Feb 26, 2017 at 10:49 AM, Paul Menzel <span dir=3D"ltr">&lt;<a =
href=3D"mailto:paulepanter@users.sourceforge.net" target=3D"_blank">paulepa=
nter@users.sourceforge.net</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">[Please CC me, as I am not subscribed.]<br>
<br>
Dear OpenBMC people,<br>
<br>
<br>
If you haven=E2=80=99t heard yet, there is a crowdfunding campaign going on=
 to<br>
fund a port of OpenBMC to the Asus KGPE-D16 [1].<br>
<br>
The free firmware coreboot [2] runs on that board, and no BLOBs have to<br>
be used with it. Having OpenBMC run on that board, would be the last<br>
step, to have a fully free, owner-controlled server mainboard. I am<br>
citing a message from Timothy to the coreboot mailing list below from<br>
February 6th, 2017 [3].<br>
<br>
&gt; As of today, we have $10,250 pledged out of $20,000 required to start<=
br>
&gt; work on the OpenBMC support for KGPE-D16 systems using coreboot.=C2=A0=
 Raptor<br>
&gt; is, as before, contributing an additional $25,000+ toward development<=
br>
&gt; should the $20,000 community goal be reached.<br>
&gt;<br>
&gt; If you would like to help get this port started, please contact Martin=
<br>
&gt; Roth (<a href=3D"mailto:gaumless@gmail.com">gaumless@gmail.com</a>) wi=
th information on what you would like to<br>
&gt; pledge.=C2=A0 This offer is time limited; we are looking to end the of=
fer in<br>
&gt; the next month or so, so if this is something you would like to see<br=
>
&gt; please step up and contribute something to this goal!<br>
&gt;<br>
&gt; As a general reminder, the KGPE-D16 is the last, most powerful<br>
&gt; owner-controllable X86 workstation / server class machine available.=
=C2=A0 It<br>
&gt; is still in production along with its Opteron CPUs, so it occupies a<b=
r>
&gt; unique position in coreboot&#39;s tree.=C2=A0 Providing a libre BMC fo=
r this<br>
&gt; system could help adoption of coreboot in server environments,<br>
&gt; strengthening its position some in the market.<br>
<br>
As of today there are still $6,000 USD missing. As the coreboot<br>
community does not seem big enough to fund such a project, I am kindly<br>
asking you for support. If you can=E2=80=99t or don=E2=80=99t want to spend=
 money, it=E2=80=99d<br>
be great if you could spread the word (Twitter message [4]).<br>
<br>
<br>
Thanks,<br>
<br>
Paul<br>
<br>
<br>
[1] <a href=3D"https://www.raptorengineering.com/coreboot/kgpe-d16-bmc-port=
-offer.php" rel=3D"noreferrer" target=3D"_blank">https://www.raptorengineer=
ing.<wbr>com/coreboot/kgpe-d16-bmc-<wbr>port-offer.php</a><br>
[2] <a href=3D"https://www.coreboot.org/" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.coreboot.org/</a><br>
[3] <a href=3D"https://www.coreboot.org/pipermail/coreboot/2017-February/08=
3176.html" rel=3D"noreferrer" target=3D"_blank">https://www.coreboot.org/<w=
br>pipermail/coreboot/2017-<wbr>February/083176.html</a><br>
[4]=C2=A0<a href=3D"https://twitter.com/RaptorEng/status/833738989840584704=
" rel=3D"noreferrer" target=3D"_blank">https://twitter.com/<wbr>RaptorEng/s=
tatus/<wbr>833738989840584704</a></blockquote></div><br></div>

--001a1144db7cc773ad0549896055--
