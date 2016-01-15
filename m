Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 69CBA1A0050
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 13:19:04 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3A18F1401DE;
 Fri, 15 Jan 2016 13:19:04 +1100 (AEDT)
Subject: Re: [PATCH docs] Add doc for contribution guidelines
To: Sam Mendoza-Jonas <sam@mendozajonas.com>
References: <1452762609-724-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452762609-724-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160115020444.GA2639@localhost.localdomain>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56985717.6090002@ozlabs.org>
Date: Fri, 15 Jan 2016 10:19:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160115020444.GA2639@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Fri, 15 Jan 2016 02:19:04 -0000

Hi Sam,

> <snip>
>> +OpenBMC has quite a module structure, consisting of small daemons with a
>> +limited set of responsibilities. These communicate over dbus with other
>> +components, to implement the complete BMC system.
> <snip>
>
> Just a nitpick: should that be s/module/modular?

Yes, it should be. I'll queue this change with any other small fixes 
that come in.

Thanks!



Jeremy
