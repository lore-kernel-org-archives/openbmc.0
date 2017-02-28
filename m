Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXYV1625RzDqH4
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 20:40:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KCFeTOoS"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id l138so606813ywc.0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 01:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nwBlF6c8ZYCQF64EnkCuLaIvV75o1PTsvrKsq/dD5Bw=;
 b=KCFeTOoSJlJPdD5n1bVsnwEGIJiF3JOahPky9GckICPYCnulgOdP/+u5OR4G95HHhW
 SYxZdKIiXTCbpSB7iORwmWUSJuOoR4oCyWt6M4b7y8iDzmKf5pzYPmi8xdQu6ZMam6de
 yth5wuDZAgL75ysFoI44e0PqLzDy1bkpg9OEvEiw2iKTgWP/Ln7/IZYyTe9zGHyHBC9U
 n2crrfEkIcBaVQaE9FWo8GnUVvmZtkyOJTNqR4FzAYQBiGU6ETOOIH7ykqvKeXyToKi/
 6sjeMV+LWcIkX+HZnnplkgjoKKDdOjTW9HfpbAiJ95O3Z3aFRavN1DbhJCjruIb/KLP+
 u9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nwBlF6c8ZYCQF64EnkCuLaIvV75o1PTsvrKsq/dD5Bw=;
 b=NRV63JWMGK+fsfanKMvGajVhVjL/IxyopE+FSx4G8ucGPz2UGD4jGo4EHr9Ma00Xst
 Z3AxzygLIP886qbQoTNDaIU1VQUvy6J8OWCJaz8oW1zwqNWLsR7IpfzHL6HbtV0CyI/g
 ZqCvctScbOrdTNiYx/2b8JlNvsudVdHo/s7Am3vt6DUbXIhI9UDT+1nAjlDp52agFb9z
 Vc0ZNpuwLG3jI0qbs6N9uY76g2KNSOgIVahaqYYTO+Y4u88Go/qM6j1sETLMu0U2aKMd
 kCsENDQ+m5Frs+xOO41einfAPcZ+GYm7lWpwGBlpLgWSIRLi4MHreQ9AXve043UXfx+y
 4Ngg==
X-Gm-Message-State: AMke39nOj77f/WWs2UaTGLBcRsQBOUBOBlioV50BcCQDqrkekGznHLQAh0BMZzMf7OcyHkjwk95M0dgWB9oKCg==
X-Received: by 10.129.101.195 with SMTP id z186mr314052ywb.11.1488274839256;
 Tue, 28 Feb 2017 01:40:39 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Tue, 28 Feb 2017 01:40:37 -0800 (PST)
Received: by 10.37.27.133 with HTTP; Tue, 28 Feb 2017 01:40:37 -0800 (PST)
In-Reply-To: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
References: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Feb 2017 20:10:37 +1030
X-Google-Sender-Auth: GCZSzD23rVo9sZoFz4Kug073mzo
Message-ID: <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI address
 mapping
To: Lei YU <mine260309@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Cyril Bur <cyrilbur@gmail.com>, Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114c6c9c1f5db1054993fd8e
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
X-List-Received-Date: Tue, 28 Feb 2017 09:40:42 -0000

--001a114c6c9c1f5db1054993fd8e
Content-Type: text/plain; charset=UTF-8

On 28 Feb 2017 17:49, "Lei YU" <mine260309@gmail.com> wrote:

The PNOR SPI address mapping is the same as Witherspoon.


This should be handled by the device drivers we now have.

Mbox brains trust, any idea why we would still need this?

Cheers,

Joel


Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 726b8fa..ec9eecf 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -221,6 +221,24 @@ static void __init do_witherspoon_setup(void)
 static void __init do_romulus_setup(void)
 {
        do_common_setup();
+
+       /* Setup PNOR address mapping for 64M flash
+        *
+        *   ADRBASE: 0x3000 (0x30000000)
+        *   HWMBASE: 0x0C00 (0x0C000000)
+        *  ADDRMASK: 0xFC00 (0xFC000000)
+        *   HWNCARE: 0x03FF (0x03FF0000)
+        *
+        * Mapping appears at 0x60300fc000000 on the host
+        */
+       writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+       writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+
+       /* Set SPI1 CE1 decoding window to 0x34000000 */
+       writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
+
+       /* Set SPI1 CE0 decoding window to 0x30000000 */
+       writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
 }

 #define SCU_PASSWORD   0x1688A8A8
--
1.9.1

--001a114c6c9c1f5db1054993fd8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 28 Feb 2017 17:49, &quot;Lei YU&quot; &lt;<a href=3D"mailto:mi=
ne260309@gmail.com">mine260309@gmail.com</a>&gt; wrote:<br type=3D"attribut=
ion"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">The PNOR SPI address mapping is the same as W=
itherspoon.<br></blockquote></div></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">This should be handled by the device drivers we now have.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Mbox brains trust, any i=
dea why we would still need this?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Joel</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Lei YU &lt;<a href=3D"mailto:mine260309@gmail.com">mine26030=
9@gmail.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/mach-aspeed/aspeed.c | 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
<br>
diff --git a/arch/arm/mach-aspeed/aspeed.<wbr>c b/arch/arm/mach-aspeed/aspe=
ed.<wbr>c<br>
index 726b8fa..ec9eecf 100644<br>
--- a/arch/arm/mach-aspeed/aspeed.<wbr>c<br>
+++ b/arch/arm/mach-aspeed/aspeed.<wbr>c<br>
@@ -221,6 +221,24 @@ static void __init do_witherspoon_setup(void)<br>
=C2=A0static void __init do_romulus_setup(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_common_setup();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Setup PNOR address mapping for 64M flash<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0ADRBASE: 0x3000 (0x30000000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0HWMBASE: 0x0C00 (0x0C000000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 ADDRMASK: 0xFC00 (0xFC000000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0HWNCARE: 0x03FF (0x03FF0000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Mapping appears at 0x60300fc000000 on the ho=
st<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88))=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C))=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set SPI1 CE1 decoding window to 0x34000000 *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34))=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set SPI1 CE0 decoding window to 0x30000000 *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30))=
;<br>
=C2=A0}<br>
<br>
=C2=A0#define SCU_PASSWORD=C2=A0 =C2=A00x1688A8A8<br>
<font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></blockquote></div><br></div></div></div>

--001a114c6c9c1f5db1054993fd8e--
