Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rFF7u8nY"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zCSWK1h2nzDqvQ
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jan 2018 12:58:37 +1100 (AEDT)
Received: by mail-qt0-x242.google.com with SMTP id e2so4195379qti.0
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jan 2018 17:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qe5NvaYQycGU6ENH2un/EpNs74t0o5NrhlrsVaPqN6Y=;
 b=rFF7u8nYjxrr+0ssJzVNjtn9KiIEu9LVtja9Rv9V5pKiEjzJqnqyULFazW6lI1tqtk
 R4MUHtM+pU9w4DHxKACJZFfpnngTC4zqfiqEyq7zSPXwtODk6yvrOrj9oxbD3AmUHnAU
 7aKoLvtpHOVlHM2Drhj1vmBsBftmUYD7D7IlR7JG8LhahIHoL6KkPKGE+hii6bgUZOTa
 FnfhiYuqzSsB7mz0gCIhkgXENGQsLYsQD5Zt1qvGjXVlEcZOUV2bon2VcgZHBSVwe9l4
 mwBje2QUb3PgKbS/C52hs58zwlfEkgTciMXvExh417RUul7ydUGVkdVfbxzNo+SKd45J
 S5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qe5NvaYQycGU6ENH2un/EpNs74t0o5NrhlrsVaPqN6Y=;
 b=QWJ9UJp35KIhCfgnW/43X5j9/4I0f4y3yhyx7QMRfEbWX1bYNGgfgZc+V1qiT3+KiX
 QHwdV2AxlnH089m7m2wMCMh5tk4iZzu2mXrijrs7aPmZef+9LdyF50oYm3+RAeD3DuFs
 opDoBdmMrkhuSUUHVP90z9p0dkf2fPqZW1KuAGLp/IWtqmi64mM2FykZndYOd/X6spSX
 hKWQ+gJuhYbeAkJOY5Ttp93sqLeT2O5MRfAPCLFd38dh+IQzq90mCQzXoiD3yB+vTJ9G
 KvwxNVyZi4Xx+oKLA64FsaNMtfkME6dP1CThXiiRhOSvjqZ7yrhMbD2R/Y0srKfBJrWX
 7ulw==
X-Gm-Message-State: AKwxytfIBgZcD24AyvYZURiyjkfsLHZqETOSuSWLWSQA11wp6Cs8a2CF
 1kV8kxrrW7wB1Lf4mgnFgOE6nyY7TLcMLPRK/gI=
X-Google-Smtp-Source: ACJfBosWs4YHGidpFQ7Q4KkZnkXyifo9nxB/7f+JODU8joAsi9y+AwO9ggNg3NnKu6Syg+73GQS+Wrt0lkVKya/jeUw=
X-Received: by 10.200.0.149 with SMTP id c21mr2220205qtg.336.1515117514722;
 Thu, 04 Jan 2018 17:58:34 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Thu, 4 Jan 2018 17:58:34 -0800 (PST)
Received: by 10.200.29.9 with HTTP; Thu, 4 Jan 2018 17:58:34 -0800 (PST)
In-Reply-To: <1515057847-30492-1-git-send-email-mine260309@gmail.com>
References: <1515057847-30492-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Jan 2018 12:58:34 +1100
X-Google-Sender-Auth: BGShvuKYVAK6NZwjeHQWTA2B4p0
Message-ID: <CACPK8Xf64OdfqNZiyu_v=hxB4YrgxPN5SHzxUsbEGkMbGqVwKg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: zaius: Add
 pcie-e2b-present gpio key
To: Lei YU <mine260309@gmail.com>, Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adrian Barrera <abarrera@us.ibm.com>
Content-Type: multipart/alternative; boundary="f403045f36724212c20561fdc9a0"
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
X-List-Received-Date: Fri, 05 Jan 2018 01:58:37 -0000

--f403045f36724212c20561fdc9a0
Content-Type: text/plain; charset="UTF-8"

On 4 Jan. 2018 20:24, "Lei YU" <mine260309@gmail.com> wrote:

Add GPIO key to check presence of PCIE E2B


Xo, can I get an ack please?



Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 17f2000..f583dcc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -55,6 +55,12 @@
                        gpios = <&gpio ASPEED_GPIO(F, 7) GPIO_ACTIVE_LOW>;
                        linux,code = <ASPEED_GPIO(F, 7)>;
                };
+
+               pcie-e2b-present{
+                       label = "pcie-e2b-present";
+                       gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW>;
+                       linux,code = <ASPEED_GPIO(E, 7)>;
+               };
        };

        leds {
--
1.9.1

--f403045f36724212c20561fdc9a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 4 Jan. 2018 20:24, &quot;Lei YU&quot; &lt;<a href=3D"mailto:mi=
ne260309@gmail.com">mine260309@gmail.com</a>&gt; wrote:<br type=3D"attribut=
ion"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Add GPIO key to check presence of PCIE E2B<br=
></blockquote></div></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Xo, can I get an ack please?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Lei YU &lt;<a href=3D"mailto:mine260309@gmail.com">mine26030=
9@gmail.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/aspeed-bmc-<wbr>opp-zaius.dts | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts b/arch/arm/boo=
t/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
index 17f2000..f583dcc 100644<br>
--- a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
+++ b/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
@@ -55,6 +55,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gpios =3D &lt;&amp;gpio ASPEED_GPIO(F, 7) GPIO_ACTIVE_LOW&gt;;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 linux,code =3D &lt;ASPEED_GPIO(F, 7)&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcie-e2b-present{<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0label =3D &quot;pcie-e2b-present&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpios =3D &lt;&amp;gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW&gt;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linux,code =3D &lt;ASPEED_GPIO(E, 7)&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 leds {<br>
<font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></blockquote></div><br></div></div></div>

--f403045f36724212c20561fdc9a0--
