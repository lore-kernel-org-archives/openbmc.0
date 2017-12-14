Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyCZ46XfNzDrbG
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 23:30:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="aw0ea6L1"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3yyCZ43Y7fz9s83;
 Thu, 14 Dec 2017 23:30:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1513254604; bh=SEMM912zX83QgQz/u8ph1LFdI7uEZLmwdv5BEzWuORY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aw0ea6L1EVvau/9WIydOqbHQs7SC2vMknkvV2uxqVKK4h4ZboPN4WjGbyrTBPtdpd
 UxAWngElOYhjviCD6ArtqPr789ff4sZ6ZqxV1dwXmXQKhetjo4utUEkcC6JsNlEftc
 K6orHRrRJMoZClFxz4kekTGj/6JKzTxrf5BJrYGO8MpYSjQ5wuZn5am2x/ByOp//CM
 jcTvhJ9IloF5T3B2PZsiJqhvjijnhHd+P7rU1h23U6CaLCPKVxddnUJkrZg6gkdXuy
 S523FhwAuSgkQxhb1mGrRY2RFdVdy5yiB/UrHQ+uF25fc4glBrQnYRNNf6EbP+wncc
 C/uppjNUbchcw==
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
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <86bef8c4-2f54-6c33-93eb-5ed6aa212aff@ozlabs.org>
Date: Thu, 14 Dec 2017 20:30:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <432e5d6e-ac7a-6844-2bc9-4a046af0abda@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 14 Dec 2017 12:30:05 -0000

Hi Tom,

>> Requiring non-standard command to be issued causes a disconnect between
>> user expectations and our implementation. We'd have to document this
>> difference in behaviour for every potential sysadmin interacting with
>> OpenBMC.
>  The command to apply BMC network settings on OpenBMC IPMI reference
>  implementation is set channel access, which is a standard command
>  mentioned in the IPMI specification.

It may be a standard command, but using it in this context certainly
isn't standard, nor even a common convention.

The issue is that we're introducing an "unusual" step for this
configuration process, and expecting all users to know about it.

>  It is not clear to me from the IPMI specification, on which
> command/condition
>  the BMC network settings are applied.

Ideally, the settings should be applied as soon as the 'Set in progress'
flag indicates that the change is complete.

Adding the 10-second delay allows users to "batch" multiple changes,
meaning that network connectivity isn't lost between those changes. This
is purely to allow ipmitool (which doesn't have a facility to make
multiple changes before indicating that the change is complete) to be
used over the network to change the lan configuration (which is a bit
risky regardless...).

For doing this over the in-band interface, there is no harm in applying
the settings immediately.

To implement something complying to a "principle of least surprise", I'd
suggest that we should:

 - batch changes, and have them applied after 10 seconds from clearing
   the set-in-progress flag

 - submit patches to ipmitool to allow multiple changes to be applied
   at once (ie, one clearing of the set-in-progress flag).

Regards,


Jeremy
