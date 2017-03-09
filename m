Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vf6cT4rjfzDqXh
 for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2017 21:50:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kK97I5pi"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id d88so245879ybi.2
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 02:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CzMYwZn7hN6FYktK7oqIkzxsy9lKKQ37/j6VCIEeLac=;
 b=kK97I5piNw0KkL2fExHsS+Ya3iiq5hoh/sFqqz1tNSScNKS0eyX3gINYNz03SIaXBC
 ZTMdCUzkkSg++qmDwVT3nh2wMc9aJjlP7RJl+TfE19xv5TBcRu6fnEMxW3l6g4Dm8YBR
 U54zhEE6YooPlZCxUXhClUszapnTeJgUiW/QMl7ObEsaHHSN4KoAwU5Y7y839QsigWfk
 Hrmkr9+I2gCasBFy6dgsdHoeSE0iqxCeKbZuSRSnv5FgPFW+mF7Om0k8vQuT/hPc7XKt
 GWUyhymShqhdcB2EU61CAdIj5T3j8Ef5s9RAoN/aJOD3QyYN1G8CBm6Xax7qlWBKG28P
 Omuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CzMYwZn7hN6FYktK7oqIkzxsy9lKKQ37/j6VCIEeLac=;
 b=kC3yJvdAFdrA2xW4p7MhG8HZdhkWcCUiqIVtdJz8AWPwSsmrSiGQkeZgygNDyLCUuZ
 IgMFkU6TaKLqGTtuanL5VSM/7L0NTth4klSWCie/iJahkZxE8zFOoVxOC35udiILAQo2
 3mSP+0zjwgcbMmNj30kg6gNfEWG17P5CaHh/qyvSNPMf778Mc6KWtXReLzLDvZMutmws
 nYv4Sf7yAkMof67vqY1HAJNnA/sC46b1wkWWvTT0+YEp78sDWpz9rRPV/gLYbwaVfK6v
 1kD9daj/vNjuqF9vC6R7DdvVe4ogeTw2EcrSzBUmPeJc2gVe3hYpWzLafnOy85qx89yW
 ICwA==
X-Gm-Message-State: AMke39lF4lg52RKsQ8R8JPRfnxG18nCK9XraHTUL9pCjZ/tjZb80WZMJxGZzmV8Q6RoB0w/nSciANC/lBXJnag==
X-Received: by 10.37.70.66 with SMTP id t63mr3332477yba.196.1489056629532;
 Thu, 09 Mar 2017 02:50:29 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Thu, 9 Mar 2017 02:50:09 -0800 (PST)
In-Reply-To: <20170308195606.11618-1-cbostic@linux.vnet.ibm.com>
References: <20170308195606.11618-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Mar 2017 21:20:09 +1030
X-Google-Sender-Auth: _JH2NYcnqdjHaWTDHRKa-1BZFWc
Message-ID: <CACPK8XdTiDztehaeFSpKDNhL4Gw75Fyb=+h4cQ3RiPXoqDy4mQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Free up allocated resources on
 fsi-master unbind
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
X-List-Received-Date: Thu, 09 Mar 2017 10:50:34 -0000

On Thu, Mar 9, 2017 at 6:26 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> In order to allow repeated bind/unbind operations on fsi-master
> the resources allocated during bind must be freed. Specifically
> the scan file and dynamic memory.  Also check for valid pointers
> during unregister which is the path taken during unbind.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

This patch does not apply to dev-4.7. Can you please rebase it?

a4a89c237856e2ee3b00db7cd5febf075b695760 is the tip of dev-4.7 at the moment.

> ---
>  drivers/fsi/fsi-core.c        | 8 ++++----
>  drivers/fsi/fsi-master-gpio.c | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index bbdf6b8..751c767 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -869,11 +869,11 @@ EXPORT_SYMBOL_GPL(fsi_master_register);
>
>  void fsi_master_unregister(struct fsi_master *master)
>  {
> -       if (master->idx >= 0) {
> -               ida_simple_remove(&master_ida, master->idx);
> -               master->idx = -1;
> -       }
> +       if (!master || !master->dev || master->idx < 0)
> +               return;
>
> +       ida_simple_remove(&master_ida, master->idx);
> +       master->idx = -1;
>         device_remove_file(master->dev, &dev_attr_fsi_ipoll_period);
>         fsi_master_unscan(master);
>         put_device(master->dev);
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 49f3399..3693b3d 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -566,6 +566,8 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
>         if (master->gpio_mux)
>                 devm_gpiod_put(&pdev->dev, master->gpio_mux);
>         fsi_master_unregister(&master->master);
> +       device_remove_file(&pdev->dev, &dev_attr_scan);
> +       devm_kfree(&pdev->dev, master);
>
>         return 0;
>  }
> --
> 1.8.2.2
>
