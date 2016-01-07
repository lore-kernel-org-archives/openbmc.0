Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B83751A0228
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 12:41:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 447DE140BA1;
 Thu,  7 Jan 2016 12:41:14 +1100 (AEDT)
Subject: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ipmid
 command support with correct DBUS property handling.
To: Cyril Bur <cyrilbur@gmail.com>, Peng Fei BG Gou <shgoupf@cn.ibm.com>
References: <20160106160934.493e446f@camb691>
 <1451956226-19954-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1451956226-19954-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201601060613.u066Dbgg023586@d23av03.au.ibm.com>
 <20160106175701.196f6a77@camb691>
Cc: openbmc@lists.ozlabs.org, openbmc-patches@stwcx.xyz
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <568DC239.2090601@ozlabs.org>
Date: Thu, 7 Jan 2016 12:41:13 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160106175701.196f6a77@camb691>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 07 Jan 2016 01:41:14 -0000

Hi all,

> Again, I'm not saying it won't work but I'm trying to understand why the
> complexity in these signatures, it doesn't seem like it's being used and
> pointless complexity doesn't help anyone.

Yes - I'd prefer to get these method signatures correct before other
code starts relying on it.

[the same philosophy applies to the contributions in general - we should
be aiming to get the patch as correct as possible, rather than trying to
fix up later]

Regards,


Jeremy
