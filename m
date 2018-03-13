Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bfmMdyvV"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TAFs5tRs"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400gHm5NnyzDr59
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 14:26:28 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id 132so4004208qkd.5
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 20:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gDP+ctPfEwURrq6eCplyN4KaPSDJc5xir43yugN5tdY=;
 b=bfmMdyvVWO+bJVY+tkz0EanPReikGPjqt50sew3YiA+j7TigoDcVsiVo2o3bPi0XJh
 XyPP28X3Emr2Afyt3eJ1HpTOiEpkjfya/4WJ7tebOeibcWFvJdQzqLM0mj8kDTKNTMep
 bji/fSE9rUoFQhDo8WvZwBFkbWB4FWnhiN3asUlhrqKidkLWitayem1HtqQIuEMfg7Rc
 hwjHbIQlTdmYp7APRtnZzfH95obFQXh7vyKgFjrt1vCtd59h5GC7ysBAVa3xnSdZEXW6
 DVeZrb+p4vjAJAZTbgeC6f/kV5iHN5Ahhh7a1SRR3gXQ2u+YqgpW1e2WHfZVqAOVbXyq
 gpzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gDP+ctPfEwURrq6eCplyN4KaPSDJc5xir43yugN5tdY=;
 b=TAFs5tRsvc3xW2Zxc0eAhp0+xr9fb9mmFvbPUAAno9Mp49shj+T7vdmra/Zlo9O7sV
 7t1tvwkNpIwMjnnwxDjkfeQONaICuSXP92CYplay20CTvMvurD9umAZLBTw40KRpkJNV
 JGgNGXqtIHYufdxMEGfXd41TjAn+JfMVPsjLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gDP+ctPfEwURrq6eCplyN4KaPSDJc5xir43yugN5tdY=;
 b=AV7UWvgqy6SSoekxbTiKHz7He36ahHaW/EPdymdzAAsLcJLf6tZWKkVes/w+EHv1ok
 JEpe9vzj40RoAotPgP0mT03ymkskztqPnwV8BdbrgSy+C6Ai4vUbK7S4ZEnTBeBX8l85
 /cO0J7K20sBFnQZgQiWoFQP87F9PTrUuMucAF1Axn4TaHLdd9VYniUquwa58a7q+4Qzt
 JeiF3C9IOZC3NCjrM71BvO5GU+MU+bAN5fUPHjWnsQfwhBQVTnk76ZXbIUts1fXj/Da/
 mjtMrceqsT5yjTjvRl70I4S8RUZUI1JW/bK9tizazyzXqngQAJTx/F3M8rO5+UwssOLz
 in6A==
X-Gm-Message-State: AElRT7E7c/8lINE+oNC90j5/XvwRKiY1v7K02Z/2KdRARsKPFv1Ahqzm
 P3TB7udeq5Dgn1EOI/uZCgcRZCD+rcYEHelQB6s=
X-Google-Smtp-Source: AG47ELtKGPQCzJtxovuRPypBrE8jedBhXl+0c1jep9EZVXNhdXtJ1OTDrO5nUUzRVKr5GjUMYoCAd3QQ6wWOoV1EqpM=
X-Received: by 10.55.20.194 with SMTP id 63mr14131311qku.203.1520911585611;
 Mon, 12 Mar 2018 20:26:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Mar 2018 20:26:05 -0700 (PDT)
In-Reply-To: <71fbea13-49db-3a3e-40de-ab30b34c38ab@linux.vnet.ibm.com>
References: <1519944259-27898-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1519944259-27898-2-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XcKZvvU27n575J+GQ=kAm3PONYqWCZwESEaxq5Ne0KP0Q@mail.gmail.com>
 <71fbea13-49db-3a3e-40de-ab30b34c38ab@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Mar 2018 13:56:05 +1030
X-Google-Sender-Auth: 4K6otTb8mhkUM1Y1CAz8xyfrSu8
Message-ID: <CACPK8XeuAjZa_A7FubAOpTRr1MQeBWKFQoqakGi-3QnGZASgvA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 1/2] hwmon (occ): Remove temperature fault
 attribute and VRM temp alarm
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, spinler@linux.vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2018 03:26:29 -0000

On Fri, Mar 9, 2018 at 5:45 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
>
>
> On 3/1/2018 6:39 PM, Joel Stanley wrote:
>>
>> On Fri, Mar 2, 2018 at 9:14 AM, Eddie James <eajames@linux.vnet.ibm.com>
>> wrote:
>>>
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> This removes the EAGAIN return for "sensor not ready" and the temperature
>>> fault and vrm temp alarms attributes.
>>>
>>> Apologies for pushing this up so early... Userspace applications aren't
>>> ready for this change. The hwmon polling application cannot accept EGAIN
>>> yet, and we can't be returning apparent errors if the sensor is
>>> temporarily unavailable.
>>
>>
>> Okay. Brad's email is from October 5th, 2017. That's 148 days ago.
>>
>> Any ETA on when the userspace plans to get some love?
>>
>
> We have 4 issues in the backlog to address the OCC GPU sensors returning
> either a 0 or 0xFF:
> https://github.com/openbmc/openbmc/issues/2327
> https://github.com/openbmc/openbmc/issues/2329
> https://github.com/openbmc/openbmc/issues/2222
> https://github.com/openbmc/openbmc/issues/2223
>
> As fan control is already doing the right thing when it reads the values
> as they are now, we deprioritized the work quite a bit so it still
> isn't scheduled and may not be until later systems.

Okay. Lets get that work scheduled ASAP, as it's already been quite
some time since we needed that fixed. I think it's now holding up the
Witherspoon team from moving to the new kernel.

Do you have an ETA?

Cheers,

Joel
