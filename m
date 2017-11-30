Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tRdZkp2o"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynPC51Q0lzDqwr
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 15:13:04 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id i2so6349918lfe.9
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 20:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kLjb8pLLsRwXjaKD5DJjzdndo9ifmf+cKRerHrGdD+I=;
 b=tRdZkp2okJgB2vY8WysiEh5vsDBYIq914oztr9uQ+iPnhcm55b+PPxrABR7S02D8ID
 jYKOruSUaONeSw8zlXzNU3i5/RYVNsKPvLSebOxu8GUqrbl+6mkfxVBr8q2ouU4SqqJ8
 ePuWwsm9AjECpjYArpT9YjHwlzKXdtlcfSVVpjz+JMv0GGoISnX6UbI1ezqfVhcqUTvB
 Q1/Mvd/B2BMHGyLZUsF2YXI0qyLw5c3z9mQdzlQiHOArAjgSFqRywxg+77xmXGl/1MGg
 j1Sxy3NTgCpf6Cli5qr1Pn75/vTj0u4Ya1KgjGvulR2WMALnK3FZpJcbRrjLamh7Z4gb
 mSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kLjb8pLLsRwXjaKD5DJjzdndo9ifmf+cKRerHrGdD+I=;
 b=GJjf2K9Dwl4eTLI+ulmkf7PXmbgniUsk+YiOly37pMdepj7RxYG479gqL5KnV08t2P
 JodqVDYnM9JfzVbAQ7UBKzoquDe2vrJEuaGgvxkkEnApgnJWAjnpUS5VymL5ylzcSo59
 bh9J5dcpjYpyudGtnH4rK/nWXQgRJ+XKMzc2aOltTDgkC/8Nz+/V1nLjC4X9tvdk9WEp
 agILHkW+N+ZALOHHoEfMdHEwHY/lIgQzsjLmFyryQk3+NQ6I9H6/H5igKe5FujZU1JtI
 fKnikmOMMYzdLJJAhL6QYZN5kCvduB7Gx/DNbRELwtxaP+mbfxFUZPZrdHUXBWtUK36Q
 A1kg==
X-Gm-Message-State: AJaThX6hbGer9TIAI2A+ntUX7GflWGGtLX7ThJ764tMjQDCiXXwFfVWa
 KE9ulM4uul1oq66mb8QJYb5O/xs9xqTPKhmMQW8=
X-Google-Smtp-Source: AGs4zMaerbPnj9IHtqvVtyIeu48m879BN8d+qAEOq7fQWrulDdhnRRZPHR+9VtMswI9yOuJWhceLXH3GdPbR4UBLsSc=
X-Received: by 10.25.28.9 with SMTP id c9mr1671164lfc.40.1512015181139; Wed,
 29 Nov 2017 20:13:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Wed, 29 Nov 2017 20:12:40 -0800 (PST)
In-Reply-To: <CAK_vbW32QHAVtm7AFETN6m7SmrcusdB-7DfsNNCAqKHUe8T6eA@mail.gmail.com>
References: <1511430637-14131-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <CAK_vbW32QHAVtm7AFETN6m7SmrcusdB-7DfsNNCAqKHUe8T6eA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Nov 2017 14:42:40 +1030
X-Google-Sender-Auth: XvWYD4cAJ_3Lo9YEGBsE0KQU6Yw
Message-ID: <CACPK8Xcn-v=nXNmL60EAcRGwDg3G1CzieQubzAMEydV20CBNsQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: witherspoon: Add power-button LED
To: Brandon Wyman <bjwyman@gmail.com>
Cc: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
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
X-List-Received-Date: Thu, 30 Nov 2017 04:13:06 -0000

On Thu, Nov 30, 2017 at 6:37 AM, Brandon Wyman <bjwyman@gmail.com> wrote:
> On Thu, Nov 23, 2017 at 3:50 AM, Vishwanatha Subbanna
> <vishwa@linux.vnet.ibm.com> wrote:
>> This LED wired to GPIO R5 is integrated with power button
>>
>> Change-Id: I899405013fbb6b93783dec59090e86453a5ec383

This is not used by the kernel. I have removed it for you; make sure
you clean them out of the commit message in the future.

>> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> Reviewed-by: Brandon Wyman <bjwyman@gmail.com>

Thanks for reviewing. Applied to dev-4.10.

Cheers,

Joel
