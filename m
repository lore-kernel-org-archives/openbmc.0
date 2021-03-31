Return-Path: <SRS0=cdlr=I5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A00C433DB
	for <openbmc@archiver.kernel.org>; Wed, 31 Mar 2021 07:37:54 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E97F9619DB
	for <openbmc@archiver.kernel.org>; Wed, 31 Mar 2021 07:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E97F9619DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9J7h2kTFz3bw7
	for <openbmc@archiver.kernel.org>; Wed, 31 Mar 2021 18:37:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TaEDR9R0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TaEDR9R0; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9J7D30Twz2yR6;
 Wed, 31 Mar 2021 18:37:27 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id g15so18475622qkl.4;
 Wed, 31 Mar 2021 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YmFGanOh+5/h5bQyI1kuE96WZuZNuPL1Dl6Uzo04jXA=;
 b=TaEDR9R0vl6FMDZ1ycwhFCUSydbcAllH2shzMvcHkb6u95KoLKY4V9zmhJtbdLq3AO
 iqAH7Mm1kLuMZa+WNoLfPvTuLbn5JlDwhxairj+uGxVpxseQ6pTxo0NyDruD5MtYGagu
 kTboJU0ZZ+LdJHfdZOz+gf4M8L16olkIclrAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YmFGanOh+5/h5bQyI1kuE96WZuZNuPL1Dl6Uzo04jXA=;
 b=QrQ+rf7z8lnfOQhfiWPeQrDJP63wgXxs2jld4rDJK28L8PjsA3FnPMUw/qiDTKzTP6
 5qKyKseDc1kzgpMFOirJ/z3ykQVzWfZ9T2f0sEs5RdNR9AeO7Q3dsNecYELEH1UVtxHW
 jD4BA9OhJ1gOOzkAo7TH/5Js2/0Bv9HMHnb7lCjYJ/zZPFpwkM8wVHhsMj64pxEmEsBZ
 FgJJt1vekxtf8cQ1OuOgudYUrrozBGF4r9hoXXGwLRtaAzrv28cKdBhYKLy0P4Mu1myO
 p6TMnDAnXX1PIaEyw4ywGhuwcXIvKJQHd8sb90goRMu9sj48qq1swiTE0wfEHhoCvLrA
 T7IA==
X-Gm-Message-State: AOAM531E9fxmxNgGPlFzdh6vghcyIzmSbOhs0NLOLLGY1XuihbS3/PiA
 tVOYFdmtoa5wpF5VtPm+qER+qVJTZH6Sl8fk24A=
X-Google-Smtp-Source: ABdhPJz8aL8nt1uu7ZKbEwhzxgPa69OpID3oHVL1idTbMH8oB07t6+ULpCPtoNxSwZxsNs2v353f5Wm/jdDIekqkuSU=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr1884039qki.487.1617176242365; 
 Wed, 31 Mar 2021 00:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210330020808.830-1-Nichole_Wang@wistron.com>
In-Reply-To: <20210330020808.830-1-Nichole_Wang@wistron.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 07:37:09 +0000
Message-ID: <CACPK8Xfb=U2SH20bxbc4vSM+U6gy8rkCJgHi2UFELrdfSGGO8w@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2 v1] ARM-dts-aspeed-Add-Mihawk-GPIO-Line-Names
To: Nichole Wang <Nichole_Wang@wistron.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ben Pai <Ben_Pai@wistron.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, small84206@gmail.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 30 Mar 2021 at 02:09, Nichole Wang <Nichole_Wang@wistron.com> wrote:
>
> Name the GPIOs to help userspace work with them. The names describe the
> functionality the lines provide, not the net or ball name. This makes it
> easier to share userspace code across different systems and makes the
> use of the lines more obvious.
>
> Signed-off-by: Nichole Wang <Nichole_Wang@wistron.com>

Thanks for the patch. The syntax is good, and I will assume the
information is correct. I will apply it to the tree.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel



> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts | 33 +++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> index 577c211..15c1f0a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> @@ -383,6 +383,39 @@
>         };
>  };
>
> +&gpio {
> +       gpio-line-names =
> +       /*A0-A7*/       "","cfam-reset","","","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "fsi-enable","","","","","","","",
> +       /*E0-E7*/       "","","","","","fsi-mux","fsi-clock","fsi-data",
> +       /*F0-F7*/       "","id-button","","","","","air-water","",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","checkstop","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","",
> +       /*Q0-Q7*/       "","","","","","","","",
> +       /*R0-R7*/       "","","fsi-trans","","","","","",
> +       /*S0-S7*/       "","","","","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/       "presence-ps1","","presence-ps0","","","","","",
> +       /*AA0-AA7*/     "led-front-fault","power-button","led-front-id","","","","","",
> +       /*AB0-AB7*/     "","","","","","","","",
> +       /*AC0-AC7*/     "","","","","","","","";
> +};
> +
>  &fmc {
>         status = "okay";
>         flash@0 {
> --
> 2.7.4
>
>
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> This email contains confidential or legally privileged information and is for the sole use of its intended recipient.
> Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
>
