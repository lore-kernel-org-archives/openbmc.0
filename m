Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPJzx19GCzDw06
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 10:52:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RLQJEtL+"; 
 dkim-atps=neutral
Received: by mail-qt0-x22b.google.com with SMTP id c47so26344622qtc.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 15:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=SDX/lvQcCpDT/3fEOaIsAeDV1rQqNlhAk0Z5MBbTBzE=;
 b=RLQJEtL+YIDIlNoMXGk9tz8pv2JKfhnMceXYljt3ZkcAOjKd+9BvCIz89S+dVHHE6O
 pvm+I/Y7hXFnxK8IP3Nn2XWKWX803FFcENQrT1cPkZL0u21lLpmR1cpNFkzGlCS/bnQV
 ZGSKVE90t7j1IW0lLHpONPZe1H0cuGwUmVuNUPXMnlUsoaPaBquDorwXl6YQ/5BqmqK4
 e5YwzmqNnxjLLAYFW03BTxI960Oq3OfDCGeA6AXo6TYRxh+l7owU8fPnHCH0QmW0+FDF
 XHdTHLPQ+Hme79qrVBYpZ7ID1sW/0Kte0zKthn1yAhFYWrr+i3FDnh8EPdG8O6Q95VpZ
 APFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=SDX/lvQcCpDT/3fEOaIsAeDV1rQqNlhAk0Z5MBbTBzE=;
 b=bcAtxJQoZ4R14w+2tNerO6BB0tZPtK7supsvp4EmcXQE4XDf9lQlZTxiZ0ZG5gqD8x
 W/yUjWHSyYowJJw/6tejJeAC/QogYjJ8DjTSHAYjSclX2jlfHkri4ML6rmx9/wE2dSwh
 od3lYVCDAsWgE+VaObuKfudI9ZVGRhja+IqwbzUd1Xi/K+rajU99xt/IesHMLuWmQXMN
 SnDi6Oq+qH0HDU6xbHH4OgLc8feYxto+bPCaNpTguKsyELmjW79wQICJtB4S4i8SLTuQ
 OzcDEGSnj1ew12izkMyHoJWg0WyZx4KY1UlFF6qqhnRrSMRphohNF4VmyqwEp8L+sJlc
 dP7Q==
X-Gm-Message-State: AKaTC00sDBQqeJ++Opl3oBGTE9wsPVvdnp7ZJJN/XmcY4nQ8fBUfg44s7mgjmyd0HGFf2SbAgkdSHhxZXV0odFbj
X-Received: by 10.200.56.182 with SMTP id f51mr5129708qtc.208.1479945162819;
 Wed, 23 Nov 2016 15:52:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.220 with HTTP; Wed, 23 Nov 2016 15:52:42 -0800 (PST)
In-Reply-To: <28078e6d-f5e4-da59-e226-baa9a60a4b19@kaod.org>
References: <1478311099-6771-1-git-send-email-brendanhiggins@google.com>
 <1478311099-6771-2-git-send-email-brendanhiggins@google.com>
 <28078e6d-f5e4-da59-e226-baa9a60a4b19@kaod.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 23 Nov 2016 15:52:42 -0800
Message-ID: <CAFd5g459KtB1YemK31nyoNV7VrqDGtpuGd9q=i-Ha9-CJ8VstA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] i2c: aspeed: added driver for Aspeed I2C
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-i2c@vger.kernel.org
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
X-List-Received-Date: Wed, 23 Nov 2016 23:52:45 -0000

> is it safe to start a new transaction when in a interrupt handler ?

Yep, i2c_transfer and most of the other functions in the i2c API that
wrap the implementations already lock for you.

> Why do you multiply by * msg->len ?

I thought it might make sense to make timeout proportional to message
length, so their would be a timeout per byte, like what the hardware
already does. I guess we should just leave that up to the user to
determine on their own?

> use devm_kzalloc() may be ?

Whoops, good catch. Will update in next version.
