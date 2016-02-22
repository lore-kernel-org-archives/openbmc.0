Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x234.google.com (mail-ob0-x234.google.com
 [IPv6:2607:f8b0:4003:c01::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 13D031A0609
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 11:58:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=cL7qQ9Ld; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=IGEArXBn; 
 dkim-atps=neutral
Received: by mail-ob0-x234.google.com with SMTP id xk3so154324155obc.2
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 16:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=jkDfQ/901E9T4mQxtdO1L+MEUb3FfnJcfHqWw0du/0M=;
 b=cL7qQ9LdTOARkIge+yh0tBsSc+KTaMzgBrRG7KNQkHDpr0dBYUxvgbqVyykUD778Ya
 SgphcJTfpPJiE4cltfiZzC7/EvJ4V3XE6GwaIeHbMF+qVmXEXH3lOcBCAUn9EU4o6mml
 W/gPQHpUyKSqhgEku2V1VoACsGzjeJMiPNIrRFiULT4T3fvCn8R4V3mp/+cpEWQxDCIm
 yRtBbSR27FhF/O2/pGwwhLUk8QT8rBPH15elajQ6AUBwNSne/ReyKadYpfFgXHouZxgw
 UCL48KFaTb0gpkY4itnpT+/idVPQNn48Pe/istDOxTrUclngD+YbHXdXFkLQhnEgFGpC
 AuhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=jkDfQ/901E9T4mQxtdO1L+MEUb3FfnJcfHqWw0du/0M=;
 b=IGEArXBnRrkGq9M+RS1Qm7/fw04WxTcrWltPs5C/d7HuN0kmNvPX8oEkUsp5T+Wb4+
 4Qi2M+TI71d722vDsn7C1+pUyaiHOQXcXfE2a8WPvuui7Wex4KG8ClepGk3M0p1WJ/LJ
 10ONaizi+I2V6r8kvl0reu1IRg5bbmmOA5kb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=jkDfQ/901E9T4mQxtdO1L+MEUb3FfnJcfHqWw0du/0M=;
 b=MqfUYm8OaJ37YIKTRLJ31QlCSWJlP2B0lnCiW7tTvf8R8S0LrS30y2T1QHxKRLvV1q
 19i+xs/QZZ9NAZS8jrxbEARRQLUGtystvSyelmbYud8qx+rVLCvta/fIptwnOJwiFbHb
 VmY/AXnp9M1t6gmLHBnz4NPg7FuLkOuXfjNyPW8kRfk6eWaI71F4ImOfdTASGZsmr8Ti
 OZxxrehpjVkBLPHvxNGTa1Rso+bAa2rvWZVXCi3XjxHUBZ5MwvLp1kM6A16Lp1SC1dM6
 uYCYYp+1OifxjhTMShHkzG69uJEXcofSdgtMKz9+XjUOSzSV9h8IMy/9SJO7Qh9N0/r3
 /tzw==
X-Gm-Message-State: AG10YOTn8lCdZ7gcllL3BnUDDZFxZprYfgeMw8UzoRCmnPgTFUjAxg8gI0aQT+UpNJBL3oeizb0ECX6C5Bv7FA==
X-Received: by 10.182.92.234 with SMTP id cp10mr20594505obb.79.1456102681189; 
 Sun, 21 Feb 2016 16:58:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Sun, 21 Feb 2016 16:57:41 -0800 (PST)
In-Reply-To: <1455909066-21813-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455909066-21813-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455909066-21813-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 22 Feb 2016 11:27:41 +1030
X-Google-Sender-Auth: RVgl3yPERjbOy6ISAf5XuJqa--4
Message-ID: <CACPK8Xc9bh32KzZ9ovFncnuKDz_=esr0R7KZjc3Pj_Jpj7yJYw@mail.gmail.com>
Subject: Re: [PATCH u-boot] Move UART setup outside DRAM init
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Norman James <nkskjames@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2016 00:58:04 -0000

Hey Norm,

On Sat, Feb 20, 2016 at 5:41 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Norman James <njames@us.ibm.com>
>
> Signed-off-by: Norman James <nkskjames@gmail.com>

We need a commit message here explaining why this change is being
made. Is there a bug you can reference?

Cheers,

Joel


> ---
>  board/aspeed/ast2400/platform.S | 81 +++++++++++++++++++++--------------------
>  1 file changed, 42 insertions(+), 39 deletions(-)
>
> diff --git a/board/aspeed/ast2400/platform.S b/board/aspeed/ast2400/platform.S
> index dd94da0..5e048a5 100644
> --- a/board/aspeed/ast2400/platform.S
> +++ b/board/aspeed/ast2400/platform.S
> @@ -184,6 +184,48 @@ LPC_Patch_E:
>
>  .globl lowlevel_init
>  lowlevel_init:
> +    /* setup UART */
> +    ldr r0, =CONFIG_ASPEED_COM_LCR
> +    mov r1, #0x83
> +    str r1, [r0]
> +
> +    ldr r0, =0x1e6e202c
> +    ldr r1, =0x00000010
> +    str r1, [r0]
> +
> +    ldr r2, [r0]
> +    mov r2, r2, lsr #12
> +    tst r2, #0x01
> +    ldr r0, =CONFIG_ASPEED_COM
> +#if CONFIG_BAUDRATE == 115200
> +    moveq r1, #0x0D                              @ Baudrate 115200
> +    movne r1, #0x01                              @ Baudrate 115200, div13
> +#endif
> +#if CONFIG_BAUDRATE == 57600
> +    moveq r1, #0x1A                              @ Baudrate 57600
> +    movne r1, #0x02                              @ Baudrate 57600, div13
> +#endif
> +#if CONFIG_BAUDRATE == 38400
> +    moveq r1, #0x27                              @ Baudrate 38400
> +    movne r1, #0x03                              @ Baudrate 38400 , div13
> +#endif
> +#if CONFIG_BAUDRATE == 9600
> +    moveq r1, #0x9c                              @ Baudrate 9600
> +    movne r1, #0x0C                              @ Baudrate 9600 , div13
> +#endif
> +    str r1, [r0]
> +
> +    ldr r0, =CONFIG_ASPEED_COM_IER
> +    mov r1, #0x00
> +    str r1, [r0]
> +
> +    ldr r0, =CONFIG_ASPEED_COM_LCR
> +    mov r1, #0x03
> +    str r1, [r0]
> +
> +    ldr r0, =CONFIG_ASPEED_COM_IIR
> +    mov r1, #0x07
> +    str r1, [r0]
>
>  init_dram:
>      /* save lr */
> @@ -338,45 +380,6 @@ set_MPLL:
>      ldr r1, =0xFFFF0000                          @ enable UART3 and UART4
>      str r1, [r0]
>
> -    ldr r0, =CONFIG_ASPEED_COM_LCR
> -    mov r1, #0x83
> -    str r1, [r0]
> -
> -    ldr r0, =0x1e6e202c
> -    ldr r2, [r0]
> -    mov r2, r2, lsr #12
> -    tst r2, #0x01
> -    ldr r0, =CONFIG_ASPEED_COM
> -#if CONFIG_BAUDRATE == 115200
> -    moveq r1, #0x0D                              @ Baudrate 115200
> -    movne r1, #0x01                              @ Baudrate 115200, div13
> -#endif
> -#if CONFIG_BAUDRATE == 57600
> -    moveq r1, #0x1A                              @ Baudrate 57600
> -    movne r1, #0x02                              @ Baudrate 57600, div13
> -#endif
> -#if CONFIG_BAUDRATE == 38400
> -    moveq r1, #0x27                              @ Baudrate 38400
> -    movne r1, #0x03                              @ Baudrate 38400 , div13
> -#endif
> -#if CONFIG_BAUDRATE == 9600
> -    moveq r1, #0x9c                              @ Baudrate 9600
> -    movne r1, #0x0C                              @ Baudrate 9600 , div13
> -#endif
> -    str r1, [r0]
> -
> -    ldr r0, =CONFIG_ASPEED_COM_IER
> -    mov r1, #0x00
> -    str r1, [r0]
> -
> -    ldr r0, =CONFIG_ASPEED_COM_LCR
> -    mov r1, #0x03
> -    str r1, [r0]
> -
> -    ldr r0, =CONFIG_ASPEED_COM_IIR
> -    mov r1, #0x07
> -    str r1, [r0]
> -
>      ldr r0, =CONFIG_ASPEED_COM
>      mov r1, #0x0D                                @ '\r'
>      str r1, [r0]
> --
> 2.7.1
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
