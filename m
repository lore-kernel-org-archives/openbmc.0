Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t90F71dW8zDt1g
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 09:36:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=kOFo7K8j; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id x4so9288173oix.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QzCaUMy/h8RhKqsZRoau7GobA6kpLltWJP/RxLyTCqE=;
 b=kOFo7K8j8hAH8FngjVtwCAI0ga2HmIF+/lNZKFgg0p7KxBNu6FhMZmit/es99n1mPO
 Xozr3eRbyB4y1rFqD7F5B9HWQYQQRMRo1gGQ5UxWa0HFxfOc5RTTHI6nXeOA3VVzizX0
 Auaczc+Gl6lAPjOpV9GksTT2GhKHLdrLW7qlQy/XahslcDovLOMJQ2arJRWD9bilAG4B
 gve/zN/sv0opzam0XBH3fOMpcpWDeXlLyljSxDkenkrxX7nXziTGd4HUsPCu9hNP5iQR
 knAA+fydA6N6BgWmf1u8BhPSKuMqxP880uQXjqtG+UMooVK0uHDhpCkao8KZl8LPlati
 Lszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=QzCaUMy/h8RhKqsZRoau7GobA6kpLltWJP/RxLyTCqE=;
 b=O0B+Y2QIMic2JRbcluzn5K0+LL+Xu8QuCts7EQDmo/7Tum3rQL23BR0hPiCVvuX6Cl
 W7r4NSYghYmAP8MH0iOlbFW9mnjJQDU1bVrBqt2ZKxvYLWFKAVhZONUHO1PuTyqVx8C9
 RrtBs61f1qFTO1RR+IIXwZ7ENMYtuELoqPhoci/A0xMM5NginY5XRGezXQt74Eceipam
 rvC53C/dyBl0WjbZGb3rNBVJ5c4UsWMYEwsJa5pGDVier7jnEmCPv3b+Y/RlwXIRdmpM
 2QgbhdLfeVd/bw75CHqxKSeXobUTLHV2YmXy78kT6iStkmabzwTCkXHILMaeWMtcXYbS
 fcTA==
X-Gm-Message-State: ABUngve3JSaCOIFgqIHDSttIYY/hmxjVLmljK3bOJPLC7tmNegPZ7ShEys8MfBC9XjNRJ6YjPruJhJAtMrOWcA==
X-Received: by 10.202.114.129 with SMTP id p123mr10921546oic.132.1478212585135; 
 Thu, 03 Nov 2016 15:36:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 15:36:04 -0700 (PDT)
In-Reply-To: <1478208984-91788-1-git-send-email-xow@google.com>
References: <1478208984-91788-1-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 09:06:04 +1030
X-Google-Sender-Auth: YO4jaoF5bivKhljbASOCv_-Yb7c
Message-ID: <CACPK8XfD1NY5tJSf1K77CEumRp3nVrvShXR_xUWXbGYS4H8_tQ@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: zaius: Add UCD90160 power
 sequencer
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
X-List-Received-Date: Thu, 03 Nov 2016 22:36:27 -0000

On Fri, Nov 4, 2016 at 8:06 AM, Xo Wang <xow@google.com> wrote:
> Add binding to instantiate hwmon sensor support for the UCD90160 power
> sequencer on the Zaius board.
>
> Signed-off-by: Xo Wang <xow@google.com>

Applied to dev-4.7.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 9e59649..673bab8 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -111,6 +111,11 @@
>                 reg = <0x68>;
>         };
>
> +       ucd90160@64 {
> +               compatible = "ti,ucd90160";
> +               reg = <0x64>;
> +       };
> +
>         /* Power sequencer UCD90160 PMBUS @64h
>          * FRU AT24C64D @50h
>          * RTC PCF8523 @68h
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
