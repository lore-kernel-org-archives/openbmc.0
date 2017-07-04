Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x23613HtZzDqj1
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 22:22:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IN8SDTIw"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id l21so10287887ywb.3
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jul 2017 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=h3yy60uNyhwAKGIC4MxTVfEquhkB8OFIshT2kSPZK9Y=;
 b=IN8SDTIwOm18YdLSsgjAfmmbJLlGYbaky0YRxbtqGOv8XTvAOGuUjNIanOYYwHMyaq
 gVngdYP6LE7GfaWgX+fvKcxMLm0riaRkA3RwJUcnztJosCLQWw5efV/iYYMCMWBEg37m
 +0o6EyJLhUh4lX/Du8gRnghuLGLwpYC0vytDY9wxQTb7On2miKcZ0Dz8+yNwhJI2ULic
 G1gUgpX9BtE2g9guFPMJQFCmP1pqPmepvMMCLZd+Ul0yBIwfgRcCCLSSWp72yp0SYgkz
 c3PCYCqyUql8qPLIHC9HnLYSrD2kCic2qfpd1LtcDP4SoAEVGrJz4K7dR7nZyolwyh2m
 ddjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=h3yy60uNyhwAKGIC4MxTVfEquhkB8OFIshT2kSPZK9Y=;
 b=AAQHv3u+AhkyuDlwaOYUoRVghnV2xU2o45hVO72DvRcCBCa+UvetCtlDhUeTytIjBN
 gAxg0wURiFp/RGurw0eT+PrE6oW1wyeOBOmNag+5tBY6qBFSpfvavvg0rMFrjiD2zbKo
 vXr147f/UVctxWqzblTbVjCaFVin4ybRLbBN9oftAN58rO1jBGIRVi5K2TENQeamF1EO
 O7cauINSZVZTEZuJM+HbAn/NV478sI1CmbFZ4VIrVAF/zlV6cybSpJyhbqmwbZ8hShW6
 wqceCrflaTieqvBrUWcAoKYfkjwvs7rjuvav26i7Q//sJ1yrS1kerwp032pP6u9Vywf4
 KWPw==
X-Gm-Message-State: AKS2vOzhZ8dWgLs31yV4Yu0ebJyIYv3o+E4e9v0l3rNtVVa0/b7Wn+X6
 c9zN8RSMTekL5WKQyYgGBFS1HpvgIoR1
X-Received: by 10.13.207.195 with SMTP id r186mr30510701ywd.219.1499170918941; 
 Tue, 04 Jul 2017 05:21:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Tue, 4 Jul 2017 05:21:57 -0700 (PDT)
Received: by 10.37.170.239 with HTTP; Tue, 4 Jul 2017 05:21:57 -0700 (PDT)
In-Reply-To: <1499163214.4990.1.camel@aj.id.au>
References: <20170704060528.17290-1-joel@jms.id.au>
 <1499163214.4990.1.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Jul 2017 21:51:57 +0930
X-Google-Sender-Auth: 4c7uFt-q8G8ubwcOKxrC-inbD6A
Message-ID: <CACPK8XfDNa_mUs=ARZMRVZWODnUQu3b8MQxZicyiTsEKzfVzYw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Set quality factor
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rick Altherr <raltherr@google.com>
Content-Type: multipart/alternative; boundary="001a114e499a14cd2905537ceec0"
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
X-List-Received-Date: Tue, 04 Jul 2017 12:22:02 -0000

--001a114e499a14cd2905537ceec0
Content-Type: text/plain; charset="UTF-8"

On 4 Jul. 2017 19:43, "Andrew Jeffery" <andrew@aj.id.au> wrote:

On Tue, 2017-07-04 at 15:35 +0930, Joel Stanley wrote:
> From the timeriomem_rng bindings:
>
>  quality: estimated number of bits of true entropy per 1024 bits read
>  from the rng.  Defaults to zero which causes the kernel's default
>  quality to be used instead.  Note that the default quality is usually
>  zero which disables using this rng to automatically fill the kernel's
>  entropy pool.

This does not appear in the 4.12 kernel's bindings at
Documentation/devicetree/bindings/rng/timeriomem_rng.txt, and doesn't
appear in Ted T'so's dev branch[1].

Where did you find this binding description?


Herbet's tree. They will be in 4.13.

Cheers,

Joel


Andrew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tytso/
random.git/tree/Documentation/devicetree/bindings/rng/
timeriomem_rng.txt?h=dev

>
> As to the recommended value for us to use:
>
> > Rick Altherr <raltherr@google.com> wrote:
> > Quality is #bit of entropy per 1000 bits read.  100 is a
> > conservative value that was suggested by those in the know.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 9cc959fccfa0..470a6335399a 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -193,6 +193,7 @@
> >                                     compatible = "timeriomem_rng";
> >                                     reg = <0x1e6e2078 0x4>;
> >                                     period = <1>;
> > +                                   quality = <100>;
> >                             };
>
> > >                           pinctrl: pinctrl@1e6e2000 {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 992242d3b22e..466b322951e1 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -232,6 +232,7 @@
> >                             compatible = "timeriomem_rng";
> >                             reg = <0x1e6e2078 0x4>;
> >                             period = <1>;
> > +                           quality = <100>;
> >                     };
>
> > >                   gfx: display@1e6e6000 {

--001a114e499a14cd2905537ceec0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 4 Jul. 2017 19:43, &quot;Andrew Jeffery&quot; &lt;<a href=3D"m=
ailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br type=3D"attributio=
n"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div class=3D"quoted-text">On Tue, 2017-07-04 a=
t 15:35 +0930, Joel Stanley wrote:<br>
&gt; From the timeriomem_rng bindings:<br>
&gt;<br>
&gt; =C2=A0quality: estimated number of bits of true entropy per 1024 bits =
read<br>
&gt; =C2=A0from the rng.=C2=A0=C2=A0Defaults to zero which causes the kerne=
l&#39;s default<br>
&gt; =C2=A0quality to be used instead.=C2=A0=C2=A0Note that the default qua=
lity is usually<br>
&gt; =C2=A0zero which disables using this rng to automatically fill the ker=
nel&#39;s<br>
&gt; =C2=A0entropy pool.<br>
<br>
</div>This does not appear in the 4.12 kernel&#39;s bindings at<br>
Documentation/devicetree/<wbr>bindings/rng/timeriomem_rng.<wbr>txt, and doe=
sn&#39;t<br>
appear in Ted T&#39;so&#39;s dev branch[1].<br>
<br>
Where did you find this binding description?<br></blockquote></div></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Herbet&#39;s tree. They w=
ill be in 4.13.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Joel</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
Andrew<br>
<br>
[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/tytso/random=
.git/tree/Documentation/devicetree/bindings/rng/timeriomem_rng.txt?h=3Ddev"=
 rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/l=
inux/kernel/git/tytso/<wbr>random.git/tree/Documentation/<wbr>devicetree/bi=
ndings/rng/<wbr>timeriomem_rng.txt?h=3Ddev</a><br>
<div class=3D"elided-text"><br>
&gt;<br>
&gt; As to the recommended value for us to use:<br>
&gt;<br>
&gt; &gt; Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com">raltherr@=
google.com</a>&gt; wrote:<br>
&gt; &gt; Quality is #bit of entropy per 1000 bits read.=C2=A0=C2=A0100 is =
a<br>
&gt; &gt; conservative value that was suggested by those in the know.<br>
&gt;<br>
&gt; Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au">joel=
@jms.id.au</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0arch/arm/boot/dts/aspeed-g4.<wbr>dtsi | 1 +<br>
&gt; =C2=A0arch/arm/boot/dts/aspeed-g5.<wbr>dtsi | 1 +<br>
&gt; =C2=A02 files changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/aspeed-g4.<wbr>dtsi b/arch/arm/boot/dts=
/aspeed-g4.<wbr>dtsi<br>
&gt; index 9cc959fccfa0..470a6335399a 100644<br>
&gt; --- a/arch/arm/boot/dts/aspeed-g4.<wbr>dtsi<br>
&gt; +++ b/arch/arm/boot/dts/aspeed-g4.<wbr>dtsi<br>
&gt; @@ -193,6 +193,7 @@<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatibl=
e =3D &quot;timeriomem_rng&quot;;<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &=
lt;0x1e6e2078 0x4&gt;;<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0period =
=3D &lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quality =3D &=
lt;100&gt;;<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; =C2=A0<br>
&gt; &gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl: pinctrl@1e6e2000 {<br>
&gt; diff --git a/arch/arm/boot/dts/aspeed-g5.<wbr>dtsi b/arch/arm/boot/dts=
/aspeed-g5.<wbr>dtsi<br>
&gt; index 992242d3b22e..466b322951e1 100644<br>
&gt; --- a/arch/arm/boot/dts/aspeed-g5.<wbr>dtsi<br>
&gt; +++ b/arch/arm/boot/dts/aspeed-g5.<wbr>dtsi<br>
&gt; @@ -232,6 +232,7 @@<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;timeriomem_rng&q=
uot;;<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1e6e2078 0x4&gt;;<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0period =3D &lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quality =3D &lt;100&gt;;<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0};<br>
&gt; =C2=A0<br>
&gt; &gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gfx: display@1e6e6000 {</div></blockquote></div><br></div></div><=
/div>

--001a114e499a14cd2905537ceec0--
