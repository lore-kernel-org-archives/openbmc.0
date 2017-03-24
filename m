Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqBPr0rhFzDqZJ
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 16:12:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bpS7APS2"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id d191so447024ywe.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 22:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=wtY2o363vFIMNcw3BzO1JrWQgaG5TIhdT6JqLwOP0P0=;
 b=bpS7APS2ZKkzGNjDvPE3fSAuQsWCJbdnjx5cqgQ3BL2EgvR8FcbIFgrZDaCtqM8XRk
 gijUP9oYp9XtJ0K3SNOw5zj5k8HUPZ/ET216F5O+5ScTRgGkKN5zwObgxn2ZXgpid1wt
 EhgdZkLMLY9RtWQo7ENgXfOgsAaUwGfLX3SRqeNpDzVpiC9s+gKxFZzMbxAS1JPWnoTd
 B3TKy7PzIupz76SSQyBXibYuucX2lbuDTLQIPZlaaEOecoE71iulNcxej6QtkTI7QNx4
 Q/TMwljO3QuPnfWAVXPqWwhEEF+wZ2NG0eOslJP1Qb/P5IYuvqLAzifwWwvq9iIq4Tcs
 P5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=wtY2o363vFIMNcw3BzO1JrWQgaG5TIhdT6JqLwOP0P0=;
 b=MnHHELjaIkj/bGNGI5P8tEgSQmNbkDrtmXIV+2QJYPmJkY3zK/oboAgJr4zkXQxyqv
 j/n0eW4h2eF1vqQnj4473tdb5vMmSDXTiVPDqG85B0KbJUwbH9U7/DBHUmmLsWa9GabY
 qP7aACqKfnkHpzc+6eA6iI1hrF0ZmrxZesittPhpG3yNXzCaaAYlVGwdlnw2gQYDCMc2
 jkN4F5cRmd7MPe6OEhot2sS9OrQ/p1D7kpKOl5vTyieLpTqdEM7ryRFZGwU7jd6h9zZP
 G2wWiko/HABUfvOOhBmXAzAcEpiLG8UtOtoMazvqKRvnjKnz1tftfIHbqu39ZqJdIF3K
 /EAw==
X-Gm-Message-State: AFeK/H3j7pFxqWK6XDz/1JIxKMNOuyC57sXnr1UMkictJjNzGuFpnqUyq5ZYD8ULi9m4sJt0u+mo2Mw9AO1B4w==
X-Received: by 10.129.101.195 with SMTP id z186mr4330544ywb.11.1490332366050; 
 Thu, 23 Mar 2017 22:12:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Thu, 23 Mar 2017 22:12:25 -0700 (PDT)
In-Reply-To: <1490258557-16803-3-git-send-email-clg@kaod.org>
References: <1490258557-16803-1-git-send-email-clg@kaod.org>
 <1490258557-16803-3-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Mar 2017 15:42:25 +1030
X-Google-Sender-Auth: arzew73usgMb5BVMytm5wDRy6Ac
Message-ID: <CACPK8Xc16C1JpCj1jhzB6YwKzM8RC+xHJaG_9pS=FKyOx59rbw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 2/3] mtd: spi-nor: aspeed: fix physical
 base address of chip
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 24 Mar 2017 05:12:48 -0000

On Thu, Mar 23, 2017 at 7:12 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> The phys_base address is used to trigger DMAs on a chip and to address
> the correct CS, it should take into account the offset of the chip in
> the AHB bus window.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index d5d8b2d6e06b..b3c8cfe29765 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -693,7 +693,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_s=
mc_chip *chip,
>                 return -EINVAL;
>         }
>
> -       chip->phys_base =3D res->start;
> +       chip->phys_base =3D res->start + (chip->ahb_base - controller->ah=
b_base);
>
>         /*
>          * Get value of the inherited control register. U-Boot usually
> --
> 2.7.4
>
