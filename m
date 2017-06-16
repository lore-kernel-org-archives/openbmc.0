Return-Path: <maxims@google.com>
Received: from mail-io0-x233.google.com (mail-io0-x233.google.com
 [IPv6:2607:f8b0:4001:c06::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wqFB55QsBzDqMS
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2017 08:18:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jNEQ5yv9"; 
 dkim-atps=neutral
Received: by mail-io0-x233.google.com with SMTP id t87so37957399ioe.0
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PI51RSvOYUmaSu5C0N+tU6KJbwpfRDm/Tb0hgLzUP4k=;
 b=jNEQ5yv9Dp3ShHI5nTF7TFIo2VWUEVSi9GQ5yGOhyHKmQB8tP+hnxSIdpgzehx70TN
 Aalfd7IkqnpL0bvp/OxAbEu3+gq19FYzAd79ENDoHgM4ZBLZrlOeLXBzQJTjEOMXS4/J
 EXe77ODmYd8sv3d6RMVr+6mfVu2BllasKiXgvOKh1BUZLy/O4Ing9vxSa79nUbNXAykl
 Wxo8kMEvyudX6EiNcu0vlHXIpWB3+0JPUwOIx7vxbkermUas+g239/7UsMlil8+BfSwG
 tAvhSIRf/RgehFuJk8/IlBK+l2SLP07AbEoJZbZHnuFOgHknFIiVPbGLW5w5QLHvfOwr
 ALpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PI51RSvOYUmaSu5C0N+tU6KJbwpfRDm/Tb0hgLzUP4k=;
 b=XD7AmolY/wdCyEGZAs/GKoITAOTgypoQyjbdyWjUMZ6LHz7kkMV4w78UiGxQ43F/Z5
 5yHc7ryY/d2KFqDx27qlbak1yl7yBcUr+m7Ru3JA/+vPIdKnusxcl/OwgqaugHoIVr+O
 8HYjPQTFgRy5zahDauDaogtkp/Sx5CyArnKFbe1MdtAReuI68Cu7Lqx+E8d43RmmdqhE
 tKdvKUL1WIQfzqMVrRRkwodw8XPpALbRoOQrN22T8n510yqww6d6+scHTqDQNatHEyJt
 Ju2TcBIDsBaEqZVLkxVngcUanf5YmTylCaGqpGkMe/XhvkRAYBmqvV/rFTLUmhGdKH24
 Er0g==
X-Gm-Message-State: AKS2vOwlr3mAh2qGr1nVeji3J35s3ek8KXak0gbW1yrTlfT05UHeU9D2
 Bs0pBfzLNDV2/fGt2HAxGU0Gna630ECd
X-Received: by 10.107.178.130 with SMTP id b124mr12343195iof.50.1497651481099; 
 Fri, 16 Jun 2017 15:18:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.90 with HTTP; Fri, 16 Jun 2017 15:18:00 -0700 (PDT)
In-Reply-To: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 16 Jun 2017 15:18:00 -0700
Message-ID: <CAFR_W8pDQxg9sGmOVOhfJUAo1MqO0LOALrm9uuUDU2Dp836Y8g@mail.gmail.com>
Subject: Re: OpenBMC Image Management
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114c987687a03505521b28d5"
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
X-List-Received-Date: Fri, 16 Jun 2017 22:18:06 -0000

--001a114c987687a03505521b28d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adriana,

On Wed, Jan 25, 2017 at 2:15 PM, Adriana Kobylak <anoo@linux.vnet.ibm.com>
wrote:

> Hi,
>
> Here is a first draft proposal for image management (code update) in
> OpenBMC for feedback.
>
> General:
> * Move to UBI volume management (on the BMC and PNOR chips), which
> provides dynamic partitioning and wear-leveling. In a limited flash space
> environment there might be the need to re-allocate partition space and
> resizing in a static partitioning implementation can be very painful.
> * Use CRAMFS for read-only partitions, and UBIFS for read-write partition=
s.
>
> PNOR:
> * Implement a new mboxd based on Cyril=E2=80=99s (see Cyril=E2=80=99s ema=
il =E2=80=9CMailbox
> daemon=E2=80=9D) that handles dbus objects, generates a virtual PNOR for =
UBI
> content, etc.
> * Move to memory-based access instead of the current LPC-to-AHD path.
> * Allocate just enough space in the initial window for Hostboot=E2=80=99s=
 TOC,
> HBB, and HBI partitions, grow as required.
> * Ability to =E2=80=98patch=E2=80=99 by copying a Hostboot image *.bin in=
to a designated
> directory (/usr/local/ for example).
> * Tool to write from PNOR image to BMC format. Implement UBI initially bu=
t
> it could be extended to support different volume managements on other BMC=
s.
>
> BMC:
> *Save multiple firmware versions, starting with 2, to provide the ability
> to roll-back if needed. If single BMC chip system, save both versions
> there. If two BMC chip system, save other version in 2nd chip.
> * Implement various levels of =E2=80=98persistency=E2=80=99, such as dev,=
 factory, field.
> Dev persistency would allow for local patches (/usr/local/ for example)
> that can be cleared before shipping to customers. Factory mode could dele=
te
> the location where user data such as network settings resides but preserv=
es
> the mac address and uuid for example. Etc.
>

I'm interested in roll-back feature, do you have something working already
or is this still under construction?

Sorry, I could not find anything in the docs or code about it.

Thanks


>
> Thanks,
>
> Adriana
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>



--=20
*M*axim *S*loyko

--001a114c987687a03505521b28d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Adriana,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, Jan 25, 2017 at 2:15 PM, Adriana Kobylak <span dir=
=3D"ltr">&lt;<a href=3D"mailto:anoo@linux.vnet.ibm.com" target=3D"_blank">a=
noo@linux.vnet.ibm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi,<br>
<br>
Here is a first draft proposal for image management (code update) in OpenBM=
C for feedback.<br>
<br>
General:<br>
* Move to UBI volume management (on the BMC and PNOR chips), which provides=
 dynamic partitioning and wear-leveling. In a limited flash space environme=
nt there might be the need to re-allocate partition space and resizing in a=
 static partitioning implementation can be very painful.<br>
* Use CRAMFS for read-only partitions, and UBIFS for read-write partitions.=
<br>
<br>
PNOR:<br>
* Implement a new mboxd based on Cyril=E2=80=99s (see Cyril=E2=80=99s email=
 =E2=80=9CMailbox daemon=E2=80=9D) that handles dbus objects, generates a v=
irtual PNOR for UBI content, etc.<br>
* Move to memory-based access instead of the current LPC-to-AHD path.<br>
* Allocate just enough space in the initial window for Hostboot=E2=80=99s T=
OC, HBB, and HBI partitions, grow as required.<br>
* Ability to =E2=80=98patch=E2=80=99 by copying a Hostboot image *.bin into=
 a designated directory (/usr/local/ for example).<br>
* Tool to write from PNOR image to BMC format. Implement UBI initially but =
it could be extended to support different volume managements on other BMCs.=
<br>
<br>
BMC:<br>
*Save multiple firmware versions, starting with 2, to provide the ability t=
o roll-back if needed. If single BMC chip system, save both versions there.=
 If two BMC chip system, save other version in 2nd chip.<br>
* Implement various levels of =E2=80=98persistency=E2=80=99, such as dev, f=
actory, field. Dev persistency would allow for local patches (/usr/local/ f=
or example) that can be cleared before shipping to customers. Factory mode =
could delete the location where user data such as network settings resides =
but preserves the mac address and uuid for example. Etc.<br></blockquote><d=
iv><br></div><div>I&#39;m interested in roll-back feature, do you have some=
thing working already or is this still under construction?</div><div><br></=
div><div>Sorry, I could not find anything in the docs or code about it.</di=
v><div><br></div><div>Thanks=C2=A0</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Thanks,<br>
<br>
Adriana<br>
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

--001a114c987687a03505521b28d5--
