Return-Path: <SRS0=gpLW=FB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B11DC2D0E4
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2020 05:27:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C0C21D7F
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2020 05:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="XOXEVvmv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87C0C21D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj36T44k1zDrL7
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2020 16:27:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XOXEVvmv; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj2NN1PjKzDrnN
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2020 15:54:27 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id l2so2551063qtq.4
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 20:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BH8es9kpinMKjiwF2Qomn9O22Phm/W4bcXT9ce9H3IU=;
 b=XOXEVvmvYmaER26Ucr/e+bQquVoqxcH3SmSnkqC7TIFvtHZHE4h1gMrsK0aAszZcin
 +fqok4wTO6vTXFTOAgc3Pw0MGJw755lO+3rIOdLccU8Z4jJKoawEJ3Pi6+93aWlEDECK
 UwE0rTvyqIs+/YNGq2flzi+Kr4NmFxokLE8ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BH8es9kpinMKjiwF2Qomn9O22Phm/W4bcXT9ce9H3IU=;
 b=rWQCBsrTEcTHg2DBrQ/8vq3H8Sgw6malaaSDlJXm/YdxBBdPFHn+4cyoY7i/MzQtDF
 dBAG56avBPKtz6XF9AS6e3UUJ0IjRcEZ/uPYqewyZXQ5HjNOg10yLEJrXWZQYb5wy3r4
 7J5phls//jFfeP2GCrHx1SmIUORoqMDkXwujbxcWNdhmLisIriKEnictcurB2TS44n7t
 P8qYj9vzzLx6sfDBmh1sqZFO5SyORYwFP0iFLMxjbci6JR3UFLW5U1wjl5fR/ra7ZdaE
 eRoZ/zyGz8JszkkrIcqfJx52QI1b1L3OaZmHZVhFpAnJTLsdyNz7dDXHQ1PWdqgHGXE0
 7+qQ==
X-Gm-Message-State: AOAM532dBGwG9qmAMwwY7boOjSFjvJWFZnyh5W22hSoJzERyctdBpAhi
 XK2ks++4TZqyLEuRjdZhhz0+FUIBvHbDvmLFho4=
X-Google-Smtp-Source: ABdhPJwfqKcSZHw4/OEHDHpGnZezwcO5B636gnPv87YNYP4XpiDgRFQt6xMSox3gdGjavMb+J3WM632tjvT7s2C+kNg=
X-Received: by 2002:aed:33a3:: with SMTP id v32mr6425159qtd.263.1606452863753; 
 Thu, 26 Nov 2020 20:54:23 -0800 (PST)
MIME-Version: 1.0
References: <20201124044910.2006209-1-msbarth@linux.ibm.com>
In-Reply-To: <20201124044910.2006209-1-msbarth@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Nov 2020 04:54:11 +0000
Message-ID: <CACPK8Xf2wh_bBEY_83-CfskeTKgQM1w3vSx837_y0QhMHkbeCg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] ARM: dts: aspeed: rainier: Set MAX31785
 config
To: Matthew Barth <msbarth@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 24 Nov 2020 at 04:49, Matthew Barth <msbarth@linux.ibm.com> wrote:
>
> Set the MAX31785 device configuration properties

Andrew,

As I understand it these properties are not upstream and we have no
intention of making them so as the correct fix is to properly program
the EEPROM in the fan controller with these settings. Can you clarify
here?

>
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 54 ++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index a4b77aec5424..4692c5e8f919 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -732,24 +732,78 @@ fan0: fan@0 {
>                         compatible = "pmbus-fan";
>                         reg = <0>;
>                         tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
>                 };
>
>                 fan1: fan@1 {
>                         compatible = "pmbus-fan";
>                         reg = <1>;
>                         tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
>                 };
>
>                 fan2: fan@2 {
>                         compatible = "pmbus-fan";
>                         reg = <2>;
>                         tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
>                 };
>
>                 fan3: fan@3 {
>                         compatible = "pmbus-fan";
>                         reg = <3>;
>                         tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +
> +               fan4: fan@4 {
> +                       compatible = "pmbus-fan";
> +                       reg = <4>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +
> +               fan5: fan@5 {
> +                       compatible = "pmbus-fan";
> +                       reg = <5>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
>                 };
>         };
>
> --
> 2.28.0
>
