Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stfnN09YrzDskc
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 01:41:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=aioA1I/K; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B34876410DB;
 Tue, 11 Oct 2016 09:41:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id CRudNOBLA4xn; Tue, 11 Oct 2016 09:41:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 50AB46410B0;
 Tue, 11 Oct 2016 09:41:07 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 50AB46410B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1476196867; bh=3kTls2DWnQ6VoEwate9odeUNDBZkR9zszZuOv6RJdRU=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=aioA1I/KnDke4JIDmetwPI3Y7QXVCCgWh1S/U8Ct8VY1iTNJ4xm3+7ti3lKtSUcsy
 vBfRW8aE1Kvw6RYoc/fSvssjEc201U46n19sDsiF8MfcceL96Ul2ldl2ro/8yIcMNi
 zZsUNFG2FPkfjtM/+fJqy6fJBbq8rfFjkczaPqGY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id V_Hl36u5r2aL; Tue, 11 Oct 2016 09:41:07 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 13AE96410DB;
 Tue, 11 Oct 2016 09:41:06 -0500 (CDT)
Message-ID: <57FCFA02.8060001@raptorengineeringinc.com>
Date: Tue, 11 Oct 2016 09:41:06 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>
CC: Patrick Williams <patrick@stwcx.xyz>, 
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: I2C device driver names
References: <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
 <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>
 <20161007015152.GA17914@heinlein.lan>
 <CACPK8Xfwj82abqJS_j20WZFzwwPZke2y1FCHk3eoMTwJopxDpw@mail.gmail.com>
In-Reply-To: <CACPK8Xfwj82abqJS_j20WZFzwwPZke2y1FCHk3eoMTwJopxDpw@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 11 Oct 2016 14:41:12 -0000

On 10/09/2016 08:57 PM, Joel Stanley wrote:
> On Fri, Oct 7, 2016 at 12:51 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Fri, Oct 07, 2016 at 10:42:24AM +1100, Joel Stanley wrote:
>>>> PMBus Power supplies:   ?
>>>>
>>>> MAX31785 fan controller:  max,max31785
>>>
>>> Doesn't appear to be an upstream driver. Please open a ticket.
>>
>> Timothy @ Raptor wrote a driver for this recently, didn't he?  Joel, I
>> thought you were going to merge it in for the time being.  Timothy
> 
> Yeah. I did ask that he spit out the maintainers part of that patch
> before we applied it.
> 
> Timothy, are you able to make that change?

No problem.  Updated version sent to the OpenBMC mailing list.

> 
>> mentioned that there was some upstream work going on in that subsystem
>> that was preventing it from be merged in the current state but that the
>> subsystem owner was likely going to take it on.
> 
> Timothy, do you have any update on the rewrite?

Not at this time.  I've requested a status update from the hwmon
maintainer that was working on it.

Thanks!

-- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
