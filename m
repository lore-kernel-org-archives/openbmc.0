Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSfPH3RV5zDq5g
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 12:08:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vSfPH0x3gz9s7C;
 Wed, 22 Feb 2017 12:08:03 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v2 0/7] drivers/fsi: Add hub master
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <aa5f0e25-26fd-b8cf-b387-741caea00604@ozlabs.org>
Date: Wed, 22 Feb 2017 09:08:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Wed, 22 Feb 2017 01:08:03 -0000

Hi Chris,

> Adds the FSI hub master functionality to the OpenFSI device driver.
> Hub master is a FSI client device driver that registers with the
> core and is notified when devices it wants, hub master engine and
> links, are discovered.
> 
> v2: Restructured to move hub into the core instead of a separate
>     slave device driver.
> 
> Christopher Bostic (7):
>   drivers/fsi: Add hub master scan detect
>   drivers/fsi: Initialize hub master
>   drivers/fsi: Define hub master callbacks
>   drivers/fsi: Move common read write ops into single function
>   drivers/fsi: Add retry on bus error detect
>   drivers/fsi: Cleanup bus errors
>   tools/testing/selftests: Add fsi command line tool

This changeset seems to add both the hub master, and the generic error
handing. Could this be split into two series?

Cheers,


Jeremy
