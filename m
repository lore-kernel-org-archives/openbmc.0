Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dUV3kqZo"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rX5B1f1TzDqgF
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 13:34:37 +1000 (AEST)
Received: by mail-it0-x242.google.com with SMTP id e14-v6so4559441itf.1
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 20:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3l72yXOYt7KVv9MYU+6U9QNJJumSj9gv1zsRN/iI7yM=;
 b=dUV3kqZoU4dm90YIKkmBU//wZSzX3yTp0YfGeyrqia4AhQGc85EiEtnZQw9SkoU1kT
 qJMW8nibdCEJgwtyaBjQN7QXLvsZFyDGgl8do+A8o0aRdFdwyCMxtL0NhRr9a2LospyQ
 VXesMXbiOGLcF6RjyhX29c2F3/sIZervWuBAq6jQcW0K/fGXQIay5cPKwVEgkDlQFzQA
 sSonRDYLPTqhbVxe0Ow0VMSVzwMVyvpJpFwL82C5XLcTclkpbwNuwjThb2bfKJUNJhCe
 hTxuWkpqLtEfQ7oaUwzKMsWd9BFx11XU77z/1nSTXtGJLVQyC6IR4bA6lASp1VxyRo7p
 dPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3l72yXOYt7KVv9MYU+6U9QNJJumSj9gv1zsRN/iI7yM=;
 b=iDWQNgqe8umr0Q4L6SZI/Yocm7djjtNxnm1JJjeZn+tOs+g7Ao+UCLO2GRSQWFaOaC
 6bJoyPhEO+chELweBj9uhoZwLxf5MkPARBLjGAhwQLDZdzz0oyTkg/exMpyhXlCQInVr
 zivYpjwNutfE5x5mOJD+9XLJbew4zns12tscAs4PmdUJoKZLDaoeNdbNToOfj7Nh6MWS
 QWF1vODZG/CgbE/Ay+OJNAMo3G720HgvyilejaFDh/i1uyzkClXfvINdgb+RLOfmBcMn
 jg02V2wkm3CzxBn/Dx2w1HtgXONKMHLkN64SgdzdUjNs/QYflD9aWBVKDpaoR5DiFdob
 /LlQ==
X-Gm-Message-State: AOUpUlGC/t5ENElGEjOB1dF698H6RiPFWsF+sagoPhEPQ8gQH9/ezXPw
 keVoSVFgYT3HUoZU8HtC8Ii20Tv11+e8qSSQ3OY=
X-Google-Smtp-Source: AA+uWPz35e69o70WxaAnn5sDfgdedDP/G2hx/pqgkkghtxlZF2gagzppDYgxX0LsfhNC7gFcj9hhyjV291T5jHpARAY=
X-Received: by 2002:a24:2b86:: with SMTP id
 h128-v6mr20281290ita.14.1534390474363; 
 Wed, 15 Aug 2018 20:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <03b3c32f-dcfd-54c1-b959-8067893c0758@yadro.com>
In-Reply-To: <03b3c32f-dcfd-54c1-b959-8067893c0758@yadro.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 16 Aug 2018 11:34:16 +0800
Message-ID: <CAARXrtnoc_63EY5rznk=GcdsqwX-3hfjjdXbsm1Z1fR-jdSBsg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/2] mtd: spi-nor: fix options for
 mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 a.soldatov@yadro.com
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 16 Aug 2018 03:34:39 -0000

I think the mail subject should be patch linux dev-4.17, instead of dev-4.7.
But anyway this is better to be submitted to upstream.

Reviewed-by: Lei YU <mine260309@gmail.com>

On Wed, Aug 15, 2018 at 11:14 PM Alexander Amelkin <a.amelkin@yadro.com> wrote:
>
> Currently in driver spi-nor there is a line for mx66l51235l.
> According to Macronix site there is no such part number.
> The chip detected as such is actually mx66l51235f.
>
> According to the datasheet for mx66l51235f,
> "The device default is in 24-bit address mode" (section 9-10).
> Hence we removed SPI_NOR_4B_OPCODES option with this commit.
>
> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5bfa36e..e9f4447 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1068,7 +1068,7 @@ static const struct flash_info spi_nor_ids[] = {
>         { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
>         { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -       { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +       { "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>         { "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
> --
> 2.7.4
>
>
