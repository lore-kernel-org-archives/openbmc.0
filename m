Return-Path: <a.amelkin@yadro.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="s2Ol9D1a"; 
 dkim-atps=neutral
X-Greylist: delayed 405 seconds by postgrey-1.36 at bilbo;
 Wed, 24 Jan 2018 01:49:06 AEDT
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQrm21ShTzDrCh
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jan 2018 01:49:05 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2C4FF512AD
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1516718528; x=1518532929; bh=CoI
 fjzlx+XwFbmw7rWwZwqrzFTxV5ViM5OIA3DQUwvY=; b=s2Ol9D1abLMIQpVUAYz
 EmIegR0L/CTzc2uk2V8B4II5/DbjbCjHQXeUqCJoa5Z+o5DlflL+QnjHxT3n6Hgd
 /R3FNZVqa6h1v8bdCYMiYT/sv+R4RsJnjZfqFWiVxcrDyy4U5fS8Ey1Beww9eAh3
 W5Meqc51zMwM5e/YJtjkryZA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vm8WaqshCd7 for <openbmc@lists.ozlabs.org>;
 Tue, 23 Jan 2018 17:42:08 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E71FC512A4
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 17:42:08 +0300 (MSK)
Received: from [172.17.14.148] (172.17.14.148) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 23
 Jan 2018 17:42:08 +0300
Subject: Re: RFC: calculating RPM from PWM for fan monitor
To: <openbmc@lists.ozlabs.org>
References: <CAARXrtm-yxJ4cVi_RjMUZVbNT9aSKqp5dPzeanW+kMb=JugW+w@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <1953058b-4268-602d-cc68-00eae50b1f4f@yadro.com>
Date: Tue, 23 Jan 2018 17:42:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtm-yxJ4cVi_RjMUZVbNT9aSKqp5dPzeanW+kMb=JugW+w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.17.14.148]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2018 14:49:07 -0000

Lei,

I'm quite new to openbmc and do not yet fully understand its internal 
mechanics, but from my previous experience with other BMC software and 
hardware, I can say that every fan has it's own characteristics that 
include the minimum and maximum RPM it is able to react to and some not 
necessarily linear function between those points.

As far as I remember, AST2500 is able to detect quite any RPM, no matter 
how low it is.
However, some fans just stop if PWM falls below some threshold and 
rotate at max RPM beyond some max PWM which may be quite less than from 
100% (255). I've seen Delta's fans that take about 70% PWM as a maximum 
and fully stop below like 20%.

Hence, assuming a single linear slope from 0% to 100% pwm is a bad idea.

Thus, IMO, the yaml file should define a piecewise linear function, and 
maybe jitter level to allow for RPM deviations.
I would also add a delay after detection of a changed pwm before rpm is 
checked to allow for acceleration/deceleration. From my experience large 
fans (like 100mm) may take up to 4 seconds to reach max rpm from full 
stop condition. This should be taken in account to avoid false alarms.

Alexander Amelkin,
Leading BMC Firmware Engineer
YADRO

23.01.2018 12:37, Lei YU wrote:
> phospohr-fan-monitor compares fan speed with target and determine if the fan
> is functional:
> https://github.com/openbmc/phosphor-fan-presence/blob/master/monitor/fan.cpp#L182-L185
>
> However, for systems using pwm as target, the logic does not work, because the
> fan speed is RPM but the target the PWM.
>
> So we probably need to have a conversion from PWM target to fan speed RPM.
>
> On Romulus, the observation is:
>
> | PWM | RPM  |
> | --- | ---- |
> | 64  | 3000 |
> | 96  | 3700 |
> | 128 | 4300 |
> | 160 | 4900 |
> | 192 | 5600 |
> | 224 | 6300 |
> | 255 | 7000 |
>
> And the linear fit becomes [RPM = 20.7147 * PWM + 1660.04][1]
>
> So how do we make fan-monitor to support this?
>
> My proposal is to define the parameters, e.g. slope, intercept in the config
> yaml, and add this support in phosphor-fan-monitor.
> E.g.
>      sensors:
>        - name: fan0
>          has_target: true
>          slope: 21
> intercept: 1600
>
> If the yaml config does not define slope/intercept, then the default value
> is set to 1 and 0 which matches the fan speed target.
>
> My question (and concern) is, the fan RPM can not be queried correctly when
> PWM is set to a low value, e.g. 32, and it means the fit function may not be
> linear fit.
>
> What do you think?
>
> [1]: http://m.wolframalpha.com/input/?i=linear+fit+%7B64%2C+3000%7D%2C%7B96%2C+3700%7D%2C%7B128%2C+4300%7D%2C%7B160%2C+4900%7D%2C%7B192%2C+5600%7D%2C%7B224%2C6300%7D%2C%7B255%2C7000%7D
