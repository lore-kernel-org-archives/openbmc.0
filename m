Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x243.google.com (mail-ob0-x243.google.com
 [IPv6:2607:f8b0:4003:c01::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5C9801A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 15:40:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Ane1Z1ow; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=LWcKCZL2; 
 dkim-atps=neutral
Received: by mail-ob0-x243.google.com with SMTP id wg8so7666253obc.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 20:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=W8UXSRceHPLNVD8jn25L7NAfAYbkqjKtI2DNod5iE54=;
 b=Ane1Z1ows8AocT4+SfV0UEEb+ynH7750szZqMyeYFvHVcNMzoTckV1DoS9lV+AGSgV
 fpFpD6tHvsdJ7AvONczwQ5MuL6pNqU6EEdo57kpsWcFs54yY1xLzV7/eRZsypGpA4XUM
 aXI+He8DDy1op9zGXqkpVn85rB66CZJd8Q6wbQZQU21vcUrU+3fdiYYHX0FEZtiZFV5Y
 ccVhhQjY+7SFY9JrWwKiL+dl66sX8IYrVaxSGUamWrKKJnFYO1zsk6rdrwkmg7Kg/reT
 mLLCaRj2CRH8i1v6pNnMHkj0ZRP7lj+wbLb+cQNA1lYH22Zo+SORtfo4810Ukyq41bkz
 2Mng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=W8UXSRceHPLNVD8jn25L7NAfAYbkqjKtI2DNod5iE54=;
 b=LWcKCZL2TGyDc1mN9pzBbkFZam+Eva40AJuDMMlbZ8oRdKwZ9Vgio0LFR2V0MwLpP4
 qKf9ZJOlk4eiLOcNeOZMn72YoXYEvcs6f5J30yKH+KurGv8hGK99r2cBa79DoHEI4T24
 S9OhaDGbD6jTyrMeA0cRZYOG7/MmugpKCQrl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=W8UXSRceHPLNVD8jn25L7NAfAYbkqjKtI2DNod5iE54=;
 b=CnKma0pkjJKyHPh1+VwqI9c0QvbnjH42dKw2m735u5LhfTRTgIPo3o2bILnqMwCwM6
 2lwdI6n3Q4wHQo0aYQW/7Hn3/Xzr5ToB33j0GVxJq3aFsZCdxJkRb6YrXqiZ0pIQtRqM
 Ea9VxF8MtRXnoS/dDuXKRNT/UNuHJ0BuDVDfxyJENnOkocmbtIw7zUfxqWUluX3DCH0T
 xz9h/Cmx4waiC838T8f5A4qrsnuaa6Oc6DY34atk2mtKvpbqQ6xRwovBC2eutdJWCGPF
 Bhxs+TTQU74PIQIW49+2ceLqlEHMNcyfvbVF1SCvddYxHDtfgVdn5SsOonLSlu/jwfNw
 GQ1A==
X-Gm-Message-State: AG10YOS+s+UH5V9U1AOR4gEqjhrH853uCL7uCa2tBmgXIcupKMbwO81c4SB/RUIZPh6I01jt28Eoug0ZI+US6A==
X-Received: by 10.60.232.99 with SMTP id tn3mr48389829oec.8.1455252006978;
 Thu, 11 Feb 2016 20:40:06 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Thu, 11 Feb 2016 20:39:47 -0800 (PST)
In-Reply-To: <1455179165-13252-2-git-send-email-jk@ozlabs.org>
References: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
 <1455179165-13252-2-git-send-email-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Feb 2016 15:09:47 +1030
X-Google-Sender-Auth: wdPy6EcHFG1W9OLOie8CPEw51pQ
Message-ID: <CACPK8XcrC=VUaDAkd1Yoye7VyjmsmfgAfHKQAPykjNthR_jQnQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] serial/aspeed-vuart: Perform enable/disable on
 driver bind/unbind
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 12 Feb 2016 04:40:10 -0000

On Thu, Feb 11, 2016 at 6:56 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Rather than exposing an enable sysfs attribute, we can just set the
> VUART enabled bit when we bind to the device, and clear it on unbind.
>
> We don't want to do this on open/release, as the host may be using this
> bit to configure serial output modes, which is independent of whether
> the devices has been opened by BMC userspace.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Applied, as discussed on IRC.

Cheers,

Joel
