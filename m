Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whgf90bnqzDqKq
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 15:46:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3whgf858Dcz9s3T;
 Tue,  6 Jun 2017 15:46:08 +1000 (AEST)
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add devices under FSI
 CFAM
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>
References: <20170605074301.11310-1-joel@jms.id.au>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <6cc0e085-0867-4128-c815-4ff74da1d5d7@ozlabs.org>
Date: Tue, 6 Jun 2017 13:46:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170605074301.11310-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 06 Jun 2017 05:46:09 -0000

Hi Joel,

> This describes the SBE FIFO and OCC device that are attached via the FSI
> bus.
> 
> As this layout is common to all existing p9 machines, we add them via a
> dtsi.  This dtsi requires the 'fsi' label be present.

Sounds like a good idea, no need to replicate the p9 FSI topology in
each BMC's device tree.

> -	gpio-fsi {
> +	fsi: gpio-fsi {
>  		compatible = "fsi-master-gpio", "fsi-master";
> -
> -		status = "okay";
> +		#address-cells = <2>;
> +		#size-cells = <0>;

We might want to keep #address-cells and #size-cells in the common
include, but then we're splitting properties (ie. compatible) between
the two files. I'm happy either way though.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
