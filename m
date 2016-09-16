Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZygN2XNnzDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 11:41:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=pp6MaIel; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id b133so243759vka.2
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 18:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=LSmq3qa6WPXDQf+krX5P3mqPhpv2MiOPLgk55ZkrvFU=;
 b=pp6MaIelImA3O/uuUkjKocuXitJJDLT7RWOJ2a9H5gyDfsQNc2NrGNBjcTG0e+HXZi
 hTQWhY97gX8hQFChm4CldzEly903ZIZ8beaooAdCyxAW1nbiD4HVL+x5dQcdxADri9Vm
 0MyLp3g8SIi5yH5CTU2DWSt74iKqetWg1SNEYeZ7ZZbcJaCCYEK9/8uFVbx+mMfOU/2n
 vO4bSmtqG5baBj79xMz07HrSSOD2KwIWib3H48pNPLKRzPL43Qs6jE4MylBADHmUTOKY
 TKh8kWP2Ji9e4PzrJNF7WHMPl+ITUftgByzSyHXlBMBuzdrOWcsYKwc3Qq4L8joTyPq/
 Z6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=LSmq3qa6WPXDQf+krX5P3mqPhpv2MiOPLgk55ZkrvFU=;
 b=hx3oVjGH/GbfyVrSGgrvcxVwO/s7gv8sK1qKqQT+1j2YEG5IIyZPx2m+jIp03OQibk
 Au0B/ca66RnAfuwZEq1cLK9FJU0vEeSuvjyYr2F9J9TABHbhIg98TZ1a10l+KDJLtF+h
 VvhmFd2fIDdDnW1gBjxnLOvZ6TF1plI1RB799J2B/RSYDN5H7NaLl4TMdG+wss4uHXXr
 pO3Crm9hHKi0MOeMcog+Y4l7ZjrEOjtXM1kpBsBlbW5s5REZrU/qu9s7tavNp4Nprr4u
 K0i3sDfyKuAEvI5t+vCmmJxY8hA/pTk26GJ5rrjYuO4zW+6JKgjZ2wn6VgNRnmArjnas
 NeAQ==
X-Gm-Message-State: AE9vXwPQcgPwDw4etyVyOO/IudMNrJM5ukQQCYIzLfVQgTYr3ocxnC7XcxJJe2DhH3ASHfElaDsXh0i5ZREr2A==
X-Received: by 10.31.108.220 with SMTP id j89mr1081319vki.124.1473990094476;
 Thu, 15 Sep 2016 18:41:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 15 Sep 2016 18:41:13 -0700 (PDT)
In-Reply-To: <847945394.194630.1473971761780.JavaMail.zimbra@raptorengineeringinc.com>
References: <847945394.194630.1473971761780.JavaMail.zimbra@raptorengineeringinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Sep 2016 11:11:13 +0930
X-Google-Sender-Auth: ONWUjap8COr8g8tQURGqjBBm7ac
Message-ID: <CACPK8XeKjq-o3VTAAp9hfKWOFx30JM+0GkLqHXnPUneRvZ2fWw@mail.gmail.com>
Subject: Re: [PATCH 08/16] Add missing LEDs to Firestone DT
To: Timothy Pearson <tpearson@raptorengineering.com>
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
X-List-Received-Date: Fri, 16 Sep 2016 01:41:36 -0000

On Fri, Sep 16, 2016 at 6:06 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
>
Missing commit message, s-o-b.

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index ae1a633..4f04e76 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -2,6 +2,8 @@
>
>  #include "aspeed-g4.dtsi"
>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
>  / {
>         model = "Firestone BMC";
>         compatible = "ibm,firestone-bmc", "aspeed,ast2400";
> @@ -19,6 +21,22 @@
>                 reg = < 0x40000000 0x10000000 >;
>         };
>
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               heartbeat {
> +                       gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               power {
> +                       gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
> +               };

On barreleye in the dev-4.4 tree we have another property to ensure
these are kept in the same state on reboot. Do you want the same?

> +
> +               identify {
> +                       gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
>         ahb {
>                 fmc@1e620000 {
>                         reg = < 0x1e620000 0x94
> --
> 1.7.9.5
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
