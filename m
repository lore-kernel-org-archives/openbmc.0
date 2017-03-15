Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vk7GK2ZtYzDqYX
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 10:33:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rabj2FGS"; 
 dkim-atps=neutral
Received: by mail-lf0-x243.google.com with SMTP id g70so2208911lfh.3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 16:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nFv1N1BDmRo+jaiC8D1MKQDYlhRgr7dzggOKuoMtoKQ=;
 b=rabj2FGShDiut3wjRoUIZt4iqrCbcJ31lle2EO+E8Ud/xAAfN3peS7fYIIfBt3IvBR
 5cg+9in+gHqm0by/GkZHR2PntwtEZVU8+II9y7OCVFio5l1hDNTDv+An4LQ9D9+4kswt
 P9UR3hjOxG8kWcLIwX3UAP54kEbtTZ/VqaPar5ma7ZGc5PB2hPZTqebMOrQrqjqo2CDZ
 CzlWp7kx3bKmDxaHdqpDlnGhf+fOpl6O5p4zED8RvAv1tw/PQRYXyAyDitQwyPy/n+tn
 Il5E6V9QTSpAVHmOne6FwDAgVPhicQh0IH8VzAmeyxh+OzLihK9WvOxw0av+IheyqyO/
 D/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nFv1N1BDmRo+jaiC8D1MKQDYlhRgr7dzggOKuoMtoKQ=;
 b=aT2USVA8dp0ry8lfn6eWYx1rhxLJk86LXYtMXDtQqzuZ6Dxp2H5Z1r6dmsWXiCbbn+
 NYPeMzSqTk2LLwTD+pKlxAH3wQAm9gET+nP4fnLQo1DcQNUU8r/XWcM70HYgJ1ehkik3
 bg3BMkaFOrSqsQA4zmsqcCBekFmOBpqxhfMsOLRqSHoOBgU8bAH0IGepjwNkoO/RttRZ
 TeFCpss+7CBxAPash25AsdE469gxRKvIA0TsbqEbAZti8ZGaRA4qyVuMqR2FqydIbWlN
 GOsBBfAHR1uU9nIuuciKV7qD4/XWfh8IWRgEgGGWfkcgL79sPrXZjFSvPPnc1GQA4liy
 rBNA==
X-Gm-Message-State: AFeK/H3/abU6vxJbkTDT+AR/0hsH53ejl3Je81dj2XBn8hW/9nMxRHb8KLcRhCDaZGOSQ6FQ2eE8G8tX2UJe/g==
X-Received: by 10.46.7.80 with SMTP id i16mr2024852ljd.129.1489620821812; Wed,
 15 Mar 2017 16:33:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.56.13 with HTTP; Wed, 15 Mar 2017 16:33:21 -0700 (PDT)
In-Reply-To: <1489182506-20505-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1489182506-20505-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Mar 2017 10:03:21 +1030
X-Google-Sender-Auth: efCT2V2PWNRDCuPCxZ7nZJW7ZYU
Message-ID: <CACPK8XfjE+v-N1gYeBTA1Fea14U+ottm-bh_fvEWM92GicOuww@mail.gmail.com>
Subject: Re: [RFC linux dev-4.7 1/5] drivers: fsi: Add function to get FSI
 clock rate
To: Eddie James <eajames@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Wed, 15 Mar 2017 23:33:46 -0000

On Sat, Mar 11, 2017 at 8:18 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> client drivers (I2C, etc) may need to know FSI bus clock rate.

We need to make sure the device tree bindings expose this.

Are we able to discover the clock rate through reading some registers?
Or is it hardcoded on all systems?

I suggest you put something like this in the device tree under the FSI
node your testing:

                 fsi_clock {
                        #clock-cells = <0>;
                        compatible = "fixed-clock";
                        clock-frequency = <8333333>;
                };

And retrieve the clock from there. This way when we add the code for
determining the clock rate your driver won't need to change.

Cheers,

Joel

>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/fsi-core.c | 7 +++++++
>  include/linux/fsi.h    | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 3d382e6..492c9e9 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -139,6 +139,13 @@ int fsi_device_peek(struct fsi_device *dev, void *val)
>         return fsi_slave_read(dev->slave, addr, val, sizeof(uint32_t));
>  }
>
> +unsigned long fsi_device_get_clk_rate(struct fsi_device *dev)
> +{
> +       /* TODO: get clk from dts */
> +       return 8333333;
> +}
> +EXPORT_SYMBOL_GPL(fsi_device_get_clk_rate);
> +
>  static void fsi_device_release(struct device *_device)
>  {
>         struct fsi_device *device = to_fsi_dev(_device);
> diff --git a/include/linux/fsi.h b/include/linux/fsi.h
> index d22d0c5..57c8fdb 100644
> --- a/include/linux/fsi.h
> +++ b/include/linux/fsi.h
> @@ -35,6 +35,7 @@ extern int fsi_device_read(struct fsi_device *dev, uint32_t addr,
>  extern int fsi_device_write(struct fsi_device *dev, uint32_t addr,
>                 const void *val, size_t size);
>  extern int fsi_device_peek(struct fsi_device *dev, void *val);
> +extern unsigned long fsi_device_get_clk_rate(struct fsi_device *dev);
>
>  struct fsi_device_id {
>         u8      engine_type;
> --
> 1.8.3.1
>
