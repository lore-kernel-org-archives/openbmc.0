Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AfnQMlEL"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0jdd28CkzDrYx
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 01:11:48 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id m20so4811184lfi.6
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Id2viJagKFTqYZaQxqXEExzBpgRvml7RhRn+Z7Gcxr0=;
 b=AfnQMlELcnnBIJFYPzNKp2ynq4/FoWBUoL+VPc8ccNahHTypQ1wjij0yOqX1oFstZy
 IyivO0AI7zRlZE7WSunOHonWdHsM8hPgtHoBPsFGTfD7u9a+KmO8wlQLgodrta7aW+Dz
 Cm/5uIyQyvnBXQIQxr3ZYfVdJwSEQvT8mfNeWtGnvEoLKbVuyx7eTb8PSB/tro3NQSgj
 WS5SxsGjTNG3Dgq8z70XUGz3gyP2ALqzUneaIXDu6iA51c97NRB57g9gIsZOJ+c0hild
 0t1WVoo9+mUh41PcZgLBXiNwmP517YG/4KHtlpxcFjNACWh2LnM+gN/Ijl70LM8ibCOS
 uOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Id2viJagKFTqYZaQxqXEExzBpgRvml7RhRn+Z7Gcxr0=;
 b=pg+F26rPLiKT8vIAhZP6iWvQBWEZHJgTf5IXkPXaUvkJpnczaqfYaMonTvi2MEjAxW
 4YrPzXtbwIs//77gzcb7WgLLJaCsyfjpCeajmTLnT25ktvExqzox/ed1jWKVmElHXgl3
 bzRIKc7bJnh+LXYuHaSziEQvGYAm9yxvIc0FjneaYqjAmLJprQ2sDdwkVKAnyryjDje9
 Ue/r2yhxXiiC622qLmxzGpfJUK1bZWDgPV3QshE1py6YeJYlATe/KvqvRVPIJlbvZBeB
 zyvRzQKFP0+LFR7jl+M9Sgg+KCOkT4CB65k3ghD9QbFYrRKMjFOEzMZVzozA0MlsGkfj
 rIqA==
X-Gm-Message-State: AKGB3mJLGy26GuVx+IO0YTDAe25E5O1Ys7vVkmEJMf1c9rberTN1DjMR
 hOXI1/yKdH0FwhMiIsDcV4IkTEE3n1szmskBxOX+MA==
X-Google-Smtp-Source: ACJfBoukfbPO8O+w44hiawRCHqQXUjEE4UeLJ0QT1SIsedBcqQ3Szo30FQyTtpiJ7WydYICZ5xflmF7EmKkEGIUKtjk=
X-Received: by 10.25.170.71 with SMTP id t68mr10804808lfe.37.1513606305611;
 Mon, 18 Dec 2017 06:11:45 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Mon, 18 Dec 2017 06:11:25 -0800 (PST)
In-Reply-To: <0d01c184-8ae0-6cbb-b222-d6c22c15ea55@linux.vnet.ibm.com>
References: <1512587959-27264-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xd2Pcb8Z_2PP-B+aALLS9Z1Pc5tvX=2+1qZUbCeVyRUag@mail.gmail.com>
 <0d01c184-8ae0-6cbb-b222-d6c22c15ea55@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Dec 2017 00:41:25 +1030
X-Google-Sender-Auth: j6-Tjs4CkHNYak-kg5EKc97Zl7w
Message-ID: <CACPK8XdHXTYiPYfGvE3=qD_BaGMK_=oBTLaV-VV8UsWHvXfqRQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] hwmon (occ): Fix integer overflow in
 multiplication
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Dec 2017 14:11:50 -0000

On Sat, Dec 9, 2017 at 8:47 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 12/08/2017 12:16 AM, Joel Stanley wrote:
>>
>> On Thu, Dec 7, 2017 at 5:49 AM, Eddie James <eajames@linux.vnet.ibm.com>
>> wrote:
>>>
>>> --- a/drivers/hwmon/occ/common.c
>>> +++ b/drivers/hwmon/occ/common.c
>>> @@ -468,7 +468,7 @@ static ssize_t occ_show_power_1(struct device *dev,
>>>                                  struct device_attribute *attr, char
>>> *buf)
>>>   {
>>>          int rc;
>>> -       u32 val = 0;
>>> +       u64 val = 0;
>>>          struct power_sensor_1 *power;
>>>          struct occ *occ = dev_get_drvdata(dev);
>>>          struct occ_sensors *sensors = &occ->sensors;
>>> @@ -491,11 +491,11 @@ static ssize_t occ_show_power_1(struct device *dev,
>>>                  val = get_unaligned_be32(&power->accumulator);
>>>                  break;
>>>          case 3:
>>> -               val = get_unaligned_be16(&power->value) * 1000000;
>>> +               val = (u64)get_unaligned_be16(&power->value) *
>>> 1000000ULL;
>>
>> I don't think these casts are required, are they?
>
>
> I'm not at all sure. I didn't think adding ULL was required here, but
> apparently it is. I don't really trust GCC...

Sorry, I thought you were joking here. GCC is behaving as it should.
Hit me up on IRC for an explanation sometime.

Can you resend without the casts?

Cheers,

Joel
