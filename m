Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VYuz6rbU"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpKR95bWxzDrYg
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 11:26:29 +1000 (AEST)
Received: by mail-pf0-x242.google.com with SMTP id g13so669103pfm.2
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 18:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=COFw40Stp3wyGsznBay+1FgUxxhcLouvrBXGKn0eo5M=;
 b=VYuz6rbUL2ATSI0bPiF+sGmb+Jf8tly1vnWJZ+7aQOiAEi2OcM654HowWhKvhlIKRb
 J9XsDLh9rrQ+5sK36Z0qIo3Yq2vkH9/c28PGgwH6dcecOJUjuacMmWGKWTt+3jYpTlDF
 CTEdzK+3n2Vq9BLicn9c+QKAe1H+RBeOB9McKrpi5LyMLFxTg3wkNuScCElPe/3C8qC8
 IjDDYDM5zvvnXwGX4SahyrxOEqVeszNNNWkFJ0vzpYcLLUASLss3QmdCXDLWbj6bTnn/
 qRuErSpwjuh1pieWOlhVa4Dxlaev/k14zzw842/lzilJmBaljPHwj7eUBYZZ8QwKa8KU
 BYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=COFw40Stp3wyGsznBay+1FgUxxhcLouvrBXGKn0eo5M=;
 b=dk+v4b7CgTdcEvEueg3SM6aSM0o4u4J2ces+Q2MAiu7seJRnt+JL5njm96tpO3i3Us
 7X4A60/Gh6/+0kPgqKSImsHS/yZbhmKQzIBM7RljF3A8aDsL0+RFrj7YsOdO3XvLHQ0A
 9zgFDKGzE5/xOU96IJkJA4EOk6zQld5SxiQFk1cX6e0rf1xAXaqEOcMJt2u7/8szSySh
 UWrhAWcnYIHg7+61TyWb7gPe9W42t+EaxENbpvNCYl3p2AXAz7O/zZRdnMNBxakmRlvY
 y+DWg6SlIp5iroLKxvaNcVUAM1E45LQCbx88Zl1B1MIBggyMi0ztEmNpeK4j+vAJOUe/
 roCA==
X-Gm-Message-State: AHPjjUhzjAXorVcaVsAtpDXvdzsyy3basO9qaBX0hygh9Jnx6EZAeRz+
 Gp+JPV0DWykrIw==
X-Google-Smtp-Source: ADKCNb4th7RjEzuuZHsdX2zOOoH2k5fwohGq4ZZpr2nA3YmDHqnCv+i3xcduIYWInh97ujqoV2wZEQ==
X-Received: by 10.99.175.14 with SMTP id w14mr1357262pge.365.1504833987568;
 Thu, 07 Sep 2017 18:26:27 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id p12sm779182pgn.90.2017.09.07.18.26.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Sep 2017 18:26:26 -0700 (PDT)
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
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
Date: Thu, 7 Sep 2017 18:26:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504832527.6124.1.camel@aj.id.au>
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
X-List-Received-Date: Fri, 08 Sep 2017 01:26:30 -0000

On 09/07/2017 06:02 PM, Andrew Jeffery wrote:
> On Thu, 2017-09-07 at 17:27 -0700, Guenter Roeck wrote:
>> On 09/07/2017 08:22 AM, Andrew Jeffery wrote:
>>> On Thu, 2017-09-07 at 06:40 -0700, Guenter Roeck wrote:
>>>> On 09/06/2017 04:32 PM, Andrew Jeffery wrote:
>>>>
>>>>>>     
>>>>>> Guess I need to dig up my eval board and see if I can reproduce the problem.
>>>>>> Seems you are saying that the problem is always seen when issuing a sequence
>>>>>> of "clear faults" commands on multiple pages ?
>>>>>
>>>>> Yeah. We're also seeing bad behaviour under other command sequences as well,
>>>>> which lead to this hack of a work-around patch[1].
>>>>>
>>>>> I'd be very interested in the results of testing against the eval board. I
>>>>> don't have access to one and it seems Maxim have discontinued them.
>>>>>
>>>>
>>>> Do you have a somewhat reliable means to reproduce the problem ?
>>>
>>> It seems we hit a bunch of problems by just continually
>>> binding/unbinding the driver, if you don't apply that hacky oneshot
>>> retry patch. We can hit problems (in our design?) with something like:
>>>
>>> # cd /sys/bus/i2c/drivers/max31785; \
>>> 	echo $addr > unbind; \
>>> 	while echo $addr > bind; \
>>> 	do echo $addr > unbind; echo -n .; done;
>>>
>>> It should hit issues covered by this patch, as the register checks are
>>> used in the operations used by probe.
>>>
>>
>> Hmm ... I didn't use your driver but my prototype driver which also supports
>> temperature and voltage attributes, so if anything it should create more
>> stress on the chip.
> 
> I did add the temp and voltage attributes...
> 
> Any chance you can give mine a try? I don't know what I would have done
> to invoke this kind of behaviour, so it would be useful to know whether
> or not it happens with one driver but not the other.
> 

Will do.

>>   No error so far, after running the script for a couple
>> of minutes. How long does it take for errors to appear, and how do I see
>> that there is an error ?
> 
> I'm seeing failures after anything from a handful of bind/unbinds, to
> hundreds of bind/unbinds. It seems to vary.
> 
>> Does the driver fail to instantiate ?
> 
> Typically probe fails so the loop exits. It usually gets -EIO and the
> shell spits out "No such device".
> 
> Thanks for testing, it's a useful data point for us hunting down the
> source of our problems.
> 
I aborted the test after ~2,500 loops without error.

Guenter
