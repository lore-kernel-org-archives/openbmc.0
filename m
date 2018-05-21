Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22b; helo=mail-oi0-x22b.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tBJZMbV0"; 
 dkim-atps=neutral
Received: from mail-oi0-x22b.google.com (mail-oi0-x22b.google.com
 [IPv6:2607:f8b0:4003:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qLgc4JDSzF15H
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 00:26:36 +1000 (AEST)
Received: by mail-oi0-x22b.google.com with SMTP id e80-v6so13130787oig.11
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=FAkuJbeUkmDgQMRZyN6e6AKeXRBIJ4aSberJJvho+eU=;
 b=tBJZMbV0X0fHj9Z1d8FrN2ECaU4oRA9M3Rlr6E43ZAbGmZc/uvzNIfb1qmMRsHi55U
 09DBOgWptr1Yj6XfyZrTPdmTi6hvgjnrFVCVebWFtwesXGpDBPgD9XOsG3TKxyoDKcVQ
 7g8SOQX0c5vr8P0SRkF8x/nAt+as7oj2vlFfI6yL3oQKt5p8Qu6zJXetkW+C+X8gbkTm
 OBokUKzqqVcqIqBMDWPms7LaVfOb2FOIpEQqQTe3JRwk41oKo0BnWQX15/zv7ZwdHbXc
 3nBxLtggm2nfpZLStS4qEjz4JqOsMlgCu4av2wH6S+ZQ8gzjLGWpu47xP1KL71pa8dEI
 Hb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FAkuJbeUkmDgQMRZyN6e6AKeXRBIJ4aSberJJvho+eU=;
 b=GU48vp5ZoztmrBxldNfXJGfE5Imfk251F1fO7JprndrDxUJxZKHUJkO4Fi0vu8k57f
 X1yEkBWaP+cRnUxslG809atPOUt/pwzElpHxSzYNPXO38F48j2VrxGo50soKNNzGyczq
 hJ5VqleDXIU8hePq3TrIUtFV9zlzmhXqMBo4843hAcLVFcLLqlT22YQ9LlD+UL0Y552e
 qvZij5V+jye/7Nu5wuSqVjVHOTZEO2bNFYSUbaS4dl3ckokX8XXFEGFX4FUpSnSAawFA
 0rCtTIYK/fV+UuAGkddiAmIbRazHvgdymrdV/YJ9V6kJLbHO8yJEkMFRevBSu+fmddSt
 DlZQ==
X-Gm-Message-State: ALKqPwfBIih4FUDhNvldtf0vTLAkOAggGLkCGEwStWjjvKE/GN5NNu+k
 6jBKHKySeZRBSf6/e9YmOWQqK/I0
X-Google-Smtp-Source: AB8JxZqL7V2MCD0PTAdUc7i4t4bgEcLP7QWQZYJ6cB0ganCBe5p6m1I0Tsbtrka5vX+kIJnbomgyTQ==
X-Received: by 2002:aca:584:: with SMTP id 126-v6mr12302303oif.2.1526912792683; 
 Mon, 21 May 2018 07:26:32 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 14-v6sm7902955oth.15.2018.05.21.07.26.32
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 May 2018 07:26:32 -0700 (PDT)
Subject: Re: OpenBMC Fix-It
To: openbmc@lists.ozlabs.org
References: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
 <CACPK8XcTC_BnxVCW4fEymcfGGwpOPGY-cOhWx_1MfhJ6jD_stg@mail.gmail.com>
 <CADfYTpEb25ex9znunS1xBtWm7x-Zc8VOw2wAQ33B1NT03rvouQ@mail.gmail.com>
 <CAARXrtmUQHcZi-3dHaY1smbc9stBt7TLANqgMm3E=GUQvv=3fQ@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <6828b131-6a9b-3530-5fe3-9f81043ffb34@gmail.com>
Date: Mon, 21 May 2018 09:26:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtmUQHcZi-3dHaY1smbc9stBt7TLANqgMm3E=GUQvv=3fQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
X-List-Received-Date: Mon, 21 May 2018 14:26:37 -0000

On 5/20/18 9:59 PM, Lei YU wrote:

> On Sat, May 19, 2018 at 3:13 AM, Nancy Yuen <yuenn@google.com> wrote:
>> :D Happy to have you for any part of it Joel!
>>
>> ----------
>> Nancy
>>
>> On Thu, May 10, 2018 at 5:43 AM, Joel Stanley <joel@jms.id.au> wrote:
>>> Hi Nancy,
>>>
>>> On 9 May 2018 at 04:58, Nancy Yuen <yuenn@google.com> wrote:
>>>> Please join my team for an OpenBMC  community "fix-it" event in June!
>>>>
>>>> My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
>>>> part of a larger fix-it initiative. OpenBMC is a large part of our
>>>> project
>>>> so I'd like to spend part of the week on a fix-it on OpenBMC.
>>>> Anyone interested in participating?
>>> I would be, as much as is practical given timezones :)
> I would be interested and would like to fix unit tests in sdbusplus.
> But I'm not sure a different timezone (GMT+8) is OK or not :D
That's the great thing about a virtual sprint - IRC never closes. As 
long as we track work and progress in an open list/document, as people 
come on line, they just take the next bug and run with it. Those that 
are available in the same time zone can work together via IRC. I am sure 
that others participating would love to wake up and see bugs fixed 
overnight. Successful vSprints require everyone to be committed to 
staying focused on the tasks and communicating everything in IRC.

Kurt Taylor (krtaylor)
