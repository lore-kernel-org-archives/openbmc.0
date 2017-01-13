Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0GCS35kMzDqV6
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 19:35:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FtvIFzD2"; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id r136so3227044vke.1
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 00:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=cUBoAa+mZtHRjTj4FjRChw7Wo6srsUbEXYg0grzMaww=;
 b=FtvIFzD2rx6mwK3Q7gQjWQlW8O2NI++c3jJsOodbSOdditNt/c6GvZIxl+7hsK/DtG
 +j5f5LAhUOL7vZvmGeIuGgJvEUN46gTkyy66pRlEjlwgV6qYE+WImXCGH8je2eDMLcZX
 JXcXpgu0dW+sUfgzy4JUrTPA7SDZKQm+DKmWglUVc5Pc93sSyn1nD2VGpeORLURMP0Fc
 yvwocdU87UzhulTiQGf+7zcYTNSVFA/u8z3qqJLB5MySfZK3NWWtD1bZghCeuVkzm8QJ
 5Tj+iHdNj4InRGAXffg5+zKn1JXq0h4UsGPupV5AdJOH3zTJSI1maJ6ND8SFhXKkskXs
 ekig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=cUBoAa+mZtHRjTj4FjRChw7Wo6srsUbEXYg0grzMaww=;
 b=MuEoEuwGoEwXaatsN0cbfO0D/tPi8bE9HFkAgKggL4cJa4UNVEX5E4l/KxJWMc0q6Q
 EktNCD00XVDK9nT19GhdACchBLtPixtmUc1EglxEyRBNYlQUdlShPIRbXvh01sCCCiMy
 vyz8B7KREZdrls0UlnMJ152fibLd2HvpWCVLAQHKjAFqYi0WOGV17tJQmHxw8bNrrQga
 bqTCEpfGLOMA9UlGxxXKprU6R5K6QC/0xPW/Zw2BodqTylGAbpNBEsfguMT81+FGIf/i
 0Cbm6PHiUDAv7wB0U6lSofxbmRONzot/LBi3Jm+aqoYvQsL5zpwBa+y3bVaozr689BIH
 uagA==
X-Gm-Message-State: AIkVDXJ9fQw8YnUjhHUJiwu7LO3TJsC6pwCPlulsxyEmZVZnWCuJbCtE4EzUObujrjs2jYDvE/3BIezQGIFdFA==
X-Received: by 10.31.49.216 with SMTP id x207mr8982679vkx.82.1484296497851;
 Fri, 13 Jan 2017 00:34:57 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.73 with HTTP; Fri, 13 Jan 2017 00:34:37 -0800 (PST)
In-Reply-To: <20170110225555.117814-2-rlippert@google.com>
References: <20170110225555.117814-1-rlippert@google.com>
 <20170110225555.117814-2-rlippert@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 13 Jan 2017 19:34:37 +1100
X-Google-Sender-Auth: qEw4cuxlfGMNAbWeDbvdRdDRMwY
Message-ID: <CACPK8Xcab_Qhm0KLMgM8MO_gB-DXzsuFtwyp61D-y0HFywO5yQ@mail.gmail.com>
Subject: Re: [PATCH linux v2 1/3] mtd: spi-nor: add SPI_NOR_DUAL_READ to
 mx66l51235l
To: Robert Lippert <roblip@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
X-List-Received-Date: Fri, 13 Jan 2017 08:35:01 -0000

Hi Rob,

On Wed, Jan 11, 2017 at 9:55 AM, Robert Lippert <roblip@gmail.com> wrote:
> Signed-off-by: Robert Lippert <rlippert@google.com>

Feel free add Cedric's Reviewed-by to this patch in subsequent
versions when there are no changes.

I added it for you and applied to dev-4.7 as 6860079bb7a6.

Cheers,

Joel

> ---
>
> Changes in v2: None
>
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index a68073afe8a8..e508c25a47f7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -857,7 +857,7 @@ static const struct flash_info spi_nor_ids[] = {
>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>         { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>         { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -       { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
> +       { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_QUAD_READ) },
>         { "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>
> --
> 2.11.0.390.gc69c2f50cf-goog
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
