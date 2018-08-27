Return-Path: <marek.vasut@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:400c:c09::241; helo=mail-wm0-x241.google.com;
 envelope-from=marek.vasut@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RkU4zY56"; 
 dkim-atps=neutral
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zStv279qzDqSL
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 20:34:43 +1000 (AEST)
Received: by mail-wm0-x241.google.com with SMTP id j192-v6so7829229wmj.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=utdTPFuiWVrtHeNHpYg2grd6fPlVbZEmUqNTSG8K3Vk=;
 b=RkU4zY5601gPrT64fW2r94Qnew59wgD1E2hEbZT+MH/FYS/Ip9Rp62DkZEfBHr6S4Z
 D7xEDO0fsqaKm/BJe+9b/YYPqIOkx7jp0pS/+2TlzCJDc213VUW6i4VctYMjbesIHEi0
 1VY7mLm3fcTRgmPtmdnxn1MUtgCFbWV/6b3T9OBuG9bPfGdKsWMVP+8QOxpzIO3hGxMo
 mkHYMmdMnypwDu6QLukIm4DfoVu5xA3joDVXHn/F0wbQuYMwJd0G22JPvwtkgVMcRp8E
 IQVQ0M+9deWEoRS6fyWLSug2VyPLFbtNoQkW3j9H1ZBlot7CRcEisVQTEhQ03GTh3oO5
 UGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=utdTPFuiWVrtHeNHpYg2grd6fPlVbZEmUqNTSG8K3Vk=;
 b=X6wrnWebsIWxKnKJpzKLqeJeJ/bcCndPXZWcWaSTzxDiZAzK7tmhNdQaJahFSQzNBQ
 gUNhOCnL6nrWGxEbufYA6mr64NLOsF6i4PpIw9ZhQD1CiePyJeRdrFhB5S8Lz42p+pQ9
 X626gJVYTLDKIQZ30aU6ZIIPSGOJgiiK7YXG8Iz09Fjib2ItbC8Qn7j6TKHUhRx6S6rT
 91sAc8CvE/7czXg7NSo7NYQrvePAE0eHQK9cv03e13+qbVi8+QOmYItC3wz0sMjZ7DwU
 MN3wNofxeLchLVoeR54FIe2lKy0BuNlby02aU7NdpzCuuOgHMArmWcm0bvqwCyytr/Np
 wr7w==
X-Gm-Message-State: APzg51CEjz8WlP9MLiOHkWKu7gK1HAFwLL/8fPEX/IjsBzGpivmxQqLa
 dhT1LkNpFJbwQy3qnBHVSDc=
X-Google-Smtp-Source: ANB0VdaQ9MxZyH528QL4yDqSC0dWOn+yPSacxAqrPp+AGbLpnyVW39tLMxe5okLnrnOrYkeBFJi6Kg==
X-Received: by 2002:a1c:dcf:: with SMTP id
 198-v6mr5317672wmn.131.1535366080595; 
 Mon, 27 Aug 2018 03:34:40 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
 [86.49.107.50])
 by smtp.gmail.com with ESMTPSA id o19-v6sm13446029wro.50.2018.08.27.03.34.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Aug 2018 03:34:39 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
Date: Mon, 27 Aug 2018 12:33:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Aug 2018 02:51:48 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 10:34:48 -0000

On 08/20/2018 12:26 PM, Alexander Amelkin wrote:
> Currently in spi-nor driver there is a line for mx66l51235l.
> According to Macronix site, there is no such part number. The chip
> detected as such is actually mx66l51235f. Hence, this commit renames
> the chip.

I wonder if this could pose a problem, since this might interfere with
the DT being an ABI. But I guess fixing the name is OK.

> According to the datasheet for mx66l51235f, "The device default is in
> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODES
> makes the code act as if the device was already in 4B mode and didn't
> need the EN4B command. That prevents this chip from functioning on
> systems where the boot loader left the chip in 3B mode (e.g. if the
> chip wasn't used during the boot process).
> 
> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
> mx66l51235f (added previously by commit d342b6a973af).

Could it be there are two variants of the chip, one which supports the
4B opcodes and one which does not ? Wouldn't be the first time I saw
this. If this chip supports the SFDP tables, you can check those.

> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: <linux-mtd@lists.infradead.org>
> Cc: <openbmc@lists.ozlabs.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Fixes: d342b6a973af ("mtd: spi-nor: enable 4B opcodes for mx66l51235l")
> Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f028277..c5ef85e 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1091,7 +1091,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
> 


-- 
Best regards,
Marek Vasut
