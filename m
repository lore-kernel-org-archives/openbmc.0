Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSdtZ0pSGzDq60
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 11:44:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vSdtY5BBFz9s7C;
 Wed, 22 Feb 2017 11:44:53 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: Fix FSI core size checking
 user interfaces
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1487711879-15542-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <cb927b0d-adbb-1568-1040-4f1456c7ae80@ozlabs.org>
Date: Wed, 22 Feb 2017 08:44:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487711879-15542-1-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 00:44:54 -0000

Hi Eddie,

> Some potential for integer overflow and not checking signed offsets.

[...]

>  int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
>  		size_t size)
>  {
> -	if (addr > dev->size)
> -		return -EINVAL;
> -
> -	if (addr + size > dev->size)
> +	if (addr > dev->size || size > dev->size || addr > dev->size - size)
>  		return -EINVAL;

I liked the split conditional statements, but that's only personal
preference. Regardless, LGTM.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
