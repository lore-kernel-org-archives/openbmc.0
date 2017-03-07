Return-Path: <raltherr@google.com>
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vd8X96r9jzDq5x
 for <openbmc@lists.ozlabs.org>; Wed,  8 Mar 2017 08:13:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Oj5x5v87"; 
 dkim-atps=neutral
Received: by mail-it0-x234.google.com with SMTP id m27so13995497iti.1
 for <openbmc@lists.ozlabs.org>; Tue, 07 Mar 2017 13:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ih90YKk4OeqMeCKeT0B/1C00IlxDyVZWSbdjBACeb2k=;
 b=Oj5x5v87mngzrIOeKgY3RWp5ax119TwN3cIKYEqLIvxZQiat2Y9SQ0l5tj00vSa6Db
 iDuPAcEQoSd3C/dELq7KoKYXXQW2yffEG8EQlpAHVU0CSJTV18FV/oxk78WOGS9gipJj
 EcFlgonFJQbTjH2fPb0+BD0frHrYGvMpZ7jcpi1rCcaz5Tcao4VTP9wxzU8Q1pFJ+Lf3
 wEKNeso3CP8CrvynQfwFXVkMfqJsxMtb2BWsATjjp//FxtTopBmrfWSh1wa/Vr79Fp8H
 Ief3szmuOuUaiXGlxZ474k+H64qboWBa4OHa3yWydaJ5DQAeVUeuD7Xr9nUC2X/UzpZh
 zGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ih90YKk4OeqMeCKeT0B/1C00IlxDyVZWSbdjBACeb2k=;
 b=IkF40xBEddoH3DCNwnQNk+0wwSh6seyf3hKGZIOfo1UfEEx6aakpRxUtwznMJbGbv4
 2pRZ9JjwykVNl1QuA4LvrxLltDG+TUzxzAmwVo8dalJnzP3/xrRbP7FG/ZC91pWBDZhY
 wu4cAUb4NahioKk5SpmjTDk4KSMQemG6+UXEL36t2fL2pOqll21yFNsqiS8BgELCUhQG
 ozgW+R0pbxk0/rCXuBdBa6wXqUEbBGdZDvREJNLc2z1UfMq1DaLOONH28ENxMT300lET
 Sppdatff+OQpHcnVUorb7+Arf65kYzSL40stmt0Pu9Ag6Ntg7E4oZ6KHbh5QrRGaHpOq
 efUA==
X-Gm-Message-State: AMke39lSmJl5HUL40K/PmwJ7R7mUgmFw6X7Bq1VMIEeqPhqv0h7BC4MIOr7qhbzUyrfDcP/Kiu1zF1XXSAW0K3p4
X-Received: by 10.36.73.135 with SMTP id e7mr3049483itd.105.1488921206490;
 Tue, 07 Mar 2017 13:13:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.25.109 with HTTP; Tue, 7 Mar 2017 13:13:26 -0800 (PST)
In-Reply-To: <20170303205920.146751-1-xow@google.com>
References: <20170303205920.146751-1-xow@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 7 Mar 2017 13:13:26 -0800
Message-ID: <CAPLgG==-CnHNe14H9SV2ZCfJu9ZQ_Xc7ayXfkKbQY+_ZmVPubA@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: zaius: Enable NC-SI mux
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 07 Mar 2017 21:13:30 -0000

Why is Linux doing this instead of U-Boot?

On Fri, Mar 3, 2017 at 12:59 PM, Xo Wang <xow@google.com> wrote:
> The Zaius motherboard has muxes for the RMII lines from the BMC to:
>   - BCM5719 LAN on motherboard (LOM)
>   - OCP mezzanine connector
>   - HDMI form factor connector
>
> Assert the active-low enable line for the muxes. Due to the AST2500
> default internal pull-down resistors, the muxes selection lines will
> be low. This implicitly selects the LOM for NC-SI.
>
> The NC-SI interface will show up as network interface eth0.
>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index dc0546869886..3bd70ed810af 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -325,6 +325,13 @@
>                 line-name = "iso_u164_en";
>         };
>
> +       ncsi_mux_en_n {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "ncsi_mux_en_n";
> +       };
> +
>         line_bmc_i2c2_sw_rst_n {
>                 gpio-hog;
>                 gpios = <ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
> --
> 2.12.0.rc1.440.g5b76565f74-goog
>
