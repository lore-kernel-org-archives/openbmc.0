Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x241.google.com (mail-ot0-x241.google.com
 [IPv6:2607:f8b0:4003:c0f::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDStR2Hs9zDqFH
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 16:17:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NcFIIgqL"; 
 dkim-atps=neutral
Received: by mail-ot0-x241.google.com with SMTP id 73so651797otj.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 21:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=IZvxEy0CCy8q4zMqdfOuixt5170IYyQgWFM6ThlZBPQ=;
 b=NcFIIgqLujS+y1iCbf58+cjeQIBM6Buno21VMpgMDzy7g3Yffo2ceWHodNdQ2RZNG7
 D5+AjPg7lRoMK8Mcfo/SIH2qJjLDevdbqw8RU/MjAudspPRRTxlQI42rnLYgOIv+wvX6
 O3Wko2ERhvxGgSBrIh01W6yxPn8bHPF8OClJMoafhyGTrqHJ15MVx+TyyY5P2lWl797e
 H/ygpGxK9WpINBB7+eouX4QEhKs5HPuWs0j23wz97Vn1ltG9Tas+S4Cnz5AOktd037Yc
 mxXux6VNBBiRvKs+Oc4mhuIrASsO6RCQ9uCvAFH2APBEXhAoLZuS2wmt/yKBBsTHYPsy
 0ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=IZvxEy0CCy8q4zMqdfOuixt5170IYyQgWFM6ThlZBPQ=;
 b=c7qwTmx4OiiIXVAu1u7hcbflhrmuS1ZqZfLUjhHyEyQrkN5Ox/G6nEQFB35fZtfCB3
 XJJD4bab5LuGDooePlljS+SlweZ/iAQzzruZ67orVrvxTrrHySob4x53fkReIAJ9UcU3
 L5ER/jLhFQXPflUqQnbrYIWEXzJ7VHdZN0ISyOx39PWxbbymj48Ls8Fjl2/8BnAT/hBN
 btN9hUDlmPS5Aw/L4h8qf/XTeQOtnp3qDq+gV2EFVv9PhxT1Ftf/KfYIkM+a3BrUw0j/
 2jbxLrJGY18YakVx1QduECJg+Pa0pMpKsUh7q3/SIQIGW4iMrhL/JGDVw90T3svD5M0u
 VZPA==
X-Gm-Message-State: AIkVDXKBaGXim2wPwCas+hrgn67lKWwv2Nv70mqOOT31d6N9zs6mmYDo3f6vdEP0J1Qa1cPE+W0AJJXUtO9e8g==
X-Received: by 10.157.10.202 with SMTP id 68mr2916835otq.51.1486012653061;
 Wed, 01 Feb 2017 21:17:33 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Wed, 1 Feb 2017 21:17:12 -0800 (PST)
In-Reply-To: <4820133.vKp7aKPARx@new-mexico>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
 <4820133.vKp7aKPARx@new-mexico>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Feb 2017 15:47:12 +1030
X-Google-Sender-Auth: HE9o_tK8aL1Y3nEuHb7qNvLr8ao
Message-ID: <CACPK8Xe1qd0JCq61zqt-9EGs5_DfQdO9aKr2TZXbXhKXSW9L7Q@mail.gmail.com>
Subject: Re: Users of SBE FIFO kernel driver
To: Alistair Popple <alistair@popple.id.au>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Thu, 02 Feb 2017 05:17:35 -0000

On Thu, Feb 2, 2017 at 3:18 PM, Alistair Popple <alistair@popple.id.au> wrote:
> On Thu, 2 Feb 2017 01:59:08 PM Joel Stanley wrote:
>> Hi Chris,
>>
>> On Thu, Feb 2, 2017 at 5:58 AM, Christopher Bostic
>> <cbostic@linux.vnet.ibm.com> wrote:
>> > I've not seen this discussed in the group but if this has already been
>> > determined than any pointers to the latest documentation would be
>> > appreciated.
>> >
>> > Who are all the potential users of the OpenBMC SBE FIFO device driver?   I
>> > understand it will need to export its general submit interface to other
>> > kernel drivers.  Only one I know of for sure would be the OCC driver Eddie
>> > James is working on.
>>
>> In addition to Eddie's driver, in userspace we will have the code that
>> performs the power on sequence.
>>
>> > Any others?
>> > What about user space access of the SBE FIFO engine?  What apps would
>> > require it?  Cronus I assume will need some means to directly access it.
>>
>> We want userspace API and an in-kernel API.
>
> Yep. For example as Ben mentioned the chip-ops also use the SBE FIFO. However
> we certainly don't want to put chip-ops directly in the kernel. It makes more
> sense to use a userspace SBE FIFO API to do the chips-ops, power on sequence
> etc. from userspace.
>
>> The driver you design will need to take into account that there will
>> be multiple users from each of these APIs. For instance, there will be
>> Eddie's OCC hwmon driver and the userspace code that kicks off the
>> boot sequence.

Agreed. This driver is to control access to the FIFO. We don't want to
have to modify the kernel every time a new operation is required.

The programs sending the messages will know how to encode their own
operations, such as pdbg, the occ hwmon driver, etc.

Cheers,

Joel
