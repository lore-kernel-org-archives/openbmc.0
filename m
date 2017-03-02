Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYY366dRwzDqVq
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 11:24:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YlnIst6t"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id 203so5442994ywz.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Mar 2017 16:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jl5miFYzQDgSeBkN08YuYS8abYGrwv/dm2japKXramc=;
 b=YlnIst6tco2kUdszRvefvvOsQlZqngZaAUcWqmbYzC7oIHar1U+BkfJVtA+lAddS/w
 rARqXn3/t0AqvcAR+MuX8qIznqKFcLupK9NroIHg7fVFA5wb973Dw73N6OqCxjIERFiI
 vaJJlzIVL1e/xpNUZhUbCdvRN3D623tzDtJ+kcaFTZbwYuljkfnNzQa3WnBq2isUqSTP
 kCV5yPu4ehXpRxTqhgFm/gsljMtOiev7yYJG/F36nsGrygicCDdbeiKqsaYazg8ryRXA
 40vs1wfSkLZHadsLG3JvkhBXhDu1p7XntHGziFVt9j8zXhXpjJyJoWHIdzPgA8Zc//xe
 mPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jl5miFYzQDgSeBkN08YuYS8abYGrwv/dm2japKXramc=;
 b=lPv2Bj/qVeV1whsldJ2QYYFE/4pvYt4votwZ0XgzN2C58S3p+Lu+DbCV/H8zzElnMR
 gMELUi0muagnbzzw9RZp4k5UYOokSnhNlqvK3/rm85IlnEwLPKrUfAL3OAITlPw1JYtP
 ZHXZNlvd7gcVTdUR3AJa5h0SDkWQOTaHNuDXADN3JQv7uRHq5MDV6a8Sw42twaYuz0Do
 ZTBJM4coUuvObH8Ydxe3oTyb4fQDmpj+B7Rhw69ytw3ZTVtd6F+OOwjniBX5Z7CrfaWe
 RzJThMjMjRS445H5ums6Bgi/3MT55Wj5a4JJ/+axWC9oUIM9sukXnRoZbSJ42yRo5Qtg
 IjPQ==
X-Gm-Message-State: AMke39nlNxsAFZae1UhxdgKM0rB2AzSmVMvaG2WxrISUW2NAJbZGf0Sc/T9GEh2xEKwUQHaNtN8DWdlubxbUqQ==
X-Received: by 10.129.118.82 with SMTP id j18mr3504164ywk.10.1488414256459;
 Wed, 01 Mar 2017 16:24:16 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 1 Mar 2017 16:23:56 -0800 (PST)
In-Reply-To: <20170301222602.43438-1-cbostic@linux.vnet.ibm.com>
References: <20170301222602.43438-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Mar 2017 10:53:56 +1030
X-Google-Sender-Auth: 3uXKHW6g14D-PGdvyb4VvamAKhM
Message-ID: <CACPK8Xe_JZ_Hv_eojfBB9s6rYJxWLn2oGQLfAUSveWq6W=Xgfw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Don't scan after
 fsi-gpio-master unbound
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
X-List-Received-Date: Thu, 02 Mar 2017 00:24:19 -0000

On Thu, Mar 2, 2017 at 8:56 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Check pointers prior to scanning master in the sysfs scan
> file.  These get invalidated after an unbind operation.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-master-gpio.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index c5f4f9c..67f0d9d 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -476,7 +476,14 @@ static ssize_t store_scan(struct device *dev,
>                                 const char *buf,
>                                 size_t count)
>  {
> -       struct fsi_master_gpio *master = dev_get_drvdata(dev);
> +       struct fsi_master_gpio *master;
> +
> +       if (!dev)
> +               return count;
> +
> +       master = dev_get_drvdata(dev);
> +       if (!master)
> +               return count;

Returning count implies that you've stored the data the user has
written. You should return an error in the case where there is an
error.

Cheers,

Joel

>
>         fsi_master_gpio_init(master);
>
> --
> 1.8.2.2
>
