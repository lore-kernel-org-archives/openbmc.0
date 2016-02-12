Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x242.google.com (mail-ob0-x242.google.com
 [IPv6:2607:f8b0:4003:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1410A1A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 15:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=poN+6lIG; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=A2DCvyOs; 
 dkim-atps=neutral
Received: by mail-ob0-x242.google.com with SMTP id x5so7637834obg.1
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 20:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=Md0pLqkNcw2Nug5vCI//XmU7y36zuDKFP4yJ7B2kmRw=;
 b=poN+6lIGUdVBmfrEmDkwaF3umQw/ahWO3sgvpb7DGSn9F1coABc4Nnz2hjusfs8qqO
 C3fdYM+Av/w+X8hc8LsFEUEP7g+If+fwdJvXavICLqPhwnTx5rZgnuGwBmvWaikSGCPs
 Wl5QaTrmm/beHAz2TlbaauhXt8g2O89ZSCw8YzoQNVZljshtbkexq/oSMGRGMs0/tn6u
 S/GZJe3leUrrXiq5ZqXopzXuGNBfIMTNkihgQhcv18QPSdFFv+BLeqpi2CYBLR+mM0bI
 M63VTikuMTJq8U1ktnxVJfc4Mhd5Y3PQ0oZxjmY1GtE1X0GtfETmf6YnWtL6QAG9unbl
 r9Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=Md0pLqkNcw2Nug5vCI//XmU7y36zuDKFP4yJ7B2kmRw=;
 b=A2DCvyOsX8wxGD7H12pf6ewYx8hp9zho9jXyPhF2YFOB0milUB8qfB0+oyYNUR+aXR
 /Zl9IVUn4dQqniODJdlAWvVSncJEU84cQLwFHCgE40oqcWzSQLmYILLIUy89D0prM1PP
 qWgwmwo7ONqzamUgO9NpntKBrl/ElJVWscGko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=Md0pLqkNcw2Nug5vCI//XmU7y36zuDKFP4yJ7B2kmRw=;
 b=Uk5i+hJJgPVX7LtoMeXrM8f/EGo6sJmVqaW21gpa6gdBD8/+NfAoKZVpevQWguDExk
 m1F1c2jDklZF0oNS1624WSAmyJPkUNM3vc/iYDXpfD4DQntoC8iHcdnioc7PM1JA/cms
 nQ+7ZmOah6CPyMjBYwcMcOBqCuKGcCycwQPNFGbYdRF2pJp1q1mjDGGA+BWSPG+xCGz9
 4JjUMqEYDMXzukJyfnGX9duLAY2C5sCbMkALlv0QdpndVaPWqWK05irt1zT5+zK+0a/F
 tdrNLzd/Et2/wFSVsFYakt0BucDURE/cR2xoIo6R0szblJgB5bndMBOWCr5QAn+vgb4A
 3QXg==
X-Gm-Message-State: AG10YOQiHkcbRAyAR4nHhBgz9zwSIqtULwOVDN0ZcaTyewZLsCMNRMxd8ztHArqBQ+aywVAP4cCnHvFtTgqbow==
X-Received: by 10.182.148.39 with SMTP id tp7mr49688939obb.87.1455250981896;
 Thu, 11 Feb 2016 20:23:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Thu, 11 Feb 2016 20:22:42 -0800 (PST)
In-Reply-To: <1455154228-7217-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455154228-7217-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455154228-7217-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Feb 2016 14:52:42 +1030
X-Google-Sender-Auth: rHmcFF5zKWxTKrGxfM2fdw3Id4g
Message-ID: <CACPK8XedTDoPRTc2madutwo_qJcJ4VinuXnXfFGpiQaJ1iinng@mail.gmail.com>
Subject: Re: [PATCH linux 1/2] i2c: aspeed: Don't rename added devices
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2016 04:23:05 -0000

On Thu, Feb 11, 2016 at 12:00 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>
> Changing the name of a device with dev_set_name after device_add
> is not allowed.
>
> However, of_create_device takes a bus_id parameter that specifies
> the name of the platform device being added.
>
> This does mean the bus property has to be retrieved multiple times.
> Creation is skiped if there is trouble retrieving or formatting
> the name.

Ok, this approach looks alright.

> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 5488233..ccb438f 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -693,13 +693,6 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
>         if (ret)
>                 return -ENXIO;
>
> -       /*
> -        * Set a useful name derived from the bus number; the device tree
> -        * should provide us with one that corresponds to the hardware
> -        * numbering
> -        */
> -       dev_set_name(&pdev->dev, "i2c-%d", bus_num);
> -
>         bus->pclk = devm_clk_get(&pdev->dev, NULL);
>         if (IS_ERR(bus->pclk)) {
>                 dev_dbg(&pdev->dev, "clk_get failed\n");
> @@ -828,7 +821,26 @@ static int ast_i2c_probe_controller(struct platform_device *pdev)
>                         controller->irq);
>
>         for_each_child_of_node(pdev->dev.of_node, np) {
> -               of_platform_device_create(np, NULL, &pdev->dev);
> +               int ret;
> +               u32 bus_num;
> +               char bus_id[sizeof("i2c-12345")];

Clever, but I don't think it's kernel style. A constant will do.

> +
> +               /*
> +                * Set a useful name derived from the bus number; the device
> +                * tree should provide us with one that corresponds to the
> +                * hardware numbering.  If the property is missing the
> +                * probe would fail so just skip it here.
> +                */
> +
> +               ret = of_property_read_u32(np, "bus", &bus_num);
> +               if (ret)
> +                       continue;
> +
> +               ret = snprintf(bus_id, sizeof(bus_id), "i2c-%u", bus_num);
> +               if (ret >= sizeof(bus_id))
> +                       continue;

You should check for a negative value as well.

> +
> +               of_platform_device_create(np, bus_id, &pdev->dev);
>                 of_node_put(np);
>         }
>
> --
> 2.7.1
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
