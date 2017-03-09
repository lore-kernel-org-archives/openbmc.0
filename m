Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vf6jQ0dT6zDqZc
 for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2017 21:54:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lxvg5BmT"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id 2so812690ywn.3
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 02:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lP5wTnd9S3OSnjXVpkHEoB01sdzsQFyXcVxIH0USqKA=;
 b=Lxvg5BmT/UGgVxo7EWA1C2sIyC6iSvPSqgtYfPrlJpJe2G8vPtO9Vyq2lTA7rJjLn1
 /155dYBzkP8UOMtegaFScE04jsdsk6ry93TFCjhNEIa0m+iLlBDTFChgiSot+QemN4CR
 D149T+hSkuHPmrsDN2GggE5S5T721szbN90mP26mATH/4LMTBULTc07rQToh9fvpayx+
 luplnrwhjP7cBJ6x6A5mQOpbg8GxLhaAS14s5//2cVh62BoqkQ0WrQHHfgoZ9W6DB47S
 g1RycOdvBpBDvWoKjZFGYwHmEz5Ppd9A6FRTK8ZR6x7oCRChk1qDt0hNbHkvTX5++oTL
 YX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lP5wTnd9S3OSnjXVpkHEoB01sdzsQFyXcVxIH0USqKA=;
 b=kL+clqus4dAa67HphD/IklBhfBPdWCE0skSe8Mbjax9/zv4uC/yv2V/lVdA3SekiuU
 mtBkrSK0wOWRKT4jdCVcZjUesIFZvzEIIKkcKfWlDFr0BVxorzTJtdi/EEVprIh7qQGE
 xz5P1ubz1cceP/BlmQ4zm/ejCLeHhpGhwFr4XW+dRLX81jaY2WZTguRV+2GFd8EgsNAa
 sRy3iLn8MGjqm0TJkspgwCm7L7rXVttFIzu1pgZtgqHr7pBe1CKNba3izCC+fXiPV642
 r20gNeqEW05cA55nkpFwzfsr0+pWTUGYLuquWF6ycraVgfiVLy2fcAi6XydE6goy+Ta7
 u0BA==
X-Gm-Message-State: AMke39mAqDZsEOZhlyHhuGr1Unlev4UpoR3ug+fBTuliUAInfo7r/nCIbreYcDUmGJhzfAPzzoDKF6wKyUfW8w==
X-Received: by 10.129.73.65 with SMTP id w62mr3185463ywa.288.1489056887622;
 Thu, 09 Mar 2017 02:54:47 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Thu, 9 Mar 2017 02:54:27 -0800 (PST)
In-Reply-To: <CACPK8XdTiDztehaeFSpKDNhL4Gw75Fyb=+h4cQ3RiPXoqDy4mQ@mail.gmail.com>
References: <20170308195606.11618-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XdTiDztehaeFSpKDNhL4Gw75Fyb=+h4cQ3RiPXoqDy4mQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Mar 2017 21:24:27 +1030
X-Google-Sender-Auth: f91rwZAuOEq53Q_2U06E5ZxIKRc
Message-ID: <CACPK8XdtGo2nAOYXGuUEW4A8mYc5PfhcxWQHm+GiboS6=f6m+g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Free up allocated resources on
 fsi-master unbind
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
X-List-Received-Date: Thu, 09 Mar 2017 10:54:50 -0000

On Thu, Mar 9, 2017 at 9:20 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Mar 9, 2017 at 6:26 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> In order to allow repeated bind/unbind operations on fsi-master
>> the resources allocated during bind must be freed. Specifically
>> the scan file and dynamic memory.  Also check for valid pointers
>> during unregister which is the path taken during unbind.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> This patch does not apply to dev-4.7. Can you please rebase it?
>
> a4a89c237856e2ee3b00db7cd5febf075b695760 is the tip of dev-4.7 at the moment.

That should read e97a91f178e55719b08d48af7f592b18cfd4da91.

>
>> ---
>>  drivers/fsi/fsi-core.c        | 8 ++++----
>>  drivers/fsi/fsi-master-gpio.c | 2 ++
>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index bbdf6b8..751c767 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -869,11 +869,11 @@ EXPORT_SYMBOL_GPL(fsi_master_register);
>>
>>  void fsi_master_unregister(struct fsi_master *master)
>>  {
>> -       if (master->idx >= 0) {
>> -               ida_simple_remove(&master_ida, master->idx);
>> -               master->idx = -1;
>> -       }
>> +       if (!master || !master->dev || master->idx < 0)
>> +               return;
>>
>> +       ida_simple_remove(&master_ida, master->idx);
>> +       master->idx = -1;
>>         device_remove_file(master->dev, &dev_attr_fsi_ipoll_period);
>>         fsi_master_unscan(master);
>>         put_device(master->dev);
>> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
>> index 49f3399..3693b3d 100644
>> --- a/drivers/fsi/fsi-master-gpio.c
>> +++ b/drivers/fsi/fsi-master-gpio.c
>> @@ -566,6 +566,8 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
>>         if (master->gpio_mux)
>>                 devm_gpiod_put(&pdev->dev, master->gpio_mux);
>>         fsi_master_unregister(&master->master);
>> +       device_remove_file(&pdev->dev, &dev_attr_scan);
>> +       devm_kfree(&pdev->dev, master);
>>
>>         return 0;
>>  }
>> --
>> 1.8.2.2
>>
