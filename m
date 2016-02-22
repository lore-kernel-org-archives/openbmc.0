Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x234.google.com (mail-ob0-x234.google.com
 [IPv6:2607:f8b0:4003:c01::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B34721A0352
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 16:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Akno0MJn; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=D7mpG+Ku; 
 dkim-atps=neutral
Received: by mail-ob0-x234.google.com with SMTP id jq7so156307987obb.0
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 21:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=/iTTeJdKuLVkdm+HB99RkqTkm+rE6tQcDXjToDQO1L4=;
 b=Akno0MJnFtQBnaw4V6uvmzEAkvC7LF/tduFdziuLckwHa1QfA+QK0c2tYaQsuw8Fwm
 LPq4GpfDUxuq6tJ4UOmID4O8LE2IhzxmtW3bEIvN3yg6j/ug7Xn5rYlKeb0qDliGPaxA
 u7wO9hDvMtDRbIlxKvnLm7CHPwPSdtT0obo3pHuDMFHu9QdYvYcgVsjxd6d8TWOjZJs5
 c37kJrBEujY9EXiuiIVYt/0sBQCZVqMVGHFa+k6xmH7Don3D/Ad5OeN0ftKibi403j7D
 AwfOdLpqHkJoNgyvOW1hVF+He5r4jIa2Yz0R1bvMktzVsD3wnPPq/CQVubOHa9cCG4zk
 vruA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=/iTTeJdKuLVkdm+HB99RkqTkm+rE6tQcDXjToDQO1L4=;
 b=D7mpG+KutrQKSgNsWH2WwWXepudHOyy6Lfs13Bsd1BmDU/3kvb8JLoeuhd8CYbVlEK
 YFXCq/Xq8U1s4rvSsE+qsi/OtQPkqLTwbCF6B/1fmgt6BKOwmWCcfqZBZJqXJ289A9R+
 fgY2UJc6cK9hQ7mX4AjzueCs8Yudw5n+dhHX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=/iTTeJdKuLVkdm+HB99RkqTkm+rE6tQcDXjToDQO1L4=;
 b=CjRtSvKkxR35ybuFw1RgIH/HW2gPo+Sp9qYrm0iovFsBbvKF4wA0A1zZbvuHQleDg7
 9WTQJ7mIGhqKDsVWLd9xyye5zuqAl9tP6ZMy/QLGJlUG5KUeMVfVvnMzYxrFOwTwBRZX
 sDD544cAanFpqyyhUrP29PhxQiRu1E41kZCvp/iHWHBZ9Xpy5WG2SZ8ouwSt0MnBHv9T
 qf63TH1Q2FsFoXu1AvSYojYd0TiVatkHI1yhUtR+Sk/22ltIIRHRpl/Ydn6xidUAVZ09
 MdgorO+uXuzMYWITJreDH95Yq6SxtVPJC3iHFLY1w3ytxk/Tocb4JFFC6U5GcIZV380z
 HcLg==
X-Gm-Message-State: AG10YOSIkP9E7dqOE3+Rr/VND265JRr1dVp+Wh15CUd7M4wmjETzoTAyHLd+d2msuB5FF4lhrIB4EzFaoTuwdg==
X-Received: by 10.182.148.39 with SMTP id tp7mr21335346obb.87.1456119094771;
 Sun, 21 Feb 2016 21:31:34 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Sun, 21 Feb 2016 21:31:15 -0800 (PST)
In-Reply-To: <1456102639.3064.19.camel@aj.id.au>
References: <1455909028-21559-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455909028-21559-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1456102639.3064.19.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 22 Feb 2016 16:01:15 +1030
X-Google-Sender-Auth: -b-M_1G6jMYmh4ZGrsND3ndQavs
Message-ID: <CACPK8Xf8kC7T8JRJc-WOU_s1KvpzdWshRtNGEpiMYnBHYo4Pug@mail.gmail.com>
Subject: Re: [PATCH linux v2] mtd: spi-nor: aspeed-smc: Use io string
 accessors to fifo
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 22 Feb 2016 05:31:37 -0000

On Mon, Feb 22, 2016 at 11:27 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> I think the change of direction in the {to,from}_fifo implementations
> improves the readability. Thanks!
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
> On Fri, 2016-02-19 at 13:10 -0600, OpenBMC Patches wrote:
>> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>>
>> Make and use new routines to access the fifo when in user mode.
>> Instead of using memcpy_fromio, base the new routines on the io
>> port string accessors.
>>

>>
>> Signed-off-by: Milton Miller <miltonm@us.ibm.com>

Thanks Milton. We will take this into our tree so we can use the flash driver.

Separately to that we need to work out what our solution will be to
get a working driver upstream.

>> ---
>>  drivers/mtd/spi-nor/Kconfig      |   2 +
>>  drivers/mtd/spi-nor/aspeed-smc.c | 120
>> ++++++++++++++++++++++++++++++++++++---
>>  2 files changed, 113 insertions(+), 9 deletions(-)
