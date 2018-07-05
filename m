Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::230; helo=mail-qt0-x230.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XaiiUPss"; 
 dkim-atps=neutral
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LhY12bDLzDqHx
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jul 2018 12:25:33 +1000 (AEST)
Received: by mail-qt0-x230.google.com with SMTP id l10-v6so5967776qtj.0
 for <openbmc@lists.ozlabs.org>; Wed, 04 Jul 2018 19:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4q86nbvm0ml1FsJ0LYeGQVTFnOHlCcxP+UTpHm+K5+o=;
 b=XaiiUPss2OIR1AXXoQUUIyFfY83AfWALXhG17hQRT/cr3R96WkcNi7dpFxXF6wD70i
 oBom9AcZjbqHBcXO9+MtLrIe1XmBWMWLs1S3VmOzmQEsPYqn54FIEXv4mk0glpqtEQwS
 GYkuuz78uap3AlwGvpYuKIP8sDEPPlZ4Q6ZXO/iPEz4MaSBncNalCvzWhpuHfosaekEh
 aETyGAH8S0nxR1AgUh0QYNIxSE8EKizsriupbyYEDBZmG5O+HQZVI+oC+FDWhUe6+DYV
 dD1R/AC9WAG70acJEjNzky8Vax7EtqIs5r5WmvOT/qRq74WIOWCDoQCT9QZaeJG6VA4P
 CaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4q86nbvm0ml1FsJ0LYeGQVTFnOHlCcxP+UTpHm+K5+o=;
 b=G4GPS0Lgsyf2CXhkEFqAVfXbb/LRDqBiMQ1gOcDyGWreo0zK8VLTRCudm91vk6sQkX
 prmDlRSSGZpmshC8LfWjVuTVReQmMSjyYko4JddrzUbyunXWx/Q/mR84QMy20GhERmAW
 vNodg97eL/O3uO9uud+H18TOEbIrH40hUgfnNXS0OXEwDJCDShRDMs6QYYUpNIVttvQG
 bgUIk8O24eXSt1Ht/4EmLGU9LTVT2lsPSNKvVq4B5JOJHR+KsMgU/hqu1wThSMdQDRrx
 28yOVkx0xu2FN3LPHN1h2XCjkXrhqD00w3KJU2tNnxlV1GcRm/h1H+L21W+lKP9gdbwh
 P0ww==
X-Gm-Message-State: APt69E04lzRV6kAKMEOVhU8BI3wa67SfnsyE8kdx5gpVEk6q/X6nTw8p
 Scw6XzmTjZU9x9S+etxVdmoXVnlmX3nwM0QdNBkHxA==
X-Google-Smtp-Source: AAOMgpeOOmFwNpU1Cuco6g4tcceSVGFpWB9OyI8inBvbKLlK0JNYtr0i1fKQWQjlyuuStf7mrgthNs6jcBlWGJL5fns=
X-Received: by 2002:ac8:1087:: with SMTP id
 a7-v6mr3668962qtj.269.1530757531521; 
 Wed, 04 Jul 2018 19:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLET5QNui-zYtXvmShkBr4UJfdwMoUP7bRZk0br1803wzg@mail.gmail.com>
 <SN6PR01MB4270F800A0E79709FFC1133FF4430@SN6PR01MB4270.prod.exchangelabs.com>
In-Reply-To: <SN6PR01MB4270F800A0E79709FFC1133FF4430@SN6PR01MB4270.prod.exchangelabs.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 4 Jul 2018 19:25:20 -0700
Message-ID: <CAJoAoZ=E=+YhfYX0kdY_HkmyKE1YtXQEoGr5SXu1B60U3UzasA@mail.gmail.com>
Subject: Re: Unable to execute IPMI commands
To: Chuong Le Anh Tran <chuong.tran@amperecomputing.com>
Cc: AKASH G J <akashgj91@gmail.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e80e0305703742d1"
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
X-List-Received-Date: Thu, 05 Jul 2018 02:25:43 -0000

--000000000000e80e0305703742d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you not have the device /dev/ipmi0 or /dev/ipmidev/0 in your sysfs? You
may not have your IPMI device configured correctly.  Which wire are you
trying to use IPMI over, LAN or something like LPC or IPMB?

On Sun, Jul 1, 2018 at 11:02 PM Chuong Le Anh Tran <
chuong.tran@amperecomputing.com> wrote:

> Hi Akash,
>
>
>
> Where did you get ipmitool? I believe command =E2=80=9Cipmitool -I dbus=
=E2=80=9D works
> normally. phosphor-ipmi-tool recipe (https://github.com/openbmc/ipmitool)
> supports OpenBMC D-Bus protocol. You can easily package that ipmitool to
> openbmc rootfs, try to add below line to your machine conf file and rebui=
ld
> openbmc* phosphor image.*
>
>
>
> OBMC_IMAGE_EXTRA_INSTALL_append +=3D =E2=80=9Cphosphor-ipmi-tool=E2=80=9D
>
>
>
> Best regards,
>
> Chuong.
>
>
>
>
>
> *From:* openbmc [mailto:openbmc-bounces+chuong.tran=3D
> amperecomputing.com@lists.ozlabs.org] *On Behalf Of *AKASH G J
> *Sent:* Monday, July 2, 2018 11:23 AM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* Unable to execute IPMI commands
>
> _________________________________________________________________________=
_______________________________________________
>
>
> Hi Team,
>
>
>
> I am new in BMC. We have one custom board that contains Aspeed AST-2500
> BMC chip. I have installed openbmc Linux into the board and tried to
> execute IPMI commands using ipmitool. I tried with both open interface an=
d
> dbus interface. But it is showing errors "*Could not open device at
> /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0*. No such file or directory"
> and "*error loading interface dbus*". Please someone help to resolve this=
.
>
>
>
> Whether any firmware required for running IPMI commands on the board,
> other than openbmc Linux image ?
>
>
>
>
>
>
>
>
>
> Thanks and regards,
>
>
>
> Akash G J
>

--000000000000e80e0305703742d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do you not have the device /dev/ipmi0 or /dev/ipmidev/0 in=
 your sysfs? You may not have your IPMI device configured correctly.=C2=A0 =
Which wire are you trying to use IPMI over, LAN or something like LPC or IP=
MB?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun, Jul 1, 201=
8 at 11:02 PM Chuong Le Anh Tran &lt;<a href=3D"mailto:chuong.tran@ampereco=
mputing.com">chuong.tran@amperecomputing.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-343722079648607875WordSection1">
<p class=3D"MsoNormal">Hi Akash,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Where did you get ipmitool? I believe command =E2=80=
=9Cipmitool -I dbus=E2=80=9D works normally. phosphor-ipmi-tool recipe (<a =
href=3D"https://github.com/openbmc/ipmitool" target=3D"_blank">https://gith=
ub.com/openbmc/ipmitool</a>) supports OpenBMC D-Bus protocol. You can
 easily package that ipmitool to openbmc rootfs, try to add below line to y=
our machine conf file and rebuild openbmc<u> phosphor image.<u></u><u></u><=
/u></p>
<p class=3D"MsoNormal"><u><u></u><span style=3D"text-decoration:none">=C2=
=A0</span><u></u></u></p>
<p class=3D"MsoNormal">OBMC_IMAGE_EXTRA_INSTALL_append +=3D =E2=80=9Cphosph=
or-ipmi-tool=E2=80=9D<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Best regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Chuong.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><a name=3D"m_-343722079648607875__MailEndCompose"><u=
></u>=C2=A0<u></u></a></p>
<span></span>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openbmc [mailto:<a href=3D"mailto:openb=
mc-bounces%2Bchuong.tran" target=3D"_blank">openbmc-bounces+chuong.tran</a>=
=3D<a href=3D"mailto:amperecomputing.com@lists.ozlabs.org" target=3D"_blank=
">amperecomputing.com@lists.ozlabs.org</a>]
<b>On Behalf Of </b>AKASH G J<br>
<b>Sent:</b> Monday, July 2, 2018 11:23 AM<br>
<b>To:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Unable to execute IPMI commands<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">____________________________________________________=
____________________________________________________________________
<u></u><u></u></p></div></div></div><div lang=3D"EN-US" link=3D"blue" vlink=
=3D"purple"><div class=3D"m_-343722079648607875WordSection1"><div style=3D"=
border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt">
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi Team,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I am new in BMC. We have one custom board that conta=
ins Aspeed AST-2500 BMC chip. I have installed openbmc Linux into the board=
 and tried to execute IPMI commands using ipmitool. I tried with both open =
interface and dbus interface. But
 it is showing errors &quot;<b>Could not open device at /dev/ipmi0 or /dev/=
ipmi/0 or /dev/ipmidev/0</b>. No such file or directory&quot; and &quot;<b>=
error loading interface dbus</b>&quot;. Please someone help to resolve this=
.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Whether any firmware required for running IPMI comma=
nds on the board, other than openbmc Linux image ?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks and regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Akash G J<u></u><u></u></p>
</div>
</div>
</div>
</div></div></div></blockquote></div>

--000000000000e80e0305703742d1--
