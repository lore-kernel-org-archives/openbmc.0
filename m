Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st1cG20P1zDrbk
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 00:46:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=j+7xabHG; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id i127so6657352oia.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lqhu/tJl+oV0UgNMVqHDbR0aBBZjZfltyQGPWbg2E+Y=;
 b=j+7xabHGCqTTjNHU7bNG3G5ULmk/JLKaDSeIc8SXYRGjD7QODK6oYxhNtyKhW71v8v
 hlGonpr14WjsZVkUIOCcGcsEArOuuqkfmLYZ/GBaLpE5mACpDkr/ULCbbRxszPoB0wHj
 GrZ5ndyYlGGyLV8R6TVYLMN/K4a1IdzD3SdbyM5SWOEQ9IMtrfFc3UEfBfewTr7wi3Pg
 DrCissCedK4bre6FO1z4ZcXsLMftp/qRsbR1aqb1dd2LsSjdRN0rGquRCPC99tK03cg8
 YZeAu+TkrNTZGl+GuGow2BaFsjVqCm/ySq8QMV2IuRzT2yHrzbkvO9de0vjFLMq2verR
 SkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lqhu/tJl+oV0UgNMVqHDbR0aBBZjZfltyQGPWbg2E+Y=;
 b=PTaOQPIgjU14jS3sBAHH0GeQytHUbrSstbo+7JGsETtAoJPE9hT322WKIWhjmAnvk+
 tLudFyDb72LkrtVhjSXqm1t9BDSdTD1EIiuhseuATvCaicjaEKsqv1B5s1/nWJMK7GOD
 KK9MyZKOZS+rFy4PCyiPJy6b17BRzxG9B8Xdxi3hjz+s4bDapVeooBaGiGfLqK0Hmdgw
 LGnUpXiNAoQTGN/Ok7f5sJNBhNqjebTwS6emIR5xArejDmP5gKnDUoMJ9t1dp7psVwA2
 sAjv8+humQhIQPEEwlXwmZ/jvuBXcetHe6M9nB3k2GMBgHhbrxrm6i2d2+98xoFm22od
 LKww==
X-Gm-Message-State: AA6/9Rn9K6/8q7YznCzreXCi3AlaubKaA9tTc8Zr995BYngURvcuCvB56NWn6cHd/1t1lUA0DK+hjUANudagdw==
X-Received: by 10.202.76.151 with SMTP id z145mr25333317oia.8.1476107164062;
 Mon, 10 Oct 2016 06:46:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Mon, 10 Oct 2016 06:46:03 -0700 (PDT)
In-Reply-To: <92b7a5c0-71ae-7af7-8090-45f4375a39d5@ozlabs.org>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-18-git-send-email-christopher.lee.bostic@gmail.com>
 <92b7a5c0-71ae-7af7-8090-45f4375a39d5@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 10 Oct 2016 08:46:03 -0500
Message-ID: <CAA0LjjW5Zti-9MJinpN8wM3j6DHJ9W5JT9XtuC80MG7WEkZwXw@mail.gmail.com>
Subject: Re: [PATCH linux v2 17/17] drivers/fsi: Add GPIO master functionality
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Mon, 10 Oct 2016 13:46:06 -0000

On Sun, Oct 9, 2016 at 7:56 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Add setup of the GPIO pins for FSI master function.
>> Set up I/O directions, define all pins needed and
>> set up their initial values.  Define serial out
>> operation.
>>
>> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
>
> Awesome! I assume this is still in development though, right?
>

Yes its not complete as it stands in this set.  I'll put the remainder
in version 3
of this set

>>  struct fsi_master_gpio {
>>       struct fsi_master       master;
>>       struct gpio_desc        *gpio_clk;
>>       struct gpio_desc        *gpio_data;
>> +     struct gpio_desc        *gpio_trans;            /* Voltage translator */
>> +     struct gpio_desc        *gpio_enable;           /* FSI enable */
>> +     struct gpio_desc        *gpio_mux;              /* Mux control */
>>  };
>
> OK, you should update the device-tree binding to include these extra

> GPIOs (and put their descriptions in there). Are they required for all
> implementations? (is it possible that some would only have clock and
> data?)
>

OK Will update the dev-tree binding.

Good question about other implementations.  It is possible that they could have
only clock and data.  I suspect some type of enable should be used but
it wouldn't be strictly necessary.  What would you suggest given the potential
for pin differences between platforms?

Thanks,
Chris

> Cheers,
>
>
> Jeremy
