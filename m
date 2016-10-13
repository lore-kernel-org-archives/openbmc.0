Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svx1z07Q4zDt0d
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 03:26:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Zk2yFW2X; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id i127so5862367oia.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7Tk1XCUMo5fKr9kGWMJwoYddGMzWsJaScgBjF6CuO4w=;
 b=Zk2yFW2Xs2d7BbMECEUV/rRXyxlZtT6yPEF6bXxD0LgFKHACQX1NcFyVTcniE8+Xgb
 AtjvytdX+X6A2VkFb095GBETv4+IbZNqPqYA5xwnCDSdmLfqIt2KbLL7DG4mfChwPnKE
 DjRGHgh/a1sfd6npVx5GGak/jv6TXRLrRENQs2FrNHexy0KZ6Eszj6HbZaiDgaPCars8
 99JEKkO3WBG3Z+5TZayJpAIJvq0vZDij4B6TloQD5AJ9rbDRRugza4aBmLQbY3+R5t5S
 M1Ez062zN+0xyMF89RTgULNorb0BX8Jeh/tw3DD3BsSF2++bPdy9shfCa5OqNsTpmLF1
 tYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7Tk1XCUMo5fKr9kGWMJwoYddGMzWsJaScgBjF6CuO4w=;
 b=Bl3fJCsmEUtAxiH1DFD5dDdO73tYXsrJ5CBIchy7V35TpT9QmTRfqCN9QrnCVL1qjm
 Ben2eMdKOahNxBFSYBi9P11qb1msp8yoEdPFl1dvFfAsKktIQjIGoAeD5MJo+qiLKnqm
 6Beax5IOR2Mfs3iP+nFefjFHTSWRQthcew36HZyssIUbydqWiRHpuwPSQgvpJPRiyAMd
 OeIVKDnV/QtTXIib/VQbsLCf8PxgzKXudmTKdbi6hIBRxIlRrf8+xtPLhf46ETyVlrYZ
 jSXvaTJZXJPAdjNRRyrRW5/vdSDrHivlH4VsgaZHyHTqS3LVogYGmUKN9PWvc6ma865p
 ehOw==
X-Gm-Message-State: AA6/9RnOBA8s61n1KdVw0EVu8IMBeXdENEVIWF0bWQxMlMy7dr4tJO4n00LHm3AQAUHeO34bIwzFfuNjHdokKg==
X-Received: by 10.202.117.66 with SMTP id q63mr4612407oic.185.1476375988754;
 Thu, 13 Oct 2016 09:26:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Thu, 13 Oct 2016 09:26:28 -0700 (PDT)
In-Reply-To: <9fa700d8-2882-cb4c-9606-018f08fd9a04@ozlabs.org>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-17-git-send-email-christopher.lee.bostic@gmail.com>
 <ad154be5-d4e3-a163-4962-167bbea924fa@ozlabs.org>
 <CAA0LjjVMOQebHY3MBhqwa=SX-Pmu1u2+SoaRoEJ-yT1dFz4NTg@mail.gmail.com>
 <9fa700d8-2882-cb4c-9606-018f08fd9a04@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 13 Oct 2016 11:26:28 -0500
Message-ID: <CAA0LjjVSnfQS4PO6ddtUwi-1Lk3Rmdm2QSRh9xJ4f-ZGgP6W4Q@mail.gmail.com>
Subject: Re: [PATCH linux v3 16/18] drivers/fsi: Set up CFAMs for communication
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Thu, 13 Oct 2016 16:26:31 -0000

On Wed, Oct 12, 2016 at 8:28 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>

>>>> diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
>>>> new file mode 100644
>>>> index 0000000..ea7a760
>>>> --- /dev/null
>>>> +++ b/drivers/fsi/fsi-slave.h
>>>> @@ -0,0 +1,62 @@
>>>> +/*
>>>> + * FSI slave engine definitions.
>>>> + *
>>>
>>> Why does this need to be in a header file? Isn't it only used by the FSI
>>> core?
>>
>> I suppose this is me not being familiar with the common coding practices
>> of the Linux community.  I would typically put constants and structs in an
>> associated header file even if there was no intent to have them be used
>> by anything outside the core.   Is it a requirement that this all be moved
>> into fsi-core.c as a means of limiting accessibility?
>
> It's not a requirement, but a strong convention. Only use headers for
> stuff that you need to share across other files; this gives future
> developers a definite indication of the scope of these macros, consts
> and structs.
>
> The less that is globally accessible, the better.
>

OK will move that all into fsi-core.c

Thanks,

Chris

> Regards,
>
>
> Jeremy
