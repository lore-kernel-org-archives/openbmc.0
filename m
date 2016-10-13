Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svwv56WkfzDt0b
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 03:20:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FmNXqBAB; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id i127so5852452oia.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=S2/eBRgBicjwU/D4Cze+rJSpWQuLDL2Vpaj9Ey1J8zE=;
 b=FmNXqBABzMJTp83bAJxTaqXCWCAph+/MvLyaDizeUDKvVf9JFu+QGnIJgZBR9YyFHd
 RYm8QRm/zEaLNrTI6s10oOD538XjmMsIAW/v3kUZZWWPGsbWJbj6OIHnNk1ZwhKc34Tv
 OtA/Lojwd6HLjBQ+oBjX4F1lKTa5EuzExm8ZwiBuiABZHnc5biLSt81JYVLZksvoJiPH
 gsKNknVhpWLH3w3/sdyEE4Y05TMf3/4Ox9X4IFNDtSXhb8zmGEBHH8qr/OAtDGhxp8qB
 qUu2YhiYr0eDjf0dLyu4qUP1bG9CyXILXn+fJnPAH/SSdp9CKV233PXjBu+bVezzVsXD
 99fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=S2/eBRgBicjwU/D4Cze+rJSpWQuLDL2Vpaj9Ey1J8zE=;
 b=SuTnqkT5tSzdUfv+rWv70wFslyGELpzgI67jWzvTwpqRb2a8GswyrmAyyPSUdvis30
 k+w6pzYJcq/Uq5YpqljC5H3ziJdejYMazBiLk8P8DKYw24Ql7AC+VREc0pcxjahopRrL
 EbKlxkOgTDwoJlmmEKZFDq5Mmbcv18WXxlbEZTysEpy/Bl79ZZKCJ1/Re0C9C5WebP+M
 q+Pwf+pf6MmMsobcdR8cGeemmSYr0VQbrYYuwcpbNCydApSKRZ+iO7P6bo+spNWURoM+
 3Fqkwdv76x6VN2N4JJHSHCGU/sNyfa7q1uVC1eJIGAmS0EHg1uJ4n4McYuVwZh1WnbzX
 5NzQ==
X-Gm-Message-State: AA6/9RkYayF6euQcDfkgEDYLjVPfeGIAY3nGCQ1OR4QjcyITlRbDBoWAqypi5qmSYlnks6MlHw7yNU2a4LzfRQ==
X-Received: by 10.157.20.173 with SMTP id d42mr4036829ote.100.1476375632081;
 Thu, 13 Oct 2016 09:20:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Thu, 13 Oct 2016 09:20:31 -0700 (PDT)
In-Reply-To: <3e7c44ea-9433-73d5-9231-aac37594e6a3@ozlabs.org>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-18-git-send-email-christopher.lee.bostic@gmail.com>
 <337bc0ed-9f0c-afb3-d35d-3962ab7a17b7@ozlabs.org>
 <CAA0LjjV8OJFNesgcebxwhWBJkT_i2ZLnG-8HFzp8nE7WqP+3qQ@mail.gmail.com>
 <3e7c44ea-9433-73d5-9231-aac37594e6a3@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 13 Oct 2016 11:20:31 -0500
Message-ID: <CAA0LjjUw2WDsPdaoCrsf6ozprJs34gaXW_S2k3dnmLQmChgdfA@mail.gmail.com>
Subject: Re: [PATCH linux v3 17/18] drivers/fsi: Add GPIO master functionality
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
X-List-Received-Date: Thu, 13 Oct 2016 16:20:34 -0000

On Wed, Oct 12, 2016 at 8:16 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>>>> +static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd)

>>>> +/*
>>>> + * Store information on master errors so handler can detect and clean
>>>> + * up the bus
>>>> + */
>>>> +static void fsi_master_gpio_error(struct fsi_master_gpio *master, int error)
>>>> +{
>>>> +
>>>> +}
>>>
>>> I know this is a todo, but where are you planning to 'store' this
>>> information? Shouldn't errors just be returned immediately?
>>
>> This is intended to be the entry point for the bus error handling code.
>> I could return the failing rc to the caller right there but ultimately the
>> error handler needs to be invoked somewhere in the call chain
>> anyway.  As it is here the error condition is cleaned up as early as
>> possible.
>>
>> Even if the error is of a master type - such as master
>> time out errors (MTOE) there is still a possibility that the connected
>> slave is in some latched failed state which requires recovery to
>> resume normal bus communications (issue a terminate command
>> to slave, etc...)
>
> OK, makes sense. Would this logic be repeated for all masters? If so, we
> may want the core to manage common error recovery that involves the
> slaves.

Hi Jeremy,

There would be some fsi-master-gpio specifics here to deal with
but there is also a portion of error handling that is standard to all
masters so that would be spelled out in fsi-core.c.  For now, I'm
leaving bus error handling out of the first set.

Thanks
Chris
