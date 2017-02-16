Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vNxmG5fV2zDqBV
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 11:26:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sf6D36XE"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id q71so160520ywg.3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 16:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uwFZTXNITMsmDdhRKImVeJLQmYIXG8P8OLoN6ub6gUA=;
 b=Sf6D36XEeOsOvclgLso57uNmn5jbLA4FroarHnPxSPstLldIkAxIYysmjSXgRpu6gF
 92ADY7LYx9ZYIxyQGRphgbfpaPoTcnH3cYZZY1jsw/9YsUfV6ZH0WIOyREBMorUrvUTH
 cgWMX18TCgmp5gokT2OkQJIhBgBKVYDIo3FgDjnqwJYFGSZZR+MxqW63FXIYnaAcM1hA
 jnVsXmAeW7jw9jVH5kGaWBg9fMOUCp2GbdgaV7g4Vk8zARDpOTWFPhRZtf0FuaAGTlVr
 /B+zjVSe53KtsiypONBt0g8AuuOKsIxiXejB/N+OGweq9Ac+e7ZVext1BfU8uwJkyCeC
 0zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uwFZTXNITMsmDdhRKImVeJLQmYIXG8P8OLoN6ub6gUA=;
 b=SQ5apH2b8C6OVpYLcMGqyIla0O8ZFuBpaSUp7145KB6lRj2tbY3D1DyCJtkjYgWIly
 Kq3UutibP9w1ovM/fXfmhPFWjovZoxf8TYgCLywc5ZobDsfyyZ1P4WzZY4OtzTLx1dhY
 yEBwFBEI/c861U/e+n0etxQpELDKAgy7apX7JE4udbWf3F/mDEJdWO/0DthYkHvz/As3
 GOnedXa3YhvzBR+n9gGOwRLfcz5GPUhNvmi2PtYfJHxEojhEgAxPiSEbp0pzJKduJc5G
 qvP9mzfaRllzetEAkOj9o2IRbUTqB+95w1JJIE3OyQcHYslfV6DLdgpfd4dHBGX2VNZl
 yrkg==
X-Gm-Message-State: AMke39kXSGmLPpQoeQr+3+ERcKwkoGCB3GCqaqAEsTzfvAfE56UHYTluPwwhUwaiBLlitpAq+Bi9RFWq8VSvUw==
X-Received: by 10.129.73.65 with SMTP id w62mr26987542ywa.288.1487204795534;
 Wed, 15 Feb 2017 16:26:35 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Wed, 15 Feb 2017 16:26:15 -0800 (PST)
In-Reply-To: <070de110-e2d4-6ac6-25a7-653d80342d2e@linux.vnet.ibm.com>
References: <1487016480-17700-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1487016480-17700-2-git-send-email-eajames@linux.vnet.ibm.com>
 <070de110-e2d4-6ac6-25a7-653d80342d2e@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Feb 2017 10:56:15 +1030
X-Google-Sender-Auth: YWu_nD_WRKd4nQ7Ty_YqYQs6vUs
Message-ID: <CACPK8XeAiB20yxEACVFUW+yWf9EQ3TP4g291Ds2uFgdzCEB3ig@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/2] drivers: fsi: delete device on unscan
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Thu, 16 Feb 2017 00:26:40 -0000

Hi Chris,

On Tue, Feb 14, 2017 at 7:30 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Acked by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Thanks for checking over this.

Next time you need to write "Acked-by" for patchwork to recognise your tag:

 http://patchwork.ozlabs.org/patch/727563/

Cheers,

Joel

>
>
>
> On 2/13/17 2:07 PM, Eddie James wrote:
>>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> need to delete device so that client driver "remove" is called.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/fsi-core.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 1e9c5a2..e8a3618 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -512,6 +512,7 @@ static void fsi_master_unscan(struct fsi_master
>> *master)
>>                 list_for_each_entry_safe(fsi_dev, fsi_dev_tmp,
>>                                         &slave->my_engines, link) {
>>                         list_del(&fsi_dev->link);
>> +                       device_del(&fsi_dev->dev);
>>                         put_device(&fsi_dev->dev);
>>                 }
>>                 device_unregister(&slave->dev);
>
>
