Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vo/LMFN9"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9Nkd33T5zDqlv
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 13:00:56 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id l196so25718382lfl.1
 for <openbmc@lists.ozlabs.org>; Sun, 08 Oct 2017 19:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=GzuZc2E0VOmwqFckHJnQkwQK9kOr+t2qLNNGzzw09bc=;
 b=Vo/LMFN9S4tI8Uuz7y0kouMcr2EsUs2+gesW6aX/xv6FcbKvwuH1r9W1kjhW9S1naw
 Z5oy5WK3C3WPPDIiatmUj4F/j9nUBA9X7XE/Mt1lOqSpPq0sfwl8PTKVhqRsGBtZ9VOd
 cBYHDZId+k4bIXIuXburZrOhoA5Fp8RCEe+CsR8aPdmJzVN+0mt3HQqCn51W74mtCaOy
 ZOSW8/diSgSbhEL91pD6mGbnYrHFd82/JYLodqFIXuP/DGi0YINAx9tlwYpgD7s8qa3G
 XG60QRmOcKqXnBjVZoyJxjxbqC6vgODwuNrzkEDgfGLVTj+Brvk05tiC4ZjhLWK+B7+P
 lnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=GzuZc2E0VOmwqFckHJnQkwQK9kOr+t2qLNNGzzw09bc=;
 b=luVGv0DXHZHm7aHipSNxGWOR1bQMT0zsZeGVR7C/V8+aa4mlruEvQYGv6W3snBG1Nl
 f2IkWezNP2bVJgsPtfypjODF3tCPLe9Y3wJxuUI53vyQ+0Spez54LKJgN/SlWxQiszjw
 fpfrRQTebceiJZZYEKtv3Yf4Yhqb6B7svihslDGQ9K9bgCXrNKGF9ynkKNuZuJcgWIVR
 SyStNb2PSH5LHCPMrOMIdx32B2knkLHCzXOfmdr7XB6cfwURcD23wUt3+m/eg9uvLubH
 ZLTKvnYrR6naFDqlpq0r0J3iLYwSS/uJls2GYFpB6BitpaYP+y6j1IZ5xooRAmoEi5o3
 EUew==
X-Gm-Message-State: AMCzsaU1X66vRs5TEIpDgLIwnJWo9MAwyymNQdQTsdvU2HgEGnZ84dww
 WuamrTS+/Z/GjHkbzv/F7SukAuILvYSURAPe4Vk=
X-Google-Smtp-Source: AOwi7QAEljS/t5dCAm1AlT4tbzQD6WBPtp0tKlOgatDKJPkb0gD6LfKBbKMjwEeqBo1+Ko8KEQRFklnlfpzImSlY2zs=
X-Received: by 10.25.143.78 with SMTP id r75mr3031146lfd.85.1507514452879;
 Sun, 08 Oct 2017 19:00:52 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Sun, 8 Oct 2017 19:00:32 -0700 (PDT)
In-Reply-To: <1507300148-8208-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507300148-8208-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 Oct 2017 11:30:32 +0930
X-Google-Sender-Auth: x2fQryAmcKDdh3qNMaUHEuMYbyo
Message-ID: <CACPK8XeiD_qukBjibd1FxMjXt9AbJ_jXGF6AJCE5HQFwr0tuFw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v5 31/31] drivers: hwmon: occ: Cancel occ
 operations in remove()
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 02:00:58 -0000

On Fri, Oct 6, 2017 at 11:59 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Prevent hanging forever waiting for OCC ops to complete.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>
> Changes since v4:
>  * Add comments for the spinlock
> ---
>  drivers/hwmon/occ/p9_sbe.c | 49 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 42 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index c7e0d9c..ac18422 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -14,37 +14,68 @@
>  #include <linux/platform_device.h>
>  #include <linux/occ.h>
>  #include <linux/sched.h>
> +#include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>
>  struct p9_sbe_occ {
>         struct occ occ;
>         struct device *sbe;
> +
> +       /*
> +        * Pointer to occ device client. We store this so that we can cancel
> +        * the client operations in remove() if necessary. We only need one
> +        * pointer since we do one OCC operation (open, write, read, close) at
> +        * a time (access to p9_sbe_occ_send_cmd is locked in the common code
> +        * with occ.lock).
> +        */
> +       struct occ_client *client;
> +
> +       /*
> +        * This lock controls access to the client pointer and ensures atomic
> +        * open, close and NULL assignment. This prevents simultaneous opening
> +        * and closing of the client, or closing multiple times.
> +        */
> +       spinlock_t lock;
>  };
>
>  #define to_p9_sbe_occ(x)       container_of((x), struct p9_sbe_occ, occ)
>
> +static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
> +{
> +       struct occ_client *tmp_client;
> +
> +       spin_lock_irq(&occ->lock);

Why not spin_lock_irqsave/spin_unlock_irqsave? Same throughout this patch.

Cheers,

Joel

> +       tmp_client = occ->client;
> +       occ->client = NULL;
> +       occ_drv_release(tmp_client);
> +       spin_unlock_irq(&occ->lock);
> +}
> +
>  static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>  {
>         int rc, error;
> -       struct occ_client *client;
>         struct occ_response *resp = &occ->resp;
>         struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
>
> -       client = occ_drv_open(p9_sbe_occ->sbe, 0);
> -       if (!client) {
> +       spin_lock_irq(&p9_sbe_occ->lock);
> +       if (p9_sbe_occ->sbe)
> +               p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
> +       spin_unlock_irq(&p9_sbe_occ->lock);
> +
> +       if (!p9_sbe_occ->client) {
>                 rc = -ENODEV;
>                 goto assign;
>         }
>
> -       rc = occ_drv_write(client, (const char *)&cmd[1], 7);
> +       rc = occ_drv_write(p9_sbe_occ->client, (const char *)&cmd[1], 7);
>         if (rc < 0)
>                 goto err;
>
> -       rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
> +       rc = occ_drv_read(p9_sbe_occ->client, (char *)resp, sizeof(*resp));
>         if (rc < 0)
>                 goto err;
>
> -       occ_drv_release(client);
> +       p9_sbe_occ_close_client(p9_sbe_occ);
>
>         switch (resp->return_status) {
>         case RESP_RETURN_CMD_IN_PRG:
> @@ -72,7 +103,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>         goto done;
>
>  err:
> -       occ_drv_release(client);
> +       p9_sbe_occ_close_client(p9_sbe_occ);
>         dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
>  assign:
>         error = rc;
> @@ -132,6 +163,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>         p9_sbe_occ->sbe = pdev->dev.parent;
>
>         occ = &p9_sbe_occ->occ;
> +       spin_lock_init(&p9_sbe_occ->lock);
>         occ->bus_dev = &pdev->dev;
>         occ->groups[0] = &occ->group;
>         occ->poll_cmd_data = 0x20;
> @@ -152,7 +184,10 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>  static int p9_sbe_occ_remove(struct platform_device *pdev)
>  {
>         struct occ *occ = platform_get_drvdata(pdev);
> +       struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
>
> +       p9_sbe_occ->sbe = NULL;
> +       p9_sbe_occ_close_client(p9_sbe_occ);
>         occ_remove_status_attrs(occ);
>
>         atomic_dec(&occ_num_occs);
> --
> 1.8.3.1
>
