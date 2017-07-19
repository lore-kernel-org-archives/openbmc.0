Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCBLt2JN0zDrV7
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:19:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kY5U5i9T"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id c13so2050802ywa.3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=PGT4VhMJS9YwrpO2o39FNzRdm/OrVYOjBk6ymPYxRwk=;
 b=kY5U5i9T2iIiEFhOmJ4AUuIZGr+FXMgGQDD3P+ssZUVIoDizh0f8bay9zSDDOoTwmD
 ihztzPUk+Uu1LGHddx8LseoRVab+N/Ohzje0n7DqIsJjWO07BLbOR5TT9ufvKe/wfMMk
 rzlQ1zHnLJtzEMfuBpVMOR7flXFa1rxgTotQcXCeIac1mcafiCoDghHoPwUApAkb/8y9
 pY9s02d03nBLJ/Lgg+t7Rluh/uPlmV1nJDEI/FnvDB6fe4ZtvE37rouGQ9kqHiP/711g
 08+fC041ZZWboX7heYcc7k09QeG7yKmmgXezbkU+Gb0XAYTxO4g78H9mwDYilwxJ/C4e
 Ozlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=PGT4VhMJS9YwrpO2o39FNzRdm/OrVYOjBk6ymPYxRwk=;
 b=iYpceTqmLeqN3ZPf8HRNTCjTNbX4Fg4JGE7TZKim0wkLinW006w6P9KumeKrAizAHk
 b2Sxcx3LVHgLgLLL8QdcOC6zLjZb7WkQ97efjn2oTxuejOP6o6uVr+c+3tipVqNiZHX6
 pcYAXJZlK3PPTKbHq4NxvyI4DK/smQm/S3+yVF4OYO/k0V5wdh7VJh5eMXSLiO1bRXRr
 WPpwTr+yn0jXFp16ar6ACYQNqVzkcXYY3Dk05KB2XZfVj1ZAMkSdWZ5dm+rwxPf7yXD1
 3KW7XOLp/IQBb6NqsPqSPFoimoXYyMFkx2Arh3bnmq9YJJFeH5XVVMkbGwJ7CKbnmaYr
 XXrw==
X-Gm-Message-State: AIVw112CjcYcpOMJWLFjvH6wZP90FH4xJVr5JqFkO4ffdA7MFGrB9BY1
 dcecJv5k3mQ+zhnxza44ZjSg1JVyHct6sT8=
X-Received: by 10.129.164.77 with SMTP id b74mr1320588ywh.235.1500455988092;
 Wed, 19 Jul 2017 02:19:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:19:27 -0700 (PDT)
In-Reply-To: <CAPLgG==g_tTX-33tT7q143Dxg3o4P=t__5q1TaWR6k1KZ6M5UQ@mail.gmail.com>
References: <20170714080941.8400-1-c_mykolak@mellanox.com>
 <CAPLgG==g_tTX-33tT7q143Dxg3o4P=t__5q1TaWR6k1KZ6M5UQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 18:49:27 +0930
X-Google-Sender-Auth: IX7YXpJ9LkSNV28Go6XYEfVJd7g
Message-ID: <CACPK8XenZyXx7LqE=hcmqz87p-JNFUjAqJdqn72hE9t9aymQDw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] iio: aspeed-adc: wait for initial
 sequence.
To: Rick Altherr <raltherr@google.com>
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
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
X-List-Received-Date: Wed, 19 Jul 2017 09:19:51 -0000

On Sat, Jul 15, 2017 at 1:35 AM, Rick Altherr <raltherr@google.com> wrote:
> On Jul 14, 2017 1:12 AM, "Mykola Kostenok" <c_mykolak@mellanox.com> wrote:
>>
>> This patch enables adc engine at initialization time and waits
>> for the initial sequence completion before enabling adc channels.
>>
>> Without this code adc channels are not functional and shows
>> zeros for all connected channels.
>>
>> Tested on mellanox msn platform.
>>
>> v1 -> v2:
>> Pointed by Rick Altherr:
>>  - Wait init sequence code enabled by bool
>> from OF match table.
>>
>> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

> Reviewed-by: Rick Altherr <raltherr@google.com>

Applied to dev-4.10. Thanks for the review Rick.

Cheers,

Joel
