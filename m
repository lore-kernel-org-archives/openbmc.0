Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPZHk1GhWzDq8X
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 11:52:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jhym3Prt"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id u68so2367960ywg.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 16:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ryw8YO0HFoJrg5SHpBVu51Gix3a+LVAg2/maNtRagWw=;
 b=jhym3PrtcPhQ+659UOVjuBEsHCl7gUeuv/kBOfomTg7PPOb/T5vri2EYuzx6vmSp+t
 BFF4JkjEv7O8b3PXuRsFd1+Ec3xWHVo6i7BXIJBQhI9n29o5YOlOhIVoq6JiRV7GVm9B
 H9ctfK0n6K9B+GNkWw6sF9rG1M2MjSSKt1KOO8Vm2/NUVpjxj7JdXJFQkj61OFIT13Yu
 Ha6JBxb51r8wkWw5AXm27NJhksVeI6VUIN38LXl8xlr8uVrCV7QUdK0hgVCpq9zqNCwF
 w0PU7v0DMkkrYGSAEHnuU/UoSoIIZl7McAs2NOPTmaRjjgjdD2ULHRulbSdUMV/7n6cX
 tFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ryw8YO0HFoJrg5SHpBVu51Gix3a+LVAg2/maNtRagWw=;
 b=pFFy9jZKLzwffmrhCZ7K2iVS8GfU4lYJFrWII4UT1IT5sfUuhrff+Rp77BZH5eVCYA
 kgcCKKxzrJgIVK0DhWkpECchik3AuC2ysD51iCRxniq/hV9BuBUc2EGUix7wwbMv5MxQ
 vz3mYHDqyCy0uSwINe6prQQ/nCDItIgsV1cMUP9vl9QiiPF+fbC2pZj66xw0kqTWnBV+
 so7v9RxSQrG5Va9m/WELRvKb/rmhJ75s2RMeDlkZSIESHtIkBrj4LjpJxmXTyFdgb2Bb
 T+8bda7TobFw5Cows6rmsAeOK9u8bXAWCk8YtMAWtSldXtBG0mNRVrz+zxJD/+Fmm3PB
 C0tw==
X-Gm-Message-State: AMke39mdSoQ0OFmkdKufVai5XG/lNHrWO0dOvDWgowADhbcTahWoJtnprA3CZ4RCB5incOv9s0ZT3q+5LIGsqA==
X-Received: by 10.129.73.65 with SMTP id w62mr3851528ywa.288.1487292751697;
 Thu, 16 Feb 2017 16:52:31 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 16:52:11 -0800 (PST)
In-Reply-To: <87cc8d63-9eb7-a812-c290-85ed73abdee2@ozlabs.org>
References: <1487272856-9776-1-git-send-email-eajames@linux.vnet.ibm.com>
 <87cc8d63-9eb7-a812-c290-85ed73abdee2@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 11:22:11 +1030
X-Google-Sender-Auth: _Y9RFtRw6FrN1CIGpfde7Bj7faI
Message-ID: <CACPK8XfNfAO6pUNfhinCUPrOLNOueAGE8JbRP+mYmd26FryH3g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: Fix incremeting dev nums
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
X-List-Received-Date: Fri, 17 Feb 2017 00:52:35 -0000

On Fri, Feb 17, 2017 at 11:14 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Eddie,
>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> both for FSI master and scom client
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>  drivers/fsi/fsi-core.c | 4 +++-
>>  drivers/fsi/fsi-scom.c | 2 ++
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index e8a3618..7816482 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -46,7 +46,7 @@ static const int engine_page_size = 0x400;
>>  static struct task_struct *master_ipoll;
>>  static unsigned int fsi_ipoll_period_ms = 100;
>>
>> -static atomic_t master_idx = ATOMIC_INIT(-1);
>> +static atomic_t master_idx = ATOMIC_INIT(0);
>
> This will mean that our first master is numbered 1 instead of zero. Not
> a huge problem, but it doesn't sound like that's what you wanted to do
> here.
>
>>  struct fsi_slave {
>>       struct list_head        list_link;      /* Master's list of slaves */
>> @@ -617,6 +617,8 @@ void fsi_master_unregister(struct fsi_master *master)
>>               kthread_stop(master_ipoll);
>>               master_ipoll = NULL;
>>       }
>> +
>> +     atomic_dec(&master_idx);
>
> This doesn't work. Consider (starting from -1):
>
>   - master_idx at -1
>   - master added, assigned index 0, master_idx now at 0
>   - master added, assigned index 1, master idx now at 1
>   - master 0 removed, master_idx now at 0
>   - master added, assigned index 1
>
> now we have two masters with index 1.
>
> Either we need to check for present masters, or use the ida functions
> (as greg kh has suggested).
>
> So, nak from me on this.

Thanks Jeremy. I missed this case when reviewing.

I have committed a revert of this patch.

Cheers,

Joel
