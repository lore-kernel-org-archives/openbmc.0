Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyGYw2lmqzDrcQ
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 01:45:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="f+6dHmkK"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3yyGYv6Nmsz9sCZ;
 Fri, 15 Dec 2017 01:45:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1513262708; bh=PsXipAGRgw0xZ/F/N+1G5VvoyxpDfqJ8PzxpvUIn7lQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=f+6dHmkKP3i+OWuKQw6+EAPWb7Sch6U6cxHMV7nHG6Q8oHBSjx9tcDk/2AnnYjmXm
 7c2r2RrTAMzGxn5CdwF6rSXhDa+8AV0fjmSAcK1WfJVNmECRHno/gs4i9Vrm1p1Adf
 wG7PH3D75Z1EokVSDBgkbwIb+2XcqJ/N5J6BlkbcpYh03ly9/+cXtzopTcpXOSUybE
 YSwl7IP6VJxiagGWI2aPyhWSqAEnHLCutGUnh8OyOqL7BV1AmvVEP79Pkirsf7hgxF
 n69Hw9Hsy/pQSwRT7IqrHT1TM598Ku413C7pU7lhcuIoofUDVWQjbkS8UH5HZOzTx5
 wSbPYVV7ufIIA==
Subject: Re: IPMI LAN command story design - try 3rd send
To: Tom Joseph <tomjose@linux.vnet.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, vernon.mauery@linux.intel.com
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com> <20161107035006.GB15757@heinlein.lan>
 <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
 <432e5d6e-ac7a-6844-2bc9-4a046af0abda@linux.vnet.ibm.com>
 <86bef8c4-2f54-6c33-93eb-5ed6aa212aff@ozlabs.org>
 <84218d7b-714c-761e-cd93-97118ceee49f@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <f0577dd5-1df9-d077-fb95-24eaec58489d@ozlabs.org>
Date: Thu, 14 Dec 2017 22:45:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <84218d7b-714c-761e-cd93-97118ceee49f@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2017 14:45:08 -0000

Hi Tom,

>> Adding the 10-second delay allows users to "batch" multiple changes,
>> meaning that network connectivity isn't lost between those changes. This
>> is purely to allow ipmitool (which doesn't have a facility to make
>> multiple changes before indicating that the change is complete) to be
>> used over the network to change the lan configuration (which is a bit
>> risky regardless...).
> 
> Yeah all this lack of clarity, arises from a lack of mechanism in IPMI to
> apply multiple changes (IP address, netmask gateway) together.

No, the specification provides a way to do exactly that:

 1) Change set-complete to 0x01

 2) Send Set LAN Configuration command to update the actual LAN
    configuration parameters. If more than one parameter is changed, then
    multiple commands can be sent.

 3) Change set-complete to 0x00

It's just that ipmitool only has code to change one parameter at a time
at (2). It still does the set-complete process.

>> To implement something complying to a "principle of least surprise", I'd
>> suggest that we should:
>>
>>   - batch changes, and have them applied after 10 seconds from clearing
>>     the set-in-progress flag
>>
>>   - submit patches to ipmitool to allow multiple changes to be applied
>>     at once (ie, one clearing of the set-in-progress flag).
> 
> I prefer the second option of allowing ipmitool to explicitly clear the
> set-in-progress flag.

They're not "or" options. We'd need to do both.

> The first option is really  "unusual way" to get this done, to overcome
> a specification shortcoming.

It's not a specification shortcoming; the specification explicitly
supports this, it's just that ipmitool doesn't.

The 10-second delay is a server-side workaround for that, and is present
on other BMC implementations out there. We should implement that
workaround, because asking everyone to update to a new ipmitool version
isn't feasible either.

Regards,


Jeremy
