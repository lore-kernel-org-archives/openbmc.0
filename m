Return-Path: <hannwang@gmail.com>
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJhGH1lS7zDvmn
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 22:04:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tHrZKkHH"; 
 dkim-atps=neutral
Received: by mail-it0-x232.google.com with SMTP id l8so8464833iti.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 03:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=gmWoI86JvRd4MgvQjKaQLXqKw/B6+HHKVHD67BPYynU=;
 b=tHrZKkHHNUBtM7nNATIcBESp557IyWsUCwf28BiaZJIwAHRdaqwS+IGOg/DSmR0jBB
 8X59Ut21UKdEAe/rf37Z7URtQ+2CLp0gjJ4bWWKasBi0ynJT409PnMsddwTRbHghFMgi
 mX6QTJPCgsjTbv2G2eso3Dc0DvtYmxKn818z3/uqxbcxk5Sub9GMF7ObNaqrdKPqqPOc
 QdsQiLTEKKqBO/Cg2Uhz8+y/GWAIjTDQacFNIR3hoQBgVfW3OviwgqSXo5QJAst0En0B
 8O78zlEaiYzC4a0UBFV6Ciyi8H/BU7Saa4NtViQQIGiUuuZZ5J973STiI/S/M84FHauX
 XM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gmWoI86JvRd4MgvQjKaQLXqKw/B6+HHKVHD67BPYynU=;
 b=M/8pvVkuW7V1nXGK6MqJXKJYJ68ok8pGa6hWS4Vsqgc01WIC9eOWRseuft62+i47oU
 EQ91n/opdlKyPgAlNHDsjSzsRwH4tLDxiusPCFmSgiJQZkc1NCPUIvVP40e5oPTBgT7z
 gLPlMOTa6F+MB8A5Zf9rM6YV0enpLncap6OL4B81b3SgaQLc7JJs+2gaBbIzrFzXEQTv
 jZEqcNhOpz60DfISA+RS1wJ7aPTuCzonBM2z+0dTJjl4TffjN9l+jJormaZsX7NAiijy
 A+Dz9jepExn+GnuU1Cge76Yz6009I/0c0jYFzhx4k0QWXQ+ZjBZxc0+q6fE9mNotyGlp
 rtaw==
X-Gm-Message-State: ABUngvdZLf77+FjFgyCpKz82+gWkga6LioVaMUAS+7Amgv/vF0+QWvtPrDzNRFEn0/mjfPudL0LaElppS3M8RQ==
X-Received: by 10.107.35.11 with SMTP id j11mr2050284ioj.68.1479294245160;
 Wed, 16 Nov 2016 03:04:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.170.13 with HTTP; Wed, 16 Nov 2016 03:03:44 -0800 (PST)
From: Hann Wang <hannwang@gmail.com>
Date: Wed, 16 Nov 2016 19:03:44 +0800
Message-ID: <CALPyGmSubhKwB9NhGDyxfaiqTpv3CdypBcEhTM7wFTc=v9Qyqw@mail.gmail.com>
Subject: Firestone cannot access local network
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a114190ec004be905416908b3
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
X-List-Received-Date: Wed, 16 Nov 2016 11:04:07 -0000

--001a114190ec004be905416908b3
Content-Type: text/plain; charset=UTF-8

I add BCM54210E drvier to linux kernel, my machine can get IP from DHCP
serverip now.
I try access internet is good, but I can't access local network.
I can ping my laptop in local network, but ssh/telnet/tftp doesn't work.
I access from another laptop to my laptop is ok.

--001a114190ec004be905416908b3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I add BCM54210E drvier to linux kernel, my machine can get=
 IP from DHCP serverip now.<br><div>I try access internet is good, but I ca=
n&#39;t access local network.</div><div>I can ping my laptop in local netwo=
rk, but ssh/telnet/tftp doesn&#39;t work.</div><div>I access from another l=
aptop to my laptop is ok.</div><div><br></div></div>

--001a114190ec004be905416908b3--
