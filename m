Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wXYvD4QNqzDqdl
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 10:59:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X39/vQkc"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id p144so11946340ywp.2
 for <openbmc@lists.ozlabs.org>; Tue, 23 May 2017 17:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AD+4ST/ib1e2By7rAiI38VaGGvEZzE39R8CVhp58SuY=;
 b=X39/vQkcCm5MJDqlKMDA4tWpe8WJZv3AlDJVZ9tlH3ALqjn68r5ogMPQTqU8dmC9Hf
 4cIe1vchFzcbNFNS7NvnBFvFIXWd9LocMY2V1e/BFoa28yoToSK0YxIQWnOSz39ppSjD
 TMaEjtODlRkUJUG7slWCEjFoREv4GsfVw6laVeW39jGb6GWIGtLYtUGcDt+MMfxcQlrc
 r0qYwI50xn8Cn4Y2c8Y1h8kOvW+2+T5Hqlau6NzjOW9f/jXk+iE5zkPM9MY3Y0zWFfcy
 uaMhXd55t0X3suf2RIDksp/5SgGhs0qVMPwoiVrsjc+PZQSfyFpSuA2hdPLVjnjRmCxE
 7Uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AD+4ST/ib1e2By7rAiI38VaGGvEZzE39R8CVhp58SuY=;
 b=W/ZJM+Wi16R4FwqWUgVxBfGqdfFRGrw6jLZw74XjoD2oIjRtdJH1dxi9/FFEz3MHGg
 zosXBcxb9cMsiJbUAwHi9nAeJAp9mP+aetmz1bacXFMJ2G/xeQECPnpE/YCi+82RiX3B
 WQeWy/eaNGra7NgSEW7KPoB2JK/2aw6kbPJTnqgHkqswddhakhKQQcXQ+WY5ASD26XFb
 /VHk/gdHkaP1nww+6rGLOUYGxNNNS4mlKfcqFGUr27QcVCqwvUQH3IJ6UzPISj1GlG7U
 76YFKeb8AZfExAMOLUxcrnNCIXcaTYv5/LjZZJNu1yIsmJoAR2ngbEMnzkmfHuzVv2Kb
 FWPQ==
X-Gm-Message-State: AODbwcDlceTw1yNJ9ajH5CrE1l/mN81aiJxpMyq8VCf/uvJUcF/jxVDg
 LlaNtC8Uy/oNhdfMuYEVQ686BO1ZcA==
X-Received: by 10.129.108.215 with SMTP id h206mr24657384ywc.329.1495587558139; 
 Tue, 23 May 2017 17:59:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Tue, 23 May 2017 17:58:57 -0700 (PDT)
In-Reply-To: <20170519173412.68053-2-cbostic@linux.vnet.ibm.com>
References: <20170519173412.68053-1-cbostic@linux.vnet.ibm.com>
 <20170519173412.68053-2-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 May 2017 10:58:57 +1000
X-Google-Sender-Auth: oS894GyrjxH4RpDkFN8rQkSlCQk
Message-ID: <CACPK8Xdq2J0XE9bkezBDOTQ=xCUGdYo=TLdjyOkwpp=3JFATgg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] arm: dts: aspeed: Add IR35221 instances
 to dev tree
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 24 May 2017 00:59:21 -0000

On Sat, May 20, 2017 at 3:34 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Add IR35221 to i2c4 and i2c5 buses.

This is similar to the patch that I sent on the 2nd.

I took your patch as it adds the device at 0x71 which I did not know about.

Cheers,

Joel


>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> V2 - Convert I2C bus addresses to 7 bit right aligned.
>    - Add IR35221 to device tree documentation.
> ---
>  .../devicetree/bindings/i2c/trivial-devices.txt      |  1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts     | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> index cdd7b48..d504271 100644
> --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> @@ -53,6 +53,7 @@ fsl,sgtl5000          SGTL5000: Ultra Low-Power Audio Codec
>  gmt,g751               G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
>  infineon,slb9635tt     Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
>  infineon,slb9645tt     Infineon SLB9645 I2C TPM (new protocol, max 400khz)
> +infineon,ir35221       Infineon IR35221 Digital DC-DC Multiphase Converter
>  isil,isl29028          Intersil ISL29028 Ambient Light and Proximity Sensor
>  maxim,ds1050           5 Bit Programmable, Pulse-Width Modulator
>  maxim,max1237          Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 5d83a76..b0338db 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -394,6 +394,16 @@
>                 compatible = "ti,tmp423";
>                 reg = <0x4c>;
>         };
> +
> +       ir35221@70 {
> +               compatible = "infineon,ir35221";
> +               reg = <0x70>;
> +       };
> +
> +       ir35221@71 {
> +               compatible = "infineon,ir35221";
> +               reg = <0x71>;
> +       };
>  };
>
>
> @@ -408,6 +418,16 @@
>                 compatible = "ti,tmp423";
>                 reg = <0x4c>;
>         };
> +
> +       ir35221@70 {
> +               compatible = "infineon,ir35221";
> +               reg = <0x70>;
> +       };
> +
> +       ir35221@71 {
> +               compatible = "infineon,ir35221";
> +               reg = <0x71>;
> +       };
>  };
>
>  &i2c6 {
> --
> 1.8.2.2
>
