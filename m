Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0KhB6ScPzDvXx
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 07:11:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=1ChvGemn; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id 139so7800723itm.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 13:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Dj/4IZ6xCvknlqQRcsfmP8tAhaty35Zs5juIxQKxBrk=;
 b=1ChvGemnlcoz/nlCg1JC4x7Qg8brFArDF5nL8wzwRcy0ezw76VTwKClR/78qlR8Jbk
 d6V7qTaXsJcG1isFOnh1CjMKKw60aFHPHLGAn7XkG0bHG4Bq0E54FjtjUz1CxykgmveQ
 3aXDWOcFEpG7DmCFSZbjHS6ijVnJdVTN2zAtZLMyjes2Wiof5WDInVGlm8dlZJywEXXR
 eYJd1q/mPI8D21bmCfoxZI4uGODxmcjkh1ALM7rfuPwBrX/TZneAfYnPD50RSF8ib8bT
 n22/wEXWCaFlj1YeKDldYzGt4QkzR04xl12qUKMbMwjlxwOUbINRhoR3nFlDx4RDUUYK
 wtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Dj/4IZ6xCvknlqQRcsfmP8tAhaty35Zs5juIxQKxBrk=;
 b=LJqRLBzr73YVEbnegHFfbwr+Jismgo4zNvvxBNSJjzw8tbODp5dIF/CimPIntXGy0m
 Ca8JuUBkCRSREhLeYPWF+hxlQb8Htmjq/Ync5V5w9xP2UxlZKbzU1JoCkxwZK2Xx+GxX
 jFAMyFXVaLa6WqXCS2S7qo63CW0sYix1E4+omhXL0vkTzYyzUfkFJEk3mS7OS1Ejuh98
 FYi/kL0zc64URpsRhi+T6saDvQlZ8oi2LOFbEyC277zwLkw+NzCfGt6R4uyIiGGFHSGe
 +ske433b0gz9AqLOxu0xUhjzVOm1klWNvCEWuMr/yyI3ftIGnQILxnApU+Y/1L7DyH+M
 zwpA==
X-Gm-Message-State: AA6/9RlwberNEsssCSGiSCaK8178PSGZ9LcmdW9MJCC8+4MeWeOUqH1rwVycOPAonIxQV1LvUDz9XWt16PX4Iw==
X-Received: by 10.202.199.66 with SMTP id x63mr8320458oif.25.1476994280952;
 Thu, 20 Oct 2016 13:11:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Thu, 20 Oct 2016 13:11:20 -0700 (PDT)
In-Reply-To: <918db920-baf4-ef79-90fe-dc00a06a2430@ozlabs.org>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-18-git-send-email-christopher.lee.bostic@gmail.com>
 <918db920-baf4-ef79-90fe-dc00a06a2430@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 20 Oct 2016 15:11:20 -0500
Message-ID: <CAA0LjjU-5n2NPicTXuVVY0_1TU2Hug8S9o2g874bUV9tzWj-DQ@mail.gmail.com>
Subject: Re: [PATCH linux v5 17/18] drivers/fsi: Add SCOM FSI client device
 driver
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Thu, 20 Oct 2016 20:11:23 -0000

>
>> +static int scom_probe(struct device *dev)
>> +{
>> +     struct fsi_device *fsi_dev = to_fsi_dev(dev);
>> +     struct scom_device *scom = &scom_dev;
>> +     int rc;
>> +
>> +     scom->fsi_dev = fsi_dev;
>> +     scom->cdev = cdev_alloc();
>> +     if (!scom->cdev)
>> +             return -ENOMEM;
>> +
>> +     scom->cdev->owner = THIS_MODULE;
>> +
>> +     rc = register_chrdev(0, "scom", &scom_fops);
>> +     if (rc < 0) {
>> +             dev_dbg(dev, "scom major allocation failed:%d\n", rc);
>> +             return rc;
>> +     }
>> +     dev_dbg(dev, "scom major allocated:%d\n", rc);
>
> You need to register the actual device too, right? We'll want scom0,
> scom1, etc.

Hi Jeremy,

Is there any value in appending an FSI device path to scom?  Like cat'ing the
fsi device name on end.  That's what is done in existing product and it makes
it easy to tell what device is where in the topology.

Thanks,
Chris

>
> Cheers,
>
>
> Jeremy
