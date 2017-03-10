Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vfSK22grHzDqC0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 11:08:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fuHwdoLy"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id o4so2127246ywd.1
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 16:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yqT6iya1f8vluIBywYZoy1pt9oqfz+mkEsgLTq+nOc4=;
 b=fuHwdoLyOAyz9SYEjrGb3wTMCo1T8SSVJrIpI5CQZnpnVCJz+76B4sNQJd0ipXoHIP
 eK/9t85D8B0/wRWdJjVwISsx0KSv1IhG/aqEIl5XKG7q1ZBdg1x4qyj9qKxLORyuQbvL
 Gca6gk2mjfEVuiNp1XG7u0k6bqEkXMQ3XmLFtekQIVxH2Rsf3JMEUvG86TReZXeS8hRc
 5BxsGp0hmF0yTKHUELu/hQ6GvDx5CSuvVbwU7QNXA1+m4ty9zMtnb8sy/3nKJNOV/Eyz
 72Z0nVg0gTGFYsB7yu/QmRrI+DE+DQt/JMTTkFDyr4QSgrobOD+xu1yc2u2etC0HnWw6
 NbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=yqT6iya1f8vluIBywYZoy1pt9oqfz+mkEsgLTq+nOc4=;
 b=L3GsIzdOw/PVnybn14Fo0QDglNDtVhS+cz5+aXukwOQP1/Ei11noRXTxtvNzIiv48L
 diFzsNiYl3tOXP8pnHSmvgVTJglpk9e+l9x4qCCbGPplbmMY761M4KPLJkK41M/qFMfd
 9ifb5aHClf6FRi0E3tKj10/5MRP3tvrpLsg2MpPzJp4sDkWXOQN6g7U267aSoy+vyosu
 vpX9/ElByyXmfEFqjVFMlzj2hKS6leQRlz3NjclCfn1ORdGr64x1LDGRfPRmOn1WxElW
 QnhLYVeRWQxGHNW+BYMRlcH+RKe4KRgRWofWBiT2UAwFESY3g71wzUEnG1Tar3i1JKhg
 GSKQ==
X-Gm-Message-State: AMke39mqSfvYiDEbZeiZu1eUMRurL2sq9vTbNW6vgh28+VfiJ6pONZ5FrS/FWMzyLVrQ+TiRYUwGoQmJ0X2zlw==
X-Received: by 10.129.101.195 with SMTP id z186mr5543775ywb.11.1489104500241; 
 Thu, 09 Mar 2017 16:08:20 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Thu, 9 Mar 2017 16:07:59 -0800 (PST)
In-Reply-To: <20170309191239.77302-1-cbostic@linux.vnet.ibm.com>
References: <20170309191239.77302-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Mar 2017 10:37:59 +1030
X-Google-Sender-Auth: WdYqI_XHnFKuqQTicsKVox1TW5c
Message-ID: <CACPK8Xc+JmsjyZr1s5B2qptgcDgV9YEqvRt6G5+tcQVZZi5-2w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Free up allocated resources
 on fsi-master unbind
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
X-List-Received-Date: Fri, 10 Mar 2017 00:08:22 -0000

On Fri, Mar 10, 2017 at 5:42 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> In order to allow repeated bind/unbind operations on fsi-master
> the scan file created on bind must be removed.  Also check for
> valid pointers during unregister which is the path taken during
> unbind.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v2 - Remove devm_kfree in gpio remove
>    - Rebase on e97a91f178e55719b08d48af7f592b18cfd4da91

Applied to dev-4.7.

Cheers,

Joel

> ---
>  drivers/fsi/fsi-core.c        | 8 ++++----
>  drivers/fsi/fsi-master-gpio.c | 1 +
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index b3b245a..3d382e6 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -868,11 +868,11 @@ EXPORT_SYMBOL_GPL(fsi_master_register);
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
> index c923846..e3431c4 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -576,6 +576,7 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
>                 devm_gpiod_put(&pdev->dev, master->gpio_mux);
>         }
>         fsi_master_unregister(&master->master);
> +       device_remove_file(&pdev->dev, &dev_attr_scan);
>
>         return 0;
>  }
> --
> 1.8.2.2
>
