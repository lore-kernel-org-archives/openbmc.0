Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZLtH2TTpzDq5x
 for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2017 18:49:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I4l7+5Kj"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id 203so9217845ywz.1
 for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2017 23:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=IFAcFggoA8Vfx9hyKualc0nNbqGoQuPQLqAoh5di+8s=;
 b=I4l7+5KjVl9eE/duO6TUkwW1n3yRVdMpr64rvduYJ9F55Xt6wOX3Pfw23xwdfpwyv7
 PwxOgFSO8Ltl5UCbFheT6Ei5pKrYBTqUkFpaqf3T+v02EJ24GkK2qnDbJQxI9XLZw5D6
 1CgHSCDQOJU9DnSM6yo9R28JFI4+yY1MqcWnJWj/6Sl0O4EdSMCRJRwNTrQQuZXBsXDR
 ALBF5kGmS1bFi8l4jaXI3bGIjvUvbiHj1o1wnAlCsnFjaaVDJ1cHT3DORo3wHszmjPtC
 ykG0E5IYE4XXxaVjH8pwzVWdrY7lHp18zu6c4FkSaUST5MXYwpkW4lCLY1ZgnlXXRkTe
 xoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=IFAcFggoA8Vfx9hyKualc0nNbqGoQuPQLqAoh5di+8s=;
 b=krsJ6ayCldx+xdHhfbybiNe5k1CPPEgfFCdUGOK5B5OaMbB+6Rs0iKHaLTRb9gsAvf
 WdqJlMzc4ee2eAwiFf22MQfBle4ZWbHNQj3jgrdVcSVkNd5IuhWqvaYq7yWpZIompHdP
 Cj5mV6vitK3+KhqyZjY4FWss6xESZp+hAzIQ+o8eU8bg5JAdOGbmvfc2i9J1uVDJHEHX
 qD09flcCdYT7+sx2gSGXdLPzj7HWvfpQ4uii/ecRr3Z9Wzt+9HL9d2d9FOHep7+lZngv
 FwOBAjUBhB09NIS5V4o/ueFH3EjV+BHjAfrAZbEvsgJ4WWBzUgR3Wbp1GFSvWAY2dKVW
 n57g==
X-Gm-Message-State: AMke39kytRFvWl1Frn72JP74EteFAHiCDLskxI+4puBGlUjskZGu/QIbFV+23sTouAMWQHTemXhty46NjyXlbQ==
X-Received: by 10.37.32.194 with SMTP id g185mr819594ybg.167.1488527364622;
 Thu, 02 Mar 2017 23:49:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Thu, 2 Mar 2017 23:49:04 -0800 (PST)
In-Reply-To: <20170302211537.67380-1-cbostic@linux.vnet.ibm.com>
References: <20170302211537.67380-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Mar 2017 18:19:04 +1030
X-Google-Sender-Auth: zcFkIeyy0TLCx5z5z20_hDVPNX0
Message-ID: <CACPK8XcUwKwKg9+GicrbDhXus2=McRj+Bk5mc71vovayKmHKNQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Don't scan after
 fsi-gpio_master unbound
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
X-List-Received-Date: Fri, 03 Mar 2017 07:49:28 -0000

On Fri, Mar 3, 2017 at 7:45 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Check pointers prior to scanning master in the sysfs scan
> file.  These get invalidated after an unbind operation.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v2:
>     Return error if invalid pointers passed in.

Thanks, I think this is better.

Applied to dev-4.7.

Cheers,

Joel

> ---
>  drivers/fsi/fsi-master-gpio.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index c5f4f9c..49f3399 100644
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
> +               return -EINVAL;
> +
> +       master = dev_get_drvdata(dev);
> +       if (!master)
> +               return -EINVAL;
>
>         fsi_master_gpio_init(master);
>
> --
> 1.8.2.2
>
