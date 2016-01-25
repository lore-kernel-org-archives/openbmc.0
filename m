Return-Path: <andrew.donnellan@au1.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8BDC11A05D0
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 12:10:00 +1100 (AEDT)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <andrew.donnellan@au1.ibm.com>;
 Mon, 25 Jan 2016 11:09:58 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 25 Jan 2016 11:09:57 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: andrew.donnellan@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 798D12CE8055
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 12:09:56 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0P19nvl38600864
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 12:09:58 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0P19Nvx008189
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 12:09:23 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0P19Ncd007731; Mon, 25 Jan 2016 12:09:23 +1100
Received: from [10.61.2.248] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 831E5A01E2;
 Mon, 25 Jan 2016 12:08:59 +1100 (AEDT)
Subject: Re: [PATCH openbmc 3/6] linux-obmc: apply the aspeed-spi-nor
 controller patchset
To: Milton Miller II <miltonm@us.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
References: <56A06F64.8050501@ozlabs.org>
 <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453331420-6524-4-git-send-email-openbmc-patches@stwcx.xyz>
 <201601211606.u0LG6uMr000899@d03av01.boulder.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Message-ID: <56A575AB.1000704@au1.ibm.com>
Date: Mon, 25 Jan 2016 12:08:59 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <201601211606.u0LG6uMr000899@d03av01.boulder.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16012501-0009-0000-0000-000002D6CC4D
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jan 2016 01:10:00 -0000

On 22/01/16 03:06, Milton Miller II wrote:
>>> +diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>>> +new file mode 100644
>>> +index 0000000..2497648
>>> +--- /dev/null
>>> ++++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>> +@@ -0,0 +1,539 @@
>>> ++/* ASPEED Static Memory Controller driver
>>>> ++ * Copyright 2015
>>> ++ * Milton Miller
>>> ++ *
>>> ++ */
>>
>> Make sure you have the right copyright headers on this one.
>
> This is a literal post of what I had submitted in 2015.  However I
> admit I am a noob at copyright headers and detailed advice will
> be gladly accepted.

My preferred copyright header for IBM kernel work is as follows:

/*
  * [Description of file]
  *
  * Copyright (C) [Years] IBM Corporation.
  * Author: [Name] <[User]@[Country].ibm.com>
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
  * as published by the Free Software Foundation; either version
  * 2 of the License, or (at your option) any later version.
  */


-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited
