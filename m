Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x22e.google.com (mail-ob0-x22e.google.com
 [IPv6:2607:f8b0:4003:c01::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E4A951A00C5
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2015 16:27:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=CLUvvKE3; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=QcnM/o+V; 
 dkim-atps=neutral
Received: by obbda8 with SMTP id da8so50222901obb.1
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2015 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=TUGHLhjM5CwqbKy38lEfI0oAWXqyMM7ioTxd+ICaylI=;
 b=CLUvvKE32oHX3PG1z1jzlMnmCpTraGM3G0psCnG5x8+LzK5uSrYfpEHfuRZV5lWAFO
 HkhpfKxgjc0gYNPOXeTgaK612Kj4jwXsLdNcCm9cbhLfzHYNZRRv+uXYS8/XGgtDf/0M
 9Ppsiw2FSB0Hg/JAZdyvWx823HwkWN4zGTe0gpxj/8ycuqnauBgFCWUulUgANablo+F2
 6uheXIl/4wFcaVXDuefhUT7tdsYiOL2C0vYS8I1udAcXn4jG1DiJNjfphbHy8EcJqGiO
 CWZBdtaTf9dpyZBJt632mMCv3VLbzDZosDFq4Z8NsYdQvb7SFgYGxC4/xJTDlWNSTiGR
 eXww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=TUGHLhjM5CwqbKy38lEfI0oAWXqyMM7ioTxd+ICaylI=;
 b=QcnM/o+VFUy3Clogl1r+Ey+qg7BvnHisEnGLowgLsJ73rFyKfYw1E2iaHeq4zxr4JB
 W46IamAb6WtdTWMjsuYPJjSqLbf5wDGQFIkTpuleFWFwHLMScRj9tX00SmXF6MrmAwcu
 XYyfmdrJgNmfFciWRhjAphzMn1YTWua568VLw=
X-Received: by 10.182.107.199 with SMTP id he7mr5101334obb.35.1443680820605;
 Wed, 30 Sep 2015 23:27:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Wed, 30 Sep 2015 23:26:40 -0700 (PDT)
In-Reply-To: <20150930191352.GC20477@asimov.ibm.com>
References: <20150929143413.GE14293@asimov.ibm.com>
 <CACPK8XeHTP4gUa=P3hdeo-uCU6_O+3SJg8qnwadfn=+GH3h5WA@mail.gmail.com>
 <20150930191352.GC20477@asimov.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Oct 2015 15:56:40 +0930
X-Google-Sender-Auth: kGBCJuz3_wA8Yyf2fCi69IHwOaE
Message-ID: <CACPK8XceU6Z4XUWujfhHetVyqxYjYYa1JeMgFY3YYDpP=xKC5w@mail.gmail.com>
Subject: Re: EEPROM driver
To: Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 01 Oct 2015 06:27:05 -0000

On Thu, Oct 1, 2015 at 4:43 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> Do we want devices to generally be required to be added to the device tree
> or do we want to have a userspace app that probes the i2c bus for devices based on hotplug events?

For the devices that are fixed in a system, such as devices on the i2c
bus, we would encode them in the device tree.

> For device tree entries are you just suggesting that the i2c master
> would be in the device tree or all the end devices?

Both. The device tree describes the relationship between the i2c bus
and the devices that hang off of each bus. We also encode interrupt
numbers, i2c addresses, and any other information that might be
configurable in the driver.

> Is there an easy way for us to pre-populate a device tree at build time
> for elements we know about a particular BMC / machine combination?  We
> may need to incorporate elements from both the bmc-bsp layer and the
> machine-bsp layer.

We will encode this information in the layer that describes the PCB
that the BMC is attached to. Guessing at your naming scheme, I imagine
this would be the machine-bsp layer?

Do we have a wiki page that describes the the bitbake layers and how
they relate to each other?

Cheers,

Joel
