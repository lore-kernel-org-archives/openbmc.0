Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oWMj1w7/"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xp1n24QSNzDrWN
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 23:40:53 +1000 (AEST)
Received: by mail-pf0-x241.google.com with SMTP id q76so4525360pfq.5
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DeaKXJUQur//vNoyow/ffDf5TMiLNOrSbWjaaPYbkyQ=;
 b=oWMj1w7/zeg9Bi2KDZKZl4dNXxbHsPnRDDlIuY7H+9rbHmt+kDwXRDS7/ureSMbNr1
 wyhFm6yEq7AoncxQIg3AaIoDKcc67fclR/ZpcZKhfhRBtM/yyRGfrUPVx81+oP2VAS4j
 Bez0rfXZ3U8CCOSWRNRWq0iGHZrXB872ZqhSIVysTX5DXYe/f6xK7bue+GdnQRQa68xW
 nKzfDvAtTAMbOHfg+8SrZWDiLNbzH6AaYVHMv3KMqf3fj86cq1zRoKiJwaUYxITbjc0G
 GtYXU6H5WcocQUtrPDiAkwdCoc04YZj4mlta3BHqiHuW3a4jkmukB28IzDKRsOaecLBU
 ywaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DeaKXJUQur//vNoyow/ffDf5TMiLNOrSbWjaaPYbkyQ=;
 b=D8pcV+KW+HzW+0mkO5E/aFjoKYBU1BQMC4Jc+4MQeSxn0AMhz5RieGKTPNyMvdlQjx
 5si0JOro7FmH6tK78Y++Pf9oilWeigddGh4W8LbLkAftD7EvVNaIXirBiEwt+Fz5mS5Z
 N1beww6p2Oya1h3IgyHTlJJ4duOeJ19sQCO/wRc6F3hwMID+OTM3wlBFyAujQr3dqG6s
 vu0MOYpqx95Zzo6crqlHvJWm11nh+xk7kLyx6LwYTYE0FuPsm+9A6v/mv9gbJVYRbaeK
 983zei1S2uuTzfHuEPrcTVzikcTEhPyg/HkMK820jrFjQW5NYS5l59BSBFl0xaZtqmGm
 3Hbw==
X-Gm-Message-State: AHPjjUh4e2VQY7pCKC78ncUwQBHwLe1sNncdvSArrY+AFBfn+xn1cu2L
 /8zWZAUudKndUQ==
X-Google-Smtp-Source: ADKCNb4KaMtsJT3qUdUiY06nggrMkA2w+yEmT/b7WGAyiQrRpDlF0W2PFoA9laaAjKNL9BYCD0t97A==
X-Received: by 10.101.85.4 with SMTP id f4mr2787041pgr.10.1504791651833;
 Thu, 07 Sep 2017 06:40:51 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id p88sm4453464pfi.164.2017.09.07.06.40.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Sep 2017 06:40:50 -0700 (PDT)
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
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
Date: Thu, 7 Sep 2017 06:40:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504740749.5042.2.camel@aj.id.au>
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
X-List-Received-Date: Thu, 07 Sep 2017 13:40:55 -0000

On 09/06/2017 04:32 PM, Andrew Jeffery wrote:

>>   
>> Guess I need to dig up my eval board and see if I can reproduce the problem.
>> Seems you are saying that the problem is always seen when issuing a sequence
>> of "clear faults" commands on multiple pages ?
> 
> Yeah. We're also seeing bad behaviour under other command sequences as well,
> which lead to this hack of a work-around patch[1].
> 
> I'd be very interested in the results of testing against the eval board. I
> don't have access to one and it seems Maxim have discontinued them.
> 

Do you have a somewhat reliable means to reproduce the problem ?

Guenter
