Return-Path: <ross.burton@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::134; helo=mail-it1-x134.google.com;
 envelope-from=ross.burton@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="nBFfs0WV"; 
 dkim-atps=neutral
Received: from mail-it1-x134.google.com (mail-it1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KGvk3F1tzDqXb
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 12:07:26 +1100 (AEDT)
Received: by mail-it1-x134.google.com with SMTP id b5so7035043iti.2
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 17:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eakFycCbrhfBm/tKxeozCrFviYl03H72A0p3anb5VvM=;
 b=nBFfs0WVxgt3BglpYYt/cvpCKefwOCJluQaZ9Kn/PDi6MuRVwZX8iqbsJpwAGEyxXm
 trm+AWFDhJ+eZtA5D+he8owtzYAsPgggkj9PDeUWHmPd1SjhfEXMgGuP31kXhZcFavHh
 TVWX8nrUKwo1sLX9MRzzzrddyvyiiKyTKtK8PK/9uV2mOXkoiwazB+7caJ/GFfonbDry
 8LLZSwwBTIp4FlecaC3g/qNhHq6gvJaRyGgsRbv2QoF1XuG5tn0H2bIY3Bi6boYMmZfH
 T3FASWKQwfrk5Q3UkmD1ceEj1cuitR0cW6OdAfw+nK2g1KbbRl9vP3c+Njqylw7dhhr5
 vP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eakFycCbrhfBm/tKxeozCrFviYl03H72A0p3anb5VvM=;
 b=gy4CD7l70YPG7D/Ebm+mDpAByq8lY22+2EVLfIEXo8ecZjLjsqSLCMDcKtSgPsjx77
 IjXDpOlFhIhIUAwhiuV7746/0QL+LukKL1ZgX6thUCcfU7npWc6P529hSgMfbYIYMFDF
 Hx1rTaVCVsDDKXgcyqsDhDKcBCEbdQwP+YVRTpsyEJc+uStsczMqFPxHb2g7jr7aRW5/
 LcEsGU0ScrIr8VtWZoFhwOKGsTpLWoW+9A9lTq9MT6LZzSl2DiSBRzRJ/OG2ZTwUJ5S8
 /sFTfbKuy1sBtik67N/lNNDDub0/tqCjq5Mtt1zqSOiH0cLRnoB2lVM5GkEYi9kTM0ix
 sY7w==
X-Gm-Message-State: AA+aEWbFCPZWaTTpmpBdzA6tZCGDQgdMSitAN6LliHsIYuij1qR+jNGx
 HJXzoGKrvRU1yuL9eD6SWP5BvOvcdAoMek1Aq2XxiXqBlSA=
X-Google-Smtp-Source: AFSGD/UHwSRRCJy8bntnLJi+YR7rR+ZDeZpSMw8wb+EX56Vld1Xm2HcHU0J+hev9fnNevSZdXycCdnelhpi/2f+DDaY=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr4564200itj.62.1545181643995;
 Tue, 18 Dec 2018 17:07:23 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
In-Reply-To: <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 01:07:12 +0000
Message-ID: <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
Subject: Re: [OE-core] flto automake
To: Bradley Bishop <bradleyb@fuzziesquirrel.com>
Cc: james.feist@linux.intel.com, OpenBMC <openbmc@lists.ozlabs.org>, 
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 19 Dec 2018 01:07:32 -0000

On Wed, 19 Dec 2018 at 00:42, Brad Bishop <bradleyb@fuzziesquirrel.com> wro=
te:

> I wonder if this is something they would be interested in upstream.  I=E2=
=80=99ve copied
> the oe-core mailing list for possible comment.

Thanks for forwarding this to us.  The class is very simple and just does:

PACKAGECONFIG_CONFARGS +=3D " AR=3D${TARGET_PREFIX}gcc-ar \
RANLIB=3D${TARGET_PREFIX}gcc-ranlib"

That's quite an abuse of PACKAGECONFIG_CONFARGS, I'd recommend just
setting AR and RANLIB directly in the class, they'll override the
defaults in bitbake.conf.

That however leads to the question of should we just change the
defaults? Does anything break if we use gcc-ar instead of ar?

Ross
