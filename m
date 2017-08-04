Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNqSX2g2fzDqk8
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 11:43:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="DNatU8mD"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xNqSW3TXGz9s8P;
 Fri,  4 Aug 2017 11:43:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1501810987; bh=u88Iz5Ii6Y+B+Whm6fVvVpuJY5rqv6jJqk7kpGThfpk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DNatU8mDMWcB7KNnQjJARDyR7RGj079E3YgM4eVk5UYQn77R9AvRlobStDpfyC74f
 CSP0WMkApY9IuEeGPelxCM8hvrBA7dh/duWb3I/hbmi3jqpetzA3Bcma8LiCtAEHT/
 hF/q/HLAxNDU1MvaUFWKJrk14rSHnPS9tyTOA5Z+HzpHZhbZwQ91osMeRAwuiJ6nqP
 D6V4t+elJljvBb3ofcMnvYWMsYQgK7MnGa8E3n2yADDnhmCj4Q6zQIWMw8Y2GSbsZK
 iz9TxFh+uk+NQbSTurjM11EryDzMFjUEOB2LuHPnxnxvTyTguqkpfAIKapmFNj14w7
 nIrc4obcFwIGA==
Subject: Re: [PATCH linux dev-4.10 1/2] drivers/fsi: Defer hub master scan on
 probe
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
References: <20170803185306.85007-1-cbostic@linux.vnet.ibm.com>
 <20170803185306.85007-2-cbostic@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <2c647116-8b52-f234-4b99-1a52d2b27ea9@ozlabs.org>
Date: Fri, 4 Aug 2017 09:43:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170803185306.85007-2-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
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
X-List-Received-Date: Fri, 04 Aug 2017 01:43:08 -0000

Hi Chris,

> Prevent hub master from scanning its connected links/slaves
> at probe time.  Needed to keep from creating arbitration
> conflicts on the hub connected links during host boot
> FSI bus accesses.

This change doesn't need to be specific to the hub code - this just
makes it more complex.

As I mentioned yesterday, this can be done entirely in the fsi core.
When a master is registered, it has a reference to the of_node; just
check that. This way, we don't need to a) assume behaviour of different
master types, or 2) implement this logic in every master.

So, the basis of the change will just be something like:

    diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
    --- a/drivers/fsi/fsi-core.c
    +++ b/drivers/fsi/fsi-core.c
    @@ -927,7 +927,9 @@ int fsi_master_register(struct fsi_master *master)
     		return rc;
     	}

    -	fsi_master_scan(master);
    +	np = dev_of_node(&master->dev);
    +	if (!np || !of_property_read_bool(np, "no-scan-on-init"))
    +		fsi_master_scan(master);

     	return 0;
     }

This way, the no-scan-on-init (or whatever would be a better name)
node applies to the core, rather than every master implementation.
Consequently, this property is related to compatible = fsi-master and
not fsi-master-gpio or fsi-master-whatever-else.

[Also, don't forget to add this to the binding doc; it'd go in fsi.txt,
under the "FSI Masters" section].

Regarding names, I wouldn't use "probe" in the property name, as it's a
linux implementation detail. Some ideas:

 - no-scan-on-init
 - explicit-scan
 - arbitration-required
 - multiple-access

 : the latter two indicating that other entities can access the device, so
 we need to be careful when scanning, and scan explicitly. Or, anything
 else that you think is appropriate (but doesn't imply any specific OS
 implementation.

Cheers,


Jeremy
