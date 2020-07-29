Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=btiTq8j5; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH96t5R9vzDqkZ
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:41:42 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id bo3so3444610ejb.11
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 16:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=adwxylVd7yVbFX9e7b2nhbvGhQyag2Gk0BgfDdJh+Ko=;
 b=btiTq8j5kdZ7gOKkZoE1Km7EwT5+wnA48VLIzwjQScVSHv1eHxY6cmNd+Y0RkWdi5e
 7xKLdDoM/oC9wFscHmD7yioFpreU78XGTc9lE+R30Eg9ZSBeLf7zO5FW58bXd1971zwU
 RJZGrSk3iUPhRfWCLpU0NMTTt4l5o6VJ19evA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=adwxylVd7yVbFX9e7b2nhbvGhQyag2Gk0BgfDdJh+Ko=;
 b=ZBt9yGVsy0i5PrIEetDsb8z9ClEjJh1zbXYr4SvgL3M21rcvoth1dA07++eWJ+ZHK5
 SpoPlTqcm8agadIiA8BQBsARQ8iD1Wv7w5LIDErdTh3jxCYgQQt2B2iB9PO6N9/3dup+
 LxY5J8B5hI3LLh2GjEn5twa++fH+CWA4HryssBYM/MWx71oQKUC2IwlwduEscU70QxDE
 E5Hrd/OYt1urSgZhGHgg+RuiXjWfnakvXNAucks03QbdZjoDXCk2oEjrqBKmzbHT8moA
 m4xC2AL0yGtgf9NBcrtuXun7YKGaccF8mO7p5iJ5yTICYqtNolPGmUObf2Qbqg50lxjc
 73Kw==
X-Gm-Message-State: AOAM530fcj8mD8oMFOWfaKavo6cfUt8w+JJk+Z5fqjddLW1qmPEXv/dB
 pGmFEc4MYj9MGafNaGXOB/IRfTrI9fMKZQtozvLrFCUpXII=
X-Google-Smtp-Source: ABdhPJx4RlBAgMSP4qvY3MVhtMSoYM6sLfTQ7OCrSjx4IQ8TIjjd11CAPS5d4i1KmroQc0ULVa+eMpjKgF7p7FU173w=
X-Received: by 2002:a17:906:198e:: with SMTP id
 g14mr45582ejd.266.1596066097778; 
 Wed, 29 Jul 2020 16:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200729204528.15157-1-eajames@linux.ibm.com>
 <20200729204528.15157-2-eajames@linux.ibm.com>
In-Reply-To: <20200729204528.15157-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Jul 2020 23:41:25 +0000
Message-ID: <CACPK8Xd+dg=MSpvjim-gWtPbqxJaB5+_t2aBmk9efv1RCsdLOQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 1/6] spi: fsi: Handle 9 to 15 byte transfers
 lengths
To: Eddie James <eajames@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 29 Jul 2020 23:41:43 -0000

On Wed, 29 Jul 2020 at 20:45, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> The trailing <len> - 8 bytes of transfer data in this size range is no
> longer ignored.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Phew, that's subtle :)

Fixes: bbb6b2f9865b ("spi: Add FSI-attached SPI controller driver")
Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/spi/spi-fsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
> index 37a3e0f8e752..8f64af0140e0 100644
> --- a/drivers/spi/spi-fsi.c
> +++ b/drivers/spi/spi-fsi.c
> @@ -258,15 +258,15 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
>         if (loops > 1) {
>                 fsi_spi_sequence_add(seq, SPI_FSI_SEQUENCE_BRANCH(idx));
>
> -               if (rem)
> -                       fsi_spi_sequence_add(seq, rem);
> -
>                 rc = fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG,
>                                        SPI_FSI_COUNTER_CFG_LOOPS(loops - 1));
>                 if (rc)
>                         return rc;
>         }
>
> +       if (rem)
> +               fsi_spi_sequence_add(seq, rem);
> +
>         return 0;
>  }
>
> --
> 2.24.0
>
