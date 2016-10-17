Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy8tl75DfzDvHv
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 18:27:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sy8tl4YkJz9s2Q;
 Mon, 17 Oct 2016 18:27:59 +1100 (AEDT)
Subject: Re: [PATCH linux v4 20/20] drivers/fsi: Add SCOM client driver
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476483282-85971-21-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <bf15af72-4bb5-69b7-974f-c2d34732e5b3@ozlabs.org>
Date: Mon, 17 Oct 2016 15:27:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476483282-85971-21-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 07:28:00 -0000

Hi Chris,

> +	/* todo: fill in and register cdev */
> +	/* open, read, write, close file ops */
> +
> +	/* todo: user space linkage to get_scom / put_scom */
> +	/*  engine init */

We have a couple of options for this, but I think a simple chardev would
work fine. Were you thinking just a read/write interface, where the
off_t is the SCOM address?

Cheers,


Jeremy
