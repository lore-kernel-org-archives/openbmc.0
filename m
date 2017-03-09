Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vf6j42jynzDqfn
 for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2017 21:54:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gR875wE8"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id a5so245025ybb.3
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 02:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DLrcixqpGsxE0oDeZDSNGHLjNSFGDRIYVVVLO1Kcxc8=;
 b=gR875wE8TGehq2EbOAxiPLLBBWLa0+gNm/pUOq+7GA6zEbqUaUceCe3V/51HpQrvb5
 4lUV8rhr1pVA+HLPi/s+GqJN+ERJmdM9movZW9DLkXvi8u0b8XJU5AZsdSiyl188WNE0
 /2+4jV8mZurwMN/Ded9wyeFUdCXi61Tc1FCPILDRAx4xMSz/6mqPVV1ur0z43osLPgsY
 +A8evYlj3J5+DDTn6cqQ/9ZGeYineDOUOcn3dJlkB443t8pXM4ReiErRQOKy49g66J92
 b+h/5C65twOzaVippbm0rKFD/mlm8Bb8ov6rEHUBgDrnk8dKgBdUk9M0gvb/X47d9tMn
 zXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DLrcixqpGsxE0oDeZDSNGHLjNSFGDRIYVVVLO1Kcxc8=;
 b=qVzHrEABgl2b7MG8/KaUpEomUWj+chQoXzDsDrL88V2QHNrGOTZFl8/ZUes0UlbbWJ
 ipaipYmgdge/azrxSlNa+PHXOhjGXM1eYn8wo3fD/S0Li0lsBmLrGbZuUbgAMkxU0zvk
 epIB/SZP0PYUCKfhnjIi975mG1gBPb45MJU2nyDKgjCqDw3SUMawEY/hKbBFSdcNl/qt
 ZP1Rry3hagk0QDlzN9eR2tAwb7M7xYYU+xZua1lLq8yiearKv2XBcMl+nFplNpfGPNaZ
 CrS9G+iw6C84s1K+nGAd9raZ7mk3qGwQX4fqEoLeJeXooOjoD1KQHapGpb+/5NV5RTRA
 SIgA==
X-Gm-Message-State: AMke39nFOnwedBUYMDpijovMTL8/gkuoUGyDa/1U/DKuYEOMH78NwfUzfT+R8jGcWS1umHBguhIY/wDmex9Wiw==
X-Received: by 10.37.194.5 with SMTP id s5mr2982162ybf.136.1489056869942; Thu,
 09 Mar 2017 02:54:29 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Thu, 9 Mar 2017 02:54:09 -0800 (PST)
In-Reply-To: <20170307164610.78174-1-cbostic@linux.vnet.ibm.com>
References: <20170307164610.78174-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Mar 2017 21:24:09 +1030
X-Google-Sender-Auth: Bz7Cc7iQHRl3EQOhvRU-4zT4bPs
Message-ID: <CACPK8XfX24uzvxgjdNYyiKD+8BWdJW9=7Owd8yVtQO3VxXm54w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Remove hub devices during
 master unregister
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
X-List-Received-Date: Thu, 09 Mar 2017 10:54:32 -0000

On Wed, Mar 8, 2017 at 3:16 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> All hub devices must be removed when the primary FSI master
> is being unregistered.  This ensures that the system is in
> a clean state when another scan is attempted.  Failure to do so
> will result in duplicate /sys device name errors.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v2: Fix missing return in non void function warning
> ---
>  drivers/fsi/fsi-core.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index bd57b41..bbdf6b8 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -84,6 +84,7 @@ struct fsi_master_hub {
>  #define to_fsi_master_hub(d) container_of(d, struct fsi_master_hub, master)
>  #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
>
> +static void fsi_master_unscan(struct fsi_master *master);
>  static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
>                 void *val, size_t size);
>  static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
> @@ -441,6 +442,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>                         hub->dev.release = hub_master_release;
>                         hub->master.dev = &hub->dev;
>                         hub->master.dev->parent = &slave->dev;
> +                       dev_set_drvdata(&hub->dev, hub);
>                         rc = device_add(&hub->dev);
>                         if (rc)
>                                 return rc;
> @@ -739,6 +741,20 @@ static int fsi_master_scan(struct fsi_master *master)
>         return 0;
>  }
>
> +static int fsi_unregister_hubs(struct device *dev, void *data)
> +{
> +       struct fsi_master_hub *hub =
> +                               (struct fsi_master_hub *)dev_get_drvdata(dev);

dev_get_drvdata returns a void *, so there is no need to cast.

I fixed this up when applying.

> +       if (!hub)
> +               return 0;

Is this expected? Should it return an error?

> +
> +       device_del(dev);
> +       fsi_master_unscan(&hub->master);
> +
> +       return 0;
> +}
> +
>  static void fsi_master_unscan(struct fsi_master *master)
>  {
>         struct fsi_slave *slave, *slave_tmp;
> @@ -756,6 +772,8 @@ static void fsi_master_unscan(struct fsi_master *master)
>                         device_del(&fsi_dev->dev);
>                         put_device(&fsi_dev->dev);
>                 }
> +               /* Remove any hub masters */
> +               device_for_each_child(&slave->dev, NULL, fsi_unregister_hubs);
>                 device_unregister(&slave->dev);
>         }
>         master->slave_list = false;
> --
> 1.8.2.2
>
