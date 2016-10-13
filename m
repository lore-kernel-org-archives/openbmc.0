Return-Path: <maxims@google.com>
Received: from mail-yw0-x230.google.com (mail-yw0-x230.google.com
 [IPv6:2607:f8b0:4002:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw01m71kLzDt1g
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 05:41:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=pHJ5VoA6; 
 dkim-atps=neutral
Received: by mail-yw0-x230.google.com with SMTP id t192so60825053ywf.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 11:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3jD9yp6qlJBjnGK71vd1+QrSS8jJwwo03ILf5B9iqN8=;
 b=pHJ5VoA6G55rs1eV+hBgBgIdXLewkMF5IYtdP93pAEV2CCfyjhcYP/BelnOHiOdxvJ
 OTGqGKg0VzYLeeGSOxQlovP7HVLDFccxmK8oF8xBUpdp2tEp/qcXFF4nynhnd7+zu62F
 T0NrcuedLxt4IdPKx+H5hkcYcwtwzRMPUZVIPiW1UMgWSa+SW5YGazfvmdIX4JIdlX+t
 OYID99XfaE8mjxLkSD0sXTKnZzQ/fP5/8WdKx2t2tYj+T8sr4rzmNCLyRxnTx3Vt4h6D
 Mrcg5i+hNwTYpj+3ewH5FK8f5GOCbHiPZAJuB1xb3vxgnGCJ/woy/7MYbL28pA83PEb4
 tmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3jD9yp6qlJBjnGK71vd1+QrSS8jJwwo03ILf5B9iqN8=;
 b=VePkd3YMpWlAvooMa8rwv0zr/PosExJdc2x/x3iIURS9eKOgwMfMvZOjvndT1gWOzi
 MaCsPkjO8o9rlsCUgq9WrOeSK2Wcgi5eLX7lOusUEpbXf5D2PGw3TAt3d1XygCQWqttC
 3AJ0yvZ8UpJsy7V6PxETPhTwIXgxOuScnFXV40Neo1lJNEGSM0qedkT2Xah3J8BN3o4V
 eI2TqZBFMKSzpu9LGH7yg2q/kvPKLv5Q9sAKPhjO2nq7ruiC+XcHfCsV7jCQVq5Ko1Vu
 +lMOXsRP+8X5P104YjplaWpa892l1g2NCbAxP90qV1SRILOVHV7iLHOzIIZWdQnEAohB
 lKAw==
X-Gm-Message-State: AA6/9Rl4UpfyTaHmkCfYeSQqJeHTsRqZNavMPlxdfSHhOQRVNHdCh0AE78XfgMPcJbbgsngDenVvOaYTsviomSky
X-Received: by 10.13.212.147 with SMTP id w141mr7385553ywd.180.1476384090465; 
 Thu, 13 Oct 2016 11:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.210.2 with HTTP; Thu, 13 Oct 2016 11:41:29 -0700 (PDT)
In-Reply-To: <CAPH-5w6RE2j7ghR9vhX2ANUQAvBx4GuhquZ=v8r9_vYK6q+9OQ@mail.gmail.com>
References: <CAPH-5w6RE2j7ghR9vhX2ANUQAvBx4GuhquZ=v8r9_vYK6q+9OQ@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 13 Oct 2016 11:41:29 -0700
Message-ID: <CAFR_W8roBycAtvE-sNLfKRTMw=uPusx0tdWU-az4mqB7N9N8UA@mail.gmail.com>
Subject: Re: Single device tree blob between linux and u-boot
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114fba1a444388053ec3750d
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
X-List-Received-Date: Thu, 13 Oct 2016 18:41:33 -0000

--001a114fba1a444388053ec3750d
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2016 at 11:20 AM, Xo Wang <xow@google.com> wrote:

> Hi folks,
>
> I saw Cedric had mentioned "...you can use the linux compiled [dtb]
> and dd it at the end of the u-boot
> partition..."
>
> To provide the device tree to u-boot, should we do what Cedric said
> and also pass the address of the DTB from U-Boot to Linux? According
> to these slides:
>
> https://events.linuxfoundation.org/sites/events/files/slides/petazzoni-
> device-tree-dummies.pdf
>
> U-Boot can pass the DTB address to Linux in r2 (p. 6) with the right
> bootm command parameters.
>
> This means we can have U-Boot and Linux use the same DTB binary (I
> prefer built in Linux) rather than each source tree building one.
>

This introduces the dependency of U-Boot on Linux. Do we plan to keep this
dependency forever? This may be fine with OpenBMC, but what about mainline
U-Boot and Linux?
Also, are we sure that they are 100% compatible? IIRC Peter was saying that
in practice you need two different device trees for U-Boot and Linux.


>
> Then we can remove the CONFIG_ARM_APPENDED_DTB option in our Linux
> build that is described as a legacy "compatibility" mechanism. We also
> avoid having an extra copy of the DTSs in U-Boot source and avoid
> duplicate DTBs in our image.
>
> Thoughts?
>
> cheers
> xo
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>



-- 
*M*axim *S*loyko

--001a114fba1a444388053ec3750d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Oct 13, 2016 at 11:20 AM, Xo Wang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:xow@google.com" target=3D"_blank">xow@google.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi folks,<br>
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
//events.<wbr>linuxfoundation.org/sites/<wbr>events/files/slides/petazzoni-=
<wbr>device-tree-dummies.pdf</a><br>
<br>
U-Boot can pass the DTB address to Linux in r2 (p. 6) with the right<br>
bootm command parameters.<br>
<br>
This means we can have U-Boot and Linux use the same DTB binary (I<br>
prefer built in Linux) rather than each source tree building one.<br></bloc=
kquote><div><br></div><div>This introduces the dependency of U-Boot on Linu=
x. Do we plan to keep this dependency forever? This may be fine with OpenBM=
C, but what about mainline U-Boot and Linux?</div><div>Also, are we sure th=
at they are 100% compatible? IIRC Peter was saying that in practice you nee=
d two different device trees for U-Boot and Linux.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
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
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--001a114fba1a444388053ec3750d--
