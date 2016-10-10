Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st1mb6JqtzDrbk
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 00:53:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=yDODQxX7; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id e12so1337861oib.3
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qjtoBD7TSzbLmMwDkwV517tlmTJDI84lco3zexmN5PU=;
 b=yDODQxX74wPtE4sveobDaeAMvob4IvBBZySkWq5ls3TrDEr52i7dzOmK6iFNCs8qP1
 x03eBIyUbwthmN4bUF0SUxUrfC+F0KfkuSZPcp7+mC/0wuYc3QxopwMOWSZbecQ9gua7
 Hwv9LyKgZPvT8qOfDgsuiDntxK2x/zVCooX2DX2TaIrAHMwQxy2ZYas0wesX/SxZGEbh
 +LB4CYKX9eEzEqOZ5UnPJhQvOfEJS6HpQkx516uUTntRxYmnOWwWLvT2i6NO2vj5UMhR
 5MKAgTQbJIIAzyYYCD3XaG1tgVDT6Z8N25JQnq7iQbxXHdFO6QwiejWLGWno3JUvhTZa
 QSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qjtoBD7TSzbLmMwDkwV517tlmTJDI84lco3zexmN5PU=;
 b=I56noTQiHMIvRpltIulPsJrj0OCNHm2G096prf6NjoqlRPbvAgZDAePDRZOLCtrMs5
 rOdeDsDjtB0Xegg/pRXSm0Rhu/ZiQxwLCK+y027IejY1jjZpI60v4vPRQW6UeVeplDFT
 jYgRphzEEBMimBBfsc0of1yMMOuFp9W3SZVFZjBv7qvb1osnHZFojr7u43cHQnR3N0Sq
 NKhLwtm/rWTeKd/XNfRR3otITJ4eule9ZBzMalYh2MNo6f6dCoTal8gq4CQFWqibFTMN
 vkzfwgM2vwOdLHD9vU8eOHlAXKtrr4tUZJ6VCdmDySViLD9fQPiHnWbK78vgye9vBYoh
 Q63g==
X-Gm-Message-State: AA6/9RnjqDQBLeqbpmXw0RJBBhwCFtZV7TsyQI8VjFWzIBOF0krmpuPEdFa1g24nHNO5Cu/3KHkfW9L63FAZcA==
X-Received: by 10.202.117.66 with SMTP id q63mr980737oic.185.1476107598136;
 Mon, 10 Oct 2016 06:53:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Mon, 10 Oct 2016 06:53:17 -0700 (PDT)
In-Reply-To: <bf2fa509-3c91-4969-f598-96806594e117@ozlabs.org>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-17-git-send-email-christopher.lee.bostic@gmail.com>
 <bf2fa509-3c91-4969-f598-96806594e117@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 10 Oct 2016 08:53:17 -0500
Message-ID: <CAA0LjjUpFw5bv=WYp+zuPQU7rUtjxkr0YJZC-g3s_9pDDMsX_Q@mail.gmail.com>
Subject: Re: [PATCH linux v2 16/17] drivers/fsi: Set up CFAMs for communication
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
X-List-Received-Date: Mon, 10 Oct 2016 13:53:20 -0000

On Sun, Oct 9, 2016 at 7:56 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> +/*
>> + * Issue a break commad on this link
>> + */
>> +static int fsi_master_break(struct fsi_master *master, int link)
>> +{
>> +     int rc = 0;
>> +
>> +     if (master->send_break)
>> +             rc = master->send_break(master, link);
>> +
>> +     return rc;
>> +}
>
> OK, looks good.
>
>> +static int fsi_master_fake_break(struct fsi_master *master, int link)
>> +{
>> +     if (link != 0)
>> +             return -ENODEV;
>> +
>> +     return 0;
>> +}
>> +
>> +static int fsi_master_fake_set_smode(struct fsi_master *master, int link,
>> +                                     uint32_t smode)
>> +{
>> +     if (link != 0)
>> +             return -ENODEV;
>> +
>> +     return 0;
>> +}
>> +
>
> Since these are no-ops...
>
>>  static int fsi_master_fake_probe(struct platform_device *pdev)
>>  {
>>       struct fsi_master *master;
>> @@ -63,6 +80,8 @@ static int fsi_master_fake_probe(struct platform_device *pdev)
>>       master->n_links = 1;
>>       master->read = fsi_master_fake_read;
>>       master->write = fsi_master_fake_write;
>> +     master->send_break = fsi_master_fake_break;
>> +     master->set_smode = fsi_master_fake_set_smode;
>
> ... we can just leave the callbacks NULL (the wrapper functions check
> this).
>

Hi Jeremy,

For break and smode callbacks I did what you had done for
fsi_master_fake_write( ).
I'm not sure how mine are any different?

> However:
>
>> +static int fsi_master_gpio_set_smode(struct fsi_master *_master, int link,
>> +                                             uint32_t smode)
>> +{
>> +     int rc;
>> +
>> +     rc = _master->write(_master, link, 0, FSI_SLAVE_BASE + FSI_SMODE,
>> +                     &smode, sizeof(smode));
>> +
>> +     return rc;
>> +}
>> +
>
> Won't this always be implemented the same way on all masters (ie, a
> write to a particular slave register)? Why the need for a
> master-specific callback here?


This will be different for various masters based on the hardware
issues mentioned
in previous notes.  For example the cascaded master needs to set a different ID
in smode.

>
>> +#define FSI_CMD_BREAK                0xc0de0000      /* Break command */
>> +
>
> This isn't used anywhere; what's it for? It doesn't look like something
> that all masters will use, so shouldn't be in the global master header.

OK, I'll move this out of the global master header.

>
>> @@ -29,6 +31,9 @@ struct fsi_master {
>>       int             (*write)(struct fsi_master *, int link,
>>                               uint8_t slave, uint32_t addr,
>>                               const void *val, size_t size);
>> +     int             (*send_break)(struct fsi_master *, int link);
>> +     int             (*set_smode)(struct fsi_master *, int link,
>> +                             uint32_t smode);
>
> See above comments - do we really need a set_smode callback?
>
> Cheers,
>
>
> Jeremy
