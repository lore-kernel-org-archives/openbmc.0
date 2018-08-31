Return-Path: <rdunlap@infradead.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="UhGcMoz4"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 422FGX4D13zF39R
 for <openbmc@lists.ozlabs.org>; Sat,  1 Sep 2018 09:01:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C3E+WeUwt/RvwDJTN2Z+zjLsKMg72sG42xvlCBsvCH4=; b=UhGcMoz4n0sFpKgQYh/eWpm32
 5pBMhLXXFlnoBfTPVkLdBy3RWIO45d8phoHnnLe7NrYMnCHrJKQkUTNle38yVqNcykNybPXrHkdHL
 gsEz6iuwbNr08CZEGEkVCgCnO8/bCJOM4ZMLHsPvPVhninaO1D9ULvTTvtddzqqht2ztm0SLK5CDG
 FvHYTcX9bXG/u41xpyeLen2Ns1qGGb0pak+/cnBX9eliBnRnh6AZ1Gzu9QsU06JjVwxAcKx7201ol
 VWoUkKjxXQwVO9EiOxZAYUhnB2ck6EAQEIGVKaBe8A1CwmZ+ER42jRK1ab+5fILLSJ1o8bv9XZv74
 5aeFvWPfQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvsPg-0004hj-19; Fri, 31 Aug 2018 23:01:12 +0000
Subject: Re: [PATCH v5 03/10] Documentation: hwmon: Add OCC documentation
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 jdelvare@suse.com, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com,
 linux@roeck-us.net, joel@jms.id.au, benh@kernel.crashing.org
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535664761-86018-4-git-send-email-eajames@linux.vnet.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4f4ff98e-f2a6-c8b1-2ad1-b16bf4305fdd@infradead.org>
Date: Fri, 31 Aug 2018 16:01:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1535664761-86018-4-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 31 Aug 2018 23:01:27 -0000

On 08/30/2018 02:32 PM, Eddie James wrote:
> Document the hwmon interface for the OCC.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>

Hi,
Please see comments below.

> ---
>  Documentation/hwmon/occ | 112 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/hwmon/occ
> 
> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> new file mode 100644
> index 0000000..adc2fa4
> --- /dev/null
> +++ b/Documentation/hwmon/occ
> @@ -0,0 +1,112 @@
> +Kernel driver occ-hwmon
> +=======================
> +
> +Supported chips:
> +  * POWER8
> +  * POWER9
> +
> +Author: Eddie James <eajames@linux.vnet.ibm.com>
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for the On-Chip Controller (OCC)
> +embedded on POWER processors. The OCC is a device that collects and aggregates
> +sensor data from the processor and the system. The OCC can provide the raw
> +sensor data as well as perform thermal and power management on the system.
> +
> +The P8 version of this driver is a client driver of I2C. It may be probed
> +manually if an "ibm,p8-occ-hwmon" compatible device is found under the
> +appropriate I2C bus node in the device-tree.
> +
> +The P9 version of this driver is a client driver of the FSI-based OCC driver.
> +It will be probed automatically by the FSI-based OCC driver.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported. All attributes are read-only unless
> +specified.
> +
> +The OCC sensor ID is an integer that represents the unique identififer of the

                                                              identifier

> +sensor with respect to the OCC. For example, a temperature sensor for the 3rd

prefer s/3rd/third/

> +DIMM slot in the system may have a sensor ID of 7. This mapping is unavailable
> +to the device driver, which must therefore export the sensor ID as-is.
> +
> +Some entries are only present with certain OCC sensor versions or only on
> +certain OCCs in the system. The version number is not exported to the user
> +but can be inferred.

[snip]


-- 
~Randy
