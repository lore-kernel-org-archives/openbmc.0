Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLNNz1lzWzDrKW
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 12:16:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hzTEygG1"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id n83so2028623ywn.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jul 2017 19:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=R2kAZe6WnygkkE4XYwRcIUdVmvsUV3IUYeydDNk7JN4=;
 b=hzTEygG1h36eLOGGPx80v3jZll6snd+HL6ZnI0kMSsBK9nME1cTknHikh9s/qwUK+f
 PpT+frD6U1tkqXXq0z/7O308tQ+stsvyKCLcaEJlgPc1eLDqcTcsoiaUviqTuJ1bHowX
 Wyy566XDbT8LwLbXZEVrGpO6To3budJzFhhhqdc20jO9/vWj6tInQQvO0kr75K5mr/m9
 XW0mSNz2ziPwM2h3ogDlmd0NqFU4yYbAegjgC1YHoFCOD/Ki75O88Q404zPBsuOgemng
 xUeoSn9RBgxBbIUpRX/b0DS/YHsd9QVxuyyBuEDPOu1R4U2+xjiD5pqPgH6rB3qTV+FM
 rg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=R2kAZe6WnygkkE4XYwRcIUdVmvsUV3IUYeydDNk7JN4=;
 b=uQhs2UVecECPTAoSod9KHcqCDQTf4tKoUEVu2I99L3O+gzVKwaX913NoDSYHv5X1IN
 sKd8IZq2YE87Z5fC3tT5xzWiHWTqtMkLhkJZ8fwcJqvNssvslAmuB6hJNgblvPMZPfMo
 fDVpN4imhDx88vTYCINjuLOosyOg2oZZbKfyk7xI9VfdA1dtRfvypkwu3SjHQ2vuorKO
 nk4mQFIfqWEVFwfCctURoNiDPrHYz4z0GGSjioUJXhOOErqQuMTXBXB7RBrWjFLa5MCV
 V22fknWGdqBSrNum6iBMvnjiUjVc91MxGnIa9dz+WNhp0A6fzbcsBZPHqkwFwwAk3Do7
 mepg==
X-Gm-Message-State: AIVw110UstduocCU9aUTmG6F91XEz5AZ18ugjrMKMm0g+l2mD6/x28hm
 mcg2gvDMtli+ZCaK15bClQQWQN3lRw==
X-Received: by 10.13.235.198 with SMTP id u189mr12046625ywe.360.1501467392849; 
 Sun, 30 Jul 2017 19:16:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Sun, 30 Jul 2017 19:16:12 -0700 (PDT)
In-Reply-To: <16278DBF-DA73-4BFB-AEEE-1D07E7A89DEE@fuzziesquirrel.com>
References: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
 <20170729183638.17503-3-cbostic@linux.vnet.ibm.com>
 <16278DBF-DA73-4BFB-AEEE-1D07E7A89DEE@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jul 2017 11:46:12 +0930
X-Google-Sender-Auth: idz08Sa1amlsdDJKH0AAaQ3mrEo
Message-ID: <CACPK8XdhG7Jks3m0v7yrXShQCSW0Zv8Ad_ymdepF-kKJk5javw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v6 2/2] drivers/leds: pca955x count LED
 lines as GPIO
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 31 Jul 2017 02:16:35 -0000

On Sun, Jul 30, 2017 at 10:20 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Jul 29, 2017, at 2:36 PM, Christopher Bostic <cbostic@linux.vnet.ibm.com> wrote:
>>
>> In order for gpio-keys-polled driver to properly register pins
>> connected to the pca955x chip it is necessary to count 'LED' lines
>> as part of the total gpio count.  The assocated gpio_chip struct
>> for the pca955x is then set to all available I/O (LEDS and 'GPIO').
>> Failure to do so will cause any pin # > GPIO pin count to fail
>> gpio-keys-polled probe/registration as it falls outside the bounds
>> of what the gpio_chip struct indicates is available.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> Tested-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
>> ---
>> drivers/leds/leds-pca955x.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>> index 9216742..4fa58b9 100644
>> --- a/drivers/leds/leds-pca955x.c
>> +++ b/drivers/leds/leds-pca955x.c
>> @@ -472,6 +472,8 @@ static int pca955x_probe(struct i2c_client *client,
>>                       ngpios++;
>>                       break;
>>               case PCA955X_TYPE_LED:
>> +                     ngpios++;
>> +

Hey Cedric, does this look like the correct fix?
