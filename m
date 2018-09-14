Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22f; helo=mail-oi0-x22f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q+Wu42ek"; 
 dkim-atps=neutral
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com
 [IPv6:2607:f8b0:4003:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Bhhg2MjHzF3Y4
 for <openbmc@lists.ozlabs.org>; Sat, 15 Sep 2018 03:04:50 +1000 (AEST)
Received: by mail-oi0-x22f.google.com with SMTP id m11-v6so13498529oic.2
 for <openbmc@lists.ozlabs.org>; Fri, 14 Sep 2018 10:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sIbwGFyVyvrY/zKReXr41pYtW7BVvMqP3AJbFw3UNMw=;
 b=Q+Wu42ekr+aRIoV3UkdzttlQaigZYhXmhcU35sr10SRYai86UoJ6DlfV8sd64TQBFB
 LD/z3lLb6H7C6QqxOHf/hRHy6gZcvooLgxmHE8FUdZJzgyPxRHRqr8Zq5j225WAoJafn
 YjrNHXUnY+hRtiZTgcU7gDGz8h1ui90ftEr2jmpVcjxfCQb2q0r2MASK7U47bfZTtDw5
 20sVkKKMhpwQdJeE2Vqg9iJk+eXlWVca4NLY+MxnigTHqCDSEVlr/XXzo43/iS+wMLWb
 sA/I8+FzLX43FA3WsuIeV70GYuhaS6bwk+w7pycxGYtLe0dFvtdAKTUVUMFUuCCZJq5z
 vg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sIbwGFyVyvrY/zKReXr41pYtW7BVvMqP3AJbFw3UNMw=;
 b=h7tDAPMUPtU6gu9jrDxCUTg80AwcpHnAo/UqF2RbkLta+btc2MJKVSO6rqXCgFSGt+
 AEiHNyO/hysp5En/jAaNg222MFniVRQtKivssuJ6bt/CH9WvMSVU18dTXX3UBs5Bd3Q7
 vInfQs5gOmmI+Fi4hiE9Rf4BlfGwjRKKGVyVD5mpgjJdyLySPx4IFg3CKIiVbdyCjV0S
 0hVWHs8FB1qJaL/n31llF22LdmMRtj8wH3g3BjyBC67Ek5f9sRcn6c4UiiUknV1vN5Mm
 NB/LTQGvIHM58ZYK6IY8F2rO3V9bH13ilRx29j8Omr+r5rWQYzQI+dv6XKXmpxnGAV1i
 oc+g==
X-Gm-Message-State: APzg51C+j0je3+sWImEqLesBTRm3SWFT2e8dUBh6yOufLQEsqkGHyjxU
 ly+c93al9jlzWAdt5wH3OCExd4Al
X-Google-Smtp-Source: ANB0VdbdEI9CSiVf5tpqP0RffuonXOkQQ445C349wFwxALv13pN4XkDFjjT2DQL9A2wbAfCghVIL+A==
X-Received: by 2002:aca:df42:: with SMTP id
 w63-v6mr10662124oig.295.1536944688119; 
 Fri, 14 Sep 2018 10:04:48 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id m7-v6sm5861865oia.32.2018.09.14.10.04.47
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Sep 2018 10:04:47 -0700 (PDT)
Subject: Re: OpenBMC Fix-it vSprint - September 24-25, 2018
From: krtaylor <kurt.r.taylor@gmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <3d8f7871-75a6-4677-3cc4-64e4e226291b@gmail.com>
Message-ID: <bcb7c54f-aa90-8c2a-ec1d-02ab84720179@gmail.com>
Date: Fri, 14 Sep 2018 12:04:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3d8f7871-75a6-4677-3cc4-64e4e226291b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2018 17:04:52 -0000

On 9/12/18 11:53 AM, krtaylor wrote:
> Hi all,
> 
> I'd like to announce the OpenBMC Fix-it virtual Sprint, September 24-25. 
> This time we're going to use IRC to communicate/organize and span 2 full 
> days to allow for more global participation.
> 
> I'll email more specifics as we get them nailed down. But, for now, get 
> those ideas coming for what we can accomplish. Keep the ideas fairly 
> small, something we can finish or almost finish in a 2 day period. Put 
> them here:
> 
> https://docs.google.com/spreadsheets/d/1j4cpTGcUPUZzW4WT1vI0iFVVJApSBbVEvrZJInhI30U/edit?usp=sharing 
> 

So far, we have had a grand total of zero ideas listed in the 
spreadsheet. Please take a few minutes and add some ideas soon.

I should get more of the logistics in place today, stay tuned for an update.

> 
> NOTE: the idea is to participate however and whenever you can, you do 
> not need to work solid for 2 days - just jump in where you can and 
> communicate much more than you think you should - if you can help for a 
> full day great, but helping for 2 hours is also good!
> 
> Thanks!
> Kurt Taylor (krtaylor)
