Return-Path: <raltherr@google.com>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPdry556XzDqBn
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:33:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jcP/5qXe"; 
 dkim-atps=neutral
Received: by mail-it0-x231.google.com with SMTP id x75so3768048itb.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 19:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cJU2mc7nExJkuuxV1hkelcoVaMmM84jGGiaNVXtF/G4=;
 b=jcP/5qXedYUGt2ghlnj1BFMN7nW+waCAiDKT5NkFInz9xvuZzCleRqT3ETqH6r2N3y
 eZJ5zNP9ibC2qEqJsXzBuFWF9zd3NTImishRwAcgOC7FZfI4fhVQ7826SUV9TAcYm+i+
 BxPQm56FEmTsMUW4f8j/t9V9GwDvFFGbFVhrKhdM8RYGR7I2EHg33CcLMn6Z/t5SnBLd
 072d5yKkzd/ouSdDkLnfTzDKPZ0Oxvdwv89f58gyo1+b0xel2X0r6ughnJrmWvn93F6y
 23E1XK/9rO0UwjHnGHP3ap8KultpQEkiBkyM5INhh6Kf8OFZiB+7ZFSn1P1QaXGXi+jO
 Xq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cJU2mc7nExJkuuxV1hkelcoVaMmM84jGGiaNVXtF/G4=;
 b=lGHFBrThu5AP7UvNyHzBs4douoC38pWi2SArTnrvTBmNu8jshABfW0DLPH/vHqppXS
 E6eK43k9GltBXmIkgPf+5gD4/K6asX1yxK+wxrWetRrbnnowBSdc1/L6kI5BaXzrgowg
 AtHAdNPwa3MwtZVQ5rFx1m+WqISvn86C9Y7F+vF45flAjN49NcCjuvOaNLO88KPuJkec
 P/343fHB+7ZnohwVDbsmDVLY4UK7zRnP6AGiosnpoBJv7ANNngwjVmE8lpE3s+2Rsdwf
 t992Jpu7rpH+FuMVwiHLMfsoiCJI9iqj+Dg6MZiL15vGFXmW+vg8ZP993+6+x3LfQft+
 csiA==
X-Gm-Message-State: AMke39m3R3u7iuNq4B3DnLDNAgY3bJJ9MWl0RdRbg670g0avaZDlHuBtoSZh/vcMcvrTI76uFx6FXapEbkk6FvjX
X-Received: by 10.36.47.78 with SMTP id j75mr471899itj.105.1487302384203; Thu,
 16 Feb 2017 19:33:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Thu, 16 Feb 2017 19:33:03 -0800 (PST)
Received: by 10.64.133.226 with HTTP; Thu, 16 Feb 2017 19:33:03 -0800 (PST)
In-Reply-To: <CAPLgG=kMbxDs32dw6uGwabVsGevv5w7g42E+KtHERToowM5HKg@mail.gmail.com>
References: <20170217031230.12800-1-cyrilbur@gmail.com>
 <CAPLgG==cyh05UMqj3VD1cTjQX9ycuG36ECGumT84MKo5sO+MAg@mail.gmail.com>
 <CAPLgG=kMbxDs32dw6uGwabVsGevv5w7g42E+KtHERToowM5HKg@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 16 Feb 2017 19:33:03 -0800
Message-ID: <CAPLgG=kFuyyZoX=g4_sZQgMG=r+dk-AjKADYBof0mwhH8Q5JZQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Update reserved memory nodes for
 zaius and witherspoon
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary=001a1144db7c4942d80548b1927c
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
X-List-Received-Date: Fri, 17 Feb 2017 03:33:07 -0000

--001a1144db7c4942d80548b1927c
Content-Type: text/plain; charset=UTF-8

Current Zaius and Barreleye G2 boards have AST2500 which has VGA support.
Google hasn't tried the VGA but it is there. We plan to switch to 2520
later for our own designs but it's only a BOM option to switch between the
two.

On Feb 16, 2017 7:15 PM, "Cyril Bur" <cyrilbur@gmail.com> wrote:

Zaius platform doesn't use VGA so don't reserve that memory

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
v2: Drop reserving the framebuffer on Zaius
    Both platforms have 1GB not 512MB - adjust numbers
    Add comment requested by Joel.

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 15 +++++++++++++--
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 12 ++++++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 4b2d8aa8abb6..b79cadb2f6d7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -25,9 +25,20 @@
                #size-cells = <1>;
                ranges;

-               flash_memory: region@94000000 {
+               /*
+                * The addreses for the flash_memory reserved range are the
+                * highest allowable for the size of the mapping (ie, the
+                * address has no set bits greater than the size)
+                */
+
+               flash_memory: region@b8000000 {
+                       no-map;
+                       reg = <0xb8000000 0x04000000>; /* 64M */
+               };
+
+               vga_memory: framebuffer@bc000000 {
                        no-map;
-                       reg = <0x94000000 0x04000000>; /* 64M */
+                       reg = <0xbc000000 0x04000000>; /* 64M */
                };
        };

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e1c9b3f4fe44..5a06da43801b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -25,10 +25,18 @@
                #size-cells = <1>;
                ranges;

-               flash_memory: region@94000000 {
+               /*
+                * The addreses for the flash_memory reserved range are the
+                * highest allowable for the size of the mapping (ie, the
+                * address has no set bits greater than the size)
+                */
+
+               flash_memory: region@bc000000 {
                        no-map;
-                       reg = <0x94000000 0x04000000>; /* 64M */
+                       reg = <0xbc000000 0x04000000>; /* 64M */
                };
+
+               /* Zaius doesn't use VGA so don't reserve VGA buffer */
        };

        onewire0 {
--
2.11.1

--001a1144db7c4942d80548b1927c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Current Zaius and Barreleye G2 boards have AST2500 which =
has VGA support.=C2=A0 Google hasn&#39;t tried the VGA but it is there. We =
plan to switch to 2520 later for our own designs but it&#39;s only a BOM op=
tion to switch between the two.</div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Feb 16, 2017 7:15 PM, &quot;Cyril Bur&quot; &lt;<a h=
ref=3D"mailto:cyrilbur@gmail.com">cyrilbur@gmail.com</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Zaius platform doesn&#39;t use VG=
A so don&#39;t reserve that memory<br>
<div class=3D"quoted-text"><br>
Signed-off-by: Cyril Bur &lt;<a href=3D"mailto:cyrilbur@gmail.com">cyrilbur=
@gmail.com</a>&gt;<br>
---<br>
</div>v2: Drop reserving the framebuffer on Zaius<br>
=C2=A0 =C2=A0 Both platforms have 1GB not 512MB - adjust numbers<br>
=C2=A0 =C2=A0 Add comment requested by Joel.<br>
<br>
=C2=A0arch/arm/boot/dts/aspeed-bmc-<wbr>opp-witherspoon.dts | 15 ++++++++++=
+++--<br>
=C2=A0arch/arm/boot/dts/aspeed-bmc-<wbr>opp-zaius.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 12 ++++++++++--<br>
=C2=A02 files changed, 23 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-witherspoon.dts b/arch/a=
rm/boot/dts/aspeed-<wbr>bmc-opp-witherspoon.dts<br>
index 4b2d8aa8abb6..b79cadb2f6d7 100644<br>
--- a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-witherspoon.dts<br>
+++ b/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-witherspoon.dts<br>
@@ -25,9 +25,20 @@<br>
<div class=3D"quoted-text">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 #size-cells =3D &lt;1&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_memory: regio=
n@94000000 {<br>
</div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The addreses for=
 the flash_memory reserved range are the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * highest allowabl=
e for the size of the mapping (ie, the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * address has no s=
et bits greater than the size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_memory: regio=
n@b8000000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0no-map;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0xb8000000 0x04000000&gt;; /* 64M */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vga_memory: framebu=
ffer@bc000000 {<br>
<div class=3D"quoted-text">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no-map;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x94000000 0x04000000&gt;; /* 64M */<br>
</div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0reg =3D &lt;0xbc000000 0x04000000&gt;; /* 64M */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
diff --git a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts b/arch/arm/boo=
t/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
index e1c9b3f4fe44..5a06da43801b 100644<br>
--- a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
+++ b/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
@@ -25,10 +25,18 @@<br>
<div class=3D"quoted-text">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 #size-cells =3D &lt;1&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_memory: regio=
n@94000000 {<br>
</div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The addreses for=
 the flash_memory reserved range are the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * highest allowabl=
e for the size of the mapping (ie, the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * address has no s=
et bits greater than the size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_memory: regio=
n@bc000000 {<br>
<div class=3D"quoted-text">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no-map;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x94000000 0x04000000&gt;; /* 64M */<br>
</div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0reg =3D &lt;0xbc000000 0x04000000&gt;; /* 64M */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Zaius doesn&#39;=
t use VGA so don&#39;t reserve VGA buffer */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 onewire0 {<br>
<font color=3D"#888888">--<br>
2.11.1<br>
<br>
</font></blockquote></div><br></div>

--001a1144db7c4942d80548b1927c--
