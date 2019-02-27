Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OzLmqZeI"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448JhJ15yszDqK9
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 12:56:47 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id x187so12140978oia.7
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 17:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VKzNAn5VyBBg4W34aY31T3mMWdUNdPmb9zE95kcXg2E=;
 b=OzLmqZeIzCqeHzskh6kbdBBHAdNjnWoGniNxKJazDsC7iDaKKLKCIslnzTnSRPVKL+
 isfbOz/PqWcnBM2fztnAn2EPMnKRmGVRYanwGPEvy1RTpizaJeEGeXjmLb5ShSoNqxj1
 eOMUMUPv+M8kSZtKUTQgyplW6ReND5zEnSME6uU286Xo5J/rmBF0n8sHep77janFEEE1
 uJ1jqAHhzVHp3TmUUq//g9gDzx8XciBC3+fH7esXU0hSSJd+Zd509p/GZ3rXeva7CHCA
 6VlyRSeZNBc4nspaqsiivar9dQ7Vx3xxRX21a5CTWBTXuC8v8XJ5FGcmcdqXILWb4BNw
 3Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VKzNAn5VyBBg4W34aY31T3mMWdUNdPmb9zE95kcXg2E=;
 b=o5nNwUqSZcjem2UrGVXZNIzzhNTsfIUDoxLgvBiR2LxWFdVcK7OJhyuLyME9GG3078
 3ChcD1Osi8Ov7haWQIqM9tKmR13r6tdHBg+14lJTFRaahNsQFhWXfHVpirhohoicv2vt
 QLs/VLftTUuSmkhIIvn1hCigusp6sUYIguNRzcMcTn2nMCMnFdA7N9XqZduT25vUXCmq
 qBjjYsRGMHuB3/Q0alW4Dc+2YzdME8uu/Ocgj8emtrbsIWlsebZIV4OjsR7RFvFD4xb3
 PdMd2m2cLNnyi0cgNmUGWXj8TMfCCn72ISUkGvq50dHbutVYFfTMUq/e5i7/CSaKRCkB
 lLqQ==
X-Gm-Message-State: AHQUAualq8V8JuTQsAzSlBf40z0xyaXdh4ggnlLghoddWnmRZgRmNj0v
 ZBPgrcWMbH1TEYBC/ZYzQeccpzZd
X-Google-Smtp-Source: AHgI3IZaWFmz3QeT+dfUtQa4y7ud+gqRQmfR6SLN7YZ8f09V08nfi86Qd59AaIYLsjPksdZ03ea1cQ==
X-Received: by 2002:aca:4747:: with SMTP id u68mr4363947oia.38.1551232603856; 
 Tue, 26 Feb 2019 17:56:43 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id b130sm5262734oif.54.2019.02.26.17.56.42
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Feb 2019 17:56:43 -0800 (PST)
Subject: Re: Using Stale bot to clean up issues
To: openbmc@lists.ozlabs.org
References: <01b53196-6c78-b004-8cd0-8534c516cbaf@linux.vnet.ibm.com>
 <df81f451-6982-6fd8-8acd-ab24b8f4c88f@intel.com>
 <5f203acc-f41d-cbae-1b1d-4c0af9d51b6e@linux.vnet.ibm.com>
 <9384d805-8ce2-a3b9-4406-06cf4f775306@gmail.com>
 <17b83fbc-247f-dee2-9fc3-2dd3efdee670@linux.vnet.ibm.com>
 <9e2daca4-c082-0bf7-071f-62c2af9129e7@linux.vnet.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <f3f6f750-31a2-d30a-0c28-db95fe9eff6f@gmail.com>
Date: Tue, 26 Feb 2019 19:56:42 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <9e2daca4-c082-0bf7-071f-62c2af9129e7@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 27 Feb 2019 01:56:49 -0000

On 2/26/19 4:03 PM, Gunnar Mills wrote:
> 
> On 2/11/2019 9:50 PM, GUNNAR MILLS wrote:
>>
>> Don't touch them until 6 months of inactively and then another month 
>> of inactively in this "stale" state before closing. We can revisit 
>> this later.
>>
> 
>> Need to be "an organization owner or have admin permissions in a 
>> repository to install a GitHub App".  Will then need a .github/stale.yml
>>
> Are there still concerns or can we install this Stale bot?
> https://github.com/apps/stale

Please?  :)

I like the 7 month window because I could see a issue being created at 
the beginning of a cycle and not being touched until the next. We can 
then make an effort to check the "stale" ones as they are tagged.

Kurt Taylor (krtaylor)
