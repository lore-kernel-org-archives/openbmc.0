Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vb2HSNhc"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpJ766y6RzDrXT
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 10:27:30 +1000 (AEST)
Received: by mail-pf0-x242.google.com with SMTP id q76so601317pfq.5
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 17:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BYSUy3GQd6qXLnQfaiTtIzf4kSMPXjyVty8SdUqQdD4=;
 b=Vb2HSNhcKLMYK0Tm2EScmMTVqy3Wm6jLPIbcaQ0ViEPbT14ERgaf9xEmeeIlob7vKJ
 JM3Ei5AvkDFcF5LrWKDncRcustAdsQciyXVG9S1NYwNEgNACNwKsTjiReFS0FHr86hSG
 aX2IgU3Q8qNVBlLF6a+uAYrZ951mwdoZSKoVkr2tGJhUuuqDLZNpKANXh+2bGEjOCPjh
 M+chOmjbqUnlKrEsc2SfbqgSN7hC9ZApxjkAyL9YA70INarudu2Kg1dwEm1+vS8Wg+AX
 UuCXIVLCN/W3SbFZrMbK1yhwMGY0TC5F5QOzR9H59+PxOhyUq0fx1TcTii95ckSQBc/h
 a4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BYSUy3GQd6qXLnQfaiTtIzf4kSMPXjyVty8SdUqQdD4=;
 b=mEuqlpZsUtR3ypColD3IoPznf0iiBYnm+DR8dKrZ7W4XxdwcL/hQctgSSSFv6QGO6M
 qPgDS6wJyTKj2OLKQCJ+5e9eRb0jgANnG9TngLHd4JqOA6qxtGdWtU5jeDmKFReZXP4l
 QJkj9Wm/C98LCUUIeWVYSKW1G3eBtZU2oo8Z9QKGg6Lo+75Zc3opl0ViKJsl4WbCtyxk
 vEKdu7AFfV6XWVdQ33BDZEfedUTemb97M4GA/9apnGmIOwj7UriRD7/9ov0SSBeojIkE
 FrmlEZjeEyAQpgj0ctPyGGqwSy5HI3lOQkfJ/mFrSMxqcr1lnHwDOiJan61+0Tq8ctjJ
 gn9g==
X-Gm-Message-State: AHPjjUi6Ro563bTzQSh2GHRnAFwBRHtSS4iRsRuBOTa9kTqKuNe/mP3z
 UfaNQX3j8b8nfQ==
X-Google-Smtp-Source: ADKCNb6xjadZIJ/YnKBF71YiboDV2mgs/vEGmfH7c8E7rsXFmiQs/KUeYVsY5wZu4EafyRKdEuORMw==
X-Received: by 10.99.110.142 with SMTP id j136mr1191651pgc.390.1504830448427; 
 Thu, 07 Sep 2017 17:27:28 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id 77sm972441pfz.47.2017.09.07.17.27.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Sep 2017 17:27:27 -0700 (PDT)
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
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
Date: Thu, 7 Sep 2017 17:27:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504797770.5105.7.camel@aj.id.au>
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
X-List-Received-Date: Fri, 08 Sep 2017 00:27:31 -0000

On 09/07/2017 08:22 AM, Andrew Jeffery wrote:
> On Thu, 2017-09-07 at 06:40 -0700, Guenter Roeck wrote:
>> On 09/06/2017 04:32 PM, Andrew Jeffery wrote:
>>
>>>>    
>>>> Guess I need to dig up my eval board and see if I can reproduce the problem.
>>>> Seems you are saying that the problem is always seen when issuing a sequence
>>>> of "clear faults" commands on multiple pages ?
>>>
>>> Yeah. We're also seeing bad behaviour under other command sequences as well,
>>> which lead to this hack of a work-around patch[1].
>>>
>>> I'd be very interested in the results of testing against the eval board. I
>>> don't have access to one and it seems Maxim have discontinued them.
>>>
>>
>> Do you have a somewhat reliable means to reproduce the problem ?
> 
> It seems we hit a bunch of problems by just continually
> binding/unbinding the driver, if you don't apply that hacky oneshot
> retry patch. We can hit problems (in our design?) with something like:
> 
> # cd /sys/bus/i2c/drivers/max31785; \
> 	echo $addr > unbind; \
> 	while echo $addr > bind; \
> 	do echo $addr > unbind; echo -n .; done;
> 
> It should hit issues covered by this patch, as the register checks are
> used in the operations used by probe.
> 

Hmm ... I didn't use your driver but my prototype driver which also supports
temperature and voltage attributes, so if anything it should create more
stress on the chip. No error so far, after running the script for a couple
of minutes. How long does it take for errors to appear, and how do I see
that there is an error ? Does the driver fail to instantiate ?

Guenter
