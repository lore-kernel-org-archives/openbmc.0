Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MgUZXSXl"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpQVQ2jpyzDrX7
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 15:14:38 +1000 (AEST)
Received: by mail-pg0-x241.google.com with SMTP id v82so873873pgb.1
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 22:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ai/G3lC6cphYwhcAg8g4JaRY95PtppY8/F/pPNPD5po=;
 b=MgUZXSXltfftBuR0IIs/N76c05hF9FwdefB1P5fuLg5SUO4ayubHJ/AR+BxxN+BWsR
 B10DOVhwmF3dyiOd3x+oGE3oR40u0PBT21I7B3RxJI0LuLhXiXp2oMmg9DSsMM60f/r+
 U2rDJBnA1gza20EMD9SSYV95/GfKGvYG2O0nyzLEdDKfl11zIoxMBPS+e5jbGGHM1+MR
 1VjnrQT4EUhac2x+pNZ9IquV9AF3URtZpGl4UruzZ5iV6bG6+1iVUruA/699rYLQjvj7
 dXGnrjTj6+7hWFzHtrtW9Nu6Wg2EbBS1yh103BQRHbkHdX7AGgWllANIJGFPfAPIQ4fr
 P5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ai/G3lC6cphYwhcAg8g4JaRY95PtppY8/F/pPNPD5po=;
 b=GhKOoozO8i1l1jM81Rnpl3AM7TLMScZXkQvr9DpqGyzD0ebUxm9W9n52FuPRKZbw49
 YxvTmOFMkNYR+t0605DE+ZsvTY8YBD6DM+kfRMFNjJ3XIJ2DnQNk+t0dkaDtZyshiSBO
 LlblOOXu2Hvc83theTvWP9ftgjBOxhwufQWN9FAbyE30t3L3knodn4EqJl71x8sJf11J
 q9iRL3tW8fIRYxMAvBvgHwHmOCMHmSPY1kkFxM4XIn3FIj5PIt/gV6H5Qm0v195FJvRw
 1iKeyZwIvmqzR4LHFA8IP0pengcyPNNyKRnLGEekkwiIaiuDSKewFARQxOcF1Jo77i/b
 VOwA==
X-Gm-Message-State: AHPjjUjdDuoDYjNyry1i58S0yag+pa0yMgiiIiInPGFEhGXbsTTtRe+u
 IjoufA1Xi/ly8Szk
X-Google-Smtp-Source: ADKCNb6kzdwXtILmPzqqFW7wXoGJ5gZ0kX7QXQyiGJ4u1olzG1/z5uZyrfL6Gm1E0aE2iYFvkjytug==
X-Received: by 10.98.15.208 with SMTP id 77mr1863274pfp.318.1504847676304;
 Thu, 07 Sep 2017 22:14:36 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id s1sm1772400pfk.27.2017.09.07.22.14.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Sep 2017 22:14:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org
References: <20170905070132.17682-1-andrew@aj.id.au>
 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
 <1504797770.5105.7.camel@aj.id.au>
 <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
 <1504832527.6124.1.camel@aj.id.au>
 <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
 <1504836369.6124.2.camel@aj.id.au>
 <75d9f838-aa4a-5cbd-744a-4d8e8bf1a370@roeck-us.net>
 <1504839076.6124.8.camel@aj.id.au> <1504842058.6124.10.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a9924f0c-ee26-6c6b-262e-84dacb50b6a6@roeck-us.net>
Date: Thu, 7 Sep 2017 22:14:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504842058.6124.10.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 08 Sep 2017 05:14:38 -0000

On 09/07/2017 08:40 PM, Andrew Jeffery wrote:
> On Fri, 2017-09-08 at 12:51 +1000, Andrew Jeffery wrote:
>>> I can't test with devicetree. x86 system.
>>>   
>>> 2,100+ iterations with your driver, no failures.
>>
>> Great. I really appreciate your testing here, so thanks for your
>> efforts. I owe you a few drinks if we ever happen to meet.
> 
> Actually, on that, how did you chop out the devicetree parts? Did you
> keep the configuration writes at the end of max31785_of_fan_config()
> and max31785_of_tmp_config()? Or did you just not call them? These two
> functions cause the bulk of the bus traffic with on probe.
> 
fan config hardcoded, four fans connected. Still no failure.

Guenter
