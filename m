Return-Path: <raltherr@google.com>
Received: from mail-yw0-x234.google.com (mail-yw0-x234.google.com
 [IPv6:2607:f8b0:4002:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw1GG63HKzDt1h
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 06:37:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=VMbM8yqN; 
 dkim-atps=neutral
Received: by mail-yw0-x234.google.com with SMTP id t193so61507408ywc.2
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 12:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=HpZEyF45Ql60xkihN0pm7VWZ4lvan1plk5vAoHzLaB4=;
 b=VMbM8yqNu6scV/R/Pd0GSrVJcRzzkmt+gkUEoNiVTKzW/Qd3Sn0JdVucBimaqzwNkq
 /OnznRytiraciSEEWIuM8rvCTIpv7bmm+6zLnfYLOQ7m6ugdAen8AVfW+EGrB3ccvW87
 N311LNfDPiLnupYtvNkXWzF/BlACV43JLqmbzC/DtwPcOvAASTXVXIPdSoCOs9fAOmuf
 xUQm7+TBn/B0PWTFjvvhH1lOHaf/6Nu4EUeel3+6q6cCYiLr0mtRdt+WaJ2//XZ1XXYY
 5IJqR/YozFEEEQkTPxtDaqkvvqOHZmVj8uZyCtJhSfa+tbCN+QjVqhtE8u2e/NTARFxq
 7OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=HpZEyF45Ql60xkihN0pm7VWZ4lvan1plk5vAoHzLaB4=;
 b=lMW+XuyCetzSqzX934tW+aBVI8UB9JTOtOLBEYmYHtKmpVceFMZf1o1glVOGQpJ9Kt
 rxGQMqZ/csiEhQmGD6di5E+PNiuTY3LsbK4hnrvG/D9D/piA1G6E1KNZD3RlCMLOswM9
 cNmB6El7Tcw3Mw5EoJ/NFHPtbYqvrVLVKEJNxvtFoco1wVAfm50UkR+LOsRDpZHtUWGO
 N3dDSkfosa52iVHNuUGTArDrz646B0OgxeXaZo5DsounZzlHOH4tGDp0co1LXQt5xob5
 RhJbtDrHTxLjjnsWJQbA7dE8bXntH37Wq+Gl4g3KPYLa14kkJEoC1Fexhk4OePisziPb
 /8ow==
X-Gm-Message-State: AA6/9RkmAIIvxtotm1J8O4yDAWCIjpcJ8q857I1mXU6prt9rNRPsqqGgPZnJAMY9avIK3xuYfctrwc7gLH/gONWY
X-Received: by 10.129.53.206 with SMTP id c197mr7206588ywa.205.1476387443529; 
 Thu, 13 Oct 2016 12:37:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Thu, 13 Oct 2016 12:37:23 -0700 (PDT)
In-Reply-To: <CAFR_W8roBycAtvE-sNLfKRTMw=uPusx0tdWU-az4mqB7N9N8UA@mail.gmail.com>
References: <CAPH-5w6RE2j7ghR9vhX2ANUQAvBx4GuhquZ=v8r9_vYK6q+9OQ@mail.gmail.com>
 <CAFR_W8roBycAtvE-sNLfKRTMw=uPusx0tdWU-az4mqB7N9N8UA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 13 Oct 2016 12:37:23 -0700
Message-ID: <CAPLgG=kafSFfaj4P569+qr=y4130ScobqtwCY94sYbm1uJzfFw@mail.gmail.com>
Subject: Re: Single device tree blob between linux and u-boot
To: Maxim Sloyko <maxims@google.com>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11421a261fe03b053ec43d0a
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
X-List-Received-Date: Thu, 13 Oct 2016 19:37:27 -0000

--001a11421a261fe03b053ec43d0a
Content-Type: text/plain; charset=UTF-8

I've been working on signed kernel images which depends on building FIT
images that include the kernel, initrd, and dtb.  The kernel_fitimage
branch of my tree (https://github.com/kc8apf/openbmc) will build an
unsigned FIT image by including the dtb specified in the machine config
(usually from the kernel).  There are also provisions in there for u-boot
being built in two stages so a control dtb that includes the public signing
keys can be combined into the final u-boot binary.  From how that is
structure, I suspect Maxim is right that there will be some differences
between u-boot's dtb and linux's dtb.  That shouldn't be an issue as the
u-boot dtb gets built into the u-boot image while the kernel dtb is loaded
from the FIT image.

Rick

On Thu, Oct 13, 2016 at 11:41 AM, Maxim Sloyko <maxims@google.com> wrote:

>
>
> On Thu, Oct 13, 2016 at 11:20 AM, Xo Wang <xow@google.com> wrote:
>
>> Hi folks,
>>
>> I saw Cedric had mentioned "...you can use the linux compiled [dtb]
>> and dd it at the end of the u-boot
>> partition..."
>>
>> To provide the device tree to u-boot, should we do what Cedric said
>> and also pass the address of the DTB from U-Boot to Linux? According
>> to these slides:
>>
>> https://events.linuxfoundation.org/sites/events/files/
>> slides/petazzoni-device-tree-dummies.pdf
>>
>> U-Boot can pass the DTB address to Linux in r2 (p. 6) with the right
>> bootm command parameters.
>>
>> This means we can have U-Boot and Linux use the same DTB binary (I
>> prefer built in Linux) rather than each source tree building one.
>>
>
> This introduces the dependency of U-Boot on Linux. Do we plan to keep this
> dependency forever? This may be fine with OpenBMC, but what about mainline
> U-Boot and Linux?
> Also, are we sure that they are 100% compatible? IIRC Peter was saying
> that in practice you need two different device trees for U-Boot and Linux.
>
>
>>
>> Then we can remove the CONFIG_ARM_APPENDED_DTB option in our Linux
>> build that is described as a legacy "compatibility" mechanism. We also
>> avoid having an extra copy of the DTSs in U-Boot source and avoid
>> duplicate DTBs in our image.
>>
>> Thoughts?
>>
>> cheers
>> xo
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>>
>
>
>
> --
> *M*axim *S*loyko
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a11421a261fe03b053ec43d0a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve been working on signed kernel images which depend=
s on building FIT images that include the kernel, initrd, and dtb.=C2=A0 Th=
e kernel_fitimage branch of my tree (<a href=3D"https://github.com/kc8apf/o=
penbmc">https://github.com/kc8apf/openbmc</a>) will build an unsigned FIT i=
mage by including the dtb specified in the machine config (usually from the=
 kernel).=C2=A0 There are also provisions in there for u-boot being built i=
n two stages so a control dtb that includes the public signing keys can be =
combined into the final u-boot binary.=C2=A0 From how that is structure, I =
suspect Maxim is right that there will be some differences between u-boot&#=
39;s dtb and linux&#39;s dtb.=C2=A0 That shouldn&#39;t be an issue as the u=
-boot dtb gets built into the u-boot image while the kernel dtb is loaded f=
rom the FIT image.<div><br></div><div>Rick</div></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On Thu, Oct 13, 2016 at 11:41 AM, Maxi=
m Sloyko <span dir=3D"ltr">&lt;<a href=3D"mailto:maxims@google.com" target=
=3D"_blank">maxims@google.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote"><span class=3D"">On Thu, Oct 13, 2016 at 11:20 AM, Xo Wang=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:xow@google.com" target=3D"_blank">=
xow@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi f=
olks,<br>
<br>
I saw Cedric had mentioned &quot;...you can use the linux compiled [dtb]<br=
>
and dd it at the end of the u-boot<br>
partition...&quot;<br>
<br>
To provide the device tree to u-boot, should we do what Cedric said<br>
and also pass the address of the DTB from U-Boot to Linux? According<br>
to these slides:<br>
<br>
<a href=3D"https://events.linuxfoundation.org/sites/events/files/slides/pet=
azzoni-device-tree-dummies.pdf" rel=3D"noreferrer" target=3D"_blank">https:=
//events.linuxfoundation<wbr>.org/sites/events/files/<wbr>slides/petazzoni-=
device-tree-<wbr>dummies.pdf</a><br>
<br>
U-Boot can pass the DTB address to Linux in r2 (p. 6) with the right<br>
bootm command parameters.<br>
<br>
This means we can have U-Boot and Linux use the same DTB binary (I<br>
prefer built in Linux) rather than each source tree building one.<br></bloc=
kquote><div><br></div></span><div>This introduces the dependency of U-Boot =
on Linux. Do we plan to keep this dependency forever? This may be fine with=
 OpenBMC, but what about mainline U-Boot and Linux?</div><div>Also, are we =
sure that they are 100% compatible? IIRC Peter was saying that in practice =
you need two different device trees for U-Boot and Linux.</div><span class=
=3D""><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Then we can remove the CONFIG_ARM_APPENDED_DTB option in our Linux<br>
build that is described as a legacy &quot;compatibility&quot; mechanism. We=
 also<br>
avoid having an extra copy of the DTSs in U-Boot source and avoid<br>
duplicate DTBs in our image.<br>
<br>
Thoughts?<br>
<br>
cheers<br>
xo<br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listi<wbr>nfo/openbmc</a><br>
</blockquote></span></div><span class=3D"HOEnZb"><font color=3D"#888888"><b=
r><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_71829566566827978=
36gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <b>=
S</b>loyko</div></div>
</font></span></div></div>
<br>______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--001a11421a261fe03b053ec43d0a--
