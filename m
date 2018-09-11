Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gBN3ImHz"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428tv66qtCzF37Y;
 Wed, 12 Sep 2018 04:37:38 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id d1-v6so12696683pgo.3;
 Tue, 11 Sep 2018 11:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NjuRFkFlv9lB3imDa52Uzyv+1CO4RJ4O3O3Bdn/0KmI=;
 b=gBN3ImHzQ1NAAJiLutaH0Gs5On77+BRTQSK1ssGN9oaiHQygHSs742IVeWNREsBJ7h
 thTy2J7+orz0tWVeYlX3Om+UD6dEKm5vGmeSnJJ2BQYZk/IXAkskYSRWOPiFLs33otK+
 89g7uq+6eDKSVbuYKsG5yBdlwm+2tqxRjY03T/wZQihUD6vbpMBQSEUqPKNkqCDjPnoY
 4mI4ozflHZgh5VMDrNU94AJIC4lcl135/dY9CaDOIY02ZqKty53LBSKW2WD3sg6Ps8Fk
 bKlhIMc+XSBTpVUZB+zi/WSwS7CfdgwBCK/u0B+RX9OgIxVzRC9tbTV4bcZ5DJt7ePsG
 AdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NjuRFkFlv9lB3imDa52Uzyv+1CO4RJ4O3O3Bdn/0KmI=;
 b=S2gZ9qMLCTu9vqfaWZ34mel7cKzR2PTgfbuTF1Bje3nCIrbMLXDzB9rAXxvAz3OPKI
 ZzBfa/70Ju4NgJ3aHNBa+Ts9l+EwkV1bu7p/jJElMzL1ASTLS6crNVD/V0+s2zsocKH0
 vrZ+YAtD8NePgNlU7zMZnsH4cj2h29LaRBCslHzHXpVzeg3RTBj2PH4VGRSfqsCZBHlF
 fgna+ub775vHEPeXelDVPDtqO6EUw5ckzNg8H2l5sxYN8xmJ1DuIPHINR+Mp44Ii2vIF
 cHPWGv0V0dqEApy79sxhwCYbj9l7h0AiZcDT5t/wot+ZKSd1SNUBGdESQ4bfO+vBFJJJ
 aHQg==
X-Gm-Message-State: APzg51DoENXpnDUiW8mxf0jAi/UbcDhfseZv2PWIrF1bUdphefF7tJ8b
 jDP9N/HvcP8r04bdEGM/R40=
X-Google-Smtp-Source: ANB0Vdbafug3F4mHQUGljwEgI3s3EFq9CPjNn1vLZ8/RymISPI32rmDqYd3h0wEfLwRCw96WjpqVMw==
X-Received: by 2002:a63:a053:: with SMTP id
 u19-v6mr29969962pgn.394.1536691056381; 
 Tue, 11 Sep 2018 11:37:36 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id t2-v6sm33644859pfj.7.2018.09.11.11.37.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Sep 2018 11:37:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Sep 2018 11:37:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined
 irq events properly
Message-ID: <20180911183734.GA21976@roeck-us.net>
References: <20180823225731.19063-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180823225731.19063-1-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 18:37:40 -0000

Hi,

On Thu, Aug 23, 2018 at 03:57:31PM -0700, Jae Hyun Yoo wrote:
> In most of cases, interrupt bits are set one by one but there are
> also a lot of other cases that Aspeed I2C IP sends multiple
> interrupt bits with combining master and slave events using a
> single interrupt call. It happens much more in multi-master
> environment than single-master. For an example, when master is
> waiting for a NORMAL_STOP interrupt in its MASTER_STOP state,
> SLAVE_MATCH and RX_DONE interrupts could come along with the
> NORMAL_STOP in case of an another master immediately sends data
> just after acquiring the bus. In this case, the NORMAL_STOP
> interrupt should be handled by master_irq and the SLAVE_MATCH and
> RX_DONE interrupts should be handled by slave_irq. This commit
> modifies irq hadling logic to handle the master/slave combined
> events properly.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

This patch causes a boot stall when booting witherspoon-bmc with
qemu v3.0, and all i2c device probes fail with error -110 (timeout).
Bisect log is attached for reference.

With the same kernel configuration (aspeed_g5_defconfig),
ast2500-evb and romulus-bmc are still able to boot.
palmetto-bmc with aspeed_g4_defconfig also appears to work.

Is this a problem with qemu ? Should I drop the qemu test
for witherspoon-bmc starting with the next kernel release ?

Thanks,
Guenter

---
# bad: [09c0888767529cdb382f34452819e42d1a66a114] Add linux-next specific files for 20180911
# good: [11da3a7f84f19c26da6f86af878298694ede0804] Linux 4.19-rc3
git bisect start 'HEAD' 'v4.19-rc3'
# bad: [a2ebc71cf97bed9b453318418e4a281434565e8b] Merge remote-tracking branch 'nfc-next/master'
git bisect bad a2ebc71cf97bed9b453318418e4a281434565e8b
# good: [6fde463b32bf4105c28c0a297a5b66aca5d6ecd4] Merge remote-tracking branch 's390/features'
git bisect good 6fde463b32bf4105c28c0a297a5b66aca5d6ecd4
# bad: [136fd6d530a3ae0dd003984f683345cfe88c01f3] Merge remote-tracking branch 'v4l-dvb/master'
git bisect bad 136fd6d530a3ae0dd003984f683345cfe88c01f3
# good: [c7ae95368af43c08f5f615b00f2f7bf2e9c45788] Merge remote-tracking branch 'v9fs/9p-next'
git bisect good c7ae95368af43c08f5f615b00f2f7bf2e9c45788
# good: [4c640c41381e47b328c6507bcf534812761256cd] Merge branch 'for-4.19/fixes' into for-next
git bisect good 4c640c41381e47b328c6507bcf534812761256cd
# good: [5bc91f70c5ecc2bc5967b98ce7fa4e55ad230d99] Merge remote-tracking branch 'hid/for-next'
git bisect good 5bc91f70c5ecc2bc5967b98ce7fa4e55ad230d99
# bad: [657b9d37406ed1625d469db0fd356e364dc75dd8] Merge remote-tracking branch 'hwmon-staging/hwmon-next'
git bisect bad 657b9d37406ed1625d469db0fd356e364dc75dd8
# bad: [fc9f90ddace238716cfcbd00d51428ee8baa12c7] Merge branch 'i2c/for-current' into i2c/for-next
git bisect bad fc9f90ddace238716cfcbd00d51428ee8baa12c7
# good: [34b7be301d4c5d85d1d093d2faf856f3d727416f] Merge branch 'i2c/for-current' into i2c/for-next
git bisect good 34b7be301d4c5d85d1d093d2faf856f3d727416f
# bad: [3e9efc3299dd78a0fa96515f0a453fab1ed4a1bd] i2c: aspeed: Handle master/slave combined irq events properly
git bisect bad 3e9efc3299dd78a0fa96515f0a453fab1ed4a1bd
# good: [fc66b39fe36acfd06f716e338de7cd8f9550fad2] i2c: mediatek: Use DMA safe buffers for i2c transactions
git bisect good fc66b39fe36acfd06f716e338de7cd8f9550fad2
# first bad commit: [3e9efc3299dd78a0fa96515f0a453fab1ed4a1bd] i2c: aspeed: Handle master/slave combined irq events properly
