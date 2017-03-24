Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq9TN41dHzDq7d
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 15:30:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y7zyLP9+"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id h11so382944ywa.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 21:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NK5cclWxgo3K+K0/Ni92WvUV6i7URPMpBH6/M8aSnK8=;
 b=Y7zyLP9+m+3i1cWJRsJyRpZ+mUXuMcNBO1aDq0g50Zo+ZBmF6kVcJQTTPR9tAEJp1L
 2Q5AK0RjTDjoAeHyRUN3uv3VqqX2SLjbG8uv1oqxBZr2D9dl0SwQRoP/WbMhRzRtf+ar
 rqZ52TpQGIQZKsUQ1Nlekp3vHcLgFI/D9tVNZcrybryV0dGsenT+Qnvex2AetCwO0PSk
 MNqkra165n2/j58zTVCNCWxTTPcPFWqfntL4pPxALO0wn1TN4XKuglGAv/wAZiOsyxz2
 DP4+8FxPe7s+aNgSBWQiWzOXFSo1uBUM2qxLjdkTQIzxL3IgbGvbKkPxpCdlKqFeJzQ0
 r25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NK5cclWxgo3K+K0/Ni92WvUV6i7URPMpBH6/M8aSnK8=;
 b=E8eXHpTZRWsE442UAgEf4zk5fzDHiE/VVJbBZHMRU9DotMwmWtK1/LUeMe8/6NvTFF
 16E4lT30Ons3N10XWMOObRjQ5ywOlABdvqH0ArjEDD+Nv/YzkP+76J59ZmpbPmWKblF5
 BtPonuyWuvBpFJWxKpHlSQTr/xwfrvDdgbpXSkIPFci/3vlQPLWkC6X0sfTN8G/0HxI7
 EM5J5NT3h/Q72Tm3GN476eVRLV4nhFM/FWBNn1yVezkR0QMgzebMaQx5xZUfe6uHJlFK
 /n0OwCS5iR3WBD8GFbxehWjN23xnkCba7XXAaZHRXy4do56dRV8swa5nPeRZmRObb8cK
 i1Yg==
X-Gm-Message-State: AFeK/H3O5YF/YMcBmRqQyQOYVEaAMs7Km/ZBkcilwNEHNubCWr51OKLKwh5A7j8n1OHLPGB7S0Wru8VWZqiT/w==
X-Received: by 10.129.101.195 with SMTP id z186mr4260625ywb.11.1490329846352; 
 Thu, 23 Mar 2017 21:30:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Thu, 23 Mar 2017 21:30:25 -0700 (PDT)
In-Reply-To: <1490251442-6538-1-git-send-email-mine260309@gmail.com>
References: <1490251442-6538-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Mar 2017 15:00:25 +1030
X-Google-Sender-Auth: ttG2QeetGTFi5_BmWfEdF-SZW44
Message-ID: <CACPK8XfdnAsAGSxO7Ub+PM9sh-t5vDG=nFpC3ojmhsR1quiNmg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/2] arm: aspeed: romulus: Disable LPC reset
 for UART1
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Fri, 24 Mar 2017 04:30:49 -0000

On Thu, Mar 23, 2017 at 5:14 PM, Lei YU <mine260309@gmail.com> wrote:
> This follows Zaius's fix, that clear the LPC block control bit that
> enables LPCRST# as a reset source for UART1, making UART1
> immediately useful in that it won't discard bytes.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

It's not ideal to be adding more hacks to the board file. We need to
add a driver for doing this reset.

I have applied the patch to dev-4.7 so your system can work now.

Cheers,

Joel

> ---
>  arch/arm/mach-aspeed/aspeed.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 7ac006a..a7b03a0 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -220,6 +220,7 @@ static void __init do_witherspoon_setup(void)
>
>  static void __init do_romulus_setup(void)
>  {
> +       unsigned long reg;
>         do_common_setup();
>
>         /* Set SPI1 CE1 decoding window to 0x34000000 */
> @@ -227,6 +228,14 @@ static void __init do_romulus_setup(void)
>
>         /* Set SPI1 CE0 decoding window to 0x30000000 */
>         writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
> +
> +    /* Disable default behavior of UART1 being held in reset by LPCRST#.
> +     * By releasing UART1 from being controlled by LPC reset, it becomes
> +     * immediately available regardless of the host being up.
> +     */
> +    reg = readl(AST_IO(AST_BASE_LPC | 0x98));
> +    /* Clear "Enable UART1 reset source from LPC" */
> +    writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>  }
>
>  #define SCU_PASSWORD   0x1688A8A8
> --
> 1.9.1
>
