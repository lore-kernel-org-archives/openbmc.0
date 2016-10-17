Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syM5q5H5SzDt26
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 02:08:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=t4DjJDBz; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id e12so12577995oib.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Cx/Oc3uR2FmNK7JKKyswe18otgfWCCLl2VRyeabbjoU=;
 b=t4DjJDBzPGJSQQ0HOUWZymC0CpbaXEpwAdr76wBNe7eX5xKvFDB7yZSvKQ2UuRq1ap
 FNKZJN7lr81oI+AaLfQ7j35LA4UEp11OfCsqokLlQ+0OmLXoN9kCZVAWQ0VkRipcDP25
 4rkRcd6R1ENJCqZWrw2laixCHvGSubX6CHLMhyDKXZz8PUGoDp3C2kLgQJAYI07f4UJZ
 enWnr5ci/nqB+mbMGftrf9DLq0RkO2Mu1hreFZt2XyadiS5HXUpu01BOMXESd67Hzaxx
 lHufDM8NE67j8Ziu+2r5I53IgYFNMkIGq0z+pRkkLVaw8WL+SKwENcOF5DR668wPoxaG
 vzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Cx/Oc3uR2FmNK7JKKyswe18otgfWCCLl2VRyeabbjoU=;
 b=WIbMbaXELPnia6PVF6RAyM/+m+vgS34/VqNZxOUuNY4cKY8Eps6YEsMWsv4xbtrbEq
 G5SyHZq/rJXAvmQauIJVRScCarRYI+VvrwkviPFszzGOfTBZe6BA9eARny+oYPR412bm
 FR89hZLNEzGfPec4FO4KHDUJ7uEkFuNH5P/e9BfuoJuXsH8NXppPZkiiXbsPL4ehAwDq
 R7hPmj5mXNvuicocUNKjPu5f900axhj79pRGk0aqywcEmG3e/xxNzW0skfs4xPZxtlAl
 uyW1S4dYmXAR+AYAHPJTdYxmOBRgPHnCFz5ULos2nsr6mbgs3I2BpD66qBv/9mgCFF14
 W48w==
X-Gm-Message-State: AA6/9RmL1bD/EM00fER1iFxIb+iksgFu3RqUpiEPb3N7PXg9ZUeiPEs8T+aS0CSMeddii905wxmwJiRHFKd0Lg==
X-Received: by 10.157.46.93 with SMTP id c29mr13461229otd.35.1476716893658;
 Mon, 17 Oct 2016 08:08:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Mon, 17 Oct 2016 08:08:13 -0700 (PDT)
In-Reply-To: <d1b72625-09be-269a-754f-3fe87856523d@ozlabs.org>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476483282-85971-18-git-send-email-christopher.lee.bostic@gmail.com>
 <d1b72625-09be-269a-754f-3fe87856523d@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 17 Oct 2016 10:08:13 -0500
Message-ID: <CAA0LjjUOXNpbQkTQ8UbVyBbZv_uO7fRQwjm5Pxw4jQ8jNH2R8g@mail.gmail.com>
Subject: Re: [PATCH linux v4 17/20] drivers/fsi: Set slave SMODE to init
 communications
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
X-List-Received-Date: Mon, 17 Oct 2016 15:08:16 -0000

On Mon, Oct 17, 2016 at 2:04 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> @@ -301,15 +376,26 @@ static int fsi_master_link_enable(struct fsi_master *master, int link)
>>  static int fsi_master_break(struct fsi_master *master, int link)
>>  {
>>       int rc;
>> +     uint32_t smode;
>>
>>       if (!master->send_break)
>>               return -EINVAL;
>>
>> -     rc =  master->send_break(master, link);
>> -     if (rc)
>> +     rc = master->send_break(master, link);
>> +     if (rc) {
>>               dev_info(master->dev, "break failed with:%d\n", rc);
>> +             return rc;
>> +     }
>> +     /* Verify can read slave at default ID location */
>> +     rc = master->read(master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
>> +                     &smode, sizeof(smode));
>>
>> -     return rc;
>> +     /* If read fails then nothing on other end of link */
>> +     if (rc)
>> +             return -ENODEV;
>> +
>> +     dev_dbg(master->dev, "smode at ID 3 after break:%08x\n", smode);
>> +     return 0;
>>  }
>
> Should this smode read logic be in fsi_master_break() at all?
>
> I'd be inclined to keep the slave detection separate. If it's necessary
> to check for slave presence, we can do that in the caller.

Hi Jeremy,

OK, will move.

Thanks,
-Chris

>
> Cheers,
>
>
> Jeremy
