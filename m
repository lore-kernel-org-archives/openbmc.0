Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41SDKG609TzDqBm
 for <openbmc@lists.ozlabs.org>; Sat, 14 Jul 2018 12:34:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="JyPclgKz"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 41SDKF27n9z9s29;
 Sat, 14 Jul 2018 12:34:41 +1000 (AEST)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1531535682; bh=4q7eiYOMpexsL2VJzrD1OsOp0EfNaytVNTUvlMRetVY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JyPclgKzQ0bkbot1+jlZ1geUcjwo6R63siidOgLa1S4tJq1QauWBMlmEVkBLOG+Ko
 cXHSTgIp0768WhfTxWbO+kAjHgJz10AGeppgdw2teJ7apCcMWgAw0SIsZpighlNndS
 0cJzApJf7h/IJDY5qk7Ojt49hyPLBAK5EoUo+PuHObjBfYJYxduIRm48iR7ufu2Xr9
 poP9NeJjFZFOI4VtyDZD8kCwcbY4S5DJ6c0J+rZsRRY0dXu/1dUqENL6ZmA3JlTtqv
 huWivPjMbiUBS/qPqDkIBOTq1I464pDRKOOIIeqCe/fwvMlf84+cpnFazzr4Pibghc
 ubpJf0KJwYOxQ==
Subject: Re: ipmitool default interface
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 OpenBMC Development <openbmc@lists.ozlabs.org>
References: <20180711165917.GH105329@mauery>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <89463651-f741-3fb7-4231-56e895a8edfd@ozlabs.org>
Date: Sat, 14 Jul 2018 10:34:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180711165917.GH105329@mauery>
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
X-List-Received-Date: Sat, 14 Jul 2018 02:34:43 -0000

Hi Vernon,

> I have seen several requests for help on this list that could have been 
> avoided if the BMC internal ipmitool used dbus as its default interface.
> I do not think we are quite ready to upstream this commit or the actual 
> interface, since the dbus interface will be changing as part of the 
> refactor of ipmid's architecture. But for now, it makes sense to set the 
> default interface as dbus.

OK, makes sense. I've merged your change for this and pushed to the 
openbmc ipmitool repo.

Cheers,


Jeremy
