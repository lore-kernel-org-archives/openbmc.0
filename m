Return-Path: <maxims@google.com>
Received: from mail-io0-x22e.google.com (mail-io0-x22e.google.com
 [IPv6:2607:f8b0:4001:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP98q3WxwzDw1c
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 04:59:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MAFJ0M9c"; 
 dkim-atps=neutral
Received: by mail-io0-x22e.google.com with SMTP id a124so37212635ioe.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 09:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JIME/d4cE4ZKUUokfLn/qlxG36p+ZipfF8bJrC1KJhQ=;
 b=MAFJ0M9cQTYGo9f9yZhje1GIZFh0j3+DRGaIDQxugOvF97qOsGhlYYtpKsxQs8m7IE
 Sy6q4YD1CU/2L9J5snpGwHZcQBuQT81yU+Fm3/LIT8hNfzpS2bHTaNbkCRVhbKTyFHuH
 bwyfV12k11AArQfYT+qmaUE+VIQebruXoYSiMFMmi7CR8zLj9n5NS2X53rm7dkAqE2ST
 cBQ0T3Haz6ibYvloem84ttm9ngnvDCXFTx/w13DPdj5PxCarU+OSMqmPlyfyzZyFnAiX
 6O5j6jNhG//lPEG05tYrKU5/9cRFuVvnITwbYgaxdN8jmgBq7X8tM9Eol7LFzudjYLaG
 cYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JIME/d4cE4ZKUUokfLn/qlxG36p+ZipfF8bJrC1KJhQ=;
 b=HhLfysrmTD31oXDSM8fTCci1sLffOiuqJuohTKz4wPfsW2tQvniAcHtZ2ck+SleLH+
 NxZbLBa3DMc8I2/KdxAdMm9i6TWoC+lVsPZ/H6M6BAaBSVY8cKxFMasZwwajLny7J3+y
 vw4G2TMYVhsEqy3RxY/jXnpOf0yIP3dFkZt79qe5IGoWEPGDxhhUZ/uQSuDSS/Ysqf1E
 WFG4Uqd1qN6BJa9sKHuEkYbh9A0QW2ePNRL3ZmKDX/dgBWY1GkcpP1+Sg8jlutTTfYtc
 FHQM/5zltj8SUPk4ysYyYXEkbGTfPiPyw5NNQAdkOWBdHg7OmtB1hywE+qpBnq20xBI3
 HFUw==
X-Gm-Message-State: AKaTC00IH3xmoCqdV2N2Uxj+5meUhk7ZabogRFsZ8585b+dlymBE4P2wXVJP6jd24BVCDyu84VRgrY8nl9PXnkRt
X-Received: by 10.107.58.195 with SMTP id h186mr4403171ioa.117.1479923992387; 
 Wed, 23 Nov 2016 09:59:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.174.224 with HTTP; Wed, 23 Nov 2016 09:59:51 -0800 (PST)
In-Reply-To: <CAPnjgZ1DJJHt7AdoKX=-y-8BmLqjkrs5j8_o9Nu19yUZJo69wg@mail.gmail.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479858976-139210-4-git-send-email-maxims@google.com>
 <CAPnjgZ3=TwFGTHcYrBYWk9yoQ+OCb6U26HnCZnbnBazfKz8DVw@mail.gmail.com>
 <CAPnjgZ1DJJHt7AdoKX=-y-8BmLqjkrs5j8_o9Nu19yUZJo69wg@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 23 Nov 2016 09:59:51 -0800
Message-ID: <CAFR_W8of1Oa4TTBTVoPnkUxF90QShvKMbOApu6bhLG19mCgLkA@mail.gmail.com>
Subject: Re: [PATCH u-boot 3/5] aspeed: Added function to calculate APB Clock
 frequency.
To: Simon Glass <sjg@chromium.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114acbc4dcd09e0541fba7cf
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
X-List-Received-Date: Wed, 23 Nov 2016 17:59:56 -0000

--001a114acbc4dcd09e0541fba7cf
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 8:24 AM, Simon Glass <sjg@chromium.org> wrote:

> [resend from correct address]
>
> On 23 November 2016 at 09:13, Simon Glass <sjg@google.com> wrote:
> > Hi Maxim,
> >
> > On 22 November 2016 at 16:56,  <maxims@google.com> wrote:
> >> From: Maxim Sloyko <maxims@google.com>
> >>
> >
> > For the subject, 'Add' rather than 'Added' (we use present tense)
>

Done.


> >
> >> This is needed by I2C driver.
> >>
> >> Signed-off-by: Maxim Sloyko <maxims@google.com>
> >> ---
> >>  arch/arm/include/asm/arch-aspeed/ast_scu.h |  1 +
> >>  arch/arm/mach-aspeed/ast-scu.c             | 11 +++++++++++
> >>  2 files changed, 12 insertions(+)
> >>
> >> diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> >> index d248416..eb5aaa2 100644
> >> --- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> >> +++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> >> @@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(void);
> >>  extern u32 ast_get_clk_source(void);
> >>  extern u32 ast_get_h_pll_clk(void);
> >>  extern u32 ast_get_ahbclk(void);
> >> +extern u32 ast_get_apbclk(void);
> >
> > Please add a comment as to what this does and what it returns.
>

Done.


> >
> >>
> >>  extern u32 ast_scu_get_vga_memsize(void);
> >>
> >> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-
> scu.c
> >> index 280c421..e00dbe2 100644
> >> --- a/arch/arm/mach-aspeed/ast-scu.c
> >> +++ b/arch/arm/mach-aspeed/ast-scu.c
> >> @@ -318,6 +318,17 @@ u32 ast_get_ahbclk(void)
> >>
> >>  #endif /* AST_SOC_G5 */
> >>
> >> +u32 ast_get_apbclk(void)
> >> +{
> >> +       u32 h_pll = ast_get_h_pll_clk();
> >
> > Can this be ulong, or is there a reason it has to be exactly 32 bits?
> >
> > blank line here (between declarations and code)
> >
> >> +       /* The formula for converting the bit pattern to divisor is
> >
> > /*
> >  * The formula...
> >  * ...
> >  */
>

Done.


> >
> >> +        * (4 + 4 * DIV), according to datasheet
> >> +        */
> >> +       u32 apb_div = 4 + 4 * SCU_GET_PCLK_DIV(ast_scu_read(
> AST_SCU_CLK_SEL));
> >> +       return h_pll / apb_div;
> >> +}
> >> +
> >> +
> >>  void ast_scu_show_system_info(void)
> >>  {
> >>
> >> --
> >> 2.8.0.rc3.226.g39d4020
> >>
> >
> > Regards,
> > Simon
>



-- 
*M*axim *S*loyko

--001a114acbc4dcd09e0541fba7cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Nov 23, 2016 at 8:24 AM, Simon Glass <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">[resend from correct addres=
s]<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On 23 November 2016 at 09:13, Simon Glass &lt;<a href=3D"mailto:sjg@google.=
com">sjg@google.com</a>&gt; wrote:<br>
&gt; Hi Maxim,<br>
&gt;<br>
&gt; On 22 November 2016 at 16:56,=C2=A0 &lt;<a href=3D"mailto:maxims@googl=
e.com">maxims@google.com</a>&gt; wrote:<br>
&gt;&gt; From: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">maxims=
@google.com</a>&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; For the subject, &#39;Add&#39; rather than &#39;Added&#39; (we use pre=
sent tense)<br></div></div></blockquote><div><br></div><div>Done.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div clas=
s=3D"h5">
&gt;<br>
&gt;&gt; This is needed by I2C driver.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.co=
m">maxims@google.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h |=C2=A0 1 +<=
br>
&gt;&gt;=C2=A0 arch/arm/mach-aspeed/ast-scu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 11 +++++++++++<br>
&gt;&gt;=C2=A0 2 files changed, 12 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h b/arc=
h/arm/include/asm/arch-<wbr>aspeed/ast_scu.h<br>
&gt;&gt; index d248416..eb5aaa2 100644<br>
&gt;&gt; --- a/arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h<br>
&gt;&gt; +++ b/arch/arm/include/asm/arch-<wbr>aspeed/ast_scu.h<br>
&gt;&gt; @@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(<wbr>void)=
;<br>
&gt;&gt;=C2=A0 extern u32 ast_get_clk_source(void);<br>
&gt;&gt;=C2=A0 extern u32 ast_get_h_pll_clk(void);<br>
&gt;&gt;=C2=A0 extern u32 ast_get_ahbclk(void);<br>
&gt;&gt; +extern u32 ast_get_apbclk(void);<br>
&gt;<br>
&gt; Please add a comment as to what this does and what it returns.<br></di=
v></div></blockquote><div><br></div><div>Done.</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 extern u32 ast_scu_get_vga_memsize(void);<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/arch/arm/mach-aspeed/ast-<wbr>scu.c b/arch/arm/mach-a=
speed/ast-<wbr>scu.c<br>
&gt;&gt; index 280c421..e00dbe2 100644<br>
&gt;&gt; --- a/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
&gt;&gt; +++ b/arch/arm/mach-aspeed/ast-<wbr>scu.c<br>
&gt;&gt; @@ -318,6 +318,17 @@ u32 ast_get_ahbclk(void)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #endif /* AST_SOC_G5 */<br>
&gt;&gt;<br>
&gt;&gt; +u32 ast_get_apbclk(void)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 h_pll =3D ast_get_h_pll_clk();<br>
&gt;<br>
&gt; Can this be ulong, or is there a reason it has to be exactly 32 bits?<=
br>
&gt;<br>
&gt; blank line here (between declarations and code)<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The formula for converting the bit =
pattern to divisor is<br>
&gt;<br>
&gt; /*<br>
&gt;=C2=A0 * The formula...<br>
&gt;=C2=A0 * ...<br>
&gt;=C2=A0 */<br></div></div></blockquote><div><br></div><div>Done.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div cl=
ass=3D"h5">
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * (4 + 4 * DIV), according to datashe=
et<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 apb_div =3D 4 + 4 * SCU_GET_PCLK_D=
IV(ast_scu_read(<wbr>AST_SCU_CLK_SEL));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return h_pll / apb_div;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 void ast_scu_show_system_info(void)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt; Simon<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M=
</b>axim <b>S</b>loyko</div></div>
</div></div>

--001a114acbc4dcd09e0541fba7cf--
