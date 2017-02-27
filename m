Return-Path: <raltherr@google.com>
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXF8M63r0zDqC0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 08:24:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vu480HMU"; 
 dkim-atps=neutral
Received: by mail-it0-x22f.google.com with SMTP id h10so66433728ith.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Feb 2017 13:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mg2yzybS6cw4cNBybiHoJctOeEbQXOthSoVeh7o/nJc=;
 b=vu480HMUN1lgfJ980Bxyd6L+gLWCeeOyetUjGZFCiHNR7sEqMmNCgoV8g4VgxfijkR
 VSM9Eiw7dDX+uokb3YdA/+gSSQMfv1UvrcsXJEjXU7zRqwTiejoI9r+xSq3X1ngCjYnw
 qCBCoYYBvlyC+svR6QMhp2QSvopiW/hhrsh/VViIGn5+E926qOTShHjPxYmbOdWHvqDI
 qqOGPOw0LILt0vgm3U6RzUrR9ZUiX1GYqAKEOz9SQt5prBrmbXxKIGpWxr7/HmNbu2Ds
 apa3y0EyV1BLcEigdQCsim8KtxI7BFK3B0DTRmyyD/Lfgh9GqnrnLFQX1sB+p97tuoJR
 HNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mg2yzybS6cw4cNBybiHoJctOeEbQXOthSoVeh7o/nJc=;
 b=TsAzyRlHRXdh0jUry48p/zJOAiaMU0Utyu9ZJMlR/VP4wojwrepInM4eFtWHIcV6M/
 64xagzD15wQj9asGm7kfQuaU7TmTA76GmUs1xJXQqaXBKUmhYMp2EuUqpeM8tp9l2lRn
 PM0oOHWIdiu4o4gGsz+pOMuy1VQiTBpVCUXhf++6O9ix+PNFLCdXdLmac6EY1CJcFl1j
 bbQQEn5R9kQro4PCfF/UovcbME+NCAmlkWcWAJ8F88+4tEyKlWVCDp3h7MwaUlBm9snl
 OWxHwaXKQxIEitU6FYidW8/212SahccWPoeYqtAMoX1+K8+f4B2iJxWzBHvUiolbFyFG
 OePw==
X-Gm-Message-State: AMke39kk5yPSrgQdub1HgFmQL9juSjREfB368cQQnIkpa1xI3et8h3BPYF2U7owO/6DonGSy/vYJjQMJxkDOvNJQ
X-Received: by 10.36.64.70 with SMTP id n67mr15511363ita.21.1488230657791;
 Mon, 27 Feb 2017 13:24:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Mon, 27 Feb 2017 13:24:17 -0800 (PST)
In-Reply-To: <58B496DD.7060207@raptorengineeringinc.com>
References: <1488134962.2850.11.camel@users.sourceforge.net>
 <CAPLgG=k8neY9VbJW624zvQO1SzXWPjza+xbUHnhWo4V94QuQmg@mail.gmail.com>
 <58B496DD.7060207@raptorengineeringinc.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 27 Feb 2017 13:24:17 -0800
Message-ID: <CAPLgG=k7ZW-vOKfE1JQxvzmzM=1__yPiY6kpL5TxET7fHV+uHg@mail.gmail.com>
Subject: Re: OT: Crowdfunding to port OpenBMC to Asus KGPE-D16
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Martin Roth <gaumless@gmail.com>
Content-Type: multipart/alternative; boundary=001a1135a57ab3e016054989b3f6
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
X-List-Received-Date: Mon, 27 Feb 2017 21:24:20 -0000

--001a1135a57ab3e016054989b3f6
Content-Type: text/plain; charset=UTF-8

I'm assuming the core work of booting u-boot and linux on the BMC used
on KGPE-D16
(AST2300?) is usable by both projects.  I'll gladly support bringup on a
new SoC as long as the patches are headed to mainline linux and u-boot.

AFAIK, the only limit on whether IBM OpenBMC can be used is the amount of
RAM and flash available.  My work on a Quanta Q71L has it booting on an
AST2400 with 128MB of RAM and 32MB of flash.

My concerns with contributing to the campaign are that I don't understand
what work is planned and where those changes will end up.

Rick

On Mon, Feb 27, 2017 at 1:15 PM, Timothy Pearson <
tpearson@raptorengineering.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 02/27/2017 03:01 PM, Rick Altherr wrote:
> > I replied to Raptor's tweet asking why they preferred Facebook's OpenBMC
> > over the IBM one. I find it odd that you are asking developers on the
> > latter to fund development for the former.
> >
> > Rick
>
> Perhaps I should clarify a bit.
>
> The KGPE-D16 uses an older ASpeed device not supported by either version
> of OpenBMC.  This ASpeed device is not only limited in computational
> power, but ASUS limited the device further in the board design to the
> point where we are not sure that the IBM OpenBMC will actually fit or
> work without hardware modifications (in fact, I am fairly certain
> hardware modifications would be required).  Given our past experience
> with crowdfunding efforts we prioritized the total project cost over the
> more expansive feature set of IBM's OpenBMC in order to get something
> functional into the community's hands.  We hope that once the larger
> community has had a chance to experience software freedom on the BMC
> level using lower-cost commercially available hardware that they will
> support the manufacturers (such as IBM) that are selling hardware with
> OpenBMC available.
>
> We have also added a stretch goal to the project to initiate a port of
> IBM's OpenBMC, built on the common code and reverse engineering efforts
> from the base Facebook port.  This process is expected to involve
> creating new hardware to replace the limited firmware module of the
> KGPE-D16, as well as integrating new x86-specific drivers into the
> upstream IBM OpenBMC tree.  Perhaps this stretch goal is more
> interesting to the members on this list?
>
> Thanks!
>
> - --
> Timothy Pearson
> Raptor Engineering
> +1 (415) 727-8645 (direct line)
> +1 (512) 690-0200 (switchboard)
> https://www.raptorengineering.com
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iQEcBAEBAgAGBQJYtJbaAAoJEK+E3vEXDOFbRJoIALLUZzWr7zmZCKivjaS32BA4
> nAPRVTfImuEuh1AD6zmFL6WlHjv3NNyMEuBdaZRv7xoizlhHL/ua0XeCFws8Qtyw
> 3VUHsRMB5THvzcie+ooDPv3GoBQPc4MW70ZuDs5VV0pzp2HcHSeoaiTgDpA6z0ga
> GyP4cbFvBwgid7pvMAA4I+LujpgQLdui19o8QhO26GA13KUQhEDoSzKWg5C7xJFz
> vgTCwrF1u1avuA5RIth9+aGzOOJxgeRwT8tDzEAuwS+cC7dZGP6KXGVGfPPb8Qir
> b9ZRU/4Q0Ig7QnLaDp/zeua9MWXLyCaUMaaCAhmmbMFbCdzQ75e5Z2R7JFSDj9E=
> =rGB+
> -----END PGP SIGNATURE-----
>

--001a1135a57ab3e016054989b3f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m assuming the core work of booting u-boot and =
linux on the BMC used on=C2=A0<span style=3D"font-size:12.8px">KGPE-D16 (AS=
T2300?) is usable by both projects.=C2=A0 I&#39;ll gladly support bringup o=
n a new SoC as long as the patches are headed to mainline linux and u-boot.=
</span></div><div><span style=3D"font-size:12.8px"><br></span></div><div>AF=
AIK, the only limit on whether IBM OpenBMC can be used is the amount of RAM=
 and flash available.=C2=A0 My work on a Quanta Q71L has it booting on an A=
ST2400 with 128MB of RAM and 32MB of flash.</div><div><br></div><div>My con=
cerns with contributing to the campaign are that I don&#39;t understand wha=
t work is planned and where those changes will end up.</div><div><br></div>=
<div>Rick</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Feb 27, 2017 at 1:15 PM, Timothy Pearson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:tpearson@raptorengineering.com" target=3D"_blank">tpearso=
n@raptorengineering.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<span class=3D""><br>
On 02/27/2017 03:01 PM, Rick Altherr wrote:<br>
&gt; I replied to Raptor&#39;s tweet asking why they preferred Facebook&#39=
;s OpenBMC<br>
&gt; over the IBM one. I find it odd that you are asking developers on the<=
br>
&gt; latter to fund development for the former.<br>
&gt;<br>
&gt; Rick<br>
<br>
</span>Perhaps I should clarify a bit.<br>
<br>
The KGPE-D16 uses an older ASpeed device not supported by either version<br=
>
of OpenBMC.=C2=A0 This ASpeed device is not only limited in computational<b=
r>
power, but ASUS limited the device further in the board design to the<br>
point where we are not sure that the IBM OpenBMC will actually fit or<br>
work without hardware modifications (in fact, I am fairly certain<br>
hardware modifications would be required).=C2=A0 Given our past experience<=
br>
with crowdfunding efforts we prioritized the total project cost over the<br=
>
more expansive feature set of IBM&#39;s OpenBMC in order to get something<b=
r>
functional into the community&#39;s hands.=C2=A0 We hope that once the larg=
er<br>
community has had a chance to experience software freedom on the BMC<br>
level using lower-cost commercially available hardware that they will<br>
support the manufacturers (such as IBM) that are selling hardware with<br>
OpenBMC available.<br>
<br>
We have also added a stretch goal to the project to initiate a port of<br>
IBM&#39;s OpenBMC, built on the common code and reverse engineering efforts=
<br>
from the base Facebook port.=C2=A0 This process is expected to involve<br>
creating new hardware to replace the limited firmware module of the<br>
KGPE-D16, as well as integrating new x86-specific drivers into the<br>
upstream IBM OpenBMC tree.=C2=A0 Perhaps this stretch goal is more<br>
interesting to the members on this list?<br>
<br>
Thanks!<br>
<br>
- --<br>
Timothy Pearson<br>
Raptor Engineering<br>
<a href=3D"tel:%2B1%20%28415%29%20727-8645" value=3D"+14157278645">+1 (415)=
 727-8645</a>=C2=A0(direct line)<br>
<a href=3D"tel:%2B1%20%28512%29%20690-0200" value=3D"+15126900200">+1 (512)=
 690-0200</a>=C2=A0(switchboard)<br>
<a href=3D"https://www.raptorengineering.com" rel=3D"noreferrer" target=3D"=
_blank">https://www.raptorengineering.<wbr>com</a><br>
-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1<br>
Comment: Using GnuPG with Mozilla - <a href=3D"http://enigmail.mozdev.org/"=
 rel=3D"noreferrer" target=3D"_blank">http://enigmail.mozdev.org/</a><br>
<br>
iQEcBAEBAgAGBQJYtJbaAAoJEK+<wbr>E3vEXDOFbRJoIALLUZzWr7zmZCKivj<wbr>aS32BA4<=
br>
nAPRVTfImuEuh1AD6zmFL6WlHjv3NN<wbr>yMEuBdaZRv7xoizlhHL/<wbr>ua0XeCFws8Qtyw<=
br>
3VUHsRMB5THvzcie+<wbr>ooDPv3GoBQPc4MW70ZuDs5VV0pzp2H<wbr>cHSeoaiTgDpA6z0ga<=
br>
GyP4cbFvBwgid7pvMAA4I+<wbr>LujpgQLdui19o8QhO26GA13KUQhEDo<wbr>SzKWg5C7xJFz<=
br>
vgTCwrF1u1avuA5RIth9+<wbr>aGzOOJxgeRwT8tDzEAuwS+<wbr>cC7dZGP6KXGVGfPPb8Qir<=
br>
b9ZRU/4Q0Ig7QnLaDp/<wbr>zeua9MWXLyCaUMaaCAhmmbMFbCdzQ7<wbr>5e5Z2R7JFSDj9E=
=3D<br>
=3DrGB+<br>
-----END PGP SIGNATURE-----<br>
</blockquote></div><br></div>

--001a1135a57ab3e016054989b3f6--
