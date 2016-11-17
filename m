Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK87t2FwmzDvrN
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 16:00:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="z70almru"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id n68so12463292itn.3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 21:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eixBYqiDniU+Xy0niCS93CadiaRJX40KAx2uuyT8zCU=;
 b=z70almruDHo/scEencejDmMdotSPRvpRCZwIFYnYY4VGUFHdCXygT7GcNp/y/+lpHR
 Q4rxmgIHGUhuaoYv0BnnBZSk2/kWglm4iw/qjJgmAKkflSP+SOqf7yLDCNY/scdMdlZ2
 ehlkA7CQa59PUHXSwcqhQPEQ6dGm6s/8ft01qqyqNOZx3FbBZorEhukAW5sfVrwmI+X7
 ozVnvV0jDzDqqxmFnMHuVm5hQhzZ4jpGep5DtTmB79CIW69Xs2WeVBEWxfTEXtf9rFEA
 BFODMOYztkJpKU5supAQtiJ5r6ewXSSF6p3esyrSS7mFTh4aZBX7XObLVxBl9GeKJ5mX
 UR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eixBYqiDniU+Xy0niCS93CadiaRJX40KAx2uuyT8zCU=;
 b=R098YDyjzrE2Z9tTCv7vNClbsMKhq7z+15ld3OeGGr/5CaG0uusNpRfUSYcxAEXrYJ
 lcWxmeVVYOid1gj/xZ5n9y8c0zWxRxY0QCrTbpMCdL/j8Yw48FHycUmZNKb0kX7+98h3
 CPZpaO3AAFypWRp9cWgcK3EMKKVchIZHvdzq8WrFbY6C0qrMhKrSmixbkNuatvxavSad
 MH72Lq4gpQYHAmvS/Xad0id/EcIb4xj3yyAQTaIqloQbONE5zB4xV/SIoPkMVSN6gzCn
 6B5y6xssF1g9Cfxcwof8+pYNE0hELaSp8UyMzFVYKzc250H53lmYLIr36qUsxgE9SrMP
 ACXA==
X-Gm-Message-State: ABUngveUi6A4YMqGAYoZsCCXL/Lg0I/bklaNZOV12vU9MTssXrfMNcwLZe8VLVemQVMNDVYgDqXYyPzARmXMAQ==
X-Received: by 10.157.36.36 with SMTP id p33mr485162ota.8.1479358808223; Wed,
 16 Nov 2016 21:00:08 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 16 Nov 2016 20:59:47 -0800 (PST)
In-Reply-To: <1479338955-5248-2-git-send-email-xow@google.com>
References: <1479338955-5248-1-git-send-email-xow@google.com>
 <1479338955-5248-2-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Nov 2016 15:29:47 +1030
X-Google-Sender-Auth: 8epBl1LFRkqYjylQTYTIpc003p0
Message-ID: <CACPK8XeWnmGJBYSMrmoE5E0oFJqE9ivp-GG2iCcf7ZDw+qp_ZA@mail.gmail.com>
Subject: Re: [PATCH linux 2/2] ARM: dts: aspeed: zaius: Add I2C master
 selector and hotswap controller
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
X-List-Received-Date: Thu, 17 Nov 2016 05:00:10 -0000

Hi Xo,

On Thu, Nov 17, 2016 at 9:59 AM, Xo Wang <xow@google.com> wrote:
> Add device-tree bindings to instantiate the PCA9541A I2C master
> selector. This driver allows mastering downstream devices after sending
> an arbitration request to the PCA9541A. Downstream devices go into the
> 'i2c-arb' child node.

I took a look at the bindings document for i2c-mux[1] and it suggests
something different.

Is there a reason why you didn't follow what it says?

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-mux.txt

Cheers,

Joel


>
> Instantiate the HWMON client driver for the TI LM5066I hotswap
> controller present on Zaius EVT2 downstream of the master selector.
>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 3d997d9..136eb1d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -210,8 +210,23 @@
>  &i2c7 {
>         status = "okay";
>
> -       /* MUX PCA9541A (other master: CPU0 PCIe 1)
> -        *   ADM1272 PMBUS @10h
> +       pca9541a@70 {
> +               compatible = "nxp,pca9541";
> +               reg = <0x70>;
> +
> +               i2c-arb {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       hotswap@10 {
> +                               compatible = "ti,lm5066";
> +                               reg = <0x10>;
> +                       };
> +               };
> +       };
> +
> +       /* Master selector PCA9541A @70h (other master: CPU0)
> +        *   LM5066I PMBUS @10h
>          */
>         /* 12V SMPS Q54SH12050NNDH @61h */
>         /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
