Return-Path: <sjg@google.com>
Received: from mail-oi0-x236.google.com (mail-oi0-x236.google.com
 [IPv6:2607:f8b0:4003:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP72g0LXxzDvsj
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 03:24:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OVX5CiOy"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="nV/KLQkt";
 dkim-atps=neutral
Received: by mail-oi0-x236.google.com with SMTP id y198so20683042oia.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 08:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Q1cKStBK5V3OLxQfX+cvbnx+aJQI+oq+U2R+wenBdBI=;
 b=OVX5CiOy5K8gOEwx2NQIFlavFLQQKcMCW7P39HQCt4R5x7GAK0yudX5O0eVf6brDn8
 VCNWI54UYT8QHaDg0Fmx1r6Hb6ujM1lnn1lyY1QmK4RklPAhfTG7DFRM4g9HUnWsBHPO
 5ZhuUbgjoe0zHSQ1qaPIHIwWCeTkTm/KRIxxs9edfm/4CfCfpcUrm5e3wuPQ9i2dWf9R
 Kj6Y4XRk7MJfujmi/9ZXPhzoh3S6y0pSdYrPlVjR0cUaFHY4/5xhHtwun5DnPd028NYt
 2dSyM7r2YxKs6KbQThZ4aTii87LgPeuNCaQHE5C+pb2/2KUIAEmD1wKd+CaTzeocbDNG
 8OzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Q1cKStBK5V3OLxQfX+cvbnx+aJQI+oq+U2R+wenBdBI=;
 b=nV/KLQktMP9BqRdGaAyfoFN6EpfGzt5G3TrkSDpaU7/d0Tkjxodi3/vLsMwC1aVgPh
 /fUVf2SD95OpnqXXcScrX+HyX8pgJILddT2rjEeim8c2HW+ql5IARmk7XVXX+HRyzSoH
 ZJNxOZVx6ufT2K2iRt0DVHZbA8rmzSzVn9DJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Q1cKStBK5V3OLxQfX+cvbnx+aJQI+oq+U2R+wenBdBI=;
 b=KVx8m6Htyvupwgs8ga2tgeQxNVkcAcM0aQdAPVsfYJ9mxmCgOKQPbQLfo2pfTI4d0n
 +fzrQYYo9tRr2uNuKyRHu2gxl8oH3XJfNDZfMnbsg2aQS1OsHUgEPv/PVVnLdzdL9VHY
 xHZH9NBQDY1E7SuGyD14eJRynZL+HSVOjB+HyzUOcNO65UkVDbQgp+loa+4qrgZzNsVs
 I4mOTL9iQ03+7xNorkuPOTWkCuVAvrj+4AhITspFFMImPaVAJUnXYB3TDMeuaRBzKqRX
 HCPjbvgZCwgk17+8sOKBIj7+tMJ2COaNLc6h2dVh7z+Ax8BLwrUD0kh1JQB1bj1bQgBp
 GX2A==
X-Gm-Message-State: AKaTC03q0WK/oAOmJdhc5r/mE/Oyg9AN6oA/sG3THaaUCOlyZY1VIpaBjNJWqQNOEaAU7Rr3WCznTCKHpsFMWiQ/
X-Received: by 10.202.177.65 with SMTP id a62mr1985051oif.52.1479918264765;
 Wed, 23 Nov 2016 08:24:24 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Wed, 23 Nov 2016 08:24:04 -0800 (PST)
In-Reply-To: <CAPnjgZ3=TwFGTHcYrBYWk9yoQ+OCb6U26HnCZnbnBazfKz8DVw@mail.gmail.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479858976-139210-4-git-send-email-maxims@google.com>
 <CAPnjgZ3=TwFGTHcYrBYWk9yoQ+OCb6U26HnCZnbnBazfKz8DVw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 23 Nov 2016 09:24:04 -0700
X-Google-Sender-Auth: EO4UtVepQoYmbMlsCckcHXP07t4
Message-ID: <CAPnjgZ1DJJHt7AdoKX=-y-8BmLqjkrs5j8_o9Nu19yUZJo69wg@mail.gmail.com>
Subject: Re: [PATCH u-boot 3/5] aspeed: Added function to calculate APB Clock
 frequency.
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 23 Nov 2016 16:24:27 -0000

[resend from correct address]

On 23 November 2016 at 09:13, Simon Glass <sjg@google.com> wrote:
> Hi Maxim,
>
> On 22 November 2016 at 16:56,  <maxims@google.com> wrote:
>> From: Maxim Sloyko <maxims@google.com>
>>
>
> For the subject, 'Add' rather than 'Added' (we use present tense)
>
>> This is needed by I2C driver.
>>
>> Signed-off-by: Maxim Sloyko <maxims@google.com>
>> ---
>>  arch/arm/include/asm/arch-aspeed/ast_scu.h |  1 +
>>  arch/arm/mach-aspeed/ast-scu.c             | 11 +++++++++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
>> index d248416..eb5aaa2 100644
>> --- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
>> +++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
>> @@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(void);
>>  extern u32 ast_get_clk_source(void);
>>  extern u32 ast_get_h_pll_clk(void);
>>  extern u32 ast_get_ahbclk(void);
>> +extern u32 ast_get_apbclk(void);
>
> Please add a comment as to what this does and what it returns.
>
>>
>>  extern u32 ast_scu_get_vga_memsize(void);
>>
>> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
>> index 280c421..e00dbe2 100644
>> --- a/arch/arm/mach-aspeed/ast-scu.c
>> +++ b/arch/arm/mach-aspeed/ast-scu.c
>> @@ -318,6 +318,17 @@ u32 ast_get_ahbclk(void)
>>
>>  #endif /* AST_SOC_G5 */
>>
>> +u32 ast_get_apbclk(void)
>> +{
>> +       u32 h_pll = ast_get_h_pll_clk();
>
> Can this be ulong, or is there a reason it has to be exactly 32 bits?
>
> blank line here (between declarations and code)
>
>> +       /* The formula for converting the bit pattern to divisor is
>
> /*
>  * The formula...
>  * ...
>  */
>
>> +        * (4 + 4 * DIV), according to datasheet
>> +        */
>> +       u32 apb_div = 4 + 4 * SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
>> +       return h_pll / apb_div;
>> +}
>> +
>> +
>>  void ast_scu_show_system_info(void)
>>  {
>>
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>
> Regards,
> Simon
