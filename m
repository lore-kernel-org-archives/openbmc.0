Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSzZT5hBvzDqmt
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 01:02:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NT4thp6d"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id n76so133425ybg.0
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 06:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ub03Ri4ofCeOEp0ok4iuFKgJg89o2NAqgjjW/zvLaMI=;
 b=NT4thp6dz7nc3a8f5xUhegPRW5RFw5AL2MV+7b7BDzg9FxuighbCj/jvha53BI47wV
 8NpIyYh9Sa6CVlUmVYkZnF9jmP0mERupUh3ZHKT7+MfYSlOecS8XWY+ZRphT7Dijut3Z
 VitUWNsP6USXZt9OATaYXRr4duxiKOceoz5agD2GViLig7rb1mbGYl4t1pDR1yqpGZiR
 0eUIP8f5iHp6084zZbW+wkDcs6NDQPMGKA3Qq2p3Pz2/s34CTxI0ZRR/7wAOkmGVSsAG
 K5WEfiLJVCQ/ktQVWKD9XDzf3jhxSC6K88vuw1tXqFOvnf+uypSDfS05EzhVUGmXYg9A
 Yq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ub03Ri4ofCeOEp0ok4iuFKgJg89o2NAqgjjW/zvLaMI=;
 b=ZPLcI74BI4cAjYSQkY2VhDV1u7/uY28XOPcKPxk6NPZU4r9tJxVoKauCK5ctUGSOtQ
 5O3EREYf7m8Iz4BEyOcYqrC7lE0z9Oc6OHj0AMKUvJKwiXNTG/X4WJDc3iPpeXzynjyM
 kV/kvZ2H6yySrkeEBfYsctYU4hmSs/lzgeVF5VMqWuxCmEL43iWijYi6RMZP4y0ubfpt
 0kCZoS7NUAZPDZ/cGUaRXeCiYUt8QPPvNI9btr51oB6XCUoycb1wjjxv+l6pVGu95y1z
 aWtSIKHk5FZNGkGvdcJw3nmupSi28cz6fCrtZoSBKc7fGVtf8GOQEhx5nIKRxDZAwV9Q
 2GEQ==
X-Gm-Message-State: AMke39lLsGJkWhcXdKGfxQLMXd6M5XS2Lq98LKWY4DXCSp3upGWlm+9XEqXAOzpR68H9Cj/TvskGE60BvBehHA==
X-Received: by 10.37.70.66 with SMTP id t63mr24662141yba.196.1487772126949;
 Wed, 22 Feb 2017 06:02:06 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 22 Feb 2017 06:01:46 -0800 (PST)
In-Reply-To: <cb927b0d-adbb-1568-1040-4f1456c7ae80@ozlabs.org>
References: <1487711879-15542-1-git-send-email-eajames@linux.vnet.ibm.com>
 <cb927b0d-adbb-1568-1040-4f1456c7ae80@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Feb 2017 00:31:46 +1030
X-Google-Sender-Auth: T6TTSXjTEvnnLrtATsSEhRU4VSE
Message-ID: <CACPK8XeOE8FAFKfPOCY+uaLDx8rraWA1CjYhQSeEmEeZy+4GrQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: Fix FSI core size checking
 user interfaces
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 14:02:10 -0000

On Wed, Feb 22, 2017 at 11:14 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Eddie,
>
>> Some potential for integer overflow and not checking signed offsets.
>
> [...]
>
>>  int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
>>               size_t size)
>>  {
>> -     if (addr > dev->size)
>> -             return -EINVAL;
>> -
>> -     if (addr + size > dev->size)
>> +     if (addr > dev->size || size > dev->size || addr > dev->size - size)
>>               return -EINVAL;
>
> I liked the split conditional statements, but that's only personal
> preference. Regardless, LGTM.

My personal preference is also to split them out. It makes them easier
to read, and there's less noise in the diff if the conditions need to
be updated.

I applied this as-is to dev-4.7 for now.

> Acked-by: Jeremy Kerr <jk@ozlabs.org>

Thanks for the review Jeremy.

Cheers,

Joel
