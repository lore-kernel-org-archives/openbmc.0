Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D108606EEB0
	for <openbmc@archiver.kernel.org>; Sat,  7 Nov 2026 00:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=euIfCb9T
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jLyBl334Gz2y1Y;
	Sat, 07 Nov 2026 11:50:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::112b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794012623;
	cv=pass; b=aDw0TbyT6sCAI/fatEGHtCU7+LYugtXJTGFL/Y2IC7QOzt3Kmiaxbj6HUElQkhL64YY4fBn8qNhaJTJf/ozV4XQTF65wFgODcNJYD2D3W77bGyjBjMCqy0457BLUvoMgAI7WC0Ddu+BzWB2MU8ov0/3fwfccaqfibf+1CwFISOw5j7oFdzHKTVI0uQc58+3MImOa7gqbFeqSBiEkluJxxiR5OJUyfKkyF4rmM1mArAjaSs99PvdTKfrgw0DvEvcERKdgUNpZvNt5tTrAd8lHHeBk+Eeyl3kk0kk0OtWydDBynRH/mBoR4pMpeJi339cXqxqAiV66iiSaa9xZzBXX/A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794012623; c=relaxed/relaxed;
	bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGs3dM7ee0PCLc+MwNxNRvYItteCuksvv/nlbGLD0eH89tp6bD1PTgjC1UOlF3N8/G93PTKnjB38gMPD1RxfB1LVkZYdVdG5fz3SY2NwdIiGtt0MS4tpy0n3SfgexDoi4urOp2S77e/Zm17FwdI7ytFxmZzlT6/44n6L9yYfiNYaClFcqCCwJb0Bal2oRiAmb1LlOCRFS6BlKUD5fzu1IdUspI/2MbokDB6vQLlF9SmEUpmuRyzM5F1sCho/EZZorfAv0tF8bhoD5WCKp1DuJKnewJxfSVO4FILCi0htwBw8FIntJ2O702/FoKykWErcZrh5gL2eDOVNeiWXn431tw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=euIfCb9T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=euIfCb9T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jLyBh1K5pz2xyh
	for <openbmc@lists.ozlabs.org>; Sat, 07 Nov 2026 11:50:19 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8871ada1a26so10527997b3.1
        for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2026 16:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794012616; cv=none;
        d=google.com; s=arc-20260327;
        b=rTZ0At5iL+l3HbxuN1zbMoe78fnwTWnagJPkL2ulWUsYPxq7ShkkM3jAt+34k0R32L
         wHSBiYMvOmK1C5Fv8HS019mTbAgCfRbg3JpZ2s2AEJwmYfJThvjL5umkBgY0t2XrFnCV
         dbWzONDRuH9j3c1mW37lHnUNoyYtWY5qULc3FkmU+4AFNcPBu4dIQ+zLXo+jv5ZuLNZy
         i2nYeqOyTnmQTOC+hB4I6/dW+vc1RzvPLF0+hrl1YL/wUAu08dDvIjnwb/+eXQt+dkzD
         vd1MkZ5rQCs0RgoSQUMSXrx89R4LA23EBLvDs+7ympRpI/eEsZs9KA0PPaRDBQL7G1f8
         c3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        fh=dJDqJgy8OFgQSXUxzppW4WwiFPVYihjGpcsRJXm8Qm4=;
        b=V9g90HGZoyNxVsQqAIpKNmisWPVXcF71St1B+WUNovXSQX3do5Ww187HVaytM0RVMg
         XxbqWp91bOx4G21AO698WeE7YCWE6UdQe61xQgc04sKw7IIaslcwJdgkJ93pJBYp4jKj
         tsOpWLkOGiyIUT8hzy1PqHDr6BaWuMVfIcshO+57KTXtUEsxdLUiwp357SLVAt0SKiAY
         JZgaBb1iExffXHT9tePbi1MAXchUpDTYhbA1mKRwNqGHiYKHQ0nxntQmK4bkY1WgJn7l
         REmsOeSasn9XhGACUlcGIeYbYJv0251COjk96+F/DuU9JePUBcV3+ab3p1fsxgaIPWfX
         mO/w==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794012616; x=1794617416; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        b=euIfCb9T1/EgL/S+vJUz41APOZ5nVihMqpHMBGyqMk1bdFRtLN6xF4r6tgQCklybPc
         /1hhp34FDOMMLBQCpf61NiyM5EvYj+ACiuANuuT6ZZltSj08ZmpVt63f+EsJ7sW1/Xb5
         LmVn2xe4N8YfaYQUr3agoCeXhNDKu0PwlLUpQDbnFGlwhv5mywQZxKnj4ZeJc8dS+pib
         LWMfQ0+b97qJomUyJJHEPJq0Z2IMh5mEs4Y3NuK9uLfHO7CJoKiMs+MexwwBy1YrWZ8z
         SEQcPEhbOlq2FSujMyXUTVKUEhYy4SRQZUWLywB+p5ZND26qFBeOzxMxkXaOkPkwizHq
         Eahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012616; x=1794617416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        b=WuGdFOe243kZcfs/COKtChJKMLR0J6LhR9oo9KJ/jkSGp3uCQCLFuuKoRjxL4oQQuZ
         /KHoSMvzvEu8s261V5QCYvdta9d8Vzpb2wWq7JshV1fKIwCpUrfFTcMh0BSIlzqFuM7D
         WbHtgfl1HCrwxU7KkCFOlZdXn+FVv/ceOcf5MdhMwzZxUAvkDiadYMajAuxU2tGxf6T2
         Jh1bIkJa+Ycz+7T/cDwockoX42G/65YUumMFaOD/ADFGYgSplpHIJEuzL5qnJLz7eX7W
         cecNmhroiKlhjfz1/UTTVNqmBMb6LQ4R1Dt+K+k0ATvm5M8LtLCqfTuQn3u6t/I50NG3
         V9Ug==
X-Forwarded-Encrypted: i=1; AL+hErEr4JOJEdWaQrKqrcsn0WRWufq1LuAtgEKJ671EpRIusJhEW17JrJ2SHX6V5j9Jfn4ch2FOp41r@lists.ozlabs.org
X-Gm-Message-State: APuU4Z+34V3/OipZ6oUwpJ0B5DK7lA6+3LSiGdJlTXMFBMMK8mdpp6l0
	cSE5C3LAEFlN8cLMvwfXwZR/mGbu8TCUNts4Pcg8LTKYP/hWeJlKnBIUXckgPY5QBp0f3TaWR6T
	G7sbegVi2XlzkQiRa70DiOctt0BtaxfE=
X-Gm-Gg: AYBFou1Y4AaT2ced0JrLlrOENSl50HO1rNKXOqGtoWo0EOkEowJ7X+1nU+4lJ2D8MNT
	OubH+DcD0n3rce1zACmaftmmh7MSoQwqUvcpYfUV478nRWnl74P5HNXOh9e39s9gbe1Yqsukz/X
	OwyRjY0rA3OcMzt37mZPf1tUkRe1dr00wgxuvTcSeF2+s2gTyKnNvTR5S3HtOHtRvNjkQH2Yq+O
	qQJvtz1GHvb5TlLO9HO58YTQWHsHF5CiRRaHKaMNAfA98yMikabYtHZntt+CPRaZPSm/FP641cD
	0UuI9CtdkGroNQAQOev+pPKtxS04AY5jt0GaHyFTTe1rtKEBsGgNzOg6bGpHWVwdCBBXKUdSggp
	rNpqDxqRG3g8jKJkUM+zQLxs/b4vZE7gJgm9HI+uaClODwH9CHvdgwLyy7/Y=
X-Received: by 2002:a05:690c:d8c:b0:8b3:f05:dd6d with SMTP id
 00721157ae682-8b34192ea67mr20495907b3.45.1794012615901; Fri, 06 Nov 2026
 16:50:15 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
 <20261106022907.10735-1-prasanth.padarthi10@gmail.com> <20261106022907.10735-3-prasanth.padarthi10@gmail.com>
 <71eb94df4d373d0f3afbe2a8ff880869f96e054b.camel@codeconstruct.com.au>
In-Reply-To: <71eb94df4d373d0f3afbe2a8ff880869f96e054b.camel@codeconstruct.com.au>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sat, 7 Nov 2026 06:20:02 +0530
X-Gm-Features: AclHuK_zfgDPcux-rGy0j0Dx_Q046t2jqfjZUDa9PKNbMEPl2IK8UVzJpqMRhCY
Message-ID: <CAMFFDGgebSfVGfogTG--kpOnGNP5UxWVUGW2g_Sej_18FybNVQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: aspeed: Hand over global GPIOP
 passthrough to local mux controls
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linusw@kernel.org, Tan Siewert <tan.siewert@9elements.com>, joel@jms.id.au, 
	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Thanks for the detailed review.

I'll address the naming, error handling, and implementation concerns
you've raised.

Regarding the necessity of the patch, on B650D4U, GPIO-only power
control failed with SCU51C[9] set. In my hardware testing, clearing
that bit allowed remote and physical-button power control to work.

However, I haven't yet established whether this requires a pinctrl
driver change or can be handled through existing initialization.

I'll investigate the existing pinctrl path further before sending
another revision.

Thanks,
Prasanth

On Fri, Nov 6, 2026 at 4:24=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Prasanth,
>
> On Fri, 2026-11-06 at 07:59 +0530, Prasanth Kumar Padarthi wrote:
> > On B650D4U, GPIO-only host power control fails when SCU51C[9]
> > enables GPIOP passthrough, even after the normal GPIO request path
> > clears the individual SCU4BC selections.
> >
> > Transfer globally selected GPIOP0-P5 THRU roles to SCU4BC[29:24]
> > before registering the controller, then clear the active shared
> > sources. Leave PWM selection and the strap-source selector unchanged.
> > Clear SCU510[28] through SCU514 and verify the shared enables cleared.
> >
> > If handover fails, retain an instance-local error and reject affected
> > GPIO and mux requests before changing their mux state. Check every
> > pin in a mux group before calling the shared helper. Retain prepared
> > local selections after partial failure rather than blindly restoring
> > a shared enable.
> >
> > Probe-time normalization policy, concurrent SCU writers and
> > post-handover registration failure remain open design questions.
> > Electrical continuity, mixed-pair forwarding, protected-write paths,
> > PWM coexistence and SCU510[28] hardware handling remain unvalidated.
> >
> > The implementation passed remote power-on, remote graceful power-off
> > and physical-button power-on tests on B650D4U with an OpenBMC Linux
> > 6.18.24-based kernel. The rebased version was ARM compile-tested on
> > v7.4-rc1 using aspeed_g5_defconfig with AST2600 pinctrl enabled.
> > With the managed-registration prerequisite, the v7.4-rc1 version
> > also completed one unbind/rebind cycle under generic KASAN on
> > B650D4U hardware and in AST2600 QEMU. Host power operations have
> > not been retested with the v7.4-rc1 kernel.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
> >  1 file changed, 141 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 85d6640ff..be22a9184 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > @@ -4,7 +4,10 @@
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> >  #include <linux/pinctrl/pinctrl.h>
> >  #include <linux/pinctrl/pinmux.h>
> >  #include <linux/types.h>
> > @@ -36,6 +39,8 @@
> >  #define SCU4D8               0x4D8 /* Multi-function Pin Control #23 *=
/
> >  #define SCU500               0x500 /* Hardware Strap 1 */
> >  #define SCU510               0x510 /* Hardware Strap 2 */
> > +#define SCU514               0x514 /* Hardware Strap 2 Clear */
> > +#define SCU51C               0x51c /* Hardware Strap 3 */
> >  #define SCU610               0x610 /* Disable GPIO Internal Pull-Down =
#0 */
> >  #define SCU614               0x614 /* Disable GPIO Internal Pull-Down =
#1 */
> >  #define SCU618               0x618 /* Disable GPIO Internal Pull-Down =
#2 */
> > @@ -2743,12 +2748,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pin=
ctrl_data =3D {
> >       .nconfmaps =3D ARRAY_SIZE(aspeed_g6_pin_config_map),
> >  };
> >
> > +struct aspeed_g6_probe_data {
> > +     struct aspeed_pinctrl_data pdata;
> > +     int thru_error;
> > +};
> > +
> > +static bool aspeed_g6_is_thru_pin(unsigned int pin)
> > +{
> > +     return pin >=3D AB22 && pin <=3D AB23;
> > +}
> > +
> > +static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                      struct pinctrl_gpio_range *range=
,
> > +                                      unsigned int offset)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct aspeed_g6_probe_data *g6 =3D
> > +             container_of(pdata, struct aspeed_g6_probe_data, pdata);
> > +
> > +     if (g6->thru_error && aspeed_g6_is_thru_pin(offset))
> > +             return g6->thru_error;
> > +
> > +     return aspeed_gpio_request_enable(pctldev, range, offset);
> > +}
> > +
> > +static int aspeed_g6_set_mux(struct pinctrl_dev *pctldev,
> > +                          unsigned int function, unsigned int group)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct aspeed_g6_probe_data *g6 =3D
> > +             container_of(pdata, struct aspeed_g6_probe_data, pdata);
> > +     const struct aspeed_pin_group *pgroup =3D &pdata->pinmux.groups[g=
roup];
> > +     unsigned int i;
> > +
> > +     /* Check the entire group before the shared helper changes any pi=
n. */
> > +     if (g6->thru_error) {
> > +             for (i =3D 0; i < pgroup->npins; i++) {
> > +                     if (aspeed_g6_is_thru_pin(pgroup->pins[i]))
> > +                             return g6->thru_error;
> > +             }
> > +     }
> > +
> > +     return aspeed_pinmux_set_mux(pctldev, function, group);
> > +}
> > +
> >  static const struct pinmux_ops aspeed_g6_pinmux_ops =3D {
> >       .get_functions_count =3D aspeed_pinmux_get_fn_count,
> >       .get_function_name =3D aspeed_pinmux_get_fn_name,
> >       .get_function_groups =3D aspeed_pinmux_get_fn_groups,
> > -     .set_mux =3D aspeed_pinmux_set_mux,
> > -     .gpio_request_enable =3D aspeed_gpio_request_enable,
> > +     .set_mux =3D aspeed_g6_set_mux,
> > +     .gpio_request_enable =3D aspeed_g6_gpio_request_enable,
> >       .strict =3D true,
> >  };
> >
> > @@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pin=
ctrl_desc =3D {
> >       .confops =3D &aspeed_g6_conf_ops,
> >  };
> >
> > +/*
> > + * Experimental: transfer the global GPIOP0-P5 THRU selection to the
> > + * individual mux controls before registering any pinctrl consumers.
> > + * PWM selection is higher priority and is deliberately left unchanged=
.
> > + *
> > + * Do not undo the local selections on error: a shared enable may alre=
ady
> > + * have cleared. Keeping the equivalent local selections preserves rou=
ting
> > + * while rejecting affected requests, rather than granting an unsafe G=
PIO.
> > + * Signal continuity during this transfer still needs hardware validat=
ion.
> > + */
> > +static int aspeed_g6_thru_handover(struct regmap *scu)
> > +{
> > +     const u32 local_mask =3D GENMASK(29, 24);
>
> Defining a variable with the value (even though that variable is
> qualified const) means it's not an integer constant expression, which
> may impede some optimisations.
>
> Further, local_mask is not a descriptive name for what's occurring
> here. Please name the mask in terms of its behaviour. Perhaps:
>
> #define GPIOP_UNGROUPED_PASSTHROUGH_MASK GENMASK(29, 24)
>
> > +     unsigned int strap2, strap3, local;
>
> Please lets improve on the name 'local'. Perhaps: ungrouped_passthrough
>
> > +     int ret;
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
>
> Consider this error-handling strategy:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/pinctrl/pinctrl-gemini.c?h=3Dv7.4-rc1#n2556
>
> If the first read doesn't work, then we can't expect any of the further
> accesses by the core aspeed pinctrl implementation to work either, so
> we can just bail out entirely in the caller.
>
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!(strap2 & BIT(28)) &&
> > +         ((strap2 & BIT(30)) || !(strap3 & BIT(9))))
>
> Please give these bits named macros. This is not easy to comprehend as
> it is.
>
> Also, consider FIELD_GET() from include/linux/bitfield.h. Something
> like:
>
>    if (!FIELD_GET(OTPSTRAP_ENABLE_GPIO_PASSTHROUGH, strap2) &&
>        (FIELD_GET(OTPSTRAP_ENABLE_DEDICATED_STRAP_PINS, strap2) ||
>            !(FIELD_GET(STRAP_ENABLE_GPIO_PASSTHROUGH, strap3)))
>
>
> > +             return 0;
> > +
> > +     /* Preserve every globally selected role, including under PWM. */
>
> This comment feels like a classic LLM statement that somehow manages to
> be simultaneously both too abstract and too detailed, while also devoid
> of context, all in 8 words.
>
> Can we rather say that the PWM functions on these pins are higher
> priority in the mux than the pass-through GPIO function, so if PWM is
> already selected, then the following write does not affect the PWM
> configuration?
>
> > +     ret =3D regmap_update_bits(scu, SCU4BC, local_mask, local_mask);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D regmap_read(scu, SCU4BC, &local);
> > +     if (ret)
> > +             return ret;
> > +     if ((local & local_mask) !=3D local_mask)
> > +             return -EPERM;
>
> Please add a comment here about the write-protection in SCUF30.
>
> > +
> > +     /* Leave the inactive GPIOZ6 source alone in dedicated-strap mode=
. */
>
> 'dedicated strap mode' is a confusing statement because ASPEED's
> documentation is confusing. I think we can drop this comment with
> regard to making other improvements.
>
> > +     if (!(strap2 & BIT(30)) && (strap3 & BIT(9))) {
>
> We've already inspected these bit values previously. Please consider
> extracting them to bool variables for re-use and to improve everyone's
> ability to comprehend the expression.
>
> > +             ret =3D regmap_update_bits(scu, SCU51C, BIT(9), 0);
>
> Essentially, having configured the ungrouped passthrough functions
> above, we can now de-configure the grouped passthrough function in
> strap3 (SCU51C).
>
> It's probably worth noting in a comment that SCU51C cannot be write-
> protected.
>
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (strap2 & BIT(28)) {
> > +             /* SCU510 is write-one-set; do not use an ordinary RW cle=
ar. */
> > +             ret =3D regmap_write(scu, SCU514, BIT(28));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
> > +     if ((strap2 & BIT(28)) ||
> > +         (!(strap2 & BIT(30)) && (strap3 & BIT(9))))
> > +             return -EPERM;
>
> This appears to be the negated expression of the earlier one, and given
> we're only returning a fixed value in either case, you could rather use
> the same expression again. Given it's repeated, you could extract it to
> a macro or static inline function.
>
> > +
> > +     return 0;
> > +}
> > +
> >  static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
> >  {
> > -     int i;
> > +     struct aspeed_g6_probe_data *g6;
> > +     struct regmap *scu;
> > +     int i, ret;
> > +
> > +     if (!pdev->dev.parent)
> > +             return -ENODEV;
> > +     scu =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> > +     if (IS_ERR(scu))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(scu),
> > +                                  "No SCU regmap for THRU handover\n")=
;
> > +
> > +     g6 =3D devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
> > +     if (!g6)
> > +             return -ENOMEM;
> > +     memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
>
> This seems unfortunate.
>
> Have you considered other approaches?
>
> > +
> > +     ret =3D aspeed_g6_thru_handover(scu);
>
> Must this logic be separate to the usual set_mux path? If not, I expect
> we don't need to retain thru_error.
>
> > +     if (ret =3D=3D -EPROBE_DEFER)
>
> Do you have an example of how ret could be -EPROBE_DEFER?
>
> > +             return ret;
> > +     if (ret) {
>
> If this handover logic is to be integrated here, can you please test
> for specific return values to separate the regmap access failure from
> the write-protection failure?
>
> Related, I've heard opinions from Tan that this patch is not necessary
> to get the platform booting. Given the current complexity, I'm
> interested to hear whether you can do without it.
>
> Andrew

