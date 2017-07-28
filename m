Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJXP30kS5zDrLX
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 12:10:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="atM/X9Ht"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xJXP250zGz9s74;
 Fri, 28 Jul 2017 12:10:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1501207814; bh=BBqF5VC6nMzbK2MPqqn0494IwIkzwNWQy0mGw78FtxM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=atM/X9HttxNgSXTwL5AuesF8qS0cJrksWEjEelgKcsePTWtbIcAZl8gzGpUQwsUNW
 3YnDshAU09tiqTT6YQrir/V4ricoc2waALav4bfXx93k1GzHQg3H/dwDH3npkkyfsj
 INmIyPzUeUUSd0e6BY0nmN8MuN7sQwVpks1wch5H47MmKPLNBu0ez/pemiUGprgwVb
 F6VQcPTm9sbsun+ZWjFFI4OHQctGpF4H0zpjU33c50WJSDANDYnQYE7/BjwliKqvL3
 3gM5UcCg8iGAes2iIPT2HpeDKZ5fCdlny3IoWjE/oyuELjcMDhe+S1geYnTD1V/hpc
 irHKNytOltzAQ==
Subject: Re: [PATCH linux dev-4.10] drivers/fsi/scom: Remove reset before
 every putscom
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
References: <1500562258-20214-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <ed57c99d-4ff6-300e-71c8-7afde6a61bed@ozlabs.org>
Date: Fri, 28 Jul 2017 10:10:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500562258-20214-1-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 28 Jul 2017 02:10:15 -0000

Hi Eddie,

> Reset causes problems for operations requiring multiple scoms (e.g. i2c
> over scom). Instead, reset scom engine during probe.

Looks good to me. Out of curiosity, what kind of problems?

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
