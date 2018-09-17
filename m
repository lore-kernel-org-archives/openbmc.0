Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HmDXdq1E"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DZrb3TR5zF0BT;
 Tue, 18 Sep 2018 04:48:13 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id l63-v6so8087995pga.7;
 Mon, 17 Sep 2018 11:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=etsqK6QSX1yfKY0D3Lv4z27XlyrJiBEA3GbCjQw4fmo=;
 b=HmDXdq1EoWnMKa5fIXsXfd2Sdbkxxo9vUKa55mGhndFc46LVFwEkx5Q9MZTA7YFASv
 ct9TxajuBur2jslC5PNyPVBRLPbJObwL896aD4gXARngYgEU1R734BQmDN1KYPGlId3X
 RQkUXbjJvrBxlBN2z+nSSQHeo7I+I0xWlVo62X7ndPkIfFtC7i5jOKjOL2UXofvYQaoU
 i07JobwaZMab9hRbWR8Jf0pIjOBvbf0Ko8nKA6OapjD5ZEZQQsJaKSZ0tuRtzcai26Xz
 mK/2Y8gCNJmKU125+TL3sN9NlfolOmdmTrm2rZZErF7dTEaEbpNcyJ4U7z925ArCtz0Q
 nt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=etsqK6QSX1yfKY0D3Lv4z27XlyrJiBEA3GbCjQw4fmo=;
 b=WkbPiAtzZV79qdIxlF4JRMBTiGcoe+o4roFU4jVE9r9PEgcwazrGxyciIAbocPgfap
 +K41gJu7ufNaWnjoFP1NJV+ZrkHePET0wVJcnb703GG6X9iYwsnkzD11Brk87xoJs8AT
 ngbIi7suMkBMzRwjo9y9FsCx1xrAb5kjyYIBhz42788SKbSHqYJbjKhBIsGyFmMiHfIf
 XZQ9hOgP3LAIxHaUriegYdtAhvVa2aPj+lggfYq7/ZllrUIGigaNNU2lbdLvhuAN3BXq
 mmTtCSMbPayhz4ETT5JZ/7ob0eqMk0ZCvH5APCfMCawrGsnlgw9XZAT1+k+s/o8sGufE
 3xgA==
X-Gm-Message-State: APzg51D7Hhd81LpODczpBvZVxZg/m9Gj1J1XbMTUlAtEuDzaVt9XwdXV
 oKze4DIS2kyNmLJmiznWNBk=
X-Google-Smtp-Source: ANB0VdaRU0LcojvqcOm7oJMNpeRYGNb7Y+K2adS3js5kYCKEmzgqAXsd8Q/rDHoJiup6+uHYJYve8g==
X-Received: by 2002:a62:71c4:: with SMTP id
 m187-v6mr27059433pfc.232.1537210091691; 
 Mon, 17 Sep 2018 11:48:11 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id 6-v6sm30542476pfr.115.2018.09.17.11.48.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Sep 2018 11:48:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Sep 2018 11:48:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
 Brendan Higgins <brendanhiggins@google.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: Acknowledge most interrupts early in
 interrupt handler
Message-ID: <20180917184809.GA16057@roeck-us.net>
References: <1536895810-28903-1-git-send-email-linux@roeck-us.net>
 <fbf54ca6-16b3-5e35-eac8-b3dab8118543@linux.intel.com>
 <20180917163401.GA1082@kunai>
 <037b4cf8-5dfa-d554-b126-a2462ba9c803@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <037b4cf8-5dfa-d554-b126-a2462ba9c803@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Mon, 17 Sep 2018 18:48:16 -0000

On Mon, Sep 17, 2018 at 10:16:59AM -0700, Jae Hyun Yoo wrote:
> On 9/17/2018 9:34 AM, Wolfram Sang wrote:
> >
> >>Looks good to me. Thanks! :)
> >>
> >>Acked-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >
> >Does that mean I need to revert "[PATCH i2c-next v6] i2c: aspeed: Handle
> >master/slave combined irq events properly" in i2c/for-next? And apply
> >this to i2c/for-current?
> >
> 
> No need to revert "[PATCH i2c-next v6] i2c: aspeed: Handle master/slave
> combined irq events properly". This patch should be applied on top of
> the patch.
> 
Yes, sorry, I should have tagged the patch as for-next.

Guenter
