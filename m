Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x236.google.com (mail-yw0-x236.google.com
 [IPv6:2607:f8b0:4002:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDJxf6VtLzDqpM
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 15:20:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ahCeF9TN"; 
 dkim-atps=neutral
Received: by mail-yw0-x236.google.com with SMTP id a12so20562450ywh.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 22:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=U60j9HG9DFUAzXYu+CJXueo3NDxl/ab+KaYKu5ukuAE=;
 b=ahCeF9TNlJCAElH8SS9//fQTx/4PwThMS8jAHYLrxoRTGBmW1nikD8amu4se4OlvUr
 p7JJfvBHsxMNULDxjLNxnS11QZmGrTPueG4SI27GOwmH2Luh+w5HUlPRYq98+m8WwQLh
 /s684rWQJvHk5dJ/I46X05zKlhB4gsMDxm2d9r6wQ7lSDOFr26xpVtjybskILiaSt9MG
 s5M7hYNgwwr7dI4LYwhIAlwiR061OUA7EJ754TugH8KmESNreF2gnvgZLlzqixxryQJd
 gyOdniTEwcqMx+fKw3hK0iXFyTj/4ZpfAOZLbiDOTZq5JrDLbHbnR0tyARp8w9l7S9u4
 6xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=U60j9HG9DFUAzXYu+CJXueo3NDxl/ab+KaYKu5ukuAE=;
 b=LYm2fk47i3D0vBa1n+mlMSwtewlxek+XDAyvkZrO/xmoeZ0m5Ia8aDcnTaiBsXKBHI
 ViFyN3UB45cDngKGVoXD2CBsy/svQ6hALE18l9TFDJp67e1qpqvkPgiIy1+UQ8P60GYd
 7aUxtx73oLWUtO1mMKGTOOVAjj9YIZjoEfQCxRIqZoGRPNLCLHVWc/sAB4ps0Xn4sS9D
 bSvy9RicLR1T9h0RgCAMuo2LluJf6bMHsREaXJq3rNrq6tv6JmdJbh5wL7bH+IFfYmLI
 3P4Vp0Yy+biJBIJMhor4TPtf2o8RAFLs5wNR/vemJP6lcHMlLVOLqnZiylLl0Qpz6xOy
 8xAQ==
X-Gm-Message-State: AIVw1125sZBCuuvg+RyT2pSwpJOTrDK3v77MgLfjtrmt5N+2f6bBNQ2q
 el0LC+COmkxA7VR7Qt4uwAuigkTSTiyY
X-Received: by 10.129.172.75 with SMTP id z11mr5584358ywj.369.1500614420047;
 Thu, 20 Jul 2017 22:20:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Thu, 20 Jul 2017 22:19:59 -0700 (PDT)
In-Reply-To: <625bc46f-e07c-bc59-6b0b-a669bd9e4a59@linux.vnet.ibm.com>
References: <20170713193606.56374-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XfbX3VqQcvtMpmiDeJhyPBx5rqh3L5grep5gL+SmS+PDQ@mail.gmail.com>
 <1500516109.500.13.camel@aj.id.au>
 <CACPK8XfnqqrzxSs8Nzr9yiytg_nK1bZ39HAAE3hwdmGA8SbQ7w@mail.gmail.com>
 <625bc46f-e07c-bc59-6b0b-a669bd9e4a59@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Jul 2017 14:49:59 +0930
X-Google-Sender-Auth: HJz9aN67dH5fZaADJP6xQrqIgmM
Message-ID: <CACPK8XeqwJO_8d1kVwDQU0ooHbciXHoooDk5e0SJCauPmkLN4A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add gpio keys for power
 supply presence, ucd alert
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 21 Jul 2017 05:20:23 -0000

On Fri, Jul 21, 2017 at 5:06 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
>
> On 7/19/2017 10:45 PM, Joel Stanley wrote:
>>
>> On Thu, Jul 20, 2017 at 11:31 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>>>>
>>>>> +
>>>>> +               ucd-alert {
>>>>> +                       label = "ucd-alert";
>>>>> +                       gpios = <&gpio ASPEED_GPIO(I, 2)
>>>>> GPIO_ACTIVE_LOW>;
>>>>> +                       linux,code = <ASPEED_GPIO(I, 2)>;
>>>>> +               };
>>>>
>>>> Andrew, are we sure this should be exposed to userspace? Is it
>>>> something that should be hooked up to the SMBus driver instead?
>>>
>>> I've looked at the relevant schematics and datasheets, and the GPIO of
>>> interest (I2) appears to be correct for the UCD alert. However, GPIOI2
>>> is *not* capable of being muxed as an SMBus Alert (SALT) line and
>>> therefore the alert will not be propagated to the I2C master. It
>>> appears we must handle it in userspace. Configuring it as GPIO key will
>>> give us an interrupt.
>>
>> We discussed this today, and decided that we would look in to hooking
>> the GPIO up to the ucd driver. From there it will initiate the reading
>> of the fault registers, and allow the implementation of a poll()
>> response on the fault files in sysfs.
>
> How does this affect the userspace side of things?

This relates to the pmbus spec's status and error handling. I don't
think it would affect the way you interpret the status data in
userspace, however I haven't seen the design for what you propose so
you would be in a better position to answer that question than me.

Cheers,

Joel

> I am planning on giving
> up support of
> doing UCD fault analysis based on interrupts because there are 6 GPUs wired
> to a single STATUS_WORD
> bit, so after one faults we'd just keep getting called back again since
> there's no way to mask at the GPU level,
> assuming we can even get the interrupt to retrigger again at all.
>
>
>
>> Cheers,
>>
>> Joel
>>
>
