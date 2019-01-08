Return-Path: <wangzhiqiang8906@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vniszzh5"; 
 dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YYsD0914zDqDb
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 12:02:55 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id p6so1727191lfc.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jan 2019 17:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0LuC7vITEKL7+paOMb64U4mc2RXWXsobg6Uxd8jgUbc=;
 b=Vniszzh5CEQ49XdGv4kyyEamcrZ57kUYpnaODmD5c0yA23nakqRlc6Fmqwl9O7GJKG
 JfmQ4p4r9AqN5XLH69dgNdp96u2d6kPOdD+pOTlxIvhOmrW680J8K6TQpqVgXCTICq2a
 Ea81XIEQ2II+7C5vUAjA6tzRa2XzWeHARrUkdxVJMKT/Ur3VHVolI/JDEOIdG/KYf/Ln
 PdXDbfB7wudw8LvEIZUQmXkV3OVdipHGXa6Wqg0ejjxAUORLXVw5MYN9CAsh2YsFT9nj
 7I6o9vGZu9qVKTityf++rYjNJ/9tgpncaWzOeC/gODLq50PGmPyD6eobA2Ib6U1NIZRK
 6FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0LuC7vITEKL7+paOMb64U4mc2RXWXsobg6Uxd8jgUbc=;
 b=RacM+237Nag2AuXgfPm8h02GpBiODacqdUnh+t9UL6rRyk8DUEckw2x/vb/NtqQg3B
 cNVaVdkEsUqW9Ct62/cl/OUSarxlZn+ZqqsakpVyONuOdvyDvnuh07cKsuf7OYgt+QOJ
 Uy7hYGiPZ25K4rufvqMSLAx7g9/XWrs/kuwYRBq5RhzF0EPlWyyhBO5YQnwDKBS7w8eQ
 MO8GqPqwk9JZiFNcaKT+TU4ZDPU3gmilNcSUZ9rSoaWsAxFr2e7zLxCacryCdvIGXiEn
 3+mw8KVOvmoeSt6MiUn6Jeu6/FAs1PznArNympkOi+Il7MciCe5zW8s3LSIA43TRPXkY
 FENg==
X-Gm-Message-State: AA+aEWbq3/ZR7EEhHDIPMEoyuC6wGucaT/HYX4bgIWFjwMyd6vBjKN31
 e0PvaJe4/cTTfL/ioyWazzdQf9dD4ixkxXxY76s=
X-Google-Smtp-Source: AFSGD/UP2P6lhV8RrlBkY13KuaxrHJVAEiwKtx+F6DsvDS8KcSVfAaskwkqNqOP+9EkPKeK/ERtQOeuHbXF2basukb4=
X-Received: by 2002:a19:c396:: with SMTP id
 t144mr30733047lff.110.1546909372584; 
 Mon, 07 Jan 2019 17:02:52 -0800 (PST)
MIME-Version: 1.0
References: <8B0F0C96-17A3-4649-9CCA-475E5E75685E@fb.com>
In-Reply-To: <8B0F0C96-17A3-4649-9CCA-475E5E75685E@fb.com>
From: qianlihu <wangzhiqiang8906@gmail.com>
Date: Tue, 8 Jan 2019 09:02:41 +0800
Message-ID: <CAHkHK09QPboyqShmOc5Fe_gvo1=-ahqrWS9qj+ZuLjGKhLHxBQ@mail.gmail.com>
Subject: Re: Kernel config
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a71af0057ee7e725"
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
X-List-Received-Date: Tue, 08 Jan 2019 01:02:57 -0000

--000000000000a71af0057ee7e725
Content-Type: text/plain; charset="UTF-8"

Hi Vijay

You can refer to
https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus/recipes-kernel/linux

The bbappend file tells us that the cfg file will be merged into the kernel
cfg

You can use devtool to generate these file :

devtool update-recipe  linux-aspeed -a
/home/xxxxxxx/openbmc/meta-facebook/meta-tiogapass

On Tue, Jan 8, 2019 at 8:38 AM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Hi,
>
> I need to add extra kernel config for our tiogapass platform and I added
> extra configuration in tiogapass.cfg file under conf/machine. I am not
> seeing these getting added to kernel config file. Please suggest right
> place to add our platform specific extra kernel config options.
>
>
>
> Regards
>
> -Vijay
>

--000000000000a71af0057ee7e725
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
 Vijay</div><div><br></div><div>You can refer to=C2=A0<a href=3D"https://gi=
thub.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus/recipes-kernel/l=
inux">https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus/=
recipes-kernel/linux</a></div><div><br></div><div>The bbappend file tells u=
s that the cfg file will be merged into the kernel cfg</div><div><br></div>=
<div>You can use devtool to generate these file :</div><div><br></div><div>=
devtool update-recipe=C2=A0 linux-aspeed -a /home/xxxxxxx/openbmc/meta-face=
book/meta-tiogapass=C2=A0<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Tue, Jan 8, 2019 at 8:38 AM Vijay Khemka &lt;<a href=3D"mailto:=
vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-8236277798012169770WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi,<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I need to add extra k=
ernel config for our tiogapass platform and I added extra configuration in =
tiogapass.cfg file under conf/machine. I am not seeing these getting added =
to kernel config file. Please suggest
 right place to add our platform specific extra kernel config options.<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Regards<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-Vijay<u></u><u></u><=
/span></p>
</div>
</div>

</blockquote></div></div></div></div></div>

--000000000000a71af0057ee7e725--
