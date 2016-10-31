Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6c8S0LdKzDvRg
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 12:24:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3t6c8R4xqPz9t15;
 Mon, 31 Oct 2016 12:24:07 +1100 (AEDT)
Subject: Re: [PATCH linux v6 13/18] drivers/fsi: Minor updates to FSI core
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1477865379-11566-14-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <45b11c70-968f-0f31-3973-7175f06d5cdf@ozlabs.org>
Date: Mon, 31 Oct 2016 09:24:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1477865379-11566-14-git-send-email-christopher.lee.bostic@gmail.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Mon, 31 Oct 2016 01:24:08 -0000

Hi Chris,

> Added some export symbols for fsi_device_read/write for FSI
> client drivers.  Removed the byte swapping done on CFAM config
> word reads - already in proper order.  Removed fsi_crc4 checks,
> they were incorectly reporting bad crc's.  Need to evaluate
> what is wrong with the method of calculation.
>
> Add missing assignment of slave to fsi_device during scan.

I assume that this patch will change as you work out the issues from
some of the updates there. However, once you get this sorted, you should
squash the updates into their original patches.

Cheers,


Jeremy
