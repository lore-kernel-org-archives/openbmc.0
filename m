Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x242.google.com (mail-ob0-x242.google.com
 [IPv6:2607:f8b0:4003:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5DE851A0331
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 10:48:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=H96WcTDq; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=c7uGTaVd; 
 dkim-atps=neutral
Received: by mail-ob0-x242.google.com with SMTP id o4so14697866obb.0
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2016 15:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=+ZR/GxFSXgD84M7qVXB3l0chq8aaZ92zxdAjwcdshg8=;
 b=H96WcTDqih26u9Ios9h3rpXCAfezDJJ7TV8TgtAk3MnYl8m2h3DouhSUjzPYOMdk0L
 3CkGfRWiLp6tSzrbV0nuxi4pe7457S7G4YzNOALdmHPlA+9gbJfWcYAZje6MqaWcrs6z
 CLYk/OBbmvDzuYUM1rYWub8dW0bzVcNmxrW2JGARKrHzzuUPfrNmYSfvQYx1iQI3NrcW
 Nbo8he9per3vBflsI8CGfH4xGVYbOL0BQiwJy4M2Ww/6r9dibVIdsMQWbQry6lVMmjDn
 clnWLv7jfC3Pv35iIm/OpYVtYvIPAgylGXbHIGp0+Wdh759mKkzIJL/QilsPM3d0RCRX
 TKNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=+ZR/GxFSXgD84M7qVXB3l0chq8aaZ92zxdAjwcdshg8=;
 b=c7uGTaVdtFVoPgh4+FWEKhyN77jxGIyTRfANuf0G01gCJFoFMDY71+7xSKqa6ogcfW
 kf7WzFGDEyR8ZsJODJJOhw8A5Jj0gqgJ9Wb+WYeUTmhbxyeZyuXmwashuUhH+qO4D9uv
 5aZldHvs2uJd5bgKYALJeoTrk+mNxcWgpkJ/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=+ZR/GxFSXgD84M7qVXB3l0chq8aaZ92zxdAjwcdshg8=;
 b=AMlnVovk6hf+j4ztuPQwCylCTg09beSTYeN2YeDp96S3PQBSzFvQnOWkYbNoeks637
 GYh29CJj3lDKFnhxMDEM581v5uF2Ah967vkLAj8B2fLwdVx93faHpnXhVJAkuxMKWF5f
 HoJN3nNpvUgDb6d1znd/PQGXqJ015GcOrzMkkDronMJQ2Nwh0eLFJnnhlmgdBU996YmP
 GNine7uFbq7Yv2pRsUhIVdmc+p6DvuIeRr7s/fG4jhJ95lDNKUk8TaTxG5cKfn0avY7i
 j4SUwfLaIBP+6jH3sJ++CfXaRDIobQE0A7VZyrm3VxJ/gAA/rTZizRTWVc1JPKm/n5Cb
 guUw==
X-Gm-Message-State: AG10YOS0rnZfzjKbln5XzQktrTJV7YXpgg00O10/n0psHCzIvklk1i+wEkVvHzE8aVHZq1kISupr0BVapOXGIA==
X-Received: by 10.202.196.208 with SMTP id u199mr9511257oif.71.1455493698050; 
 Sun, 14 Feb 2016 15:48:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Sun, 14 Feb 2016 15:47:58 -0800 (PST)
In-Reply-To: <201602140035.u1E0ZOPC022801@d01av03.pok.ibm.com>
References: <1455154228-7217-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455154228-7217-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XedTDoPRTc2madutwo_qJcJ4VinuXnXfFGpiQaJ1iinng@mail.gmail.com>
 <201602140035.u1E0ZOPC022801@d01av03.pok.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 15 Feb 2016 10:17:58 +1030
X-Google-Sender-Auth: 84bD9u9I9D0dQDi6FGT947CwDi4
Message-ID: <CACPK8XdeJpLCmJEnP8PcYynRguz9g7sCWstJHpNtHcQOnZhPjA@mail.gmail.com>
Subject: Re: [PATCH linux 1/2] i2c: aspeed: Don't rename added devices
To: Milton Miller II <miltonm@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Feb 2016 23:48:23 -0000

On Sun, Feb 14, 2016 at 11:05 AM, Milton Miller II <miltonm@us.ibm.com> wrote:
>
>
>
> On 02/11/2016 10:23PM, Joel Stanley wrote:
>>Subject: Re: [PATCH linux 1/2] i2c: aspeed: Don't rename added devices
>>
>>On Thu, Feb 11, 2016 at 12:00 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
>>> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>>>
>>> Changing the name of a device with dev_set_name after device_add
>>> is not allowed.
>>>
>>> However, of_create_device takes a bus_id parameter that specifies
>>> the name of the platform device being added.
>>>
>>> This does mean the bus property has to be retrieved multiple times.
>>> Creation is skiped if there is trouble retrieving or formatting
>>> the name.
>
> Spell checking this pointed out skipped above is missing a p in the
> commit message.
>
>>
>> Ok, this approach looks alright.
>>
>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>>> index 5488233..ccb438f 100644
>>>         for_each_child_of_node(pdev->dev.of_node, np) {
>>> -               of_platform_device_create(np, NULL, &pdev->dev);
>>> +               int ret;
>>> +               u32 bus_num;
>>> +               char bus_id[sizeof("i2c-12345")];
>>
>> Clever, but I don't think it's kernel style. A constant will do.
>
> git grep  'sizeof("'  | wc -l
>
> yields 235 occurrences, 94 with an additional \[ in front.  Including
> well maintained sections of the kernel like vsnprintf for uuid length
> and network code for formatting ip addresses.
>
> I admit the 5 digit bus number is a bit arbitrary, but I think the origin of
> a constant will be less clear than this code.

I was referring to doing sizeof("constant string").

>
>>> +
>>> +               ret = snprintf(bus_id, sizeof(bus_id), "i2c-%u", bus_num);
>>> +               if (ret >= sizeof(bus_id))
>>> +                       continue;
>>
>> You should check for a negative value as well.
>
> It's defined to return "the number of characters which would be written to the buffer",
> not sure how that can ever be < 0 other than the undefined overflow of the int type.
> vscnprintf doesn't consider a need to check for < 0.  The size_t input of the underlying
> vsnprintf is checked vs INT_MAX and returns 0 in that case.
>
> Can you point to other kernel code that checks printf family for returns < 0 ?

I was thinking of the userspace man page which suggests snprintf
returns a negative value on error. You're right; the kernel
implementation doesn't ever do this.
