Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22d; helo=mail-vk0-x22d.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ycom1q+Q"; 
 dkim-atps=neutral
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9sql56XhzDqv8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 07:52:02 +1100 (AEDT)
Received: by mail-vk0-x22d.google.com with SMTP id t203so2142159vke.0
 for <openbmc@lists.ozlabs.org>; Mon, 09 Oct 2017 13:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=WjevTW0/MZu281PMqUpSFMPRCwNWD4jvu6mKJIEzppY=;
 b=Ycom1q+QwqpY770yYIhdxgNMFuzHOy+Le7H8RFNDlsjf17kVJNgvEJCe+agibBzEaL
 sM3gWi6ejcLkT72dgmsL+H4GK1WbjgQZfxWWr1LXkklzBjK9fE3lCcM6mWvOQRQy9bFg
 STBduYVuxxnnvewnuEG0ombGu0b3ksn+dvJiL0VsVcYaqzicuKJSnVeJ7XCRnJHQakM5
 UtQ84F4n8XeyOUwI29mBVpcIZtXb4ez4Zgz19ueEep40EialRcJ2k0yVhdxrjDK6YFNB
 qnskMMxJjEPaTFO3RHYy1O5LwPfDFYX9AvbBAnpB5oePBOMTFQHOto3r7pXTZQ+tgd8l
 sPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=WjevTW0/MZu281PMqUpSFMPRCwNWD4jvu6mKJIEzppY=;
 b=itZB9Zrx3sXF976gKIvQ7+qy2FSU/n+a+te0+lb9KIazrSLv7RIcW1OgVVdpficksD
 K4TtPDcjStSWhkh0F7yGXBKdwGMNdMEChN6Tcf0dSBrDWrLug6Wi6g2fAjCwL3t++Z1a
 8LiJR81R6dvQqJpGR+6gCRa0mPnhUSpqOSEStSFP5xcbCFaI94cRZFjRPG8xY9atDlgA
 CM7m3l/M0GTbWeHnLXsZ20Wnh1TN4BRaDFouT55ax8Yo9H9CWhdqCQ8EnMP08ctyeQmn
 OuQDRH+L9EmW1vJXjtEb/mLVxh0S0LYPbm4OVRyze/b8z9ETF90gt2/8H2XxV2SMp5gG
 1kYA==
X-Gm-Message-State: AMCzsaWkw2U5UosLs8lVEAkoyc0UlphUmAkkRzXvkbttjcTWPDS9iUHQ
 4zntIqWj9YSh6Rewq9VHuQdczZq0pw10MuHVn5HY8A==
X-Google-Smtp-Source: AOwi7QAHD4VCmsTutY56uRgkafP5+VvKcc7g4jPCfW0InrSR4CVEcLsU29Fntq8rPKib3mvO+6Q1LEyNm7NHAe0b1qo=
X-Received: by 10.31.48.213 with SMTP id w204mr4095610vkw.174.1507582319596;
 Mon, 09 Oct 2017 13:51:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.147.88 with HTTP; Mon, 9 Oct 2017 13:51:59 -0700 (PDT)
In-Reply-To: <CAGMNF6W+g_yAnm2e0ta7VtBZb01pwaRs_SZW+=N4tJtDO88xFw@mail.gmail.com>
References: <CAGMNF6W+g_yAnm2e0ta7VtBZb01pwaRs_SZW+=N4tJtDO88xFw@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 9 Oct 2017 13:51:59 -0700
Message-ID: <CAPLgG=nut_9GaVeby6w8fcaq5n=3ntxCHqdSQorRmSSKLdcLbw@mail.gmail.com>
Subject: Re: pythonnative version mismatch?
To: Kun Yi <kunyi@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1143f882a1a14c055b235c04"
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
X-List-Received-Date: Mon, 09 Oct 2017 20:52:04 -0000

--001a1143f882a1a14c055b235c04
Content-Type: text/plain; charset="UTF-8"

This was a really good question.  I wrote a blog post to document the
answer: https://www.kc8apf.net/2017/10/snakes-in-a-sysroot/.

On Fri, Oct 6, 2017 at 11:00 AM, Kun Yi <kunyi@google.com> wrote:

> Hello folks,
>
> I searched through the mailing list but haven't seen anyone brought up.
> Here's a weird bug I found on my setup: pythonnative seems to be using
> python3.4.3 whereas the recipe specified 2.7.
>
> Before diving into the layers of bitbake recipes to root cause what caused
> this, I want to post on the mailing list to see if it is reproducible on
> other setups, and if people have ideas why this went wrong (environment
> variable accidentally being overwritten?)
>
> *What I tested:*
> I found the code in phosphor-settings-manager, which inherits
> pythonnative, seems to be working per python 3, so added the following line
> into a native python function:
>
> python do_check_version () {
>   import sys
>   bb.warn(sys.version)
> }
> addtask check_version after do_configure before do_compile
>
> WARNING: phosphor-settings-manager-1.0-r1 do_check_version: 3.4.3
> (default, Nov 17 2016, 01:08:31)
>
> This is with openbmc git tip, building MACHINE=zaius
>
> *What the recipe should be using is seemingly 2.7:*
> $ cat ../import-layers/yocto-poky/meta/classes/pythonnative.bbclass
>
> inherit python-dir
> [...]
>
> $ cat ../import-layers/yocto-poky/meta/classes/python-dir.bbclass
> PYTHON_BASEVERSION = "2.7"
> PYTHON_ABI = ""
> PYTHON_DIR = "python${PYTHON_BASEVERSION}"
> PYTHON_PN = "python"
> PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
>
> *Why this is bad:*
> well, python2.7 and python3 have a ton of differences. A bug I discovered
> is due to usage of filter(), which returns different objects between
> Python2/3.
>
> --
> Regards,
> Kun
>

--001a1143f882a1a14c055b235c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This was a really good question.=C2=A0 I wrote a blog post=
 to document the answer:=C2=A0<a href=3D"https://www.kc8apf.net/2017/10/sna=
kes-in-a-sysroot/">https://www.kc8apf.net/2017/10/snakes-in-a-sysroot/</a>.=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Oct=
 6, 2017 at 11:00 AM, Kun Yi <span dir=3D"ltr">&lt;<a href=3D"mailto:kunyi@=
google.com" target=3D"_blank">kunyi@google.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello folks,<div><br></div><di=
v>I searched through the mailing list but haven&#39;t seen anyone brought u=
p. Here&#39;s a weird bug I found on my setup: pythonnative seems to be usi=
ng python3.4.3 whereas the recipe specified 2.7.</div><div><br></div><div>B=
efore diving into the layers of bitbake recipes to root cause what caused t=
his, I want to post on the mailing list to see if it is reproducible on oth=
er setups, and if people have ideas why this went wrong (environment variab=
le accidentally being overwritten?)</div><div><br></div><div><b>What I test=
ed:</b></div><div>I found the code in phosphor-settings-manager, which inhe=
rits pythonnative, seems to be working per python 3, so added the following=
 line into a native python function:</div><div><br></div><div>python do_che=
ck_version () {</div><div>=C2=A0 import sys</div><div>=C2=A0 bb.warn(sys.ve=
rsion)</div><div>}</div><div>addtask check_version after do_configure befor=
e do_compile<br></div><div><br></div><div>WARNING: phosphor-settings-manage=
r-1.0-<wbr>r1 do_check_version: 3.4.3 (default, Nov 17 2016, 01:08:31)=C2=
=A0<br></div><div><br></div><div>This is with openbmc git tip, building MAC=
HINE=3Dzaius</div><div><br></div><div><b>What the recipe should be using is=
 seemingly 2.7:</b></div><div><div>$ cat ../import-layers/yocto-poky/<wbr>m=
eta/classes/pythonnative.<wbr>bbclass</div><div><br></div><div>inherit pyth=
on-dir</div><div>[...]</div></div><div><br></div><div><div>$ cat ../import-=
layers/yocto-poky/<wbr>meta/classes/python-dir.<wbr>bbclass=C2=A0</div><div=
>PYTHON_BASEVERSION =3D &quot;2.7&quot;</div><div>PYTHON_ABI =3D &quot;&quo=
t;</div><div>PYTHON_DIR =3D &quot;python${PYTHON_BASEVERSION}&quot;</div><d=
iv>PYTHON_PN =3D &quot;python&quot;</div><div>PYTHON_SITEPACKAGES_DIR =3D &=
quot;${libdir}/${PYTHON_DIR}/site-<wbr>packages&quot;</div></div><div><br><=
/div><div><div><b>Why this is bad:</b></div><div>well, python2.7 and python=
3 have a ton of differences. A bug I discovered is due to usage of filter()=
, which returns different objects between Python2/3.</div><span class=3D"HO=
EnZb"><font color=3D"#888888"><div><br></div>-- <br><div class=3D"m_9422749=
62384234270gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></=
div>
</font></span></div></div>
</blockquote></div><br></div>

--001a1143f882a1a14c055b235c04--
