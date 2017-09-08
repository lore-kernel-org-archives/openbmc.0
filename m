Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::244; helo=mail-pg0-x244.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UKsIxQuW"; 
 dkim-atps=neutral
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpPpd0bg4zDqZ9
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 14:43:35 +1000 (AEST)
Received: by mail-pg0-x244.google.com with SMTP id m9so845593pgd.0
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 21:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bpy8WVadnfRV3pFQf249egfIg/r46tXRFF3nNXfYL5g=;
 b=UKsIxQuWSxo7JFtV0p1YUm6/CFmhhnykKepUwz5HpesoyCe0qKN6kxmMw29SHfKEsd
 D+7/E5teQ9Zmp/AJM2GXVgfnNhbioc0s9zPE9jkhqdfVgSUeccJkfwKFK8SSvuXPAN7K
 CLDbz3aj0zV4QyJ/MYZkJ19yAMceKaK6bfRS52NoV3EgiyuriF5OAUt1WasqmdkMUM2o
 SDFdz12vidvIhlOw+pmRCMYQuraJuL36z/o/cdrO9aOFXZyoBl8cVIno2OXrj5EuXRBz
 kn8tSEPcOrLzwKFjATHJKvEGMPlfaSD0HrwNPRfQAD7nY14SHPWS1+b4aTbqmnG1ngXU
 wnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bpy8WVadnfRV3pFQf249egfIg/r46tXRFF3nNXfYL5g=;
 b=L7M1/DGOpUWk6TlzXsNzj11JTdTLWuq9Dec+WGKv4oDG1p92pSblbFFJXuq0Uu9Zko
 jb2hIdGasT8XtznpVfyEQyy7StDgCKqi2Jsk6GNRpCdbtGE7RP1h9ls8oNpQ+ExnnlzQ
 5399qLQbEjaqcaWECKw37e3L7qYf07//KYifV2rze4CSQMoCjwquSaAISWpDoMwJUlNy
 OyZ7WIari19fXTURkhLW/dXBdmDU1pW3qe963ze1QVgRIztlwpwcQPyDP/w4MocR2V+G
 GzYHbEmV/GGVIbDWzSvgcTps45mDQ1qWnzRTrnA8EoIql/BeWqCZfu1NVqmMh3B5TIHn
 2WtQ==
X-Gm-Message-State: AHPjjUh7jT4vnGBea3f5ZM5Dh+MufXEaDCZ8K6woQuyCk5STHNet59Yu
 W4S/d2A8cujU2A==
X-Google-Smtp-Source: ADKCNb4VR0ARVXBdjDFC3TRMQbbQgx8i67OXbsIiNmN+XuRW9Exyc8ANR9B4zRzrMvHrlhtOxcL0lg==
X-Received: by 10.84.216.69 with SMTP id f5mr1965763plj.212.1504845813107;
 Thu, 07 Sep 2017 21:43:33 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id w90sm1559397pfi.80.2017.09.07.21.43.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Sep 2017 21:43:31 -0700 (PDT)
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
Message-ID: <020c1373-6c3e-15e0-340a-e617c3147610@roeck-us.net>
Date: Thu, 7 Sep 2017 21:43:30 -0700
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
X-List-Received-Date: Fri, 08 Sep 2017 04:43:37 -0000

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

I didn't change to code, just compiled and run it. Guess that means
this part was skipped.

I'll replaced the fan configuration with some hard-coded values.
We'll see if it makes a difference.

Guenter
