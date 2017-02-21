Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS6b81VKGzDq5s
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 15:14:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5FvvjVd"; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id p22so17995666qka.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 20:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=clEcVCIz1oSvUGgSPnntSWfL94AyU8AEll920tYQfKo=;
 b=m5FvvjVdvRi795j7iF4ipx0xZ13Sf/Px/AQYq6maxOPFRybchtu7/71MbdBP3XodUk
 XkcjhcOPjLWoe8zUNBFDvOyQ+7iEw7KDaMEF4/pPh7a9j/GOzxl0phfQKp8Try++03OQ
 O22TbgKow2iP1Xk/9AT7L1Fx9hdoLVxw84QBP9cztzf1r7uAwTqmqUvY96Zcd6QhHUCZ
 5GIsskRVjhGiqtMAPTdLAKiNWyS2Kukp2TytBL+xAbNQf49Y0aCdN5b8QveyLWRAmIIH
 MvyXD/U/9Z4TPxQd73rlWGhlPX+KG6SLS8rZSa90TMfCkjsSS4Sfb98ip3kIuC7WcnrT
 WQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=clEcVCIz1oSvUGgSPnntSWfL94AyU8AEll920tYQfKo=;
 b=mqAya5073EEoJiEiqd2emYjcadgBEIN1yqxtcnE1s1OA+e0WfykxcOUG2O5wMrHbiv
 0rPrAo/MghCAWMCUdgDxCwDXSU/8Zrs69ZEowQfb910brQEN6CWqDkkeWwMLzF9vBzIN
 ZIFs8IJcFcbdz3BjNZqGrp81ueKUeX8S2/qEnULs6kZ0E+GLs/NvYkDpe7wxDYYtxhTN
 tqoYfYDzVsDRYI4ICheYvLXRxZ3rOAboFaz9S+zPUnJRgFeT8HuHxBvpQd4a1N9wV7Jp
 7+B3UHEO7G/4qe4EUGSwBIStDcMHtY+54bLsCDvAWxHYBOd9gBMKdUhpzZgGOAbM8/XG
 xHNQ==
X-Gm-Message-State: AMke39kzx9ZDgS+woRGVzBJ8J5XoJIE+wxrqyjTDI6KhKbpzaZ4Xp2+xphKuSZyFVYDYHdse8teO8ozz5ki9zA==
X-Received: by 10.55.21.225 with SMTP id 94mr22086294qkv.237.1487650481798;
 Mon, 20 Feb 2017 20:14:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.35 with HTTP; Mon, 20 Feb 2017 20:14:41 -0800 (PST)
In-Reply-To: <CACPK8Xfk-QQ-00wPTfM_DfT=U1XZL8pK+e7j_m=BrjC=VGjqMA@mail.gmail.com>
References: <1487625445-11892-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xfk-QQ-00wPTfM_DfT=U1XZL8pK+e7j_m=BrjC=VGjqMA@mail.gmail.com>
From: Eddie James <eajames.ibm@gmail.com>
Date: Mon, 20 Feb 2017 22:14:41 -0600
Message-ID: <CALpMbdnFrWjPKCSYGThXZ9bA1HYvHV4DBLpKMvSeo8oe6hiN1w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Fix return code for
 putscom
To: Joel Stanley <joel@jms.id.au>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
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
X-List-Received-Date: Tue, 21 Feb 2017 04:14:44 -0000

Yes, looks good, thanks!

On Mon, Feb 20, 2017 at 5:39 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Feb 21, 2017 at 7:47 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Read/write calls should return the number of bytes read/written on
>> success.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>  drivers/fsi/fsi-scom.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
>> index 2874ea0..51b3dc3 100644
>> --- a/drivers/fsi/fsi-scom.c
>> +++ b/drivers/fsi/fsi-scom.c
>> @@ -156,7 +156,7 @@ static ssize_t scom_write(struct file *filep, const char __user *buf,
>>         if (rc)
>>                 dev_dbg(dev, "put_scom failed with:%d\n", rc);
>>
>> -       return rc;
>> +       return rc ? rc : len;
>
> I refactored this to be:
>
>  if (rc) {
>      dev_dbg(dev, "put_scom failed with:%d\n", rc);
>      return rc;
>  }
>
> return len;
>
> Are you ok with that?
>
>
>>  }
>>
>>  static loff_t scom_llseek(struct file *file, loff_t offset, int whence)
>> --
>> 1.8.3.1
>>
