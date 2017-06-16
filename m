Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpnyx6XRFzDq88
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 14:51:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GI+xr1ar"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id b63so1272628yba.1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 21:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=IjDvfF0BzPLnpTaflFdXqvor4ABI8QxwD0JHz9xOzX0=;
 b=GI+xr1arzyIxId7AFzuj0ECVjzYRoGm9SAe0Tc38EyRr3nj47iQ6QQ57Dz2F8vbFmA
 merlthWItzZ23kniC7tzvQW76z+49RztaPL+2yG7RsoWEC7yBseHSEPFb2NZLUaPDFFc
 jLyD6JmercULzpez/TPEoub24ju3O1HODvmrZvHrOhd9HaJqcwU7jTNl/fxsZ4HfyM4T
 VG/My+Uq4AnrC7a85bykqPuJDuCPWI+2BHu8q/yc+ZIUwGi5QZ8+YREc6Mh97feEqKqW
 KbvGkZXWStTY3tEXlEAQVQYV6fVEk21xWgaN3jpxfNipRcDHFGP3jdDP8ojGw/gvRf3h
 JXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=IjDvfF0BzPLnpTaflFdXqvor4ABI8QxwD0JHz9xOzX0=;
 b=ERBrhfGbRm/syvfO4dZbsP4Rc2vXaawBk9XBOlepbtMQ6V/kCMfM1ic9hIp4sxioD5
 721+9S7b9uyZtsfzWziarp13E0tTJxUa5bndNnFXdwklyds1o1wiKhFRnGDMCRSAiDMm
 3nnRt0ivmyaJKemaQkK1pPXxvpN+sLMqbRD13DOwHB58+OfXBcKHnmzr13Zn4INdb7Cb
 yKi2BOhS0Qx+KUu4pZvZTkdPR+gxasABUSmwVkTGLBMMv0wmK2P+tXKlB4GCt86rCd47
 b5f/EXAHDk15rxmreRRA/2ERAgl1QfPZ/oKegsP4vd3iPgyOy9XdyQ53/5iwVLVEzVQY
 fc1g==
X-Gm-Message-State: AKS2vOwMh06fkBl+Cxon7mb4GQLt7Bjb7c6nJr+qHERd3bccifK4O0Lx
 u+4kYnn+v9SFAGecE4S70ARLP6AhCA==
X-Received: by 10.37.177.158 with SMTP id h30mr6890939ybj.214.1497588710523;
 Thu, 15 Jun 2017 21:51:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 21:51:30 -0700 (PDT)
In-Reply-To: <20170613221019.100175-1-venture@google.com>
References: <20170613221019.100175-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 14:21:30 +0930
X-Google-Sender-Auth: OZYirw4UIzfDyMcodJNlb1_tRSY
Message-ID: <CACPK8Xe_MT6Ssq3XPF1EO-pzS89Ja-_PHPOtne7vttn7TVzaHg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 4/4] ARM: dts: aspeed: quanta-q71l: PDB
 FRU and mux on the PDB in front of the PSUs.
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Fri, 16 Jun 2017 04:51:54 -0000

Hi Patrick,

On Wed, Jun 14, 2017 at 7:40 AM, Patrick Venture <venture@google.com> wrote:
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 20 +++++++++++++++++++-

I had some issues with conflicts between the 4 patch series and the
two patches you'd sent before then. So merged all of your device tree
changes for the Q71L as one patch.

Next time you're sending changes that may conflict, put them all in
the same series. It's okay to send a v2 of the series with additional
patches added.

Also, in the case of your patch #4 where you needed to make a fix,
it's convention to re-send the entire series. No worries this time
though, I got it sorted in the end.

I noticed we did not have the dts added to the Makefile, so it was not
building. I fixed that too. Please take a look a the tree and make
sure all of the device tree nodes are in there as you expect them to
be.

Cheers,

Joel

>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 4b5047b5d592..2b01c5bcc88b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -145,7 +145,7 @@
>          *    SSD 1,
>          *    SSD 2
>          */
> -       i2cswitch@77 {
> +       i2c-switch@77 {
>                 compatible = "pca9548";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> @@ -177,6 +177,24 @@
>
>  &i2c7 {
>         status = "okay";
> +
> +       /* 0: PSU4
> +        *    PSU1
> +        *    PSU3
> +        *    PSU2
> +        */
> +       i2c-switch@70 {
> +               compatible = "pca9546";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +       };
> +
> +       /* PDB FRU */
> +       eeprom@52 {
> +               compatible = "atmel,24c64";
> +               reg = <0x52>;
> +       };
>  };
>
>  &i2c8 {
> --
> 2.13.1.518.g3df882009-goog
>
