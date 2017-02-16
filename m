Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vNxsR5NtkzDqBW
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 11:31:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lg8m7osR"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id o65so84442ybo.3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 16:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=stFC4hjHJV34soh8DqdfKn1DUYLng0t/ZSOovvZM4BI=;
 b=lg8m7osRC5z3I8y+kK+Ota/E2aAY/1JOvuG4rZPD3NruQzw+5plG3zN/oxUuq43Jxg
 DzmZDJsy09cVIbXtuxgB214WW9K4bAJsT3LuS0gQSj02Mkp1bEbKfVR8ztfnScKJ8j7U
 SCos6RUEEedCThQiWQhlcc1V4EtuqPMKWrEIOsZOH3ogEC8JE7RSEkGFb9zE4Al0nNM6
 nIcy5wyBHCwSAAngy76lJNKJ1h7AihOfiaiQX1t4+vqEIFKQeIUBg9OSMvIowAcqaJfw
 GbNqzLfOoe/fcvr4sVF61C8xOmTSQu+a8YfmTS4dgi0X0yjBPO2+ciq9Y3OsDrXDoCsP
 fXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=stFC4hjHJV34soh8DqdfKn1DUYLng0t/ZSOovvZM4BI=;
 b=QiJcOsFY77wkzLEZBh9P1KqoRB1SszHsqL33GLVuPB6Eokj+JPby2m3+6uPKA8klR7
 wnQhPE8xZGkA/tL3vvYGYC8aGQznggZqMTRboj44HMxl6WGd5pV1aCOB+DOJkG5h2Zch
 9ZacWxuxJJelRyBgmso/RrSEHQW/rq99+T/YaO3Sp/deV19cT59LXjZIVOoL6SODGy3w
 t0sxcAF4s6Ba8uRzpKSPy4LJdM519YHqvArXVepNDh4GS6aMVZpD9dckEP25j5eb6LYu
 6Tijd4+M8tpC/Ph1YNCO1miIki+JrldWVwgmjpLzNjXGDBrXYcw8Vc2nUp7B0gl7dFwr
 WKaw==
X-Gm-Message-State: AMke39nDCyqkqYNpDycE+nEW9qtAHhWfp2BPcM5loDnQo7+rirodiqXzKYyGR8gbIKSrX//95ebwGwCaaWS9+g==
X-Received: by 10.37.170.33 with SMTP id s30mr26605070ybi.153.1487205065622;
 Wed, 15 Feb 2017 16:31:05 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Wed, 15 Feb 2017 16:30:45 -0800 (PST)
In-Reply-To: <d7155853-8eff-d6f0-add3-bd8a468789e6@linux.vnet.ibm.com>
References: <1487016480-17700-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1487016480-17700-2-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xfx_uhrXkUgOAh7R=j+Tux5vBGvJ47XYZTLxJskar3Xug@mail.gmail.com>
 <d7155853-8eff-d6f0-add3-bd8a468789e6@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Feb 2017 11:00:45 +1030
X-Google-Sender-Auth: grA-LM8eRA-BAwFn_L7wR8Y8uJo
Message-ID: <CACPK8XecYW58ZXC_DDLZDfQaouKEb1EfM395wMONoZQAeCi-Jg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/2] drivers: fsi: delete device on unscan
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
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
X-List-Received-Date: Thu, 16 Feb 2017 00:31:08 -0000

On Tue, Feb 14, 2017 at 2:41 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> On 02/13/2017 06:18 PM, Joel Stanley wrote:
>>> @@ -512,6 +512,7 @@ static void fsi_master_unscan(struct fsi_master
>>> *master)
>>>                  list_for_each_entry_safe(fsi_dev, fsi_dev_tmp,
>>>                                          &slave->my_engines, link) {
>>>                          list_del(&fsi_dev->link);
>>> +                       device_del(&fsi_dev->dev);
>>>                          put_device(&fsi_dev->dev);
>>
>> put_device calls kobject_put, but device_del has already called
>> kobject_del. Are you sure this is what you want to do here?
>
>
> Hmm, I was just doing what device_unregister() does. We manually call
> device_add() for these devices, so I understand from the documentation that
> device_del() should be called, but I think device_unregister would work as
> well. I can confirm this works and doesn't throw any warnings after repeated
> fsi scans.

Thanks for looking into this.

I will merge this patch as-is, but please work with Chris to get this
change added to his upstream FSI patchset. The fix should be folded
into his series for his next submission (v4).

Cheers,

Joel
