Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::231; helo=mail-qt0-x231.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BBdWwq9r"; 
 dkim-atps=neutral
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41L4T03SpQzF1QL
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 12:20:03 +1000 (AEST)
Received: by mail-qt0-x231.google.com with SMTP id h4-v6so3390228qtj.7
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 19:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=NjQMhXtW1AXGkY7e64VYOUh+Gndxk3zK7nNlvzZM4yw=;
 b=BBdWwq9rev7/o1pp6UxZWzRay14ozn/tOtwDYgmTLjhhbO5e4Y3RcgnvzP1J7hv380
 9psmdjZiyNDO69es/F7VQ3f8+qCK+Du6Jw+WPOZpyeS1/Bugz2kl7I6W5GVuSlk8Wvgt
 C5Y02Ll9dWNq8JAu7cLj1XKbTv5aQ4uR7+ORTqGfK37tgVHq4G/uJHzfUO5xhWvOW6f5
 HU4lfDQCYMblXcvvNH5KtGtxt8Wk4ey1sW/8JCNyka92/eaXcVSevXaLJ5vW+UHw8ow1
 UCfSbM1hpsiOyi7bruhDquJcKqqtPyU/L3qXCb3Q5vJnlECJMAQrsoJKJuvIXAWXtyB3
 ilhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=NjQMhXtW1AXGkY7e64VYOUh+Gndxk3zK7nNlvzZM4yw=;
 b=J+A+AIyRhxbMHL+LZjXPyga1YfrONI4QAey3obOHTFy0+6HBpO2zqbeGwwX/HgGNIZ
 /4Hi3H5e+CfIoIO9Nfl+3LsAaT3bp2O0Y0AE8mZHqaaw9LSdWnaNFGDoaxHtsCrHisZc
 nf1vk4bVAsbNLnYw19XvcqHtGjIToLvHFmu4E8c3wq4yjxTFfbdyfbz/KbxKhSkHRLdP
 E51aiqbg4KTqT5i2ap3UZPm3oeFkd+NEnqDu6Tj1Q02lvCJrBzcaRtpUgqaM3H6d1pdE
 TRd7cvOn9BY4zdmtLmaLClHF+rp1j+tP9v9jhaAxXDOKhIMA3VwXoWSz36PT0p6vb5nw
 HFIQ==
X-Gm-Message-State: APt69E1HlmRZmYC7QDBWW4t3EjeRUh5vS7Yk9+wg6Nk8fmdwpMl4s0Sr
 3ajdao8bNK0ZqNPGcSrbmhBFyxUsu0fuYk77U+I=
X-Google-Smtp-Source: AAOMgpc7dOWwxg9fNjRi/kGqwDFPcdAoFhQtbS6LO0Br2JYx193ji4EwmtaA/lI7dh2LzYg19AGXEd5pi4P4J4dJwKM=
X-Received: by 2002:ac8:234f:: with SMTP id
 b15-v6mr114877qtb.336.1530670801311; 
 Tue, 03 Jul 2018 19:20:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Tue, 3 Jul 2018 19:20:00 -0700 (PDT)
In-Reply-To: <CAARXrtkRqe-CGfi1XZn1ueuA7npP0pC67-HfuvaGCiaxtU-Uvg@mail.gmail.com>
References: <CAG9c7cCPZFFg65e-1iOSkLqgb26-2t1SqH_AZ4JjB5-TigNqzw@mail.gmail.com>
 <CAARXrtm1ELUMV_Hh9VNF21fMXeKnn3RpOhABLfaWRPk05Gd=RA@mail.gmail.com>
 <CAG9c7cApfyerEPeZ7e=WBN1nfcgMrxT0Yvy-vSP66S1+-KJYJA@mail.gmail.com>
 <CAARXrtkRqe-CGfi1XZn1ueuA7npP0pC67-HfuvaGCiaxtU-Uvg@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 4 Jul 2018 10:20:00 +0800
Message-ID: <CAG9c7cBFcpDp+d-WiDqLsGjo8XEUa-ziGYYRU_=hOwAr6TbGKg@mail.gmail.com>
Subject: Re: How to override default Kernel config
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000615c7c0570231189"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 02:20:05 -0000

--000000000000615c7c0570231189
Content-Type: text/plain; charset="UTF-8"

Hi Lei Yu,

After following your instructions, the CONFIG_DEVMEM is still not set in
the below '.config'

workspace/sources/linux-aspeed/.config

It did work if I directly
modified meta-openbmc-bsp/meta-aspeed/recipes-kernel/linux/linux-aspeed/ast2500/defconfig

Thanks.

2018-07-04 10:06 GMT+08:00 Lei YU <mine260309@gmail.com>:

> On Wed, Jul 4, 2018 at 10:03 AM Henbin Chang <henbinchang@gmail.com>
> wrote:
> >
> > Thanks Lei Yu.
> >
> > Actually, I want to enable CONFIG_DEVMEM in my specific machine.
> > I added the below config to my machine.cfg
> > CONFIG_DEVMEM=y
> > CONFIG_HWMON=y
> > CONFIG_SENSORS_TMP421=y
> >
> > But I still saw the line in the ".config" after devtool modify
> linux-aspeed.
> > # CONFIG_DEVMEM is not set
> >
> > How should I do?
>
> OK, you are using devtool. Then the simplest you can do is to reset and
> modify the recipe again:
>
>     devtool reset linux-aspeed
>     # Manullay delete the linux-aspeed dir in workspace
>     devtool modify linux-aspeed
>

--000000000000615c7c0570231189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lei Yu,<div><br></div><div><span style=3D"font-size:sma=
ll;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">After following your instr=
uctions, t</span>he CONFIG_DEVMEM is still not set in the below &#39;.confi=
g&#39;=C2=A0<br></div><div><br></div><div>workspace/sources/linux-aspeed/.c=
onfig<br></div><div><br></div><div>It did work if I directly modified=C2=A0=
meta-openbmc-bsp/meta-aspeed/recipes-kernel/linux/linux-aspeed/ast2500/defc=
onfig</div><div><br></div><div>Thanks.</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">2018-07-04 10:06 GMT+08:00 Lei YU <span di=
r=3D"ltr">&lt;<a href=3D"mailto:mine260309@gmail.com" target=3D"_blank">min=
e260309@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">On Wed, Jul 4, 2018 at 10:03 AM Henbin Chang &lt;<a href=3D"mailt=
o:henbinchang@gmail.com">henbinchang@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks Lei Yu.<br>
&gt;<br>
&gt; Actually, I want to enable CONFIG_DEVMEM in my specific machine.<br>
&gt; I added the below config to my machine.cfg<br>
&gt; CONFIG_DEVMEM=3Dy<br>
&gt; CONFIG_HWMON=3Dy<br>
&gt; CONFIG_SENSORS_TMP421=3Dy<br>
&gt;<br>
&gt; But I still saw the line in the &quot;.config&quot; after devtool modi=
fy linux-aspeed.<br>
&gt; # CONFIG_DEVMEM is not set<br>
&gt;<br>
&gt; How should I do?<br>
<br>
</span>OK, you are using devtool. Then the simplest you can do is to reset =
and<br>
modify the recipe again:<br>
<br>
=C2=A0 =C2=A0 devtool reset linux-aspeed<br>
=C2=A0 =C2=A0 # Manullay delete the linux-aspeed dir in workspace<br>
=C2=A0 =C2=A0 devtool modify linux-aspeed<br>
</blockquote></div><br></div>

--000000000000615c7c0570231189--
