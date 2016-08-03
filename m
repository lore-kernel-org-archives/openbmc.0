Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4KsZ0P6RzDqQ5
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 03:33:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OtAWhod5; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id l9so20498281oih.0
 for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2016 10:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bfCdgKrtKTJ28W+bgTGpMLEknu8j3/zQyFyKRdNK0nU=;
 b=OtAWhod5PM4i5+cP19aYGs1zI7Ogx4q/02/KwVkEj/CYzMEnSRfb7owOSZWVOQCjbf
 TjZphahsUS/wfMTdoYZjLqDdCZR5/zm8/nA9TFspu9vJs/V4xM58+1b2yrr5UN4+xDQx
 pkFIlthQG+Mm74igx58KXf6VTdfBt66uSMRr4ihWg010EdEh/RAf3zJ+NvqsD+eyrUVH
 UQR/+gZbrxSnOSnRRPZHAAoYUOCvPJIq4kJFztvIcb7ZNDGYCOnqwsBIrdqGINd7VD84
 l4TXSUJqUWVlSkyQQjytkLk2rz/VtMOABY34Qpe/JZjKCfqSuBu3BmQM51c3AGPTn6Ci
 DKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bfCdgKrtKTJ28W+bgTGpMLEknu8j3/zQyFyKRdNK0nU=;
 b=EjjTWEICY3u0XrnqHBc3IjbpDxzgXZwHKHcFh1VccduPP1J4//trZ4M2cuu9d4uWxG
 0cwMvywvIw4fj8Ap54m3ePm2Ucqzgo7MH15X8iUR2bV1jzV+wWApgNkaeCfoyux8LuW8
 By7sl5+dBLCOUepHjKJI9D8bh7eUvt9OL9LNgUY8C0TIaPItz5l7tBcYcf5O3FPJJMC4
 iVY2QJiXH4WqQbH5VqlpK+6zTMGNl3j0rWVMnB9zcVAP9oLvfCsXJbdgewymXlJVMVZZ
 k2D/k2yv8WzR7Dj1obCIF51+wh6G6f+oxfSwMTSbyiHHweUAaZ+0//x3lqn9+gK1WQDo
 tRdA==
X-Gm-Message-State: AEkoouvUTvn70XCt7J//ZJPtjCRE6bdT54xOxit4e53AcfpXK5P3DxDdY6eCCWNRATrlxJVopF0iqSoiD86nqg==
X-Received: by 10.202.61.70 with SMTP id k67mr28652424oia.204.1470245583855;
 Wed, 03 Aug 2016 10:33:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.196.198 with HTTP; Wed, 3 Aug 2016 10:33:03 -0700 (PDT)
In-Reply-To: <CACPK8XefFQ1-HuOhuAcR_w7tc=XZjxX8U6rYvwwZbASEaApsXA@mail.gmail.com>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1469729698-37246-4-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XefFQ1-HuOhuAcR_w7tc=XZjxX8U6rYvwwZbASEaApsXA@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 3 Aug 2016 12:33:03 -0500
Message-ID: <CAA0LjjWxiWgC71CSpFXXGFj+9+gQUy8ZDE0Tg0dG0AnM1PrqjQ@mail.gmail.com>
Subject: Re: [PATCH linux 4/4] drivers/fsi: Add FSI link buildup function
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2016 17:33:06 -0000

>
>> +
>> +       return p;
>> +}
>> +EXPORT_SYMBOL(fsi_calloc);
>
> Why are we exporting this?
>

FSI has a wrapper for dynamic memory allocation in order to keep some
local stats on memory consumption.
Has been useful in the past to have this information available.
Probably not something should keep?
