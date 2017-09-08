Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qhjv1Gi9"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpLYl65y3zDrX7
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 12:17:15 +1000 (AEST)
Received: by mail-pf0-x243.google.com with SMTP id g13so720957pfm.2
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 19:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QkFrV6w2TAdCzaZrvh/ObLiqMSl1QZirj1nfPFRFtPw=;
 b=qhjv1Gi92tEvH2REG4k/hEr4OtYNupe53pSGjoJ+7RsfWh6yxDcyj1GBmpFsb+hcjj
 GcH9lpLaqmM2EbIVbcqShy2Zd5K1en/mPpF0b6sDGauVN0AiyuDoi5850qunnVrxv9FZ
 IW3tB6Feal+jVh0J+nMBPEaF9CMWYQjSHSDy/LdRuIjV3+9sADp4nqoanYQwvqS+3Rwx
 4QkbW1F/zO1KjEXTzto1P3fBaTTJddrH85O3y5Y7297z7x01S9U4WUcfA6iZSvh1yEJv
 PdvOs4Fqlfuj79bvqfmD62Y3wTc/lq+uQ5j+Jz5Svu3OAMaPV3F6aCMMH8ypCAL1b/Ri
 0/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QkFrV6w2TAdCzaZrvh/ObLiqMSl1QZirj1nfPFRFtPw=;
 b=hnHfQYffVhpgcPxqPXeDHMNSBa5ZlWUED4E5jV3QkC5U9GqMF9WSSGdP7wiMQeh9PI
 noBRK4lnwjAzCcIt35L/c8INZzVZYeq8IRYtxPZ6EYtu6WWkGI48tFVLIj/2Fe2cZLYI
 rPyYwt2Yo7rWl1tFNe+wk07spZOlp5If39FjSaPCWgluA/iPG3U/IiK49qbqZqB9Wu/3
 kljQm0OOmcfMRGWz/JUlmF9Zs/1e2GXGTaPSBPrb2Gnv3XCWOHfROlybxjQuV0OEE9qp
 QATY8/qiYNajB+gzMudK/OMfRifJdh6P1CPsoCFoaOo7qTty68r9HospZz/HinL9Npop
 nggw==
X-Gm-Message-State: AHPjjUhw45nt5x/SCBkOKi5TJvUc34MDQ/MOsDN81VR0upUn+MBfun7h
 V9VlaYZaYgdHFg==
X-Google-Smtp-Source: ADKCNb5v+iQ5gVOgyAIfDovJ945uD/j3O0DE5YYLHYv4cHSw6Jw/VB2cMwJH3mdyollmOvygWqpOfg==
X-Received: by 10.98.159.137 with SMTP id v9mr1448579pfk.49.1504837033395;
 Thu, 07 Sep 2017 19:17:13 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id d186sm1106201pfa.97.2017.09.07.19.17.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Sep 2017 19:17:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au
References: <20170905070132.17682-1-andrew@aj.id.au>
 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
 <1504797770.5105.7.camel@aj.id.au>
 <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
 <1504832527.6124.1.camel@aj.id.au>
 <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
 <1504836369.6124.2.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <75d9f838-aa4a-5cbd-744a-4d8e8bf1a370@roeck-us.net>
Date: Thu, 7 Sep 2017 19:17:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504836369.6124.2.camel@aj.id.au>
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
X-List-Received-Date: Fri, 08 Sep 2017 02:17:16 -0000

On 09/07/2017 07:06 PM, Andrew Jeffery wrote:
> On Thu, 2017-09-07 at 18:26 -0700, Guenter Roeck wrote:
>> On 09/07/2017 06:02 PM, Andrew Jeffery wrote:
>>> On Thu, 2017-09-07 at 17:27 -0700, Guenter Roeck wrote:
>>>> On 09/07/2017 08:22 AM, Andrew Jeffery wrote:
>>>>> On Thu, 2017-09-07 at 06:40 -0700, Guenter Roeck wrote:
>>>>>> On 09/06/2017 04:32 PM, Andrew Jeffery wrote:
>>>>>>
>>>>>>>>      
>>>>>>>> Guess I need to dig up my eval board and see if I can reproduce the problem.
>>>>>>>> Seems you are saying that the problem is always seen when issuing a sequence
>>>>>>>> of "clear faults" commands on multiple pages ?
>>>>>>>
>>>>>>> Yeah. We're also seeing bad behaviour under other command sequences as well,
>>>>>>> which lead to this hack of a work-around patch[1].
>>>>>>>
>>>>>>> I'd be very interested in the results of testing against the eval board. I
>>>>>>> don't have access to one and it seems Maxim have discontinued them.
>>>>>>>
>>>>>>
>>>>>> Do you have a somewhat reliable means to reproduce the problem ?
>>>>>
>>>>> It seems we hit a bunch of problems by just continually
>>>>> binding/unbinding the driver, if you don't apply that hacky oneshot
>>>>> retry patch. We can hit problems (in our design?) with something like:
>>>>>
>>>>> # cd /sys/bus/i2c/drivers/max31785; \
>>>>> 	echo $addr > unbind; \
>>>>> 	while echo $addr > bind; \
>>>>> 	do echo $addr > unbind; echo -n .; done;
>>>>>
>>>>> It should hit issues covered by this patch, as the register checks are
>>>>> used in the operations used by probe.
>>>>>
>>>>
>>>> Hmm ... I didn't use your driver but my prototype driver which also supports
>>>> temperature and voltage attributes, so if anything it should create more
>>>> stress on the chip.
>>>
>>> I did add the temp and voltage attributes...
>>>
>>> Any chance you can give mine a try? I don't know what I would have done
>>> to invoke this kind of behaviour, so it would be useful to know whether
>>> or not it happens with one driver but not the other.
>>>
>>
>> Will do.
> 
> Thanks. For reference, here's a devicetree description:
> 
> https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L283
> 

I can't test with devicetree. x86 system.

2,100+ iterations with your driver, no failures.

Either it is because my chip is a MAX31785 (not A), or the configuration makes a difference,
or it is your hardware.

I'll try to connect a couple of fans next (so far I did without) and try again.

Guenter
