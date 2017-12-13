Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yxM821J0bzDrYT
 for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2017 14:08:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="qeysfsnh"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3yxM8157YLz9s7F;
 Wed, 13 Dec 2017 14:08:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1513134481; bh=D9e4GsGAJeGLQgSBQIQQy2GmK5TruXOHyVQJ046YajU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qeysfsnhAnqqTsFBWBvW9gAUthZB9YXsiOdPBNGzLsa9Iy47L0+A0SxKa22zaW3e0
 88YcRDvnNM80b7jrWxSH5rx4sbvbU9IW2+Jmlu6Eq2APex8YBpKDTbepkcT6UUJbkX
 A/Hu6bHzHFk2YYgmiliv/KWXgCGehl1EebicgzTSGSwsM8x5PWfzf0Bf6lVqpQLYRg
 9cWUZgEvIehoiDW5UIDGumIfDnn4ebfi7mbNbkCH5sqhiWZjgfoWHYMUUP2XAHyDvz
 /98pDZ6zGRzF0cmW6f9DdJHSG7x2Wbzg5vvaLqaqbtJDg/8CcGAhS2KB/iWgtjvoNV
 htABzRflmZLag==
Subject: Re: IPMI LAN command story design - try 3rd send
To: Patrick Williams <patrick@stwcx.xyz>, tomjose <tomjose@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com> <20161107035006.GB15757@heinlein.lan>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
Date: Wed, 13 Dec 2017 11:08:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20161107035006.GB15757@heinlein.lan>
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
X-List-Received-Date: Wed, 13 Dec 2017 03:08:03 -0000

Hi all,

Digging up an old thread here, but I think this is important:

> Thanks for the explanation.  With this website you pointed to and some
> other investigation I've done, I am comfortable with us using the 'Set
> Channel Access' as the time to apply the settings.  The documentation of
> two competition products both seem to require an 'ipmitool mc reset
> warm' for IP address changes to take effect, so we are at least better
> than that.

The two BMC implementations that I'm aware of do not require a mc reset
for lan parameters to be applied. Both will apply settings without
further commands. One will wait 10 seconds before applying settings, to
allow multiple changes to be grouped into a single reconfiguration.

Requiring non-standard command to be issued causes a disconnect between
user expectations and our implementation. We'd have to document this
difference in behaviour for every potential sysadmin interacting with
OpenBMC.

> Can you internally track down a contact on the xCAT team and verify that
> this will be ok with them?

Not just xCAT, but every other provisioning software that will support
OpenBMC. Including ones that are custom-developed. That's not feasible.

For cases like this, we should really reconsider before coming up with
our own special interface requirements.

Regards,


Jeremy
