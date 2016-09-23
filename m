Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgQ764T4dzDsmC
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 17:32:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=XefBEpLc; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 107so1098967uah.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 00:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mhw/MgqOVOVV1md5KUaidih7P/amadBBmy3gVJwa7E4=;
 b=XefBEpLcIkNZu8mHcI04kY6/zu/jKmdloZTg2uHRKaed7tl91JQmTZ0r/bSuTKk1Td
 UPvPfdknSiIA0vN8A4q1+xzoDVZ5b9f8SagC2M+wwsfW/sR/rdZDwNQsdGSD64k1w9/z
 1J+z3/vmSzSECO4fp8RjzsLxoJrGL038S/XFoWwOuIpy+28SCTxOwHp4gmAjRdAW4Spu
 wHgmmebWxUtSeDSKVBHlh/QqB6LRbOJsKmNatAMniOU9TCpUtAxZAh5STrYxOA8OsniK
 Z4Z5FE3ua0LwAKovCsuN/gxc4NO7mVctW3sufWtXeAp9P+nPhjHcODtzHX8XTmWupnSB
 IrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mhw/MgqOVOVV1md5KUaidih7P/amadBBmy3gVJwa7E4=;
 b=I3ohWs6/qr3KooT3vM0WmE4LDw3UG044GV5v1EiPK6OgpWQCPFp9ykoDc5J+2hGS9S
 Lw8593o+NYpBFqMojtGlXm03wP2k7kRmMmRA9uKf/z/806deBMFRqe1D18xx7cMy4/jm
 bWmItrDBF6IgpCzyNUJ/h1oKFkCiOlDUudfT179fO+1SvEuC5LzXa1AYw9ly7CAKcGGU
 klfvmVevjFahBd+9jUFRh95SQ+bYDcWVU0zKurLzaFAPEqgLHbVdO0x2c9TTAzV6rd4W
 o5XCMFMQiXgT3dDUYFoTaH1HdQqfSTzXd6Z55oV2bfAHcGiDs4DbTtKgel1PdqWZ13pg
 Nmvw==
X-Gm-Message-State: AE9vXwMahT7HrS1iLnPsOMziCLGaQwIa/53u4tugxVtg69Gua1Fd4dEn03l0A6byqWb6PGeO6AejJ70x3u5QgQ==
X-Received: by 10.159.36.177 with SMTP id 46mr3405995uar.78.1474615952533;
 Fri, 23 Sep 2016 00:32:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Fri, 23 Sep 2016 00:32:12 -0700 (PDT)
In-Reply-To: <1474246880.13249.49.camel@aj.id.au>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-9-git-send-email-tpearson@raptorengineering.com>
 <1474246880.13249.49.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 17:02:12 +0930
X-Google-Sender-Auth: Y9TqLpNjs9ETRe40KC1zh1GpUUE
Message-ID: <CACPK8Xdjm1+daVc4-AXBTWcWo8_YLo80pWEaAVmEepuF-UOftw@mail.gmail.com>
Subject: Re: [PATCH 08/17] pinctrl-aspeed-g4: Add missing MDIO1 pingroup
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 23 Sep 2016 07:32:35 -0000

On Mon, Sep 19, 2016 at 10:31 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2016-09-16 at 15:35 -0500, Timothy Pearson wrote:
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks for testing this Timothy. Andrew and rolled up your patch into
a larger series that adds all of the ast2400 pins. I will apply his
patches once they are submitted.

Cheers,

Joel
