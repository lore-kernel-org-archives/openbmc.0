Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sStQV0YXHzDrpp
 for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2016 14:09:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Tm7U9ASB; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 49so3339306uat.0
 for <openbmc@lists.ozlabs.org>; Mon, 05 Sep 2016 21:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ga0B4gT+Er34vNW3a8csLnztGKchRtg6ACy125pjoik=;
 b=Tm7U9ASB7IIg0HaPdoUpFR8LVaKHorPPVIi6xNI9iQcMUnHQpRqpIHsLNdWEd93ea1
 uwhyk7JAKkt41TboyC+bVHzIM+1i6BIqtj8Zysv1hnVePeCRUsWsmZTdYKYnmIcpassI
 O+AxnvtYsI2EoLBiDywRwjVoTxeB+XVzXG3v3HNwJFtr8lu5rHrunlRTMvjWGNtl/JZr
 sajTfC3RkVKkBuEkfTwcqlsyBEfFQQQEoOx6CJGCsQeYKtMayxWhpum9l2ygKJd2rzK7
 p4IxvgI0kSfAfZGZDwcTKHIrnec2R1y1CaphezO9HUwmnIwrwtqo1SmEkxc71eteqx+0
 uvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ga0B4gT+Er34vNW3a8csLnztGKchRtg6ACy125pjoik=;
 b=EnoZohW13KGD1IK59HHYiT4kcoJkYFfDt/1NqkOItY5jLaq/mPIuXDGUdykvL+tOwj
 7nIL+7h3Xxsmo6j/N6lRG3QV+lxHp030SyGvqnfbfChfnkGIfbSSpEv1BhNTvAop+dst
 lROV7SubnDsf5KSlMq8I0PhyCO+mZci1/1bYQCFuIOR7Q6cbSK+mX8fU4YCaFqlu1urL
 enrIIFyssY60Zj42pj7H8jWO02XbZob2GFDadWx8ootgj0rOyLS7bbH9Be472bNkkWJ9
 AfW66AVj2jO1y6Q7jwUDpryjvtWXBtE5V6NYCRw6muhPY/JRHawl88rDYQSXUvinDoVf
 nHlg==
X-Gm-Message-State: AE9vXwNWO4UOxopCHB+Og7yw7h5prynpwVP22DfYPUF53sgH9MbIg9rI+FJ75Z6ggeCt+cxQTu85bZcNbkzCBg==
X-Received: by 10.176.80.120 with SMTP id z53mr19412137uaz.38.1473134958049;
 Mon, 05 Sep 2016 21:09:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Mon, 5 Sep 2016 21:08:56 -0700 (PDT)
In-Reply-To: <20160902073051.31492-2-andrew@aj.id.au>
References: <20160902073051.31492-1-andrew@aj.id.au>
 <20160902073051.31492-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Sep 2016 13:38:56 +0930
X-Google-Sender-Auth: IpxIbddzYK7Z9dNIgjPeikx7OXE
Message-ID: <CACPK8XcCvE7-XbC0C==0P8j8S=nvKiZPrig6OhpcrUkaAffWQQ@mail.gmail.com>
Subject: Re: [PATCH linux 1/3] aspeed-g5: Add I2C mux configuration properties
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2016 04:09:22 -0000

On Fri, Sep 2, 2016 at 5:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Thanks, merged to dev-4.7.

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 3d7b69b50785..f73a2b18e152 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -384,6 +384,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <2>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c3_default>;
>                                 };
>
>                                 i2c3: i2c-bus@100 {
> @@ -395,6 +397,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <3>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c4_default>;
>                                 };
>
>                                 i2c4: i2c-bus@140 {
> @@ -406,6 +410,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <4>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c5_default>;
>                                 };
>
>                                 i2c5: i2c-bus@180 {
> @@ -417,6 +423,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <5>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c6_default>;
>                                 };
>
>                                 i2c6: i2c-bus@1c0 {
> @@ -428,6 +436,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <6>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c7_default>;
>                                 };
>
>                                 i2c7: i2c-bus@300 {
> @@ -439,6 +449,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <7>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c8_default>;
>                                 };
>
>                                 i2c8: i2c-bus@340 {
> @@ -450,6 +462,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <8>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c9_default>;
>                                 };
>
>                                 i2c9: i2c-bus@380 {
> @@ -461,6 +475,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <9>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c10_default>;
>                                 };
>
>                                 i2c10: i2c-bus@3c0 {
> @@ -472,6 +488,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <10>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c11_default>;
>                                 };
>
>                                 i2c11: i2c-bus@400 {
> @@ -483,6 +501,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <11>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c12_default>;
>                                 };
>
>                                 i2c12: i2c-bus@440 {
> @@ -494,6 +514,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <12>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c13_default>;
>                                 };
>
>                                 i2c13: i2c-bus@480 {
> @@ -505,6 +527,8 @@
>                                         clock-frequency = <100000>;
>                                         status = "disabled";
>                                         interrupts = <13>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c14_default>;
>                                 };
>
>                         };
> --
> 2.9.3.1.g0db844e
>
