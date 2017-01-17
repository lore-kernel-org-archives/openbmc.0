Return-Path: <raltherr@google.com>
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v35yB6b4mzDqPQ
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 10:33:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uhTDC8Bp"; 
 dkim-atps=neutral
Received: by mail-it0-x233.google.com with SMTP id d9so30257744itc.0
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 15:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=GswWWFDBSI/aXfbHfgDwPawyzV2WYdXjVJyUAgu66pQ=;
 b=uhTDC8BpDydwymzVFq0LwY/swtKmaxnInko1M6atZl371snpmNhxXqewNRH3PfbYtO
 qebVvakJB+lu9JShY2CQ5cWuDQsVbeY7yGn/0Z00+k+mgZ+iyw6NFQiHWUvs98jwLr8E
 fnWGpnR6LLclp0qP+onJoPh6ULFdQFOq9q1dJC/5YG7RBPuAjb1V1OrZzW6znRggdP/c
 pkudoOaMQBFCQp6iNfiIJ4X9Zy63FFmkEhUYcixxEmjR9QDfPOD/JoZk4suhT/6yOaQT
 hI86ycfmUDVA2UvjztYgER3nMrKlI/yzth0vntRmNwnJbkyIhhUv05qu1/CuTEgmunYy
 sNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=GswWWFDBSI/aXfbHfgDwPawyzV2WYdXjVJyUAgu66pQ=;
 b=SCWArQKTL1Ggy7tn0GSKq2N0p37yeGWTBc968CUvxSIa18dX5l1hl1dFo8vkD8czMx
 GgYLoxqhZOlU3ydsRnGZU6paXf1ifviX79W3OdQB508WFcmfWg3onGPakbINgxQ9Uyhv
 vv/EuUH5zYE7sIThmn03KY5J6smITJl14wBMVOq9bm75jXPF46qeQwM53nAT1PGg1B5L
 zzlc3LEqDDQHj2Tk27Fhh/6sY5djFTYb/zLq/PUHZFI98dLQ6RwaDk7qVy6EJ5HgvK95
 3YrGAxi9mFVNO8C6tzI2m75XREKEv99UT3txmHPof94LEi/WM7N+A9IbA7DQ8cxOElQL
 +z7Q==
X-Gm-Message-State: AIkVDXIdyBrRv3wkpuBqOnmJ5s8QJgoqR1arw4kE9ArBMk+hUJBSflqMHStSfqoVsP/h9YHs3d3pAOtE7UVhvuK9
X-Received: by 10.36.158.193 with SMTP id p184mr851335itd.8.1484695998204;
 Tue, 17 Jan 2017 15:33:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.130.106 with HTTP; Tue, 17 Jan 2017 15:33:17 -0800 (PST)
In-Reply-To: <CACPK8Xd3LtSZ3i_r19AZtVMxRLxXnQwOw8oQc+eS7b5iJvWS9A@mail.gmail.com>
References: <20170112021328.27200-3-raltherr@google.com>
 <CACPK8Xd3LtSZ3i_r19AZtVMxRLxXnQwOw8oQc+eS7b5iJvWS9A@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 17 Jan 2017 15:33:17 -0800
Message-ID: <CAPLgG=n4YJXe65oirFCsBHPU5v+5BXqJ4W9JjAA6hhVdP0ZCiA@mail.gmail.com>
Subject: Re: [U-Boot,2/2] aspeed: use FIT-provided ramdisk if available
To: Joel Stanley <joel@jms.id.au>
Cc: Simon Glass <sjg@chromium.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114f85ea92e96e054652b91d
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
X-List-Received-Date: Tue, 17 Jan 2017 23:33:23 -0000

--001a114f85ea92e96e054652b91d
Content-Type: text/plain; charset=UTF-8

I couldn't find any prior examples.  I'll ask upstream what they think.

On Mon, Jan 16, 2017 at 4:33 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Thu, Jan 12, 2017 at 1:13 PM, Rick Altherr <raltherr@google.com> wrote:
> > If the kernel FIT specifies a ramdisk, use it.  Otherwise, expect a
> > ramdisk at 0x20300000.
> >
> > Signed-off-by: Rick Altherr <raltherr@google.com>
> > ---
> >
> >  include/configs/ast-common.h | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
> > index b39ea33ce7..110c780070 100644
> > --- a/include/configs/ast-common.h
> > +++ b/include/configs/ast-common.h
> > @@ -96,7 +96,11 @@
> >  #define CONFIG_ENV_OFFSET              0x60000 /* environment starts
> here  */
> >  #define CONFIG_ENV_SIZE                        0x20000 /* Total Size of
> Environment Sector */
> >
> > -#define CONFIG_BOOTCOMMAND     "bootm 20080000 20300000"
> > +#define CONFIG_BOOTCOMMAND     \
> > +       "fdt addr 20080000; " \
> > +       "if fdt get value ramdisk_conf /configurations/conf@1 ramdisk;
> then " \
> > +       "    bootm 20080000; else bootm 20080000 20300000; " \
> > +       "fi"
>
> This feels a little clunky. Is this the method upstream suggests to
> solve this problem?
>
> Cheers,
>
> Joel
>

--001a114f85ea92e96e054652b91d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I couldn&#39;t find any prior examples.=C2=A0 I&#39;ll ask=
 upstream what they think.</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Mon, Jan 16, 2017 at 4:33 PM, Joel Stanley <span dir=3D=
"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.a=
u</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On Thu, Jan 12, 2017 at 1:13 PM, Rick Altherr &lt;<a href=3D"mailto:ralther=
r@google.com">raltherr@google.com</a>&gt; wrote:<br>
&gt; If the kernel FIT specifies a ramdisk, use it.=C2=A0 Otherwise, expect=
 a<br>
&gt; ramdisk at 0x20300000.<br>
&gt;<br>
&gt; Signed-off-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com"=
>raltherr@google.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt;=C2=A0 include/configs/ast-common.h | 6 +++++-<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/include/configs/ast-common.h b/include/configs/ast-common=
.h<br>
&gt; index b39ea33ce7..110c780070 100644<br>
&gt; --- a/include/configs/ast-common.h<br>
&gt; +++ b/include/configs/ast-common.h<br>
&gt; @@ -96,7 +96,11 @@<br>
&gt;=C2=A0 #define CONFIG_ENV_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x60000 /* environment starts here=C2=A0 */<br>
&gt;=C2=A0 #define CONFIG_ENV_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x20000 /* Total Size of Environ=
ment Sector */<br>
&gt;<br>
&gt; -#define CONFIG_BOOTCOMMAND=C2=A0 =C2=A0 =C2=A0&quot;bootm 20080000 20=
300000&quot;<br>
&gt; +#define CONFIG_BOOTCOMMAND=C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fdt addr 20080000; &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;if fdt get value ramdisk_conf /confi=
gurations/conf@1 ramdisk; then &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 bootm 20080000; else b=
ootm 20080000 20300000; &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fi&quot;<br>
<br>
</span>This feels a little clunky. Is this the method upstream suggests to<=
br>
solve this problem?<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div>

--001a114f85ea92e96e054652b91d--
