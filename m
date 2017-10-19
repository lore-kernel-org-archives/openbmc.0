Return-Path: <wak@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::235; helo=mail-pf0-x235.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vg7afYVH"; 
 dkim-atps=neutral
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yHdFQ3n4xzDqBr
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 16:45:45 +1100 (AEDT)
Received: by mail-pf0-x235.google.com with SMTP id b79so5714070pfk.5
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 22:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=HcEtku2yiSeRc5N0gxop+6X+9fcswgC85Yo6+Xi3dPI=;
 b=vg7afYVHrcQ4IpyeWP3N2C2m+58xEtqbc0sPD1+Th+CaPXjxou5hi39z7fySVGei0l
 2BWPTBbuu83gv/epShMzSm4BV1CQR2uc9zWJIM+bjWIzXOA6QJFWXFh+XbZQdClCBeOE
 3SQ+Y+BuXCWR/YkY8EqrpOl/91AUvfUlBvFjbII3kKfRHVHhGKNQYcZ52QXQIwLK6MjV
 2UWz73G3t/2drGdHjjUp/N0H43lOYhKq8Pzmrhf4Rvb2QIsMAUnsR/3v9bOznCQS5Qdi
 FO4HOJidbGBFh6AAL7YzAWvjv8pFeiSuxMPAQtw6mmHPXUn7/e32DHZc386GQ6voYQbG
 9KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=HcEtku2yiSeRc5N0gxop+6X+9fcswgC85Yo6+Xi3dPI=;
 b=oDjA8DFW0QlGJFk8dNXbR5Vk/haoLkDEe8CQIVIKJgfnuMjC/fokfBWDdmN1qxjmtO
 Z4Kzv+WfhHEt65+S8ojLd6qCdQueNvECiAn4jn5CAO/KXt8Fl6AphgWIpzvo0W47THbs
 LPzpXeaUknVcTK36Zy39zOwWJHuKCSvVC7YIRCRe/VANuBdegdMNiI2ByGDojLxlJdJ3
 HIUvCdjUT3krQPQt/GXZTUGzc4GyR8aiOpaqvCmYrXOfZu/MoplQh2fpyW7B+XGi2TJJ
 PPWlS+Xn6MHEMABv5D0erYr0c5S9P/R/hxwlrRC7QVvE5fPE+ijnmnMd9MP4EnJlZ3rf
 no4Q==
X-Gm-Message-State: AMCzsaUCSMT7F5XdYla/Xq1dtP4CCdVRG/TYk+zzQW2elMiPAH+oDZYQ
 xQxR4QN+1yuDBVne1tGH8mSf9Q==
X-Google-Smtp-Source: ABhQp+Rk9Xs9nqmkDxqLcPjCDlZvvxNZnIVHfY3MZBM1aCr7LQpR8wGJfbbE3PoZQIDTwmCVp2S1UQ==
X-Received: by 10.98.33.203 with SMTP id o72mr451961pfj.41.1508391942573;
 Wed, 18 Oct 2017 22:45:42 -0700 (PDT)
Received: from [10.1.4.219] (c-71-204-170-241.hsd1.ca.comcast.net.
 [71.204.170.241])
 by smtp.gmail.com with ESMTPSA id l66sm25523094pfl.17.2017.10.18.22.45.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Oct 2017 22:45:42 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH] docs: Specify V3 of the mbox protocol
From: William Kennington <wak@google.com>
In-Reply-To: <1507183803.5452.58.camel@aj.id.au>
Date: Wed, 18 Oct 2017 22:41:28 -0700
Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>, skiboot@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, cyrilbur@gmail.com, stewart@linux.vnet.ibm.com
Content-Transfer-Encoding: 7bit
Message-Id: <3F3C077C-993C-4A25-856E-6C5B33026B22@google.com>
References: <20171004004520.18593-1-sjitindarsingh@gmail.com>
 <1507183803.5452.58.camel@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Oct 2017 05:45:47 -0000

Reviewed-by: William A. Kennington III <wak@google.com>
