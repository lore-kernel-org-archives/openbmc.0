Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTbBf159FzDq6X
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 12:46:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3qTbBd6SGcz9s3T;
 Tue, 22 Mar 2016 12:46:01 +1100 (AEDT)
Subject: Re: [PATCH 2/2] hwmon/adm1275: Support sense resistor parameter from
 dt
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <1458610171-11894-1-git-send-email-joel@jms.id.au>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56F0A3D9.5030008@ozlabs.org>
Date: Tue, 22 Mar 2016 09:46:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1458610171-11894-1-git-send-email-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Tue, 22 Mar 2016 01:46:02 -0000

Hi Joel,

> +adm1275 temperature sensor
> +--------------------------
> +
> +Required property:
> +
> + - compatible: "adi,adm1278"
> + - reg: i2c device address 
> +
> +Optional property:
> +
> +- sense-resistor: external sense resistor value in milliOhms

This is just a multiplier, right? We shouldn't need to care what the
hardware implementation is, just that we do need to scale the value.

So, how about:

  Optional property:

  - multiplier: multiplier to be applied to sensor readings (eg, to
                account for a sense resistor on the device input)

Other than that, all looks good to me.

Cheers,


Jeremy
