Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vf6f91kf2zDqZ6
 for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2017 21:52:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TNqiezZl"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id h11so808366ywa.2
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 02:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=h5hbG6SoYsOxMzt0Bt5MesGwqFRoVGgiDQ/IW9QUiWk=;
 b=TNqiezZlqZpP/L5wiY5obJSGKxAWgTmCJVa4beBdLnigUSCxa0EHry/XTVCPfc2ZYo
 2FQL0pkxg1nKNkxVCwhwuGzCadpARpVIyO/ilTFjm+h66U6YMl0MUY5VxhJM1cDmfc+e
 k5zr3k1IemrMJ/GduuPuNtn1Y0HLfdmzEiRkKK7N43+QZQI6Pe4ng1aK1U5TKpOkCvwJ
 u0FGhpUfRsM5dSNZTTmRSGmyEpCFwjo4qQp9JqtGVLMaPJVu4SFEhL9/CjZ+/WXe6MY5
 H/w068ytYwW6TNRzY1w8KM0l23WrDug4vXNdPKLzGEc8XDkOjkUIwlHHHPgqklmVaQRG
 uE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=h5hbG6SoYsOxMzt0Bt5MesGwqFRoVGgiDQ/IW9QUiWk=;
 b=cXRZ4mJ8ofNCnIwbNsjFthNAoW6aSQUjL9kgehzCemnqPnR2l8Nc/nX8D0uaqXs60S
 cHTITgkJJXFQDJsZ/gyUWzYqtNCxdLpJ56bEB+SmLabM3fSMq61SLVoAmLQnCag3COQN
 bUZIApitjlZw1nDmfRpq82ErkZoEc3/2EVaXBvB5W0zD0KMnaWKfh8PKntSSJ+wEoaUS
 iRxEdVXNsr1o3dwYo3OgiRCzpdz3e2IcjA7yanLgdHNASQ/hUTngoKVP71hT9IA/sFCl
 gjXPx7aIHUeDhgpwabLh+B4CpMQMJqvSgB2218eF18laegMufsEtMEeo66rtq/wxiXel
 +Ekg==
X-Gm-Message-State: AMke39n/Lmipz8HO9HGJLOyUWLhtJURSwEtX5ijKjNhJqlIFyRetwdhm6f6YkuknN1qApiqlr87G/2krZEcbiQ==
X-Received: by 10.129.91.194 with SMTP id p185mr3101961ywb.50.1489056717788;
 Thu, 09 Mar 2017 02:51:57 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Thu, 9 Mar 2017 02:51:37 -0800 (PST)
In-Reply-To: <20170309000213.20262-1-cbostic@linux.vnet.ibm.com>
References: <20170309000213.20262-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Mar 2017 21:21:37 +1030
X-Google-Sender-Auth: uM_w-GDQmkyhbrGw07jCnE_-PTw
Message-ID: <CACPK8XeqJ47Sj+X1ZpPKRUBFrmwaZzT1YDNwUBHRvxzZcAXQOg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Flag FSI bus errors with
 dev_err( )
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
X-List-Received-Date: Thu, 09 Mar 2017 10:52:01 -0000

On Thu, Mar 9, 2017 at 10:32 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Currently not seeing details of any FSI bus errors that may
> occur.  Send info via dev_err so that the type of FSI bus fail
> can be determined.

Are these really errors for normal users of the system?

I think these will only be useful for FSI developers. Use the dynamic
debug system for having developer errors.

>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-master-gpio.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 49f3399..c2f2fe2 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -218,8 +218,8 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>                                 break;
>                 }
>                 if (i >= FSI_GPIO_MTOE_COUNT) {
> -                       dev_dbg(master->master.dev,
> -                               "Master time out waiting for response\n");
> +                       dev_err(master->master.dev,
> +                               "MTOE: Master time out waiting for response\n");
>                         drain_response(master);
>                         fsi_master_gpio_error(master, FSI_GPIO_MTOE);
>                         return -EIO;
> @@ -257,8 +257,8 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>
>                 case FSI_GPIO_RESP_ERRA:
>                 case FSI_GPIO_RESP_ERRC:
> -                       dev_dbg(master->master.dev, "ERR received: %d\n",
> -                               (int)response.msg);
> +                       dev_err(master->master.dev, "ERRA/C received: %d\n",
> +                               response_id);
>                         /*
>                          * todo: Verify crc from slave and in general
>                          * only act on any response if crc is correct
> @@ -283,7 +283,7 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>                 /* Read in the crc and check it */
>                 serial_in(master, &response, FSI_GPIO_CRC_SIZE);
>                 if (crc_in != response.msg) {
> -                       dev_dbg(master->master.dev, "ERR response CRC\n");
> +                       dev_err(master->master.dev, "ERR response CRC\n");
>                         fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
>                         return -EIO;
>                 }
> @@ -293,7 +293,7 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>
>         } while (busy_count++ < FSI_GPIO_MAX_BUSY);
>
> -       dev_dbg(master->master.dev, "ERR slave is stuck in busy state\n");
> +       dev_err(master->master.dev, "ERR slave is stuck in busy state\n");
>         fsi_master_gpio_error(master, FSI_GPIO_ERR_BUSY);
>
>         return -EIO;
> --
> 1.8.2.2
>
