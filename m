Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSz6s5DvdzDqD0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 00:41:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rx42FFNH"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id l16so202618ywb.2
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 05:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=J1HhIIfUMp04loS8iwE0zgd/Z4KNx3djpUjyasGrTos=;
 b=Rx42FFNHGKdWotF9o+soedwzkz/MDWnxx7Hvukszazf5WlNAjxNQSo9xpUGmyh7tiQ
 tTC0JXwDXPpBI0AlasVxGa64I8QMAqv2yWi+7vAbZu4xbmHkOJ9fau3HyuGnXgWNhSRx
 MAJLGw15aqWPq5j6t/3GsfL52lTwf+kTohaHjwexlb+fMqSDpKUPfpsekcMInw4Vq3Gu
 qNEf2lqEdtBtRVtUAhsgFl9WlukC/eHlec9qiD3jMPH04I21kGTlmgkxfy3nqYpj8csp
 r0CNDLNMBBx6scDiM9yrcRb1X90wSlLKL/XotenaM33m4RFrPJii8pgtnVKfuO23Ad7v
 m1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=J1HhIIfUMp04loS8iwE0zgd/Z4KNx3djpUjyasGrTos=;
 b=l9T6lPfBv8jXIz46jl9N+9Lhk7UEPkF2p8f5PFuuF8otBWcSFhnO/BL7NuTKuLo6TP
 /+y8AN9cacIxe0zl4WQjxf5h5j9Qka21eWPmI+rpQOWNjpQL3pgupUMAxDkhRVIO7iD0
 oAtO1Y/fGvdTBagg9ALsnfQL5uLh7YZzONU54cW+Y2rcrXrAFcJLY1LZn4wws36w/CDn
 99SeoLBWnPijfbcAt/1dVSffe1zNJKtFzlqC2ckl1OfiFQz3hfSmH+eIRjAa67/ENk9R
 LbxaKj8GCSLV3fmrr1sWBiDSor2cv5YJnNi/xOZ0/ThpTjmldCn8DjfHEUzOA90QS+25
 uahA==
X-Gm-Message-State: AMke39kKNTk6q068sOgG73RsXSyAzuqJvEXQ1GvDqPHPa1R4dTyZ6PHjqLf7+fXEb6V1apkfEE/Bh+uwm3uTZg==
X-Received: by 10.129.116.4 with SMTP id p4mr27746862ywc.268.1487770899384;
 Wed, 22 Feb 2017 05:41:39 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 22 Feb 2017 05:41:18 -0800 (PST)
In-Reply-To: <CALLMt=pyX=4FVoqQ_LwuOoG2U1sGTVyKDcYDzU3Ov-x4FRiJbQ@mail.gmail.com>
References: <1487696530-27256-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CALLMt=pyX=4FVoqQ_LwuOoG2U1sGTVyKDcYDzU3Ov-x4FRiJbQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Feb 2017 00:11:18 +1030
X-Google-Sender-Auth: HMm3_5dS9ztmg1PopdWiTU31iHA
Message-ID: <CACPK8Xf_8vfqmXdeDo8ftVtBcTBOtq5xqmuUpKEJqufCyF0r0A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Zero out user buffer
 first
To: Andrew Geissler <geissonator@gmail.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 22 Feb 2017 13:41:42 -0000

On Wed, Feb 22, 2017 at 1:51 PM, Andrew Geissler <geissonator@gmail.com> wrote:
> On Tue, Feb 21, 2017 at 11:02 AM, Eddie James
> <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Scom data is just bit-wise OR'd with the user buffer, so it needs to be
>> set to 0 first.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>  drivers/fsi/fsi-scom.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
>> index 51b3dc3..ed3b98e 100644
>> --- a/drivers/fsi/fsi-scom.c
>> +++ b/drivers/fsi/fsi-scom.c
>> @@ -85,6 +85,7 @@ static int get_scom(struct scom_device *scom_dev, uint64_t *value,
>>         uint32_t result, data;
>>         int rc;
>>
>> +       *value = 0ULL;
>>         data = addr;
>>         rc = fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
>>                                 sizeof(uint32_t));

We could do something more sensible, like apply the low 32 bits to
value and then OR in the top half:

        rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA1_REG, &result,
                                sizeof(uint32_t));
        if (rc)
                return rc;
       *value = result;

       rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA0_REG, &result,
                                sizeof(uint32_t));
        if (rc)
                return rc;

        *value |= (uint64_t) result << 32;

Or have result1 and result2, and then only save to value the once:

    *value = (result0 << 32) | result1;

And then there are questions of endianess that must be considered
before upstreaming.

I have applied the fix as-is to dev-4.7.  Please consider a cleaner
fix when applying this patch to the series for upstream.

Thanks for the review everyone. Most reviewed one liner OpenBMC has ever seen :D

In all seriousness, keep it up, it's good to share the load.

Cheers,

Joel
