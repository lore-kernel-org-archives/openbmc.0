Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syNKd1Xp0zDt8w
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 03:03:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=M35JY5gF; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id e12so12673316oib.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=P76mJuOunWwjsJT+SyOCgQ8RCWyR6iOXLyJPD9UBsFI=;
 b=M35JY5gFLF8GUaZR7Xm+5Jdycgc0TjHu12JXxpsu/cXe9wfxEb4n6oqFkYhwsQCgVR
 aBnMJ6D/pptKNqlbGpOJt6UVZb35MLMTBiSAvWUllhyElElDxbLG2i0Y2oJKd4xWxaJZ
 x5tU0wNcpuX7QNPVLrdx4GpGfvdBFEbmWg47FsNEeZbWhBcGdigKstlO90TMNrqbgyw9
 W8Pzw9LROLyIBl90AAhSflFRTR4Y2iiyMSqGVJTAyqJ8dcneb4v0taKND4eSNuInqQ4n
 Gexx8YzoRN1rda7L9MX+W1i9XlljtmJM+7SDCd+7ZJFd/CXunh5JMeAwo/libnPNjOA+
 Lyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=P76mJuOunWwjsJT+SyOCgQ8RCWyR6iOXLyJPD9UBsFI=;
 b=TWRRBpEfq4YAL/zI89L+9QYiH5RhK6KaujE6FIJfKOcKZwggO4p2r0OdE/i38h7+DK
 kcUbdkwKmUDeyuuClw+oiVD9ddkT5EhGiExUTR4hmvqj0zdoKr9jEmPXmvp6oGwkxcNM
 n+sZPp4/JttD7NAsFoKWEg3+VC+w9hbN9tjIxHCsbdqGnqw42C75Ex3t/vQpzD3Auism
 3pR1zl5Wyzy98QRPos/v1KknRuFiQ97TanIQYvh3t9noqB57dd73RrcgjDmLYNNl9nJN
 xdwH254ms1YzVEVBjEDOvMkUlW6aFW1Yot/6TFYGbljQ/ZXLBvVv3XyQ3JUN4wv/YTsy
 zjOA==
X-Gm-Message-State: AA6/9RnVSpHQPxS8sVQhl5FHoEGd95ytxDD5vzW/K9JVMS20cI6stVkAfzPkRmSd9Y6sdcXu3gNrOyF6uEoXYA==
X-Received: by 10.157.34.106 with SMTP id o97mr14222769ota.134.1476720211491; 
 Mon, 17 Oct 2016 09:03:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Mon, 17 Oct 2016 09:03:30 -0700 (PDT)
In-Reply-To: <c4ea6133-9286-b650-3375-f899121f2ce3@ozlabs.org>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476483282-85971-20-git-send-email-christopher.lee.bostic@gmail.com>
 <c4ea6133-9286-b650-3375-f899121f2ce3@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 17 Oct 2016 11:03:30 -0500
Message-ID: <CAA0LjjX=+xu8Z3w9VZpq8WHGbZCAVCF3541aHNf+yN1w2Sqe1A@mail.gmail.com>
Subject: Re: [PATCH linux v4 19/20] drivers/fsi: Add client driver register
 utilities
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
X-List-Received-Date: Mon, 17 Oct 2016 16:03:33 -0000

On Mon, Oct 17, 2016 at 3:12 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> +int fsidrv_register(struct fsi_driver *fsi_drv)
>> +{
>> +     if (!fsi_drv)
>> +             return -EINVAL;
>> +     if (!fsi_drv->id_table)
>> +             return -EINVAL;
>> +
>> +     return driver_register(&fsi_drv->drv);
>> +}
>> +EXPORT_SYMBOL_GPL(fsidrv_register);
>> +
>> +void fsidrv_unregister(struct fsi_driver *fsi_drv)
>> +{
>> +     driver_unregister(&fsi_drv->drv);
>> +}
>> +EXPORT_SYMBOL_GPL(fsidrv_unregister);
>> +
>
> Minor, but I think fsi_driver_register / fsi_driver_unregister
> would be better names; we don't use 'fsidrv' elsewhere.

Hi Jeremy,

OK will change.

>
> Do we want a module_fsi_driver macro (similar to module_platform_driver)
> to reduce boilerplate code?
>

Will add.

Thanks,
Chris

> Cheers,
>
>
> Jeremy
