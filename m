Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::243; helo=mail-io0-x243.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PMoYRGjx"; 
 dkim-atps=neutral
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 402zh32Sv2zF116
 for <openbmc@lists.ozlabs.org>; Sat, 17 Mar 2018 08:52:02 +1100 (AEDT)
Received: by mail-io0-x243.google.com with SMTP id o4so23848iod.3
 for <openbmc@lists.ozlabs.org>; Fri, 16 Mar 2018 14:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=LK1f54VLhexn0gIhpZh3mku3Zh07BDbKDrWXKuEOjFY=;
 b=PMoYRGjxGL2qgxcaOsZfiQFDORy8dzEqa0u6obm5URCfy0ee0sw8uwEDXj356yhUxc
 /Vf6YqxKcLEoqXyd0K3PqJPrcOXtqATQ6aD0tsuhRF7AyrPTZMvL00SpYXxXMxK3dq2u
 qiOHgi6DGoyxuzyYl7r+Bo7LSonXA4CvQQMkwf8bL8xBSeb/kjNWjlUMjyyDz+mnA5mD
 SO4q47pjidCChXN5BOfRD0WOM5lrdTRy7XOumwscfIkNF7cBPJRVRxr6e86KH67mE2eZ
 ySM2uotXyFfGTxuvObRtmrysSugQw5O3U0GdB+bG1FXZC1w8+Q+xc+vbdTe9Yhep5Bsl
 2GGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=LK1f54VLhexn0gIhpZh3mku3Zh07BDbKDrWXKuEOjFY=;
 b=nm776HAout42/O6FXwSSxuoA4VNJXg+gkt344/TimXbvH/TtQI27l5i0w2qjtlxRWd
 Pma2oa1jk2lCTi4+B8ZeAqxxmD8AO1lUaYn/oqKYWYDNepjVytW5aAh+DzuQ+6FmNpW6
 BL6iisJMyIYRZr+DpUOgoLqZA7VL+dpEbUtQE5SsZmJx1iiAWDa7BhSwFqi8ibbR73t1
 xA49KJcCt5pfEBvbIyxPRmw8xtmiS0l3e7He25i+8nU5zmxD3CCwJ8+0lhLMi8O+PS/H
 T/OHMDrYPRUnEBSSJCxAJ/0wzclq/tPdbZO8xt967zkdATRGu1dI5dGDvmZzAjpb3yBu
 3TnQ==
X-Gm-Message-State: AElRT7FmoWQaWi300R28gfyRhimivGW7SlViv/lkvCp3RJ1N9Xn3uEUH
 qGjDrXyxVMi5rCAhsOTHszwDt5VwhCFYpq7XUXc=
X-Google-Smtp-Source: AG47ELuQksnk8xLQi5vhZbq8yytfVRRFqHOtcEKFufDfM6oVKdBt9EMxanLyrFiabNyCYJ8c38E0uG78T8Jc8+oksoM=
X-Received: by 10.107.164.132 with SMTP id d4mr3617892ioj.287.1521237120408;
 Fri, 16 Mar 2018 14:52:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.182.25 with HTTP; Fri, 16 Mar 2018 14:51:59 -0700 (PDT)
In-Reply-To: <CAFd5g44NOFRmQbDJfRLw_SwsHwVB-hxsUYMYSmkqeyRKmXqSqQ@mail.gmail.com>
References: <1521155412-29229-1-git-send-email-tmaimon77@gmail.com>
 <1521155412-29229-3-git-send-email-tmaimon77@gmail.com>
 <CAFd5g44NOFRmQbDJfRLw_SwsHwVB-hxsUYMYSmkqeyRKmXqSqQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 16 Mar 2018 23:51:59 +0200
Message-ID: <CAP6Zq1jvCvM+uG8kU_JAYzm9e3BG28AS80ANmn_0a0HmiVBm3A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm: npcm: Enable L2 Cache in NPCM7xx
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Patrick Venture <venture@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Nancy Yuen <yuenn@google.com>
Content-Type: multipart/alternative; boundary="001a1141db782e623f05678e9ee7"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2018 21:52:04 -0000

--001a1141db782e623f05678e9ee7
Content-Type: text/plain; charset="UTF-8"

On 16 March 2018 at 07:52, Brendan Higgins <brendanhiggins@google.com>
wrote:

> On Thu, Mar 15, 2018 at 4:16 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > Enable L2 Cache in Nuvoton NPCM7xx BMC.
>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >   arch/arm/mach-npcm/npcm7xx.c | 2 ++
> >   1 file changed, 2 insertions(+)
>
> > diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
> > index 5f7cd88103ef..c5f77d854c4f 100644
> > --- a/arch/arm/mach-npcm/npcm7xx.c
> > +++ b/arch/arm/mach-npcm/npcm7xx.c
> > @@ -17,4 +17,6 @@ static const char *const npcm7xx_dt_match[] = {
> >   DT_MACHINE_START(NPCM7XX_DT, "NPCM7XX Chip family")
> >          .atag_offset    = 0x100,
> >          .dt_compat      = npcm7xx_dt_match,
> > +       .l2c_aux_val    = 0x0,
> > +       .l2c_aux_mask   = ~0x0,
>
> You need to limit this to the specific bit(s) you want to set and verify
> that
> the l2c driver does not already manage that bit appropriately and that it
> can
> not be specified via the dtsi.
>

Do you mean that I need to specify it the same as been done in V7?
because when I run with the above l2c_aux_val and  l2c_aux_mask parameters
I get the same result.

Also if I am not adding the l2c_aux_val and  l2c_aux_mask parameters to
the  DT_MACHINE_START
the L2C cache does not initialize.

>
> We discussed this a little while ago with Rob here:
> https://www.spinics.net/lists/arm-kernel/msg613372.html


Sorry in this link I see only Russel king comment regarding the L2C

>
>
> >   MACHINE_END
> > --
> > 2.14.1
>
>
> Cheers
>

Cheers

--001a1141db782e623f05678e9ee7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 16 March 2018 at 07:52, Brendan Higgins <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:brendanhiggins@google.com" target=3D"_blank">brendanhiggins@goo=
gle.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Th=
u, Mar 15, 2018 at 4:16 PM Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gma=
il.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Enable L2 Cache in Nuvoton NPCM7xx BMC.<br>
<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0arch/arm/mach-npcm/npcm7xx.c | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
<br>
&gt; diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx=
.c<br>
&gt; index 5f7cd88103ef..c5f77d854c4f 100644<br>
&gt; --- a/arch/arm/mach-npcm/npcm7xx.c<br>
&gt; +++ b/arch/arm/mach-npcm/npcm7xx.c<br>
&gt; @@ -17,4 +17,6 @@ static const char *const npcm7xx_dt_match[] =3D {<br=
>
&gt;=C2=A0 =C2=A0DT_MACHINE_START(NPCM7XX_DT, &quot;NPCM7XX Chip family&quo=
t;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .atag_offset=C2=A0 =C2=A0 =3D 0x100,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .dt_compat=C2=A0 =C2=A0 =C2=A0 =3D n=
pcm7xx_dt_match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.l2c_aux_val=C2=A0 =C2=A0 =3D 0x0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.l2c_aux_mask=C2=A0 =C2=A0=3D ~0x0,<br>
<br>
</span>You need to limit this to the specific bit(s) you want to set and ve=
rify<br>
that<br>
the l2c driver does not already manage that bit appropriately and that it<b=
r>
can<br>
not be specified via the dtsi.<br></blockquote><div><br></div><div>Do you m=
ean that I need to specify it the same as been done in V7?</div><div>becaus=
e when I run with the above <span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;text-decoration-style:initial;text-decoration-color:initial;backgro=
und-color:rgb(255,255,255);float:none;display:inline">l2c_aux_val and=C2=A0=
<span>=C2=A0</span><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">l2c_aux_mask parameters</span>=
</span>

 I get the same result.</div><div><br></div><div>Also if I am not adding th=
e=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">l2c_aux_val and=C2=A0

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">l2c_aux_mask parameters to the=C2=A0

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">DT_MACHINE_START</span>

</span></span><br></div><div><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">the L2C cache does not initialize.=C2=A0</span></span></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
We discussed this a little while ago with Rob here:<br>
<a href=3D"https://www.spinics.net/lists/arm-kernel/msg613372.html" rel=3D"=
noreferrer" target=3D"_blank">https://www.spinics.net/lists/<wbr>arm-kernel=
/msg613372.html</a></blockquote><div><br></div><div>Sorry in this link I se=
e only Russel king comment regarding the L2C=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
<br>
&gt;=C2=A0 =C2=A0MACHINE_END<br>
&gt; --<br>
&gt; 2.14.1<br>
<br>
<br>
Cheers<br></blockquote><div><br></div><div>Cheers=C2=A0</div></div><br></di=
v></div>

--001a1141db782e623f05678e9ee7--
