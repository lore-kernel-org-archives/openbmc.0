Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QrohxhwH"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gDQ20sxjzDqQN;
 Thu, 17 Jan 2019 17:17:30 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id l12so10162035qtf.8;
 Wed, 16 Jan 2019 22:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FKfY06XBvP+7+lbG+bUd4k8JgUNDe4s1OC2BG4+aqNQ=;
 b=QrohxhwH+D46iYBRsQWtmMIQDDPdVNdtow+/ApAd/32mCnidizUfQOmFMdAIe8fcLw
 y8frZX0ZFffmR+9hEtWESUAUy0cOu4N0QsyVJYh8wikeRI4TYnk5i138YQW30SjCPYKp
 7N63THQsW+z6Z+Qz9ut5aTs7kFbJHp87ul2yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FKfY06XBvP+7+lbG+bUd4k8JgUNDe4s1OC2BG4+aqNQ=;
 b=PNnVcM/+eRnfm87bswafMzcSQIEyElBj8+2BgG0uCCAGbqN1tWPcapSuv98Nouq9/H
 MObE7b35q0C53U6QkwYR0HMQQ/TipKAyjfWKm95ipqtL5k5/Lz2s+WKGWFgVjPcd0/TQ
 JZPWrWcl88eOhKlTeN/3R2nUoSSpMYE5y4Uo4XajDOveQWWjwqeeaDTRuqdDCHrLH+AF
 alshI4nizEJQAZ2F+T3RoJD+l+J9YPLZcgi4bbcHmyTNodYCrrDigJ74W+GQyEYAFWcB
 Wp+Lg+s8CaG8Q7gQvdDppNbJDueZ8p4WyvANUorsxM8gg1zycSUqMXepJV3aPVrDZjeh
 wLLw==
X-Gm-Message-State: AJcUukeMJLUWaxpI53rpQkVOg/Scw8AVWNY0fJH1JN9SStt6qW1VMT8N
 jfv16fMF0Q9YNoXlc+nnkWNr4NW0ibHmRMg0v2M=
X-Google-Smtp-Source: ALg8bN5JkY1m/cQon+3Je4qTIUqCns1PRy7wSqDPtkx1aQq/lr6LJ3SkBE7UsuAG3vxioE1AKMPRT5667+U/NQFoX7g=
X-Received: by 2002:ac8:748:: with SMTP id k8mr10223752qth.235.1547705847795; 
 Wed, 16 Jan 2019 22:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20190116220154.1026171-1-vijaykhemka@fb.com>
In-Reply-To: <20190116220154.1026171-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 17:17:16 +1100
Message-ID: <CACPK8XdCVvUaCFsMXdEkc9KG0TQCGpYV55u-X7pY7vBLLHuQtw@mail.gmail.com>
Subject: Re: [PATCH v2] misc: aspeed-lpc-ctrl: make parameter optional
To: Vijay Khemka <vijaykhemka@fb.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 17 Jan 2019 06:17:30 -0000

On Thu, 17 Jan 2019 at 09:02, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Makiing memory-region and flash as optional parameter in device
> tree if user needs to use these parameter through ioctl then
> need to define in devicetree.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Thanks! This looks okay to me. I tested it on one of our systems which
uses both flash and reserved memory and it was fine.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Can you also send a patch to update the bindings at
Documentation/devicetree/bindings/mfd/aspeed-lpc.txt ? I think the
only change you need to make is to move the memory region and flash
properties to optional (instead of required).

Cheers,

Joel

> ---
>  drivers/misc/aspeed-lpc-ctrl.c | 58 +++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
> index a024f8042259..332210e06e98 100644
> --- a/drivers/misc/aspeed-lpc-ctrl.c
> +++ b/drivers/misc/aspeed-lpc-ctrl.c
> @@ -68,6 +68,7 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
>                 unsigned long param)
>  {
>         struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
> +       struct device *dev = file->private_data;
>         void __user *p = (void __user *)param;
>         struct aspeed_lpc_ctrl_mapping map;
>         u32 addr;
> @@ -90,6 +91,12 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
>                 if (map.window_id != 0)
>                         return -EINVAL;
>
> +               /* If memory-region is not described in device tree */
> +               if (!lpc_ctrl->mem_size) {
> +                       dev_err(dev, "Didn't find reserved memory\n");
> +                       return -EINVAL;
> +               }
> +
>                 map.size = lpc_ctrl->mem_size;
>
>                 return copy_to_user(p, &map, sizeof(map)) ? -EFAULT : 0;
> @@ -126,9 +133,18 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
>                         return -EINVAL;
>
>                 if (map.window_type == ASPEED_LPC_CTRL_WINDOW_FLASH) {
> +                       if (!lpc_ctrl->pnor_size) {
> +                               dev_err(dev, "Didn't find host pnor flash\n");
> +                               return -EINVAL;
> +                       }
>                         addr = lpc_ctrl->pnor_base;
>                         size = lpc_ctrl->pnor_size;
>                 } else if (map.window_type == ASPEED_LPC_CTRL_WINDOW_MEMORY) {
> +                       /* If memory-region is not described in device tree */
> +                       if (!lpc_ctrl->mem_size) {
> +                               dev_err(dev, "Didn't find reserved memory\n");
> +                               return -EINVAL;
> +                       }
>                         addr = lpc_ctrl->mem_base;
>                         size = lpc_ctrl->mem_size;
>                 } else {
> @@ -196,17 +212,17 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
>         if (!lpc_ctrl)
>                 return -ENOMEM;
>
> +       /* If flash is described in device tree then store */
>         node = of_parse_phandle(dev->of_node, "flash", 0);
>         if (!node) {
> -               dev_err(dev, "Didn't find host pnor flash node\n");
> -               return -ENODEV;
> -       }
> -
> -       rc = of_address_to_resource(node, 1, &resm);
> -       of_node_put(node);
> -       if (rc) {
> -               dev_err(dev, "Couldn't address to resource for flash\n");
> -               return rc;
> +               dev_dbg(dev, "Didn't find host pnor flash node\n");
> +       } else {
> +               rc = of_address_to_resource(node, 1, &resm);
> +               of_node_put(node);
> +               if (rc) {
> +                       dev_err(dev, "Couldn't address to resource for flash\n");
> +                       return rc;
> +               }
>         }
>
>         lpc_ctrl->pnor_size = resource_size(&resm);
> @@ -214,22 +230,22 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
>
>         dev_set_drvdata(&pdev->dev, lpc_ctrl);
>
> +       /* If memory-region is described in device tree then store */
>         node = of_parse_phandle(dev->of_node, "memory-region", 0);
>         if (!node) {
> -               dev_err(dev, "Didn't find reserved memory\n");
> -               return -EINVAL;
> -       }
> +               dev_dbg(dev, "Didn't find reserved memory\n");
> +       } else {
> +               rc = of_address_to_resource(node, 0, &resm);
> +               of_node_put(node);
> +               if (rc) {
> +                       dev_err(dev, "Couldn't address to resource for reserved memory\n");
> +                       return -ENOMEM;
> +               }
>
> -       rc = of_address_to_resource(node, 0, &resm);
> -       of_node_put(node);
> -       if (rc) {
> -               dev_err(dev, "Couldn't address to resource for reserved memory\n");
> -               return -ENOMEM;
> +               lpc_ctrl->mem_size = resource_size(&resm);
> +               lpc_ctrl->mem_base = resm.start;
>         }
>
> -       lpc_ctrl->mem_size = resource_size(&resm);
> -       lpc_ctrl->mem_base = resm.start;
> -
>         lpc_ctrl->regmap = syscon_node_to_regmap(
>                         pdev->dev.parent->of_node);
>         if (IS_ERR(lpc_ctrl->regmap)) {
> @@ -258,8 +274,6 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
>                 goto err;
>         }
>
> -       dev_info(dev, "Loaded at %pr\n", &resm);
> -
>         return 0;
>
>  err:
> --
> 2.17.1
>
