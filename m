Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSfMG14fPzDq5g
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 12:06:18 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vSfMF5vJPz9s7C;
 Wed, 22 Feb 2017 12:06:17 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v2 3/7] drivers/fsi: Define hub master
 callbacks
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-4-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <dc340299-0b3c-f262-153d-a9ee5787b786@ozlabs.org>
Date: Wed, 22 Feb 2017 09:06:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170221215032.79282-4-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 01:06:18 -0000

Hi Chris,

> Define hub master read, write, link enable, and break ops.

Now that we have things more contained, you may want to add the complete
hub functionality in one patch.

However:

> @@ -571,6 +598,7 @@ static int fsi_slave_init(struct fsi_master *master,
>  	slave->id = slave_id;
>  	slave->dev.parent = master->dev;
>  	slave->dev.release = fsi_slave_release;
> +	slave->link = link;
>  
>  	dev_set_name(&slave->dev, "slave@%02x:%02x", link, slave_id);
>  	rc = device_register(&slave->dev);

This looks like a generally-useful fix, for more than just the hub code.

Otherwise, looks good.

Cheers,


Jeremy
