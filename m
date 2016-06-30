Return-Path: <clg@kaod.org>
Received: from mo6.mail-out.ovh.net (mo6.mail-out.ovh.net [178.32.228.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgQKj5xWMzDrDK
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 02:41:29 +1000 (AEST)
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 3F5BCFFB60B
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 18:32:31 +0200 (CEST)
Received: from [9.101.4.42] (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id A9FB3120092;
 Thu, 30 Jun 2016 18:32:28 +0200 (CEST)
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 8/9] aspeed/ast-g4: add a
 force saveenv config
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-9-git-send-email-clg@kaod.org>
 <1467270678.6386.30.camel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <670584dd-dadf-545e-36f1-86ca6ddeaa95@kaod.org>
Date: Thu, 30 Jun 2016 18:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1467270678.6386.30.camel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5304677414188518146
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudejgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 16:41:30 -0000

On 06/30/2016 09:11 AM, Joel Stanley wrote:
> On Wed, 2016-06-29 at 18:09 +0200, Cédric Le Goater wrote:
>> That was a feature in the previous Aspeed branch which is was left
>> out
>> in the v2016.05 port. So let's use the new aspeed Kconfig to add it.
> 
> What does this gain us?

Not much a part from using that new Kconfig.
 
> On a boot with an invalid set of settings, we use the defaults anyway.

yes. let's drop it.

Thanks,

C. 

> Cheers,
> 
> Joel
> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/arm/Kconfig     | 1 +
>>  board/aspeed/Kconfig | 6 ++++++
>>  common/env_common.c  | 3 +++
>>  3 files changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index bfbeb4842380..b2c19b912834 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -756,6 +756,7 @@ config TARGET_WITHERSPOON_BMC
>>  config TARGET_AST_G4
>>         bool "Support ast2400"
>>         select CPU_ARM926EJS
>> +       select ASPEED_WRITE_DEFAULT_ENV
>>  
>>  endchoice
>>  
>> diff --git a/board/aspeed/Kconfig b/board/aspeed/Kconfig
>> index a92b9bc0c934..fca65d0206f6 100644
>> --- a/board/aspeed/Kconfig
>> +++ b/board/aspeed/Kconfig
>> @@ -1,3 +1,9 @@
>> +config ASPEED_WRITE_DEFAULT_ENV
>> +       bool "force  write of default environment"
>> +       help
>> +	 when the environment CRC is bad, force a saveenv to update
>> +	 the flash with a sane default environment
>> +
>>  source "board/aspeed/ast-g5/Kconfig"
>>  source "board/aspeed/ast-g4/Kconfig"
>>  source "board/aspeed/witherspoon-bmc/Kconfig"
>> diff --git a/common/env_common.c b/common/env_common.c
>> index af59c72e1fd7..5d6aac551b26 100644
>> --- a/common/env_common.c
>> +++ b/common/env_common.c
>> @@ -262,6 +262,9 @@ void env_relocate(void)
>>  #else
>>  		bootstage_error(BOOTSTAGE_ID_NET_CHECKSUM);
>>  		set_default_env("!bad CRC");
>> +#ifdef CONFIG_ASPEED_WRITE_DEFAULT_ENV
>> +		saveenv();
>> +#endif
>>  #endif
>>  	} else {
>>  		env_relocate_spec();
