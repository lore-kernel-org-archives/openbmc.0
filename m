Return-Path: <raltherr@google.com>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com
 [IPv6:2a00:1450:400c:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGV1j4P0jzDrKJ
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 04:16:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="W+W9/5qV"; 
 dkim-atps=neutral
Received: by mail-wm0-x22e.google.com with SMTP id l81so21229954wmg.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 11:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OK6Zszbf/HcCT41tD57cEVIBChuMq2srNWDH2BVk7pc=;
 b=W+W9/5qVncCRshy5G/C30zN6pUlZ8uCmijcqE7DM/S4QhyNB5LdpVwxBGKRX3GZSwr
 0w6tgC/wwz5zfeuqY29iJlr7x7txHC15z9I7b6RYvBP3T2ylX33iksm9nBIv3B4FfRaw
 1/ltZQJsYBUXPz2Fwi5x9R5jjvV91LH50Ofjd4wpQ4etp/CbUh9/lr7dwUH+bpgbSIO9
 VpaAgwcvritdebS9nYJPVB5XtVtPiuV41RPWQ0lw3YGdiwaDVPm8fM+QfA/FdV8uoLTr
 pPV9sg6dPNqauDx0J09vAW3eiakmUxbXQizN8EIBMucxdMcnYZGz8qAMCMJ2HFf112pO
 6zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OK6Zszbf/HcCT41tD57cEVIBChuMq2srNWDH2BVk7pc=;
 b=BjKcT4D1/5xN65w/jpM84/ljsGRUeaq9K2Cy22ODzl6LAliPSZ6a53S5nT9SxNtZuj
 PDK55g/RGSikwGCpALD/7VczF3NeO1gotycCK/9wC9KBV5DCTD2WJlnBFjILLj/hxqKV
 wKIkNHMUH5Hp2sKYWlnrXffpdZdvD5bsDlT+LT4Uukk+79HlOVVaW4V6AIVuNbXBOX5e
 5Y0TgJ6ohdPYTMXI3DtkU0WzS8yAyM2F6/ICu/kCumaSPTAodHSxt4KpBAa+GYAdZs3L
 N8eXyhZpBywqOrdVkvjpi0cQx5dUs2ETWYedi4ZOj13J0bhxIjmpZ1mJbs3fRFOkN36z
 dDGg==
X-Gm-Message-State: AIVw110fzU9em/j84NREiA0U1QL7utp/LP5jrBwbuyFTUr4RISmzqVE2
 Br1hrVsywzmJ1RUowwDehmpp6M3Q92rpg1s=
X-Received: by 10.28.142.203 with SMTP id q194mr3918660wmd.174.1500920181073; 
 Mon, 24 Jul 2017 11:16:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Mon, 24 Jul 2017 11:16:20 -0700 (PDT)
In-Reply-To: <20170721223326.28674-2-patrick@stwcx.xyz>
References: <20170721223326.28674-1-patrick@stwcx.xyz>
 <20170721223326.28674-2-patrick@stwcx.xyz>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 24 Jul 2017 11:16:20 -0700
Message-ID: <CAPLgG=m6jr8iatPtYCMGRfoR-DKUEXQHqzZ6O2Hueodqucav2g@mail.gmail.com>
Subject: Re: [PATCH u-boot 1/1] config/ast-common: hack bootopts
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1143bf263b34da055514360a"
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
X-List-Received-Date: Mon, 24 Jul 2017 18:16:26 -0000

--001a1143bf263b34da055514360a
Content-Type: text/plain; charset="UTF-8"

Why?

On Fri, Jul 21, 2017 at 3:33 PM, Patrick Williams <patrick@stwcx.xyz> wrote:

> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  include/configs/ast-common.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
> index 110c780070..6f2a50b854 100644
> --- a/include/configs/ast-common.h
> +++ b/include/configs/ast-common.h
> @@ -84,7 +84,10 @@
>  #define CONFIG_SYS_MAXARGS             16
>  #define CONFIG_SYS_BARGSIZE            CONFIG_SYS_CBSIZE
>
> +#if 0
>  #define CONFIG_BOOTARGS                        "console=ttyS4,115200n8
> root=/dev/ram rw"
> +#endif
> +#define CONFIG_BOOTARGS                         "console=ttyS4,115200n8
> root=/dev/mtdblock4 ro"
>
>  #define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
>  #define CONFIG_FMC_CS                  1
> @@ -96,11 +99,14 @@
>  #define CONFIG_ENV_OFFSET              0x60000 /* environment starts
> here  */
>  #define CONFIG_ENV_SIZE                        0x20000 /* Total Size of
> Environment Sector */
>
> +#if 0
>  #define CONFIG_BOOTCOMMAND     \
>         "fdt addr 20080000; " \
>         "if fdt get value ramdisk_conf /configurations/conf@1 ramdisk;
> then " \
>         "    bootm 20080000; else bootm 20080000 20300000; " \
>         "fi"
> +#endif
> +#define CONFIG_BOOTCOMMAND                      "fdt addr 20080000; bootm
> 20080000"
>  #define CONFIG_ENV_OVERWRITE
>
>  #define ASPEED_ENV_SETTINGS \
> --
> 2.13.0
>
>
>

--001a1143bf263b34da055514360a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why?</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Fri, Jul 21, 2017 at 3:33 PM, Patrick Williams <span dir=3D"lt=
r">&lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx=
.xyz</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by:=
 Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xy=
z</a>&gt;<br>
---<br>
=C2=A0include/configs/ast-common.h | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h<br=
>
index 110c780070..6f2a50b854 100644<br>
--- a/include/configs/ast-common.h<br>
+++ b/include/configs/ast-common.h<br>
@@ -84,7 +84,10 @@<br>
=C2=A0#define CONFIG_SYS_MAXARGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A016<br>
=C2=A0#define CONFIG_SYS_BARGSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
CONFIG_SYS_CBSIZE<br>
<br>
+#if 0<br>
=C2=A0#define CONFIG_BOOTARGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;console=3DttyS4,115200n8 root=
=3D/dev/ram rw&quot;<br>
+#endif<br>
+#define CONFIG_BOOTARGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;console=3DttyS4,115200n8 roo=
t=3D/dev/mtdblock4 ro&quot;<br>
<br>
=C2=A0#define CONFIG_AST_SPI_NOR=C2=A0 =C2=A0 /* AST SPI NOR Flash */<br>
=C2=A0#define CONFIG_FMC_CS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 1<br>
@@ -96,11 +99,14 @@<br>
=C2=A0#define CONFIG_ENV_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x60000 /* environment starts here=C2=A0 */<br>
=C2=A0#define CONFIG_ENV_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x20000 /* Total Size of Environment=
 Sector */<br>
<br>
+#if 0<br>
=C2=A0#define CONFIG_BOOTCOMMAND=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fdt addr 20080000; &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;if fdt get value ramdisk_conf /configurat=
ions/conf@1 ramdisk; then &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 bootm 20080000; else bootm =
20080000 20300000; &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fi&quot;<br>
+#endif<br>
+#define CONFIG_BOOTCOMMAND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fdt addr 20080000; bootm 20080000&quot;<=
br>
=C2=A0#define CONFIG_ENV_OVERWRITE<br>
<br>
=C2=A0#define ASPEED_ENV_SETTINGS \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--001a1143bf263b34da055514360a--
