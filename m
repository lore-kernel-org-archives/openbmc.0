Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGghT2HHMzDrD6
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 11:32:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sxbXzQaB"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id p68so2065033ywg.5
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 18:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CQWb3/rXJbOzyvFN5uvc9Q+64haLgaC03ZpkFil77sE=;
 b=sxbXzQaBNCgpDWWt4gbbv4mSkmAk9GH6FbVpg6sHP0JNpASrph2sM9PkM9ku9zR+On
 bo010J+jCUSp+TwYIAK9/1qIkeYSnVs0Lofm0yiOxdxV4IGAWqIi3qNkI0FXaYhtSd+K
 quqEkM3MtZ+0tCU4veKn6W8m+82B9EdKvjWoLjM/9ZV+VgY2svZgjQH7eLHv111ZI/Gd
 rH1S4FFDaT3AKY8xlLv0gZy5ffvgixAHs7j0buRYgAXeUu6/WclYoDNjwI+ikMRND67D
 fxJ3hM/DuzAhGwPb/DwoeSCtnODmw5X5wykIQBiNv4eR5K4682h/u34fZb11t62VcAQv
 WrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CQWb3/rXJbOzyvFN5uvc9Q+64haLgaC03ZpkFil77sE=;
 b=snoQAmFQu+OxqE3La3a+7M0PJfrEHcWV3d6JVVuJl2aBNlz5YODKCiBCYrMC9Dmdw6
 maFa6uzJ3GJDmyvgWhrQwPZdQ3FCCBWuCEVrp+u9xxPpjeRWQgfXEIRd0OQkMp2u34Ou
 cXR18xE9ESwD8FVAew/e8gsr1UDkQRFejILVGHOlqYDBwWdImPjeQFpfpUG+7of1kHno
 TQkeTmRiVsPQFhDKMlROMeVWN+PuV8bauz0TDxKejUu2DhNkVC+OAXoBrQdvc495o7K4
 mORg128QppLHbhytGcqhcq3ctHI/0+zY3xPGjczQO0yxnC/q8tRteR05UIsvZ6AOE/QA
 4qzA==
X-Gm-Message-State: AIVw113VNl9RmrUqScROKvzbuNO5Ig7WpdBuM9AX8zoG8UWuA73ST798
 0J8wxIBRTgdenWc2FurH8mnOp/8/OA==
X-Received: by 10.37.114.198 with SMTP id n189mr14510878ybc.21.1500946326161; 
 Mon, 24 Jul 2017 18:32:06 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Mon, 24 Jul 2017 18:31:45 -0700 (PDT)
In-Reply-To: <20170724212509.85197-3-cbostic@linux.vnet.ibm.com>
References: <20170724212509.85197-1-cbostic@linux.vnet.ibm.com>
 <20170724212509.85197-3-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Jul 2017 11:01:45 +0930
X-Google-Sender-Auth: g5ykkRzAw-jC8z4TrN4K5DVaWE4
Message-ID: <CACPK8XdK3D_QiEfvS_BsTbvaA_uqb6rYPU13urFn2f8yR8LFLA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 2/2] drivers/iio: dps310 Use previous value
 if new reading not available yet
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 25 Jul 2017 01:32:10 -0000

On Tue, Jul 25, 2017 at 6:55 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> In cases where temperature is queried before the latest value is finished
> reading then use the previously measured value instead of returning error.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/iio/pressure/dps310.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
> index f351c26..c7ee99e 100644
> --- a/drivers/iio/pressure/dps310.c
> +++ b/drivers/iio/pressure/dps310.c
> @@ -202,8 +202,8 @@ static int dps310_read_temp(struct dps310_data *data)
>         if (r < 0)
>                 return r;
>         if (!(ready & DPS310_TMP_RDY)) {
> -               dev_dbg(dev, "temperature not ready\n");
> -               return -EAGAIN;
> +               dev_dbg(dev, "temperature not ready, use last temp value\n");
> +               return 0;

We can't hide these errors in the kernel driver. The user of this API
will have no way of knowing if it actually has a new value, or if the
value is days old. In the extreme case, the driver may nave never
received a value from the hardware, but we will happily report zero.

If you want to go down the path of using old values, there's a defined
iio API for doing triggered readings that put data into a timestamped
buffer of values. This could be used by userspace when it needs a
reading, regardless of it's age. I've not used this before so it would
require further investigation to decide if it's useful.

Alternatively, if the userspace application doesn't care about the
latest value then it could cache the previously read value and use
that.

Cheers,

Joel
