Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh6d11dCvzDqLG
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 17:58:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GzfurNBM"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id 202so4656253ybd.0
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=E1sCI5QsKJN8YQAprSfAKqapP4X41JE2Vm2zEUa6Q8s=;
 b=GzfurNBMLKn2NBGeDZNtQ309d6YWsgN1EY2UZr3kmJLYQ8vHGG+V6Ss0mJQg29KBqg
 D4+FWNWTHllK59y16yDhRqfV/XSdd4H1oT0Ka0nPhUrJyXYcXPzV0PjO785aPpp9Ag3o
 fO4JjbhfmvOp1n4y9kL5DIi215p3xRDKG76rPhWCLU6CusMn32BtBJ32fGWZA64zRuxq
 VXVwHFMlBLGOM1Sn3ED7NxDXGWcS/scIuo1qnZyOBS+UJ6m1d+9muWzXlc7o5ENqixtp
 mH9TXH9Kif7m7ebsjOSQbgVkrAKCWzPjyMWdgZmYzCB/qVf1oH2r5JbFkMgD0CaHVppN
 ns1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=E1sCI5QsKJN8YQAprSfAKqapP4X41JE2Vm2zEUa6Q8s=;
 b=N51JddpYqYGIUSW1oLwc/ONUEbjVNWoLUPgiD8GPsVQ+nxoiheTQk/j7W9Pn1DouEp
 /8SuP2SpMoYIL5EE9Mqx7ZkcloWsKIsZ50skzFBXdxGmhSJeqCWECTvXnbm38u/WLd2G
 DMRJPGDWbjijBY+oLjLf2Gocp3P5SSpO7qpj8bhdmcN+jMAzNhDmqjorsLyVikFMHy9r
 IipHkUcNe3Y30MudXu+xBwwV2YrxfenLjqBuduzYgfXMXdy9h9HjNmFAhmZzL8AtgBcV
 pg9V0p/ccSZNTqlI1D4F/xT+VJ0EXUClSCpBy6kOqPDX/imxq1q4qiC0kjNfbS3+vnGy
 2qrQ==
X-Gm-Message-State: AODbwcC4IG1HmyMQCnGhQZlNbRUp+pcR2wo7hnfcXOhJU+qZ45jw/heh
 CwXz3RSeZfFisAe2CcMPe9CMg0seiQ==
X-Received: by 10.37.202.140 with SMTP id a134mr4684452ybg.182.1496649490735; 
 Mon, 05 Jun 2017 00:58:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Mon, 5 Jun 2017 00:57:50 -0700 (PDT)
In-Reply-To: <1496426181-26205-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1496426181-26205-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1496426181-26205-3-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 17:27:50 +0930
X-Google-Sender-Auth: iwtHhHbpiN0s4dwRZ6Znhi-BlYg
Message-ID: <CACPK8XdVxJ+f+U-aYX0N2__E1oCUokrBzv=a+JFNvcq1KqnpNg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v4 2/2] drivers: fsi: sbefifo: Add OCC
 driver
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 05 Jun 2017 07:58:13 -0000

On Sat, Jun 3, 2017 at 3:26 AM, Eddie James <eajames@linux.vnet.ibm.com> wr=
ote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This driver provides an atomic communications channel between the OCC on
> the POWER9 processor and a service processor (a BMC). The driver is
> dependent on the FSI SBEFIFO driver to get hardware access to the OCC
> SRAM.
>
> The format of the communication is a command followed by a response.
> Since the command and response must be performed atomically, the driver
> will perform this operations asynchronously. In this way, a write
> operation starts the command, and a read will gather the response data
> once it is complete.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

I applied this to dev-4.10.

Note that there are a number of outstanding issues we must address
before it is considered production quality. I propose we do that
review when you submit it to the upstream lists.

> +
> +static int occ_remove(struct platform_device *pdev)
> +{
> +       struct occ_xfr *xfr, *tmp;
> +       struct occ *occ =3D platform_get_drvdata(pdev);
> +       struct occ_client *client;

This created some warnings:

drivers/fsi/occ.c: In function =E2=80=98occ_remove=E2=80=99:
drivers/fsi/occ.c:735:21: warning: unused variable =E2=80=98client=E2=80=99=
 [-Wunused-variable]
  struct occ_client *client;
                     ^~~~~~
drivers/fsi/occ.c:733:24: warning: unused variable =E2=80=98tmp=E2=80=99 [-=
Wunused-variable]
  struct occ_xfr *xfr, *tmp;
                        ^~~
drivers/fsi/occ.c:733:18: warning: unused variable =E2=80=98xfr=E2=80=99 [-=
Wunused-variable]
  struct occ_xfr *xfr, *tmp;
                  ^~~

I fixed them for you. Please make sure you fix them in your tree
before submitting upstream.

Cheers,

Joel

> +
> +       flush_work(&occ->work);
> +
> +       misc_deregister(&occ->mdev);
> +
> +       device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
> +
> +       ida_simple_remove(&occ_ida, occ->idx);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id occ_match[] =3D {
> +       { .compatible =3D "ibm,p9-occ" },
> +       { },
> +};
> +
> +static struct platform_driver occ_driver =3D {
> +       .driver =3D {
> +               .name =3D "occ",
> +               .of_match_table =3D occ_match,
> +       },
> +       .probe  =3D occ_probe,
> +       .remove =3D occ_remove,
> +};
> +
> +static int occ_init(void)
> +{
> +       occ_wq =3D create_singlethread_workqueue("occ");
> +       if (!occ_wq)
> +               return -ENOMEM;
> +
> +       return platform_driver_register(&occ_driver);
> +}
> +
> +static void occ_exit(void)
> +{
> +       destroy_workqueue(occ_wq);
> +
> +       platform_driver_unregister(&occ_driver);
> +}
> +
> +module_init(occ_init);
> +module_exit(occ_exit);
> +
> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("BMC P9 OCC driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/occ.h b/include/linux/occ.h
> new file mode 100644
> index 0000000..d78332c
> --- /dev/null
> +++ b/include/linux/occ.h
> @@ -0,0 +1,27 @@
> +/*
> + * Copyright (C) IBM Corporation 2017
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __OCC_H__
> +#define __OCC_H__
> +
> +struct device;
> +struct occ_client;
> +
> +extern struct occ_client *occ_drv_open(struct device *dev,
> +                                      unsigned long flags);
> +extern int occ_drv_read(struct occ_client *client, char *buf, size_t len=
);
> +extern int occ_drv_write(struct occ_client *client, const char *buf,
> +                        size_t len);
> +extern void occ_drv_release(struct occ_client *client);
> +
> +#endif /* __OCC_H__ */
> --
> 1.8.3.1
>
