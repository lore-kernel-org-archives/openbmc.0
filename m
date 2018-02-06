Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::236; helo=mail-qt0-x236.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2RM/8wr"; 
 dkim-atps=neutral
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbBQ74BYWzF0t2
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 15:32:31 +1100 (AEDT)
Received: by mail-qt0-x236.google.com with SMTP id r13so744777qtm.8
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 20:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=R9v8K6IWPcsq83ZYsNa44l783iKrnHdwTuoEsBQK//U=;
 b=O2RM/8wrWNWvUX4MRQWLOD3HWQljJtUUZ1vvE79bS8t0nA6CSIjauqj3c6IcJtW3wK
 12EAFEiUNtsg4sQ4qukwia7VNmpmoJtw3Hsla/SlbwBoTnIouwJML5vo3MN+4Jh8N0Vi
 gtxzfOeCW13WCiSRiEcu0iK/ulk9KAa5V80aFFXgbw7GiZseBR3PqR4ZdQ9cztGRpOtp
 +l7+0ggCz2kE7tmhDhPg8f6+rdyIET7yZQO79OJ8he+6JTdbEytNT/m+UcgWatXV+e76
 tEfx10inN64coNs+cxsJxf5fP/X9h5is4oIKtRdgW9vHvq4cyjFFJD9NlEwXdCqE9kcu
 0wZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=R9v8K6IWPcsq83ZYsNa44l783iKrnHdwTuoEsBQK//U=;
 b=C0uDv4rRc4a9oNiJVv4ym3N6CnyLLCCCwmBfWjWAkj29juOJSvqJqVyf8K7zjCWvn0
 uQpNhgDEzrsye9X87+rYqsofAAK5lgNYnb7q+i6EL1ib1/2H5H0zsPFBUYWvgnmLh7HC
 fALSwCkjAG5xJ2JjvN/b0Y8cqSwQHIZzc7kB8MrbRWOPhRiBeSlkTXqwnOpTRGV0anvR
 YjLGUfOLz6IDThTLyq91/k7F+0iKVDy3TBlZR2NSP3gVevgKvMbCwbFgDM4bE+2atR1W
 PsBHva9jT0bDZJ2dEyiycFzLFcAEJrhK9Ta63iL8wJAyxTqAjM2wUiX5vfmOTw2ZHZYn
 fvHw==
X-Gm-Message-State: APf1xPArPJW3Rct2mQotX5/g52knckQSmT6j/vxAy98Z8ke8Dnj3dpMs
 x/Xc4txMVI+cCSpp2wBgczXmnyfPVV2TgyHclrw=
X-Google-Smtp-Source: AH8x224wtBUe6QuuMkD56+EKPeK/Uav82Q6a3dh9+3cGMMGt9Nwl6zS3qjHQD/1JDNcd1YkibXIt5/h2PlgfJGhoUv0=
X-Received: by 10.237.38.132 with SMTP id q4mr1688665qtd.121.1517891548535;
 Mon, 05 Feb 2018 20:32:28 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.157 with HTTP; Mon, 5 Feb 2018 20:32:08 -0800 (PST)
In-Reply-To: <87a7ww136z.fsf@linux.vnet.ibm.com>
References: <CACPK8XfKMTv+=LJbdoMDOOkQ4izwqq81=vHmM-Z8x6GZ6FyqGA@mail.gmail.com>
 <87a7ww136z.fsf@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Feb 2018 15:02:08 +1030
X-Google-Sender-Auth: MvO2JHbM_CMtvxTJNbc07P1gTxk
Message-ID: <CACPK8XfKx05YUBjMjJe5vERzOMJ1AXqq=OEZSEmvY-gMMsWniw@mail.gmail.com>
Subject: Re: Removing Barreleye, Firestone, Garrison
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Feb 2018 04:32:32 -0000

On Tue, Jan 30, 2018 at 1:08 PM, Stewart Smith
<stewart@linux.vnet.ibm.com> wrote:
> Joel Stanley <joel@jms.id.au> writes:
>> I am working on ensuring the boards that we build for are working with
>> the dev-4.13 kernel branch. Currently Barreleye, Firestone and
>> Garrison systems fail as there has not been a device tree forward
>> ported.
>>
>> Is there an interest in maintaining these platforms?
>>
>> If not, I will remove them from CI on Friday to unblock the kernel work.
>>
>> This does not stop someone re-enabling them in the near future should
>> interest arise. However, I suggest we create a policy on removing
>> abandoned machines when there is no one actively maintaining them, and
>> we use this to delete machines once they reach the agreed criteria.
>
> From a primarily consumer of OpenBMC perspective, I think it's okay to
> remove them. Booting the host on Firestone/Garrison with OpenBMC has
> always been somewhat sketchy.

Thanks for the response Stewart.

I've removed these three machines from the CI.

Cheers,

Joel
