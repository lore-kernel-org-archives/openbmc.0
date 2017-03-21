Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnDk70NZ0zDq5g
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 11:50:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ollZ1jET"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id p77so15622150ywg.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 17:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dMVFEDGx5fkHZShC18JBFqIWrypXvaFKmkhexQ7IPAE=;
 b=ollZ1jET+fMEwIuM8c5KZSdhOosL5RGO3jmOJHKSPkGOae6fveH2Jbu0veHDd76P4k
 Pg1kYQdQTeyzkMprU1Nkmpse9prQLuCV3r7yBTzvsiW8mNBH0G+7KU4FAQeeOKLlfTU7
 OF80UY/6PdPqnitgFRVEQ4db7Dxtpuo5yH/tuga+NaLFyCQooJ1ZkL4v6TGNDP9+e/1J
 XhFLkOy/Rl3xdLZ55jP4LhTUPbo8Uj541IkXXJ455mGZhdZaHmTCV/H5GlcVutRl/DfI
 WDIAz22HDkgjNiYGECzFUZcQtEaWH8e7CfNtpofO9Pgoofhp+YNDU6+5GzYc2RfHSEv0
 9tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dMVFEDGx5fkHZShC18JBFqIWrypXvaFKmkhexQ7IPAE=;
 b=Z3ZvTIhGOFQ04uj6bS5DNw44302oj+4myhbN8oMpKEIcvZ5gTp5RRCZb7/evOP5P8M
 DxDUWs8Notdf7N/2ocR2CYLediP2SrdtckFqXbJ90sdnsPV9zdi+KxtpdUQ4d+YZP/P2
 SwnkSRa6GKHOU9i23wm4SEjzqJwi7nY+DarY868dWyXsmk+COhgpCP3pXqSijYC4EuWU
 mVveSX3y3b67480ZdSfM5X58jhGGseP+o9sqpTe4ATmtWs8Zy/DnxDI3r5EhUXcj4M/O
 CzUHijDMOHukq48WjzRpBrzzKZdo+a0k996H91Zn8+wdYtD8/1vCnZhg/GRlY+4UEEax
 rlYA==
X-Gm-Message-State: AFeK/H3JPcqaM0sNwqHJm6A4tzinQ+ySFNZ9ED2Vw4WfeXuIIVZn42pMQOi0lweLFgn8j5tnQMNWerCDPFvXJA==
X-Received: by 10.129.116.214 with SMTP id p205mr19068230ywc.268.1490057404969; 
 Mon, 20 Mar 2017 17:50:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Mon, 20 Mar 2017 17:49:44 -0700 (PDT)
In-Reply-To: <30268faa-5c95-4295-35ba-f5bc4ccff68a@linux.vnet.ibm.com>
References: <20170317023411.13045-1-joel@jms.id.au>
 <30268faa-5c95-4295-35ba-f5bc4ccff68a@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Mar 2017 11:19:44 +1030
X-Google-Sender-Auth: X5CdTB_VKQvHXD8xtRsNGtBCHu4
Message-ID: <CACPK8Xe8bsTPvp15RXy9F1EJgVu287K-orWuvsjEznLj1wJOuQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] fsi: i2c: Remove noisy printks
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A . James" <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 21 Mar 2017 00:50:07 -0000

On Tue, Mar 21, 2017 at 7:47 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
>
>
> On 3/16/17 9:34 PM, Joel Stanley wrote:
>>
>> These create a lot of noise in the kernel log. Hide them behind dev_dbg.
>>
>>    PROBE    eng[00f5112c]
>>    Adding ports[0x0000000000007fff] to eng[0x00f5112c]
>>    bus[0000000f] created
>>    bus[00000010] created
>>    bus[00000011] created
>>    bus[00000012] created
>>    bus[00000013] created
>>    bus[00000014] created
>>    bus[00000015] created
>>    bus[00000016] created
>>    bus[00000017] created
>>    bus[00000018] created
>>    bus[00000019] created
>>    bus[0000001a] created
>>    bus[0000001b] created
>>    bus[0000001c] created
>>    bus[0000001d] created
>>    RESUME   eng[00f5112c]
>>    iic_boe_reset
>>    iic_boe_eng_init: P8/Z7PLUS mode
>>    clean port busy port_busy[0001ffff]
>>    iic_boe_eng_init: P8/Z7PLUS mode
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>

>
> Acked-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>

Thank you for taking a look. Applied to dev-4.7.

Cheers,

Joel
