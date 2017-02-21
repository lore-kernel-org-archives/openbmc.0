Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS6cG6GPPzDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 15:15:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tsyvyp09"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id 2so3375876ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 20:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JdF1aUDi39v1now6xQ7qfXuqmcsOjIQ5WCYEmehzSok=;
 b=Tsyvyp09lvcHgaUd0CmBgGzucOjT8G+1E8nM9T3p2APsg0fk7Jruiy2pRGdMjItfZ/
 5XhrQGlVhH3+2K5Sd3urzgXvg54m29As81ovkJ0V9QMSRMWPu0UeHq2Jff9dSRxDG4VE
 UTiG9wMUHIPcxcIfkh7hTRyM8oag/ICpgDcBWkwNoh08a0ykaC4U6jqKnw2frv3Tg40t
 tUjl7J9Mh9R7DnrfeS3cB1hh2qkCTyFcdYFa8Zt9OLJJ4OaOW4w8tv8ONPmI3UqZFUKv
 Tfle5xG3xWXRKy1giXtgVcE9xjFaugq0QA19g4td0XgaNkDWWiM9NttkT2umk2+juoF3
 3WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=JdF1aUDi39v1now6xQ7qfXuqmcsOjIQ5WCYEmehzSok=;
 b=VSoEg2GEHr6yWDt+WbopzdPjOVcLR6v9O5OwPc4gRQBfXBwrnAbYHbVn0dwOlk77jh
 DcRVka9uIzkSEcolv2Lql27R1j5T0+qaRBRsPJzMI8GZQXWgLtmvzyx9Hvuk4uJZV9gd
 8E/la1j2G2hnbIgwcsapt8snQytIouhFnFKNilDu9YBem6OVedfMRV75MVRYV5WFEfVb
 r79OKlD8awM3fCUnzVmpBrTcIlyy3Q6n3wpHc9OJKrb9ewxVVTi+zAeTUKx9MSStmg0S
 2360C/iE2TqZjKGV45oLCLcWj483cjL/HmMRsxZUTcFrXrC8nDgyL+gZov6JJWb8KimY
 rvGQ==
X-Gm-Message-State: AMke39ngtG9DEPQvU7IUJyKwPsprQUZoUInfCAipuwhEox5AIuSbgM2EGAAGuPi7bb+gmlOtR+muu1beb8CDXQ==
X-Received: by 10.129.118.82 with SMTP id j18mr18516083ywk.10.1487650540523;
 Mon, 20 Feb 2017 20:15:40 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 20:15:20 -0800 (PST)
In-Reply-To: <CALpMbdnFrWjPKCSYGThXZ9bA1HYvHV4DBLpKMvSeo8oe6hiN1w@mail.gmail.com>
References: <1487625445-11892-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xfk-QQ-00wPTfM_DfT=U1XZL8pK+e7j_m=BrjC=VGjqMA@mail.gmail.com>
 <CALpMbdnFrWjPKCSYGThXZ9bA1HYvHV4DBLpKMvSeo8oe6hiN1w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 14:45:20 +1030
X-Google-Sender-Auth: cbr427s0MB33GCKxiDORRoIIZ94
Message-ID: <CACPK8XfRNZO-vLQFdVoYXXx30pwS_3wjicveo9T=ZTthSAzhMw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Fix return code for
 putscom
To: Eddie James <eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 21 Feb 2017 04:15:43 -0000

On Tue, Feb 21, 2017 at 2:44 PM, Eddie James <eajames.ibm@gmail.com> wrote:
> Yes, looks good, thanks!

Cool, I applied it to dev-4.7.

Cheers,

Joel

>
> On Mon, Feb 20, 2017 at 5:39 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Tue, Feb 21, 2017 at 7:47 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> Read/write calls should return the number of bytes read/written on
>>> success.
>>>
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>> ---
>>>  drivers/fsi/fsi-scom.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
>>> index 2874ea0..51b3dc3 100644
>>> --- a/drivers/fsi/fsi-scom.c
>>> +++ b/drivers/fsi/fsi-scom.c
>>> @@ -156,7 +156,7 @@ static ssize_t scom_write(struct file *filep, const char __user *buf,
>>>         if (rc)
>>>                 dev_dbg(dev, "put_scom failed with:%d\n", rc);
>>>
>>> -       return rc;
>>> +       return rc ? rc : len;
>>
>> I refactored this to be:
>>
>>  if (rc) {
>>      dev_dbg(dev, "put_scom failed with:%d\n", rc);
>>      return rc;
>>  }
>>
>> return len;
>>
>> Are you ok with that?
>>
>>
>>>  }
>>>
>>>  static loff_t scom_llseek(struct file *file, loff_t offset, int whence)
>>> --
>>> 1.8.3.1
>>>
