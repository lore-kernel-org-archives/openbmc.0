Return-Path: <linux@roeck-us.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=roeck-us.net
 (client-ip=208.91.199.152; helo=bh-25.webhostbox.net;
 envelope-from=linux@roeck-us.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="NZP7dyVJ";
 dkim-atps=neutral
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41P47L2xh5zDrL3
 for <openbmc@lists.ozlabs.org>; Mon,  9 Jul 2018 09:15:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bDkwyEuVROEq1MRbOV1BERyGjAnqKukaE+/Cf95OC8s=; b=NZP7dyVJ0Tp9YLOXRUBpzJajcX
 1AxEXnQQ3MSQnW0NlhWGkNfFkUFUPJW7e9lxybfqJ73at43b/g1IiHkxriziDF6oI0iNybQQxA5AT
 Y0mEG723uOfAhV7k+K1Rk0VOBov6tnA7DnkdlSNh46ID4ZVte1LfnJPhh7QwIsNOD6hPRJEMrAPJ4
 UrBKSi2+KzrwrHJGpivoOrsMtQ1GsBmAma35O3XnU+wjYQycmIj16Op46S+fRZiLK2cduA87mZ7bq
 IOKTSrU6TwrfcSpfbh5tT7ob8Uig3HA64dkUyNq7453JWvw1RAEz+uxRa7PxgPI3aRuSNeUzXXZfg
 ss9xOGDg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:51540 helo=localhost)
 by bh-25.webhostbox.net with esmtpa (Exim 4.89)
 (envelope-from <linux@roeck-us.net>)
 id 1fcItY-00AvjN-1O; Sun, 08 Jul 2018 23:15:08 +0000
Date: Sun, 8 Jul 2018 16:15:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
 avifishman70@gmail.com, yuenn@google.com, brendanhiggins@google.com,
 venture@google.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [v8,2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
Message-ID: <20180708231507.GA26077@roeck-us.net>
References: <20180703232326.355718-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703232326.355718-3-tmaimon77@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Sun, 08 Jul 2018 23:15:10 -0000

On Wed, Jul 04, 2018 at 02:23:26AM +0300, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM750/730/715/705 Pulse Width Modulation (PWM)
> and Fan tacho driver.
> 
> The Nuvoton BMC NPCM750/730/715/705 supports 8 PWM controller outputs
> and 16 Fan controller inputs.
> 
> The driver provides a sysfs entries through which the user can
> configure the duty-cycle value from 0(off) and 255(full speed)
> and read the fan tacho rpm value.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
