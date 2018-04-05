Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bhteSgYX"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40H89N4ldFzF1pk
 for <openbmc@lists.ozlabs.org>; Fri,  6 Apr 2018 02:56:07 +1000 (AEST)
Received: by mail-io0-x241.google.com with SMTP id m83so31388152ioi.8
 for <openbmc@lists.ozlabs.org>; Thu, 05 Apr 2018 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Pb0QxMobvXMrfaUWrFVruvUsQ7/fy6N9Pn+N76tE6Zo=;
 b=bhteSgYXkGyXZlXdGY04eWm+RmRohxIUdhtgAF6LMwlrcHGDtHmOQtVTZxu2oBj2oT
 pEoftKiDmqs9ANz3q/gMOwZj4E+UPv2jsv5qT8X9dXDMrkScTbcG7bnLJ9NqYjbKjS7I
 r7udqwcIKLNei3k4jdzuVehvRR1O09eUODy2RrBBl/giOipKMfO/+UCw9+YIs97ISQbA
 5ND0W7iTiR/TX1CdqjTK5O7wLOJUGUj6aAR37mN/3HeK/HQRnUftc/VswClw9UkcKEQJ
 P8W4g69NLpGo8vtY/Kqj8LaEMEavfrFKfXRPVDApzpJCwvYaXhAJQikiJUPhVgs+bn7f
 uKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Pb0QxMobvXMrfaUWrFVruvUsQ7/fy6N9Pn+N76tE6Zo=;
 b=TAjyyhomMp3SR+HFjrvIqbqBEjNmd46AY0pqHMPRymHU2KloXeefzopsGGd/hFS+cb
 ad6yc8siGJZLDLrk/MQdx3g56LwtSgWxfc/ZjBBsvLIVDCe1m9zdOywi7zgWjesZmp75
 Ic7Jr/vDs/Vjp/hpaLEWz4B1X8RwTEzNktGxkzzzvHLP8qUUhnWT04FouycZ7199Qsdv
 Cmci9l0loOkXvjdLqtUIbhn1g6h4kYhrwQ2BYDKwt6/E1X3N3jpNWh2pNSadBk+rGN0q
 Zu/ntaQkP1h/wuLQEXd7G6NuQIZTjjVLYvjl6XKi0ouO4r7cF6ouaOnR3WyZvoWWHJvx
 Mukw==
X-Gm-Message-State: ALQs6tBMhWJWlqHrdvGAvMizm18dm5TUR+R6cTTozBlsrOgW3zslTE+P
 B34lTVHnjJnH3GEs6BK5MEEPS8WC+oYmy+qa2zs=
X-Google-Smtp-Source: AIpwx48O/eRNJRVgNvnf0xvCiZ5DVcVBY2O77q31xSv3W6krfbG0EyygYXic9QbxBkHnrAVZ9H4qIyHkz6MyR/1OjmU=
X-Received: by 10.107.200.204 with SMTP id y195mr4912iof.252.1522947365922;
 Thu, 05 Apr 2018 09:56:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.182.25 with HTTP; Thu, 5 Apr 2018 09:56:04 -0700 (PDT)
In-Reply-To: <CAK8P3a3HBkqgas-QkAr_J767ffBMXJTJeqqVY9fFxw2Yexi27g@mail.gmail.com>
References: <1521155412-29229-1-git-send-email-tmaimon77@gmail.com>
 <1521155412-29229-3-git-send-email-tmaimon77@gmail.com>
 <CAFd5g44NOFRmQbDJfRLw_SwsHwVB-hxsUYMYSmkqeyRKmXqSqQ@mail.gmail.com>
 <CAP6Zq1jvCvM+uG8kU_JAYzm9e3BG28AS80ANmn_0a0HmiVBm3A@mail.gmail.com>
 <CAK8P3a3HBkqgas-QkAr_J767ffBMXJTJeqqVY9fFxw2Yexi27g@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 5 Apr 2018 19:56:04 +0300
Message-ID: <CAP6Zq1j9i0Zdt3wPCGLLnPZJPGf8BaG9Nh1pLAsnwczqWHtthQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm: npcm: Enable L2 Cache in NPCM7xx
To: Arnd Bergmann <arnd@arndb.de>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Patrick Venture <venture@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Nancy Yuen <yuenn@google.com>
Content-Type: multipart/alternative; boundary="94eb2c0c1096c1eb8205691cd06e"
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
X-List-Received-Date: Thu, 05 Apr 2018 16:56:09 -0000

--94eb2c0c1096c1eb8205691cd06e
Content-Type: text/plain; charset="UTF-8"

On 5 April 2018 at 15:54, Arnd Bergmann <arnd@arndb.de> wrote:

> On Fri, Mar 16, 2018 at 10:51 PM, Tomer Maimon <tmaimon77@gmail.com>
> wrote:
> >
> >
> > On 16 March 2018 at 07:52, Brendan Higgins <brendanhiggins@google.com>
> > wrote:
> >>
> >> On Thu, Mar 15, 2018 at 4:16 PM Tomer Maimon <tmaimon77@gmail.com>
> wrote:
> >>
> >> > Enable L2 Cache in Nuvoton NPCM7xx BMC.
> >>
> >> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >> > ---
> >> >   arch/arm/mach-npcm/npcm7xx.c | 2 ++
> >> >   1 file changed, 2 insertions(+)
> >>
> >> > diff --git a/arch/arm/mach-npcm/npcm7xx.c
> b/arch/arm/mach-npcm/npcm7xx.c
> >> > index 5f7cd88103ef..c5f77d854c4f 100644
> >> > --- a/arch/arm/mach-npcm/npcm7xx.c
> >> > +++ b/arch/arm/mach-npcm/npcm7xx.c
> >> > @@ -17,4 +17,6 @@ static const char *const npcm7xx_dt_match[] = {
> >> >   DT_MACHINE_START(NPCM7XX_DT, "NPCM7XX Chip family")
> >> >          .atag_offset    = 0x100,
> >> >          .dt_compat      = npcm7xx_dt_match,
> >> > +       .l2c_aux_val    = 0x0,
> >> > +       .l2c_aux_mask   = ~0x0,
> >>
> >> You need to limit this to the specific bit(s) you want to set and verify
> >> that
> >> the l2c driver does not already manage that bit appropriately and that
> it
> >> can
> >> not be specified via the dtsi.
> >
> >
> > Do you mean that I need to specify it the same as been done in V7?
> > because when I run with the above l2c_aux_val and  l2c_aux_mask
> parameters I
> > get the same result.
> >
> > Also if I am not adding the l2c_aux_val and  l2c_aux_mask parameters to
> the
> > DT_MACHINE_START
> > the L2C cache does not initialize.
> >>
> >>
> >> We discussed this a little while ago with Rob here:
> >> https://www.spinics.net/lists/arm-kernel/msg613372.html
> >
> >
> > Sorry in this link I see only Russel king comment regarding the L2C
>
> I'm not sure what the outcome is, and the patch changelog doesn't
> explain what the patch is for, so I've not applied it. If you need the
> patch for correct operation, please resend it with a proper changelog
> comment explaining why it's needed and why you ended up not setting
> any of the bits.
>

Sorry for not explain it better,

It seems that I have to add l2c_aux_val, l2c_aux_mask parameters to the
DT_MACHINE_START
to enable the L2 Cache.

>
> The last email in that thread mentions
> L310_AUX_CTRL_CACHE_REPLACE_RR, is that required after all?
>

No it is not require this is why I added:
.l2c_aux_val    = 0x0,
.l2c_aux_mask   = ~0x0,



>
>      Arnd
>

Can I resend it on Sunday?

Thanks,

Tomer

--94eb2c0c1096c1eb8205691cd06e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 5 April 2018 at 15:54, Arnd Bergmann <span dir=3D"ltr">&lt;<a href=
=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd@arndb.de</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"=
h5">On Fri, Mar 16, 2018 at 10:51 PM, Tomer Maimon &lt;<a href=3D"mailto:tm=
aimon77@gmail.com">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 16 March 2018 at 07:52, Brendan Higgins &lt;<a href=3D"mailto:brend=
anhiggins@google.com">brendanhiggins@google.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Mar 15, 2018 at 4:16 PM Tomer Maimon &lt;<a href=3D"mailto=
:tmaimon77@gmail.com">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Enable L2 Cache in Nuvoton NPCM7xx BMC.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@g=
mail.com">tmaimon77@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 =C2=A0arch/arm/mach-npcm/npcm7xx.c | 2 ++<br>
&gt;&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; &gt; diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npc=
m/npcm7xx.c<br>
&gt;&gt; &gt; index 5f7cd88103ef..c5f77d854c4f 100644<br>
&gt;&gt; &gt; --- a/arch/arm/mach-npcm/npcm7xx.c<br>
&gt;&gt; &gt; +++ b/arch/arm/mach-npcm/npcm7xx.c<br>
&gt;&gt; &gt; @@ -17,4 +17,6 @@ static const char *const npcm7xx_dt_match[]=
 =3D {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0DT_MACHINE_START(NPCM7XX_DT, &quot;NPCM7XX Chip f=
amily&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .atag_offset=C2=A0 =C2=A0 =
=3D 0x100,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .dt_compat=C2=A0 =C2=A0 =C2=
=A0 =3D npcm7xx_dt_match,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.l2c_aux_val=C2=A0 =C2=A0 =3D 0x0=
,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.l2c_aux_mask=C2=A0 =C2=A0=3D ~0x=
0,<br>
&gt;&gt;<br>
&gt;&gt; You need to limit this to the specific bit(s) you want to set and =
verify<br>
&gt;&gt; that<br>
&gt;&gt; the l2c driver does not already manage that bit appropriately and =
that it<br>
&gt;&gt; can<br>
&gt;&gt; not be specified via the dtsi.<br>
&gt;<br>
&gt;<br>
&gt; Do you mean that I need to specify it the same as been done in V7?<br>
&gt; because when I run with the above l2c_aux_val and=C2=A0 l2c_aux_mask p=
arameters I<br>
&gt; get the same result.<br>
&gt;<br>
&gt; Also if I am not adding the l2c_aux_val and=C2=A0 l2c_aux_mask paramet=
ers to the<br>
&gt; DT_MACHINE_START<br>
&gt; the L2C cache does not initialize.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; We discussed this a little while ago with Rob here:<br>
&gt;&gt; <a href=3D"https://www.spinics.net/lists/arm-kernel/msg613372.html=
" rel=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/<wbr>a=
rm-kernel/msg613372.html</a><br>
&gt;<br>
&gt;<br>
&gt; Sorry in this link I see only Russel king comment regarding the L2C<br=
>
<br>
</div></div>I&#39;m not sure what the outcome is, and the patch changelog d=
oesn&#39;t<br>
explain what the patch is for, so I&#39;ve not applied it. If you need the<=
br>
patch for correct operation, please resend it with a proper changelog<br>
comment explaining why it&#39;s needed and why you ended up not setting<br>
any of the bits.<br></blockquote><div>=C2=A0</div><div>Sorry for not explai=
n it better,</div><div><br></div><div>It seems that I have to add=C2=A0<spa=
n style=3D"color:rgb(80,0,80)">l2c_aux_val,=C2=A0</span><span style=3D"colo=
r:rgb(80,0,80)">l2c_aux_mask parameters to the=C2=A0<span style=3D"color:rg=
b(80,0,80);font-family:arial,sans-serif;font-size:small;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">DT_MACHINE_START</span>

</span></div><div><span style=3D"color:rgb(80,0,80)"><span style=3D"color:r=
gb(80,0,80);font-family:arial,sans-serif;font-size:small;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">to enable the L2 Cache.</span></span></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
The last email in that thread mentions<br>
L310_AUX_CTRL_CACHE_REPLACE_<wbr>RR, is that required after all?<br></block=
quote><div><br></div><div>No it is not require this is why I added:</div><d=
iv><span style=3D"color:rgb(80,0,80)">.l2c_aux_val=C2=A0 =C2=A0 =3D 0x0,</s=
pan></div><div><span style=3D"color:rgb(80,0,80);font-family:arial,sans-ser=
if;font-size:small;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">.l2c_aux_mask=C2=A0 =C2=A0=3D ~0x0,=
</span></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0Arnd<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">Can I=
 resend it on Sunday?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Tomer</div></div>

--94eb2c0c1096c1eb8205691cd06e--
