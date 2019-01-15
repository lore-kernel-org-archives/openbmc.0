Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="a4QJ8kRM"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fRxK1MRhzDqJ1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 10:53:24 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id q8so2732826qke.1
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 15:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pV/EVyrxDVgDptUsvY6YKTL0UtEyJ+yZpvKEE8ukFV4=;
 b=a4QJ8kRMzEgB92POBYAPq45yKszxwn8s5Sd60h9nOm5caNRB/gHuI2mfDXQFSTmRm3
 da8wquKNT5Ltgn+TtX1QEWjC+Iu3LNRpdAqeMUfdqPP3G56m4D26s0iBY25wR0b9Dv2T
 vFajbQANRKVu5SDsCuXmbtABknFVFzUbkCfV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pV/EVyrxDVgDptUsvY6YKTL0UtEyJ+yZpvKEE8ukFV4=;
 b=f7v08gDL91lzBlthm2t5TG0nSDt+OXnCxNw1R6Swln8SvJlAflcl6lN2iC1etZsopb
 00fnbdZfAGIoJTbJqDCI98Y6Zb+tvrBZpNbYWzLU6Qnd//e58Eth5Y/kSLAv0+6jmNoU
 aTWvrhAASnS5ULtHy57XJss5wd3Zbei4seaR1Swa0oqB0YzU0Ms77hi5BCtNBy56QNaU
 vE3NNm+w9LVOlwglOd4rFTR0XhBayYwHDkn2EgUK0hdCWec4zKlzp8cel5fhRGwNI693
 rncwTUFH36idALvnJNw9Y6gLjIBIV//AW/yETc6eNH+1o1gbSQPIj+wfJw+eTjo6a10n
 jICA==
X-Gm-Message-State: AJcUukdsAYJFnvC318ON9mTPftt+yWNgFRcxKaaZ7nQ4bcV5M3QLnGXo
 PgwNGoAYo2pztE59jWdYPLulPASQrcxMJ7RyyVE=
X-Google-Smtp-Source: ALg8bN6+olCYeAJWDufWDpXl6djUZdmCsNn+xXqO1iQoe2QgTibKJjFcuncnQXIywZ/xrVbRKYOwfZcTJABXwYUrWM8=
X-Received: by 2002:a37:bc06:: with SMTP id m6mr4845665qkf.336.1547596402651; 
 Tue, 15 Jan 2019 15:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20190114130710.427600-1-tmaimon77@gmail.com>
 <20190114130710.427600-4-tmaimon77@gmail.com>
In-Reply-To: <20190114130710.427600-4-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Jan 2019 10:53:11 +1100
Message-ID: <CACPK8XeF8MYsUJA7HsQL23mfoGFRQ5rjSTRzrJxhZL23fzRikg@mail.gmail.com>
Subject: Re: [linux dev-4.19 03/15] mtd: spi-nor: add NPCM FIU controller
 driver
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2019 23:53:25 -0000

Hi Tomer,

On Tue, 15 Jan 2019 at 00:07, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton NPCM BMC Flash Interface Unit(FIU) SPI-NOR
> controller driver
>
> The FIU supports single, dual or quad communication interface.
>
> the FIU controller can operate in following modes:
> - User Mode Access(UMA): provides flash access by using an
>   indirect address/data mechanism.
> - direct rd/wr mode: maps the flash memory into the core
>   address space.
> - SPI-X mode: used for an expansion bus to an ASIC or CPLD.
>

> +static int npcm_fiu_uma_read(struct spi_nor *nor, u8 transaction_code,
> +                            u32 address, bool is_address_size, u8 *data,
> +                            u32 data_size)
> +{

> +
> +       regmap_update_bits(host->regmap, NPCM_FIU_UMA_CTS,
> +                          NPCM_FIU_UMA_CTS_DEV_NUM,
> +                          (chip->chipselect <<
> +                           NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
> +       regmap_update_bits(host->regmap, NPCM_FIU_UMA_CMD,
> +                          NPCM_FIU_UMA_CMD_CMD, transaction_code);
> +       regmap_write(host->regmap, NPCM_FIU_UMA_ADDR, address);

I notice this driver uses regmap for register reads and writes. Are
you aware that regmap has a very large overhead for every operation?
It takes a few hundred instructions to do each read/write, where as
readl/writel result in one or two instructions.

I'd strongly recommend implementing your drivers without regmap unless
you are using it to access, for example, a couple of registers that
are shared between drivers.

Cheers,

Joel
