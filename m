Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vjY6h0lWVzDqXc
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 11:55:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nt7jCdMW"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id p77so262861ywg.0
 for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2017 17:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fv9moa5gehlYPO3q6vsFOHIAbIcNBXskDqRbaMiqZgQ=;
 b=nt7jCdMWfGkodBaPSzFUU2oQCBvTlV/UwpCuunRRq/oaIzs3ta0C6KbkeBd5iLqKyD
 +eW+xeBfy//elM1qQxUscW8oSQfWFm5yzypNCUzTe0hQkbYq/+F854OrjitJnph+eoEr
 v6wy3kBMTnGrPwPtELP/gNtbEstuChrV0HRr+mY+LvG5gYouAJyA6VaRUrGyLNyHwUzF
 9vM97TyGp9vay5liYnk1HbNMAjO6u0tG9kgbErQH4pzqBRBLBE0v06Eb/6y/0wmb26IP
 pt+UbUsu4S3bTEXh5797IakjtFp1a8lKaN29NG1tUedK94fqHTFnFFwtwCH0K6SgamM3
 aqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fv9moa5gehlYPO3q6vsFOHIAbIcNBXskDqRbaMiqZgQ=;
 b=JeqDetHmGQMeEQjy6G1Kuo5ROHG05YjpFJWA3yGIFQm6YU7EJQO1lJtCHpulyPF4FB
 f90ZPDkwlk5LmczARCdeNiMLQk2b8PCYfQoZkhS9YmHLibuYAkhXyDyAoI9cWHm0Tnux
 QpXBn0PkQeVkWqu6zge07vx6mXSTolnJcxcWRXRwDFhYzhSphyW8RORR7NaTdpJp9UXl
 SAayWf9H6QTUYUn2EbtdE+n+nrjnzQau2LaEeoRR1J/mVCxATXKYNz/MJhCcO2eTLiYW
 QQEitWSjvOpOOeYlMH3TllRr8C5EJzqCfGkDFIb4gVbKdW2MHV1MeIvsMk9VXK7aOYH3
 pyDA==
X-Gm-Message-State: AFeK/H0RiLGMfKwoMDbHZBrrAwgjYtsvsV6MEBKCPNtVPP5xa2ezTUERhX5WjO7rxVEzQJ79eoTnS09mFyef/w==
X-Received: by 10.13.247.134 with SMTP id h128mr506850ywf.56.1489539305523;
 Tue, 14 Mar 2017 17:55:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Tue, 14 Mar 2017 17:54:45 -0700 (PDT)
In-Reply-To: <20170314211710.44250-1-cbostic@linux.vnet.ibm.com>
References: <20170314211710.44250-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 15 Mar 2017 11:24:45 +1030
X-Google-Sender-Auth: 7XV5Q3KRBmp-kArgH_X2VDAWikw
Message-ID: <CACPK8XdRBzgbg0KXEiW6djq7x9vPhGRPCgAW3+4hoAwDLVAUzQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Set enable line to '1' on
 unbind
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 15 Mar 2017 00:55:08 -0000

On Wed, Mar 15, 2017 at 7:47 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Configure I/O for non OpenFSI users of the FSI enable line by
> setting value to to '1' on unbind prior to releasing use of pin.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Applied to dev-4.7.

Cheers,

Joel

> ---
>  drivers/fsi/fsi-master-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index e3431c4..a8976d5 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -568,7 +568,7 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
>                 devm_gpiod_put(&pdev->dev, master->gpio_trans);
>         }
>         if (master->gpio_enable) {
> -               gpiod_set_value(master->gpio_enable, 0);
> +               gpiod_set_value(master->gpio_enable, 1);
>                 devm_gpiod_put(&pdev->dev, master->gpio_enable);
>         }
>         if (master->gpio_mux) {
> --
> 1.8.2.2
>
