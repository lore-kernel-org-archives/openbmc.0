Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::236; helo=mail-vk0-x236.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MlsGm/eo"; 
 dkim-atps=neutral
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7wq56gDwzDqhg
 for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2017 03:59:42 +1100 (AEDT)
Received: by mail-vk0-x236.google.com with SMTP id g69so9988543vke.5
 for <openbmc@lists.ozlabs.org>; Fri, 06 Oct 2017 09:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JbSyYgcQi8FDu0ARkGcAKYXHiU/XB8PCpznhbjYMphw=;
 b=MlsGm/eoOZH/N1YbavCCf0ebqXW7HLCbjk0H1LQUYAwqTj048OsE9sz07KGjkNcRUl
 DlYWY3IfyOC9yM6xKdSV58dIUZLLHTVPhQiHrBTZ1OruXOgwbDIuUXB7w7hEcq/Qbzur
 pnS78yd+u15E1xhl/561tG0JjU98YqhogSlGDIdhqUCoLFcpNm63M42RXgp1AR0b5FTX
 ZayLRZOTnhOKUyUZ5JnykealvSEhwFSvATF3pQDp/pNU/93Z5Pcn5D+7dSLhCxmkXl82
 hJr21z2bYuUlXWb/MowYZFr8YJf5oOIYVVPFtRgR2diTavIW1xCR7ouAM1vQM04Ad1nB
 6tbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JbSyYgcQi8FDu0ARkGcAKYXHiU/XB8PCpznhbjYMphw=;
 b=D7/Ehw7tpLql2QcBjmARvMW1F8s5IsfgpyW6EvJxfOy5cSG4S++LkfFhLGhn8bN2Nf
 Ycoq1xbuksOyQ1rHwb4MIjZWdotL2nNvIHAUkQ/3at4U6flubydU4+ec+lcXkrTtuUBx
 hh5+5Map6TltyVYfR6YK+ySZGIuV2DSA6XvV9kNU2//8Yt4oIcsyWzYVI3TatxQzsl7a
 g3iPpDRblHrhY4yNtMjz/f+rQBo4EUQsxBDmx3Sbpn1JyHDtZT4MkGBIKRWoNjnI6w7A
 aVZaUf0whk6ZWaudZXajGDM0vYe+55B91DjIb5lGMotfMdvqW4wRqHx9x8vGNpDpZBov
 riaA==
X-Gm-Message-State: AMCzsaVszGw9EmLKWFbre5HggD2BClrgdVnXnsGt82oNRAHy/g2AoBK9
 FwR/UOhM4tMgey0yjOshyPeU62EqF8eQsmLbmflINg==
X-Google-Smtp-Source: AOwi7QB87XNMdyOL7TXQwWytxeWsqCdsZB0Uj0yS80bu/bJGFomKOahES/QVyx9YglR/R4+WGrbZPhswnYH7S+7LwOk=
X-Received: by 10.31.12.200 with SMTP id 191mr1157439vkm.73.1507309176920;
 Fri, 06 Oct 2017 09:59:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.147.88 with HTTP; Fri, 6 Oct 2017 09:59:36 -0700 (PDT)
In-Reply-To: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 6 Oct 2017 09:59:36 -0700
Message-ID: <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
Subject: Re: OpenBMC on Raspberry PI 3.
To: Javier Romero <xavinux@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114125fe0efebc055ae3c482"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 17:00:13 -0000

--001a114125fe0efebc055ae3c482
Content-Type: text/plain; charset="UTF-8"

When you run  export TEMPLATECONF=meta-openbmc-machines/meta-
openpower/meta-ibm/meta-palmetto/conf, you are telling the build system
that you want to build images for the BMC processor used on the Palmetto
machine (Aspeed AST2400).  That image won't boot on a RaspberryPi.  What
you'll need to do is create a new layer in meta-openbmc-machines for a
RaspberryPi that includes the raspberrypi layer, specifies the correct
kernel device tree, etc.  Take a look at the meta-ast2500-evb and
https://github.com/Nuvoton-Israel/meta-bsp-nuvoton/tree/master/meta-openbmc-machines/meta-evb/meta-evb-nuvoton/meta-evb-npcm750/conf
for examples of what a machine to support an evaluation board (evb) looks
like.

On Fri, Oct 6, 2017 at 8:38 AM, Javier Romero <xavinux@gmail.com> wrote:

> Hi People,
>
> I'm building an OpenBMC image for target Palmetto on Ubuntu 16.04 to try
> to make it work on the Raspberry PI 3. I've followed these steps:
>
>
> *1.  *sudo apt-get install -y git build-essential libsdl1.2-dev texinfo
> gawk chrpath diffstat
>
> *2.* git clone git@github.com:openbmc/openbmc.git
>
> *3.* cd openbmc
>
> *4-* export TEMPLATECONF=meta-openbmc-machines/meta-
> openpower/meta-ibm/meta-palmetto/conf
>
> *tester@obmc:/openbmc$* . oe-init-build-env ~/my-build
>
> *tester@obmc:~/my-build$* bitbake obmc-phosphor-image
>
> *tester@obmc:/$* cd /home/tester/my-build/tmp/deploy/images/palmetto/
>
> *tester@obmc:/$* tar -xvf obmc-phosphor-image-palmetto-
> 20171005142206.static.mtd.all.tar
>
> *tester@obmc:/$* ls -lha
> total 65M
> drwxr-xr-x  2 root   root   4.0K Oct  5 15:37 .
> drwxr-xr-x 24 root   root   4.0K Oct  5 10:29 ..
> *-rw-rw-r--  1 tester tester  32M Oct  5 14:03 image-bmc*
> -rw-rw-r--  2 tester tester  33M Oct  5 14:03 obmc-phosphor-image-palmetto-
> 20171005142206.static.mtd.all.tar
>
>
> Would like to know if it is the *image-bmc* file, what I will have to
> flash on the SD card of the Raspberry to load OpenBMC.
>
> Have also build an image of Linux Yocto for Raspberry PI 3.
>
> Thanks for your attention.
>
> Regards,
>
>
>
>
> *Javier Romero*
>
> *E-mail: xavinux@gmail.com <xavinux@gmail.com>*
>
> *Skype: xavinux*
>
>

--001a114125fe0efebc055ae3c482
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">When you run=C2=A0<span style=3D"font-size:12.8px">=C2=A0e=
xport TEMPLATECONF=3Dmeta-openbmc-</span><wbr style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">machines/meta-</span><span style=3D"font-siz=
e:12.8px">openpower/meta-ibm/meta-</span><wbr style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">palmetto/conf, you are telling the build sys=
tem that you want to build images for the BMC processor used on the Palmett=
o machine (Aspeed AST2400).=C2=A0 That image won&#39;t boot on a RaspberryP=
i.=C2=A0 What you&#39;ll need to do is create a new layer in meta-openbmc-m=
achines for a RaspberryPi that includes the raspberrypi layer, specifies th=
e correct kernel device tree, etc.=C2=A0 Take a look at the meta-ast2500-ev=
b and=C2=A0<a href=3D"https://github.com/Nuvoton-Israel/meta-bsp-nuvoton/tr=
ee/master/meta-openbmc-machines/meta-evb/meta-evb-nuvoton/meta-evb-npcm750/=
conf">https://github.com/Nuvoton-Israel/meta-bsp-nuvoton/tree/master/meta-o=
penbmc-machines/meta-evb/meta-evb-nuvoton/meta-evb-npcm750/conf</a> for exa=
mples of what a machine to support an evaluation board (evb) looks like.</s=
pan></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri,=
 Oct 6, 2017 at 8:38 AM, Javier Romero <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi People,<br=
><br></div>I&#39;m building an OpenBMC image for target Palmetto on Ubuntu =
16.04 to try to make it work on the Raspberry PI 3. I&#39;ve followed these=
 steps:<br><br><div><div><br><b>1.=C2=A0 </b>sudo apt-get install -y git bu=
ild-essential libsdl1.2-dev texinfo gawk chrpath diffstat<br><br><b>2.</b> =
git clone git@github.com:openbmc/<wbr>openbmc.git<br><br><b>3.</b> cd openb=
mc<br><br><b>4-</b> export TEMPLATECONF=3Dmeta-openbmc-<wbr>machines/meta-<=
br>openpower/meta-ibm/meta-<wbr>palmetto/conf<br><b><br>tester@obmc:/openbm=
c$</b> . oe-init-build-env ~/my-build<b><br><br>tester@obmc:~/my-build$</b>=
 bitbake obmc-phosphor-image<br><br><b>tester@obmc:/$</b> cd /home/tester/m=
y-build/tmp/<wbr>deploy/images/palmetto/<b><br><br>tester@obmc:/$</b> tar -=
xvf obmc-phosphor-image-palmetto-<wbr>20171005142206.static.mtd.all.<wbr>ta=
r<br><br><b>tester@obmc:/$</b> ls -lha<br>total 65M<br>drwxr-xr-x=C2=A0 2 r=
oot=C2=A0=C2=A0 root=C2=A0=C2=A0 4.0K Oct=C2=A0 5 15:37 .<br>drwxr-xr-x 24 =
root=C2=A0=C2=A0 root=C2=A0=C2=A0 4.0K Oct=C2=A0 5 10:29 ..<br><span style=
=3D"color:rgb(255,0,0)"><i><b>-rw-rw-r--=C2=A0 1 tester tester=C2=A0 32M Oc=
t=C2=A0 5 14:03 image-bmc</b></i></span><br>-rw-rw-r--=C2=A0 2 tester teste=
r=C2=A0 33M Oct=C2=A0 5 14:03 obmc-phosphor-image-palmetto-<wbr>20171005142=
206.static.mtd.all.<wbr>tar<br><br><br></div><div>Would like to know if it =
is the <span style=3D"color:rgb(255,0,0)"><b>image-bmc</b></span> file, wha=
t I will have to flash on the SD card of the Raspberry to load OpenBMC.<br>=
<br></div><div>Have also build an image of Linux Yocto for Raspberry PI 3.<=
br></div><div><br></div><div>Thanks for your attention.<br><br></div><div>R=
egards,<br><br><br></div><div><br clear=3D"all"><div><div class=3D"m_-27666=
93576331344254gmail_signature"><div dir=3D"ltr"><div style=3D"text-align:le=
ft"><i><b>Javier Romero<br></b></i></div><div style=3D"text-align:left"><sp=
an style=3D"color:rgb(19,79,92)"><i><b><span style=3D"color:rgb(0,0,0)">E-m=
ail:<span style=3D"color:rgb(0,0,255)"> </span></span><span style=3D"color:=
rgb(0,0,255)"><a href=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinu=
x@gmail.com</a></span><br></b></i></span></div><div style=3D"text-align:lef=
t"><i><b><span style=3D"color:rgb(19,79,92)"><span style=3D"color:rgb(0,0,0=
)">Skype:</span> <span style=3D"color:rgb(11,83,148)"><u><span style=3D"col=
or:rgb(0,0,255)">xavinux</span><br></u></span></span></b></i></div><div sty=
le=3D"text-align:left"><br></div> </div></div></div>
</div></div></div>
</blockquote></div><br></div>

--001a114125fe0efebc055ae3c482--
