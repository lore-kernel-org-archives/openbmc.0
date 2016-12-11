Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcMnZ2dprzDvt9
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 10:37:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="urcf4REg"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id b35so6969212uaa.1
 for <openbmc@lists.ozlabs.org>; Sun, 11 Dec 2016 15:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qvq9hxKggLvBnq/9MXFUJCMhtSfH0caIJXNPKs+WEUY=;
 b=urcf4REgqf++IVLcVuxJB0g5HuLMdL28LMz+4faaWGhKyMR6xJBPTHEiWI7PdqXIZp
 S9sbPTWpp1jgopIsKXUfxYhAc1l2ZCBXa0d7qo9k8LHyPqaVAoqZ1nhG6sP+mNvT4Wi6
 3UmthTw+fFSoB8398mv0tRKowQrYKawbdEuhxEcwX7X8pwbK/MrI11ut8Bl27Yi2bTz3
 n3aQECvWZKcdxK7oic5r06I1EyuzArfC3HFWSLPNWaNCeiczcrRccc/SkEF/wEyuex0B
 l/t8YATZgT+kB7t/RJXEs5n4JEQBeQfdiEsuAJhMTGf5OvZq53LPo/w8N9OHGGQtKam7
 LZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qvq9hxKggLvBnq/9MXFUJCMhtSfH0caIJXNPKs+WEUY=;
 b=H3PczhLPJC94i/r1vOPR8TNKuL8UUc+ZEpA/YxbhrbBFFGaEH5iZX5iY+bw/b0HoZG
 JLXm1QlhuYN0kS89X9+b1q1h77rk/1MxYa+Wn2Eyf2+QGyau//Clm288SDm1GOUEjsWx
 p4Wg6uvsRQqKBbykhIuZklhBAwPbfJlyHgIRFVighsLAh0qPJ53U/dbxHJUcGzA40nhl
 ibiHoo2MfYSdziaNrk0K2ACegW28lhZ4I1pmmOHgl6DVBjFQ1IiRQAVUOl0voTmPtYDQ
 dzspDSdl+khZkbQwx3JmPK8Mr4UXQK1+OZGJ3fibx6SzT3oqS1yuqZv6+L86Cwk7Ky9H
 scZA==
X-Gm-Message-State: AKaTC00FTXsnfXSAO98Vxt8sgI1U2CciyluT02XeznXDaMj8cEpkocJUbKgMmYPby+YzOPtJnn46YlVQ0PCdGA==
X-Received: by 10.176.82.157 with SMTP id v29mr59013859uav.123.1481499421432; 
 Sun, 11 Dec 2016 15:37:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Sun, 11 Dec 2016 15:36:41 -0800 (PST)
In-Reply-To: <de14e2a8-06f3-19f9-c783-3d05e6856993@linux.vnet.ibm.com>
References: <1474336344-1821-1-git-send-email-tpearson@raptorengineering.com>
 <1474336344-1821-2-git-send-email-tpearson@raptorengineering.com>
 <CACPK8Xf+m04SOBSV8EJ_xYR3qONU5ydbmA-3LPabZVqE2kvuYw@mail.gmail.com>
 <57E54486.6020304@raptorengineeringinc.com>
 <de14e2a8-06f3-19f9-c783-3d05e6856993@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Dec 2016 10:36:41 +1100
X-Google-Sender-Auth: Z84O11WxgRluDPZF65juGy8zEVs
Message-ID: <CACPK8XfZ=yHgx75xBgy8kyQqxpCLwW406hyKvQYfiBpnC6Hvqw@mail.gmail.com>
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 11 Dec 2016 23:37:07 -0000

Hi Matt,

On Sat, Dec 10, 2016 at 2:55 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> Hi,
>
> We're getting closer to needing the hwmon driver for this.  Has anyone heard
> an outlook?

It's convention on mailing lists to bottom post. Particularly so when
others in the thread are using this style.

I have not heard any news about this driver.

Have you?

Cheers,

Joel

>
>
> On 9/23/2016 10:04 AM, Timothy Pearson wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 09/23/2016 02:41 AM, Joel Stanley wrote:
>>>
>>> Hello Timothy,
>>>
>>> On Tue, Sep 20, 2016 at 11:22 AM, Timothy Pearson
>>> <tpearson@raptorengineering.com> wrote:
>>>>
>>>> Add a basic driver for the MAX31785, focusing on the fan control
>>>> features but ignoring the temperature and voltage monitoring
>>>> features of the device.
>>>>
>>>> This driver supports all fan control modes and tachometer / PWM
>>>> readback where applicable.
>>>> This series adds a new hwmon driver for the MAX31875, which is
>>>> used for fan control on Firestone.
>>>>
>>>> This patch is a holdover until a PMBus driver is written at some
>>>> point.  Upstream has stated they will not accept unless a PMBus
>>>> driver is used for this particular device.
>>>
>>> I'm happy to carry this in our tree for now.
>>>
>>> Do you have a timeline for rewriting and submitting upstream?
>>
>> At this time upstream needs some significant work; the PMBus core driver
>> as it currently exists does not support the required functions.
>> However, the hwmon maintainer (Gunter Roeck) has said he will work on
>> extending the PMBus driver and might even get something working for this
>> chip with that core driver, so there is definitely progress being made.
>>   I wouldn't expect anything upstream until at least kernel 4.9 or later
>> though.
>>
>> - -- Timothy Pearson
>> Raptor Engineering
>> +1 (415) 727-8645 (direct line)
>> +1 (512) 690-0200 (switchboard)
>> https://www.raptorengineering.com
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.11 (GNU/Linux)
>> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>>
>> iQEcBAEBAgAGBQJX5USGAAoJEK+E3vEXDOFbuZsIALMWMVl0LK/zGDpD3qVL5tib
>> M0t9QYXhMfYSX1CbP47lRTTDg779f6YadV4QsVslqVt3pVCVm+cA0q2SuyDGCVJ5
>> KCfVlocQ8KYjZXUieY/Ry3YLvU3oraCIAy5VLpeuPAZMU8RwA8gctElcmeWQNneV
>> nywY1wJPe1YjBrIZefVvkF5gJQ/Mzoo498Aeyo8Mi98EB+XSStCp5w9XKF7I7Hja
>> BL5FZbO13ghvfSoDUPv51uKS4r843Z7SL7yzPH1W4OH+beB8nKXyj5ajo2C21Z2V
>> ciyuWQQdQMw/rh5I7ejNvAczEUsYV7h8zXc4dMxoZQYmgcagP1P7uahFL/0skZo=
>> =+1Oo
>> -----END PGP SIGNATURE-----
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>
>
