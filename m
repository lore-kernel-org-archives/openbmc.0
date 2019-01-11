Return-Path: <blue@cmd.nu>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cmd.nu
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=blue@cmd.nu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=cmd.nu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cmd.nu header.i=@cmd.nu header.b="f3P8/4EJ"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bhz66b1GzDqxB
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 23:30:21 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id f9so12923244eds.10
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 04:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3M7eeaPBM9j1ykA8sFQkE+TBD2tQUV94MTvIlLE5pwk=;
 b=f3P8/4EJK6tId5JENJ3vC0MszBCsMy2jE1NBKB9DnKk02n4nhb8BdM8NJWUvPgvXQ2
 kNIf94dNYQJyfLr04CpGYE1oUmY3fFIW9V0MKKJ1h9QeQK60dTTn0HfUefwPft5X7Z5X
 bsKJ+Mgcw5oC0LpX0/Vk3JvItH3vow9nb3VvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3M7eeaPBM9j1ykA8sFQkE+TBD2tQUV94MTvIlLE5pwk=;
 b=FzSwD8rxIikg7PCA3Zj/HGh9L6f+LCFMGslAGJiaKreYckiKUI+heKwP85BI1f0uCK
 s/JADR725amTLRFuFLzPBeoJqRv51iZi3QeNAQMQn/xm2SMIwwqFmILfOe4j3QSLFdwa
 oDeucKO/XvIt2eFv6hqidmAT82sLJiJQHP3m9u99aiYQkZcyu7z1Srz3w8NUSzxV6e8C
 b9gnqkKAv8E13W/bvnPrgmCiMd6g0Bs/QL/DXoVAqxEu8PZXPIV+VtEHX/0uMC1r3mkB
 DG/WuNWULGwDak8LCk1P+jB6LZQz2oUmWbe47ggambalj5V0p9J42reSYzOzVrzPDsqw
 pnzQ==
X-Gm-Message-State: AJcUukccU/ArO29W8+ZTUX6v2sjDXX6PgoG2/h1CLlRurwInhSf7fde2
 8zFfBv70Ui0uXQ3x1P4h13jdCD/fPp6MGeFw/25eRA==
X-Google-Smtp-Source: ALg8bN6ijmGU78mOKr6cTW1FIvbjaoV5qHuiAH/ufIj6kgFSgKZLgFx2G+Zv1khPpJVvNoZyf3Cpfq7VXOB0IMjselg=
X-Received: by 2002:a17:906:815a:: with SMTP id
 z26-v6mr391815ejw.121.1547209818578; 
 Fri, 11 Jan 2019 04:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20181112142541.166609-1-bluecmd@google.com>
In-Reply-To: <20181112142541.166609-1-bluecmd@google.com>
From: Christian Svensson <blue@cmd.nu>
Date: Fri, 11 Jan 2019 13:30:08 +0100
Message-ID: <CADiuDARXNE=j-_w5uH3RwMNc7Y6duDuQw0Axq3mvU=SXzxaSGw@mail.gmail.com>
Subject: Re: [PATCH] linux: arch: define aspeed SOC IO mapping
To: Christian Svensson <bluecmd@google.com>
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org
Content-Type: multipart/alternative; boundary="000000000000a1414d057f2ddb54"
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
X-List-Received-Date: Fri, 11 Jan 2019 12:30:30 -0000

--000000000000a1414d057f2ddb54
Content-Type: text/plain; charset="UTF-8"

Ping.


On Mon, Nov 12, 2018 at 3:26 PM Christian Svensson <bluecmd@google.com>
wrote:

> Without this IO mapping early printk will simply not work after the
> paging and MMU has been setup.
>
> This patch maps all the whole 0x1e600000 IO space to 0xfe600000.
>
> Signed-off-by: Christian Svensson <bluecmd@google.com>
> ---
>  arch/arm/Makefile                 |  1 +
>  arch/arm/mach-aspeed/Makefile     |  1 +
>  arch/arm/mach-aspeed/aspeed_soc.c | 47 +++++++++++++++++++++++++++++++
>  arch/arm/mach-aspeed/iomap.h      | 17 +++++++++++
>  4 files changed, 66 insertions(+)
>  create mode 100644 arch/arm/mach-aspeed/Makefile
>  create mode 100644 arch/arm/mach-aspeed/aspeed_soc.c
>  create mode 100644 arch/arm/mach-aspeed/iomap.h
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index fc26c3d7b9b6..f0e3ca392f8c 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -159,6 +159,7 @@ textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
>  machine-$(CONFIG_ARCH_ACTIONS)         += actions
>  machine-$(CONFIG_ARCH_ALPINE)          += alpine
>  machine-$(CONFIG_ARCH_ARTPEC)          += artpec
> +machine-$(CONFIG_ARCH_ASPEED)          += aspeed
>  machine-$(CONFIG_ARCH_AT91)            += at91
>  machine-$(CONFIG_ARCH_AXXIA)           += axxia
>  machine-$(CONFIG_ARCH_BCM)             += bcm
> diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile
> new file mode 100644
> index 000000000000..426952d47cc3
> --- /dev/null
> +++ b/arch/arm/mach-aspeed/Makefile
> @@ -0,0 +1 @@
> +obj-y := aspeed_soc.o
> diff --git a/arch/arm/mach-aspeed/aspeed_soc.c
> b/arch/arm/mach-aspeed/aspeed_soc.c
> new file mode 100644
> index 000000000000..187276c2813d
> --- /dev/null
> +++ b/arch/arm/mach-aspeed/aspeed_soc.c
> @@ -0,0 +1,47 @@
> +/*
> + * Copyright (C) 2018 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/of_platform.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
> +
> +#include "iomap.h"
> +
> +// This is needed for e.g. earlyprintk
> +static struct map_desc io_desc[] __initdata = {
> +       {
> +               .virtual = AST_IO_VIRT,
> +               .pfn = __phys_to_pfn(AST_IO_PHYS),
> +               .length = AST_IO_SIZE,
> +               .type = MT_DEVICE
> +       }
> +};
> +
> +static void __init aspeed_map_io(void)
> +{
> +       iotable_init(io_desc, ARRAY_SIZE(io_desc));
> +}
> +
> +static const char * const aspeed_compat[] = {
> +       "aspeed,ast2400",
> +       "aspeed,ast2500",
> +       NULL
> +};
> +
> +DT_MACHINE_START(ASPEED_DT, "Aspeed SoC")
> +       .map_io = aspeed_map_io,
> +       .dt_compat = aspeed_compat,
> +MACHINE_END
> diff --git a/arch/arm/mach-aspeed/iomap.h b/arch/arm/mach-aspeed/iomap.h
> new file mode 100644
> index 000000000000..7ea5276f3892
> --- /dev/null
> +++ b/arch/arm/mach-aspeed/iomap.h
> @@ -0,0 +1,17 @@
> +/*
> + * Copyright (C) 2018 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#define AST_IO_PHYS 0x1e600000
> +#define AST_IO_VIRT 0xfe600000
> +#define AST_IO_SIZE 0x00200000
> --
> 2.19.1.930.g4563a0d9d0-goog
>
>

--000000000000a1414d057f2ddb54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping.<div><br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Mon, Nov 12, 2018 at 3:26 PM Christian Svensson &lt;<a h=
ref=3D"mailto:bluecmd@google.com">bluecmd@google.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Without this IO mapping=
 early printk will simply not work after the<br>
paging and MMU has been setup.<br>
<br>
This patch maps all the whole 0x1e600000 IO space to 0xfe600000.<br>
<br>
Signed-off-by: Christian Svensson &lt;<a href=3D"mailto:bluecmd@google.com"=
 target=3D"_blank">bluecmd@google.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0arch/arm/mach-aspeed/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0arch/arm/mach-aspeed/aspeed_soc.c | 47 ++++++++++++++++++++++++++++++=
+<br>
=C2=A0arch/arm/mach-aspeed/iomap.h=C2=A0 =C2=A0 =C2=A0 | 17 +++++++++++<br>
=C2=A04 files changed, 66 insertions(+)<br>
=C2=A0create mode 100644 arch/arm/mach-aspeed/Makefile<br>
=C2=A0create mode 100644 arch/arm/mach-aspeed/aspeed_soc.c<br>
=C2=A0create mode 100644 arch/arm/mach-aspeed/iomap.h<br>
<br>
diff --git a/arch/arm/Makefile b/arch/arm/Makefile<br>
index fc26c3d7b9b6..f0e3ca392f8c 100644<br>
--- a/arch/arm/Makefile<br>
+++ b/arch/arm/Makefile<br>
@@ -159,6 +159,7 @@ textofs-$(CONFIG_ARCH_AXXIA) :=3D 0x00308000<br>
=C2=A0machine-$(CONFIG_ARCH_ACTIONS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D =
actions<br>
=C2=A0machine-$(CONFIG_ARCH_ALPINE)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D =
alpine<br>
=C2=A0machine-$(CONFIG_ARCH_ARTPEC)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D =
artpec<br>
+machine-$(CONFIG_ARCH_ASPEED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D aspee=
d<br>
=C2=A0machine-$(CONFIG_ARCH_AT91)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
+=3D at91<br>
=C2=A0machine-$(CONFIG_ARCH_AXXIA)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
+=3D axxia<br>
=C2=A0machine-$(CONFIG_ARCH_BCM)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+=3D bcm<br>
diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile<=
br>
new file mode 100644<br>
index 000000000000..426952d47cc3<br>
--- /dev/null<br>
+++ b/arch/arm/mach-aspeed/Makefile<br>
@@ -0,0 +1 @@<br>
+obj-y :=3D aspeed_soc.o<br>
diff --git a/arch/arm/mach-aspeed/aspeed_soc.c b/arch/arm/mach-aspeed/aspee=
d_soc.c<br>
new file mode 100644<br>
index 000000000000..187276c2813d<br>
--- /dev/null<br>
+++ b/arch/arm/mach-aspeed/aspeed_soc.c<br>
@@ -0,0 +1,47 @@<br>
+/*<br>
+ * Copyright (C) 2018 Google, Inc.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ */<br>
+<br>
+#include &lt;linux/init.h&gt;<br>
+#include &lt;linux/of_platform.h&gt;<br>
+<br>
+#include &lt;asm/mach/arch.h&gt;<br>
+#include &lt;asm/mach/map.h&gt;<br>
+<br>
+#include &quot;iomap.h&quot;<br>
+<br>
+// This is needed for e.g. earlyprintk<br>
+static struct map_desc io_desc[] __initdata =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.virtual =3D AST_IO=
_VIRT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pfn =3D __phys_to_=
pfn(AST_IO_PHYS),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.length =3D AST_IO_=
SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D MT_DEVICE=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+};<br>
+<br>
+static void __init aspeed_map_io(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iotable_init(io_desc, ARRAY_SIZE(io_desc));<br>
+}<br>
+<br>
+static const char * const aspeed_compat[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;aspeed,ast2400&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;aspeed,ast2500&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
+};<br>
+<br>
+DT_MACHINE_START(ASPEED_DT, &quot;Aspeed SoC&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.map_io =3D aspeed_map_io,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dt_compat =3D aspeed_compat,<br>
+MACHINE_END<br>
diff --git a/arch/arm/mach-aspeed/iomap.h b/arch/arm/mach-aspeed/iomap.h<br=
>
new file mode 100644<br>
index 000000000000..7ea5276f3892<br>
--- /dev/null<br>
+++ b/arch/arm/mach-aspeed/iomap.h<br>
@@ -0,0 +1,17 @@<br>
+/*<br>
+ * Copyright (C) 2018 Google, Inc.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ */<br>
+<br>
+#define AST_IO_PHYS 0x1e600000<br>
+#define AST_IO_VIRT 0xfe600000<br>
+#define AST_IO_SIZE 0x00200000<br>
-- <br>
2.19.1.930.g4563a0d9d0-goog<br>
<br>
</blockquote></div>

--000000000000a1414d057f2ddb54--
