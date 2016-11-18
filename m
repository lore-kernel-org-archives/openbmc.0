Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0d34gSmzDvb1
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:24:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rKse2SbQ"; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 50so17953846uae.2
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 06:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=DOsZ5NGDxWXSC2tjyeLbv7vmBYIIbGEblGVKlr/EpgI=;
 b=rKse2SbQ1O++bIEUyav6H241FHEMxaFiUtwIZRlm/kiwEJhllMI1MGBnxLtWCrOAZ0
 6sno9Y8omyP7pNeedeCy54fc7CGX1aH4zUOy17WHGDQD42paERKWP3aXWxyHk/VMH9Am
 84/ku2ClG2AWBgcGkvnuDmUNjwak6CiDU5kZqQBSvaXou5BSOvy410sncnrH86iyCJ+F
 +8S5j+UgqSJIIF5lnLPGIZGaYB34T1dJPAjJGa77odGNQCKB3NIE21b+sYu7JtY8+uWw
 ekgTls9xxvGm+h+nBwvL77sxbaA4coT68Dft/rsNGKGw3hCfH7YNlcwJrK7kESoIycQR
 YV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=DOsZ5NGDxWXSC2tjyeLbv7vmBYIIbGEblGVKlr/EpgI=;
 b=KxSNGFtMT53f896dfLt9BPeWYO7+lPZJcWfwZkFFTU8gqsgfUPqzlUjssVzjADkgja
 TvAalSpRVOfEAcOnUmV2ajkhg8vSAbMrpUGRC5urbPJ4Voa4pTQBMPAkHAvqnKtOFytu
 atFC1vpP0hx4bpsr4+0Itg9nrTi3ErNkbBnUR4+gCnvIz4+AWS3ZS6r/YYnvbTNMeSl/
 0zT9zJznIUv/NQWdXJvkHLS8JSoB9bhk0k88afXWfqDuTTAteTpGK6VSQzWL76USV8WW
 LlKEF0CeIcHn1elvmHVRs/65eCzCsNUpYGNCfuDFBLOuMaZWPE+yqbe9c2a0Z7KQ+zj0
 ds6g==
X-Gm-Message-State: ABUngvcwfveG42yMed8wLXsldwZmrsxXVpASGXoYUqf4N1UJYS/kwdzH1mqbwlNtTPi0UykvDZmKy8aL0mYlzA==
X-Received: by 10.176.80.195 with SMTP id d3mr5803471uaa.125.1479479093020;
 Fri, 18 Nov 2016 06:24:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.243 with HTTP; Fri, 18 Nov 2016 06:24:52 -0800 (PST)
In-Reply-To: <OF6A1A7417.88F14B99-ON0025806F.004E9A7D-8625806F.004EA327@notes.na.collabserv.com>
References: <OF6A1A7417.88F14B99-ON0025806F.004E9A7D-8625806F.004EA327@notes.na.collabserv.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Fri, 18 Nov 2016 08:24:52 -0600
Message-ID: <CAA0LjjXej1XQ=voNfX_=5YL21bgjf73WK-UE=OgBcb=Pt=aKhg@mail.gmail.com>
Subject: Re: Fw: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Jeremy Kerr <jk@ozlabs.org>, xxpetri@de.ibm.com, zahrens@us.ibm.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 18 Nov 2016 14:24:56 -0000

On Fri, Nov 18, 2016 at 8:18 AM, Christopher Bostic <cbostic@us.ibm.com> wrote:
> From: Andrew Jeffery <andrew@aj.id.au>
> To: Joel Stanley <joel@jms.id.au>
> Cc: openbmc@lists.ozlabs.org, Cyril Bur <cyrilbur@gmail.com>
> Date: 11/18/2016 02:13 AM
> Subject: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
> Sent by: "openbmc" <openbmc-bounces+cbostic=us.ibm.com@lists.ozlabs.org>
>
> ________________________________
>
>
>

Hi Andrew,

I notice Pin H6 is in your list assigned as a gpio-hog.   This is a
pin I use for the voltage direction control via the translator for
openFSI.  Not familiar with the history here but is that pin being
used for other purposes or is required to be flagged as a gpio-hog?
Currently I'm attempting to grab a descriptor for this without that
requirement.

Thanks,
Chris


> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 21619fd8cd8d..5c689613e5bd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -167,6 +167,133 @@
> output-low;
> line-name = "func_mode2";
> };
> +
> + pin_gpio_a0 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
> + input;
> + line-name = "A0";
> + };
> +
> + pin_gpio_a1 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "A1";
> + };
> +
> + pin_gpio_b1 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "B1";
> + };
> +
> + pin_gpio_b2 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "B2";
> + };
> +
> + pin_gpio_b7 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "B7";
> + };
> +
> + pin_gpio_d1 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "D1";
> + };
> +
> + pin_gpio_f1 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
> + input;
> + line-name = "F1";
> + };
> +
> + pin_gpio_f4 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
> + input;
> + line-name = "F4";
> + };
> +
> + pin_gpio_f5 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(F, 5) GPIO_ACTIVE_HIGH>;
> + input;
> + line-name = "F5";
> + };
> +
> + pin_gpio_f7 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(F, 7) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "F7";
> + };
> +
> + pin_gpio_g3 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "G3";
> + };
> +
> + pin_gpio_g4 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>;
> + input;
> + line-name = "G4";
> + };
> +
> + pin_gpio_g5 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
> + input;
> + line-name = "G5";
> + };
> +
> + pin_gpio_h0 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
> + input;
> + line-name = "H0";
> + };
> +
> + pin_gpio_h1 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
> + input;
> + line-name = "H1";
> + };
> +
> + pin_gpio_h2 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "H2";
> + };
> +
> + pin_gpio_h6 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "H6";
> + };
> +
> + pin_gpio_h7 {
> + gpio-hog;
> + gpios = <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
> + output-high;
> + line-name = "H7";
> + };
> +
> };
>
> &vuart {
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>
