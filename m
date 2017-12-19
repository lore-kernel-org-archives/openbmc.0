Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::243; helo=mail-io0-x243.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o9/NMY7r"; 
 dkim-atps=neutral
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z11yP5R55zDsQN
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 13:27:25 +1100 (AEDT)
Received: by mail-io0-x243.google.com with SMTP id d16so11975553iob.4
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 18:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bdu6dZilJBsRHMeaE+D8xaTG+LlZdMrro3sjCgku1fY=;
 b=o9/NMY7rzXQi0ZbGzphQZ0iw9WGhONOJ9JVHRFm7W9k8dWzQqrdLqkgtXCEV7wUI3h
 lR/9Tj/4cZ/sP1RaX1wu+Nc0AaP5k/PtLHzNLXbQ6LQXsIpHsoyuyOtA5GhWP8hPC6TO
 /m0Pq6ifuasjycy401up/cX2VrriP0RGR7VWKIiG5ZCxzQsufCZKn9/sHwjUnGnbA1Fe
 WlznqByJ+K7rnXT8vW9XF0BWeT6ofNzXGp9cVOgjm/oU3iQtxpWjOb2IAm+12RYRY29A
 yKI8NxuwI6V/Lq838hwh2kP2TfZH+68JCfCdVFYaMUINmA1jtNVMiWJc3QiEBtrqFWfe
 MfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bdu6dZilJBsRHMeaE+D8xaTG+LlZdMrro3sjCgku1fY=;
 b=EHow2PGBwb3iJxlXPhaoaDTnbfNAAMJ08bBrb9XVTC5uDv+hJWBAkuB1LeGtBXQ9X1
 DiN4yOLtWKec+pYkBYOyA6vIc7bAkwElLJoEbBbNnWmDYLHlTLvcsoGtdMfiQbAtR62f
 MSIkDNJOA8zVKnnfIKHDsV/5K0HeVC4xvdNFJXMqKnvvUIZoL1+oVJhCocodF3JoNgp/
 IeC4kkmaTDqWCuNNUSrCgnJT+H+/HSOuZWEG9Y25v7MCjiAiq50U39Ib+zIHYq60bdSU
 9yPR3FSt95XYpBlg9Fo1DID8XKkferArBtYZhK3z6VMa971BPSOyZ3N6mnJwdMGH1Obt
 KZfA==
X-Gm-Message-State: AKGB3mKzJuW9X3PF3QP6/oQek3z5BSOvckOUEpxvWaX3493X1ZLL/VfU
 XY05n+2vMez0YGHJWzFzMDxHnabZoZGAo7G6UhE=
X-Google-Smtp-Source: ACJfBoskrsSLgSyZEY/b2iUgrjCHkeQr5itCFj5bIw5+z7f56zS5ru27sGBx1lntGtQGr/24Pb6hcG7F4DbCUmcGWJ4=
X-Received: by 10.107.11.85 with SMTP id v82mr2128163ioi.198.1513650442841;
 Mon, 18 Dec 2017 18:27:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.228.137 with HTTP; Mon, 18 Dec 2017 18:27:22 -0800 (PST)
In-Reply-To: <CACPK8XdHXTYiPYfGvE3=qD_BaGMK_=oBTLaV-VV8UsWHvXfqRQ@mail.gmail.com>
References: <1512587959-27264-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xd2Pcb8Z_2PP-B+aALLS9Z1Pc5tvX=2+1qZUbCeVyRUag@mail.gmail.com>
 <0d01c184-8ae0-6cbb-b222-d6c22c15ea55@linux.vnet.ibm.com>
 <CACPK8XdHXTYiPYfGvE3=qD_BaGMK_=oBTLaV-VV8UsWHvXfqRQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 19 Dec 2017 10:27:22 +0800
Message-ID: <CAARXrtmsMO74xB-Cb3gsxBHGJCf=QtuZzuzRFo+FU1dWSKVvvw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] hwmon (occ): Fix integer overflow in
 multiplication
To: Joel Stanley <joel@jms.id.au>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, qiaoling.qin@powercore.com.cn, 
 =?UTF-8?B?6Z+p56yR?= <xiao.han@powercore.com.cn>
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
X-List-Received-Date: Tue, 19 Dec 2017 02:27:26 -0000

Hi Eddie,

Except for the values for power, the value used for temperature is u16
and overflows
as well.
Powercore reports that if the temperature goes over 65 degrees, the
value overflows
obviously as long as it is over 65535.

Could you fix this as well?

Thanks!

--
BRs,
Lei YU

On Mon, Dec 18, 2017 at 10:11 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Sat, Dec 9, 2017 at 8:47 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>
>>
>> On 12/08/2017 12:16 AM, Joel Stanley wrote:
>>>
>>> On Thu, Dec 7, 2017 at 5:49 AM, Eddie James <eajames@linux.vnet.ibm.com>
>>> wrote:
>>>>
>>>> --- a/drivers/hwmon/occ/common.c
>>>> +++ b/drivers/hwmon/occ/common.c
>>>> @@ -468,7 +468,7 @@ static ssize_t occ_show_power_1(struct device *dev,
>>>>                                  struct device_attribute *attr, char
>>>> *buf)
>>>>   {
>>>>          int rc;
>>>> -       u32 val = 0;
>>>> +       u64 val = 0;
>>>>          struct power_sensor_1 *power;
>>>>          struct occ *occ = dev_get_drvdata(dev);
>>>>          struct occ_sensors *sensors = &occ->sensors;
>>>> @@ -491,11 +491,11 @@ static ssize_t occ_show_power_1(struct device *dev,
>>>>                  val = get_unaligned_be32(&power->accumulator);
>>>>                  break;
>>>>          case 3:
>>>> -               val = get_unaligned_be16(&power->value) * 1000000;
>>>> +               val = (u64)get_unaligned_be16(&power->value) *
>>>> 1000000ULL;
>>>
>>> I don't think these casts are required, are they?
>>
>>
>> I'm not at all sure. I didn't think adding ULL was required here, but
>> apparently it is. I don't really trust GCC...
>
> Sorry, I thought you were joking here. GCC is behaving as it should.
> Hit me up on IRC for an explanation sometime.
>
> Can you resend without the casts?
>
> Cheers,
>
> Joel
