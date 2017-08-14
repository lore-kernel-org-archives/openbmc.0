Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW2lb4ks2zDqj4
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 14:32:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HTjZMfdb"; 
 dkim-atps=neutral
Received: by mail-lf0-x242.google.com with SMTP id y15so5822334lfd.5
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 21:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nN9C+2v46N/erJlPPid0AeZL1Kwkrylp2zl5hxdUtyE=;
 b=HTjZMfdb1SJpZOAR4PIjk1IrvpsisgHBLWI0eeT0MkjB+II+BUnWm9PNQg3gpyDGKh
 GcgH+iOx5jgq82riv8FbQvR1iSuC5BODL/4/CgBj4cACGyLTsFjwgX6PJ/WPzWY+yqWt
 gWo5ACF7CBekz+1jphPt3Lhgg98T64rAN7sYSNOCD0/OdHVyXJ7jGItljc2D6QU2zhh5
 EKMv6hTOsHDrkTdjM4otQkFxLBcKEpQ608H1aRM9mRgnP+7OgixWXOL6wPOzVhNp4tF5
 hOU8ICHd+TuWKh9pxZVh61mOf2dq27HP6ypZOmGYZZPdO+7N5gmwg3BZRVapBphyMzsu
 f+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nN9C+2v46N/erJlPPid0AeZL1Kwkrylp2zl5hxdUtyE=;
 b=pfAfM6Sr0z01lQBacM4f3MCWpXhrTEfTVFq8rxf1xfw5DPJKdZYmVnAuJMWkG0eZsz
 /9g7cMs5HbzI2OIj5fO3ubS7MtPHJQ1DyDwQZ2ys/0escwbbl7IyWMaHTD8swKIjcskP
 1QbyFuk3B6cHuj9STRZkuerQAZg9yMRg9k6TKjXjevIyixYxZKiyFHowgA5H7NQZkkEN
 ty9m0+anofRdAdvrasCuoKHrTnUOeW8J5fhPeoc1eb++cEBNE6tIXGpxAo1g9Zm022hU
 4WyBuF4pcYj+4oDkqfUGckhgyTVFiR8I9H5K/UayUO+hQ1XYasFBdkxoDsOyE/U/gyNS
 cmSQ==
X-Gm-Message-State: AHYfb5jqCOvIG14g6yafbcb5E0MASYwUXKsaFqGxwlPPiheq4gKbUTLH
 MWlkD7CpzmMuq/1hHBEyK1ObhcbrIIv6/WgvKQ==
X-Received: by 10.25.168.3 with SMTP id r3mr8164846lfe.111.1502685160791; Sun,
 13 Aug 2017 21:32:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Sun, 13 Aug 2017 21:32:20 -0700 (PDT)
In-Reply-To: <1502474608-2674-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474608-2674-3-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2017 14:02:20 +0930
X-Google-Sender-Auth: B-lYwoMB5Vre4SgO7I05aQezH4g
Message-ID: <CACPK8XeH5AqL_Jav4kWq7jfp_+FJmwHd5qPqE=-_e_vyW6zGfQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 2/4] hwmon: (pmbus): Access word data
 for STATUS_WORD
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 14 Aug 2017 04:32:44 -0000

On Sat, Aug 12, 2017 at 3:33 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Pmbus always reads byte data from the status register, even if
> configured to use STATUS_WORD. Use a function pointer to read the
> correct amount of data from the registers.
> Also switch to try STATUS_WORD first before STATUS_BYTE on init.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

I have merged the upstream commit
(cbcdec6202c934bd72fca4fe9db255d84f907dbe) into dev-4.10.

Cheers,

Joel
