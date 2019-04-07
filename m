Return-Path: <jic23@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=jic23@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="CDQWL8kB"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44cVBP29KszDqHn
 for <openbmc@lists.ozlabs.org>; Sun,  7 Apr 2019 20:28:12 +1000 (AEST)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A3CD213F2;
 Sun,  7 Apr 2019 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554632889;
 bh=8hD8WxkDAJm856q9Xl0cW+WxSrX0fTKFNfrBhRVZDak=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CDQWL8kBhhTHhj7rL4TSVPMI8N9g9kfPEUC7+QmJAeiSILfZXfgUXJoxFuX42MwzS
 /Yb1lN4MaqciG/rew2VXX58E+dw+ozaclmAeUAba/2M3V2Vqi/F+NJxak1ZDfnIzy9
 J8MuY3Z+CxQptDmddJDx84EhC9hqjL1qJIyttGNU=
Date: Sun, 7 Apr 2019 11:28:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: gregkh@linuxfoundation.org, knaack.h@gmx.de, lars@metafoo.de,
 pmeerw@pmeerw.net, yuenn@google.com, venture@google.com,
 brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au,
 linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iio: adc: modify NPCM ADC read reference voltage
Message-ID: <20190407112803.5de7b4c2@archlinux>
In-Reply-To: <20190407081928.72250-1-tmaimon77@gmail.com>
References: <20190407081928.72250-1-tmaimon77@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Apr 2019 10:28:14 -0000

On Sun,  7 Apr 2019 11:19:28 +0300
Tomer Maimon <tmaimon77@gmail.com> wrote:

> Checking if regulator is valid before reading
> NPCM ADC regulator voltage to avoid system crash
> in a case the regulator is not valid.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Good catch.

Applied to the fixes-togreg branch of iio.git and marked for
stable.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/npcm_adc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> index 9e25bbec9c70..193b3b81de4d 100644
> --- a/drivers/iio/adc/npcm_adc.c
> +++ b/drivers/iio/adc/npcm_adc.c
> @@ -149,7 +149,7 @@ static int npcm_adc_read_raw(struct iio_dev *indio_dev,
>  		}
>  		return IIO_VAL_INT;
>  	case IIO_CHAN_INFO_SCALE:
> -		if (info->vref) {
> +		if (!IS_ERR(info->vref)) {
>  			vref_uv = regulator_get_voltage(info->vref);
>  			*val = vref_uv / 1000;
>  		} else {
