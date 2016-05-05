Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x241.google.com (mail-ob0-x241.google.com
 [IPv6:2607:f8b0:4003:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0wXs2CCnzDq5y
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 23:21:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gE7fBFdz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=d7eZLJNV; 
 dkim-atps=neutral
Received: by mail-ob0-x241.google.com with SMTP id aq1so4697063obc.0
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2016 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=TjGb85B0K3noYkTX8GSPHyn9UGYKgMX1qHiOa8Jgn/s=;
 b=gE7fBFdzxN3J05yD+HabkXx8VbZSVtFaFiyXltnK1RL3MUESGzvldK7rORVV0PWmGy
 6m2aHhTpuOTYKC/fXy5TqHxv89ag2JGkGcC/HLH1tmV7RX4pviKD6MFo4ANipqMo9klH
 +mLI2PuDbKiNSTz8L3nVy2mw/u6cXBrkhW22eXyczNDbTzaUcnlWzhH66fUTpnB5DxPb
 C1Y7aGl9VVXt6b7l33PlYw4rjVa5oGMRFh72AiTfaxQk8uYoKv6MTIyneRnN6Sy3okSF
 eKDC3V2xLPkWGD5XsNDlG0hKtPqzcJ+XZebZFWXuEGljCScyZfHRYUqE/KvJCIRlJESI
 WfOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=TjGb85B0K3noYkTX8GSPHyn9UGYKgMX1qHiOa8Jgn/s=;
 b=d7eZLJNVLBRlyD6YA8xJxox2ZP2SbRwkWyHSvN2ajoF7y2jM/kSAPp8RJIWwv+fMm7
 3fko6BXOnt1mlNqCrlCDlS00f3F2tDtpmWruH4/V3aAvTTtevNaN/fhVbBhW/gGHcf9r
 6NmRduoIJkI12Dh9IV9sI41y+yZL/UMQYr4wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=TjGb85B0K3noYkTX8GSPHyn9UGYKgMX1qHiOa8Jgn/s=;
 b=cIIYs0jMMno/Vqhp8615/YA/17SUefxHbqdBV1GvLJC7fErnn7uxg5CoPUMWkoxPWT
 DYpzRKLUU2Vs9A03AwXKhZfhq9Z1UEAqL4R7k7u0IpATSjtfTlG8Z1n2TKiAGobzhAAk
 y5Byr6sJ0GwReE7DJTT5npAFih840O3BHF1r6+Tk06g0CLm1bJvQPIr9dzzglJg21peW
 Q0O5UFnyvsPf56HZUzXWyyu/44eF4KUm515Lbe7mymMvU9s8ppO1bFthN7W8hrN0KV5n
 R8NvUVOHlwUlrtDcXt8BFT34Sd4YjGKIVm0V+UcNeVzRbkyqY6vcmraTAZQfY7D1+Q5m
 fQyQ==
X-Gm-Message-State: AOPr4FVJD4VAWcWYJfVIMO7oEaSlnNSR6Ei29GdNkPc+DSFvw6sYy+vJ551xFOS9P8+MA5NwZoP6cFb3ZLYcwg==
X-Received: by 10.182.224.137 with SMTP id rc9mr6649313obc.39.1462454490946;
 Thu, 05 May 2016 06:21:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Thu, 5 May 2016 06:21:11 -0700 (PDT)
In-Reply-To: <1462411636-7225-5-git-send-email-cyrilbur@gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-5-git-send-email-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 May 2016 22:51:11 +0930
X-Google-Sender-Auth: LJGxOUoikzx2bZfA7RjG9AkFiPg
Message-ID: <CACPK8Xf7Bzi99E3=69Pi_O1aZTG9EOUNy+1uNO6+-87=zbTF1w@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm/dts: Set I2C_TEN_BIT_ADDRESS in Firestone BMC
 board i2c addresses
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 05 May 2016 13:21:34 -0000

On Thu, May 5, 2016 at 10:57 AM, Cyril Bur <cyrilbur@gmail.com> wrote:

Did you work out why we needed this, and why it fixes things?

Should we be doing it for all the device trees?

> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 2b988e7..379b561 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -75,7 +75,7 @@
>                                 i2c5: i2c-bus@180 {
>                                         tmp423@98 {
>                                                 compatible = "ti,tmp423";
> -                                               reg = <0x98>;
> +                                               reg = <0x80000098>;
>                                         };
>                                 };
>                                 i2c6: i2c-bus@1c0 {
> @@ -98,27 +98,27 @@
>                                         status = "okay";
>                                         leds@c0 {
>                                                 compatible = "pca,pca9552led";
> -                                               reg = <0xc0>;
> +                                               reg = <0x800000c0>;
>                                                 // led9 - led_fault_n
>                                                 // led10 - pwr_led_n
>                                                 // led11 - rear_id_led_n
>                                         };
>                                         rtc@d0 {
>                                                 compatible = "dallas,ds3231";
> -                                               reg = <0xd0>;
> +                                               reg = <0x800000d0>;
>                                         };
>                                         si5338a@e2 {
>                                                 // SiLabs clock generator
> -                                               reg =<0xe2>;
> +                                               reg =<0x800000e2>;
>                                         };
>
>                                         idt@d6 {
>                                                 // IDT 9DBV0641 clock buffer
> -                                               reg = <0xd6>;
> +                                               reg = <0x800000d6>;
>                                         };
>
>                                         tpm@a3 {
> -                                               reg = <0xa3>;
> +                                               reg = <0x800000a3>;
>                                         };
>                                 };
>                                 i2c12: i2c-bus@440 {
> --
> 2.8.2
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
