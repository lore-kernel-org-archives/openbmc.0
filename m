Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gKmg6rxZzF10S
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 14:18:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="InSyg2fe"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 41gKmg3Jynz9rxx;
 Wed,  1 Aug 2018 14:18:27 +1000 (AEST)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1533097107; bh=azKf0z8jeo0m35O/ip9SHHSJztrZ5CeD3X9yRmmFbnY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=InSyg2felmMRTz7L31C4BqTacKrciWTwmo/8XFn5WEhpswLuThoZceNWQXxFGQhvJ
 ZyDIf3k8hg9FJoWs+0opxxC5ssMbYDlY0WxfttFkICDefReymhRG1Wj+pZtMOQ/Z6T
 EkZaKY5n5zGDzCOWK7PUbrqgxPInHVzqYu7IQ3h0wggMt6a7CgBhmnb0NtJzk3ZxDC
 yAu0FDiT9dnrt/oltFDs9evCbFtHvlDrxgh+PUCufgQ6ekqdFypq6ulM7Dy9JkgHQa
 +r39AwHwbYoimvoBKGTFOVPCqEgTulnRXeDZb1w4DQ/cibONoJ/tqxmLUzIq1Rxuqp
 O4q3PK+TS7+0Q==
Subject: Re: Virtual Media
To: Stewart Smith <stewart@linux.ibm.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: openbmc@lists.ozlabs.org
References: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
 <eb74222a-737f-92cb-66a3-8d023b5962dc@ozlabs.org>
 <20180731180257.GJ105329@mauery>
 <e1b784dc-3434-cfda-a07b-3a065458fef0@ozlabs.org>
 <87wotag1yi.fsf@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <01caa0f0-5aaa-2fe1-a03c-a27d4b765cca@ozlabs.org>
Date: Wed, 1 Aug 2018 12:18:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87wotag1yi.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 04:18:28 -0000

Hi Stewart,

>> Yes, I'd agree there. As above, I'm not sure how much this would be
>> used. The one use-case I can imagine is a small writeable filesystem for
>> saving debug logs (in our case, from petitboot). However, we also have
>> actual host network available at that point...
> 
> zmodem over the terminal right to the browser!

The browser still can't write to the local filesystem :P

Cheers,


Jeremy
